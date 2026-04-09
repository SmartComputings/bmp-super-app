import 'dart:ffi';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sqlite3/open.dart' as sqlite_open;
import 'package:sqlcipher_flutter_libs/sqlcipher_flutter_libs.dart';

import 'package:bmp/core/config/app_config.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/client_manager.dart';
import 'package:bmp/shared/utils/platform_infos.dart';
import 'package:flutter/foundation.dart';
import 'package:matrix/matrix.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:universal_html/html.dart' as html;

import 'cipher.dart';

// import 'sqlcipher_stub.dart'
//     if (dart.library.io) 'package:sqlcipher_flutter_libs/sqlcipher_flutter_libs.dart';

Future<DatabaseApi> flutterMatrixSdkDatabaseBuilder(String clientName) async {
  MatrixSdkDatabase? database;
  try {
    database = await _constructDatabase(clientName);
    await database.open();
    return database;
  } catch (e, s) {
    Logs().wtf('Unable to construct database!', e, s);
    // Try to delete database so that it can created again on next init:
    database?.delete().catchError(
          (e, s) => Logs().wtf(
            'Unable to delete database, after failed construction',
            e,
            s,
          ),
        );

    // Delete database file(s) so next init can recreate:
    if (database == null && !kIsWeb) {
      final paths = <String>[await _getDatabasePath(clientName)];
      if (PlatformInfos.isIOS) {
        try {
          paths.add(join(await getDatabasesPath(), '$clientName.sqlite'));
        } catch (_) {}
      }
      for (final p in paths) {
        final f = File(p);
        if (await f.exists()) await f.delete();
      }
    }

    try {
      // Send error notification:
      final l10n = await lookupL10n(PlatformDispatcher.instance.locale);
      ClientManager.sendInitNotification(
        l10n.initAppError,
        l10n.databaseBuildErrorBody(
          AppConfig.newIssueUrl.toString(),
          e.toString(),
        ),
      );
    } catch (e, s) {
      Logs().e('Unable to send error notification', e, s);
    }

    rethrow;
  }
}



Future<MatrixSdkDatabase> _constructDatabase(String clientName) async {
  if (kIsWeb) {
    html.window.navigator.storage?.persist();
    return await MatrixSdkDatabase.init(clientName);
  }

  // Disable encryption on Android due to SQLCipher issues
  final cipher = PlatformInfos.isAndroid ? null : await getDatabaseCipher();

  Directory? fileStorageLocation;
  try {
    fileStorageLocation = await getTemporaryDirectory();
  } on MissingPlatformDirectoryException catch (_) {
    Logs().w(
      'No temporary directory for file cache available on this platform.',
    );
  }

  // On iOS/Android use native sqflite to avoid disk I/O errors (e.g. 6922).
  // On iOS the native plugin expects paths under getDatabasesPath() (Documents);
  // using Library can cause 6922 and session loss after reload.
  final bool useNativeSqflite = PlatformInfos.isIOS || PlatformInfos.isAndroid;
  final DatabaseFactory factory;
  final String path;

  if (useNativeSqflite) {
    factory = databaseFactory;
    databaseFactory = factory;
    path = PlatformInfos.isIOS
        ? join(await getDatabasesPath(), '$clientName.sqlite')
        : await _getDatabasePath(clientName);
  } else {
    path = await _getDatabasePath(clientName);
    // Desktop: FFI + SQLCipher shared libraries
    await applyWorkaroundToOpenSqlCipherOnOldAndroidVersions();
    if (PlatformInfos.isMacOS) {
      try {
        DynamicLibrary.process();
        Logs().i('SQLCipher loaded via process symbols');
      } catch (e) {
        Logs().e('Failed to load SQLCipher', e);
      }
      sqlite_open.open.overrideFor(sqlite_open.OperatingSystem.macOS, () => DynamicLibrary.process());
    } else if (PlatformInfos.isLinux) {
      sqlite_open.open.overrideFor(sqlite_open.OperatingSystem.linux, () {
        try {
          return DynamicLibrary.open('libsqlcipher_flutter_libs_plugin.so');
        } catch (_) {
          return DynamicLibrary.open('libsqlcipher.so');
        }
      });
    }
    factory = createDatabaseFactoryFfi();
    databaseFactory = factory;
  }

  // migrate from potential previous SQLite database path to current one
  await _migrateLegacyLocation(path, clientName);
  if (PlatformInfos.isIOS) {
    await _migrateFromLibraryToDocuments(path, clientName);
  }

  // in case we got a cipher, we use the encryption helper
  // to manage SQLite encryption
  final helper = cipher == null
      ? null
      : SQfLiteEncryptionHelper(
          factory: factory,
          path: path,
          cipher: cipher,
        );

  // check whether the DB is already encrypted and otherwise do so
  bool openWithoutEncryption = cipher == null;
  if (!openWithoutEncryption) {
    try {
      await helper?.ensureDatabaseFileEncrypted();
    } catch (e) {
      Logs().w('Encryption setup failed, disabling: $e');
      openWithoutEncryption = true;
      const FlutterSecureStorage().delete(key: 'database_password').catchError((_) {});
      if (!PlatformInfos.isIOS) {
        final dbFile = File(path);
        if (await dbFile.exists()) {
          await dbFile.delete();
          Logs().i('Deleted database file for recreation');
        }
      }
    }
  }

  await Directory(dirname(path)).create(recursive: true);

  Database database;
  try {
    database = await factory.openDatabase(
      path,
      options: OpenDatabaseOptions(
        version: 1,
        onConfigure: openWithoutEncryption ? null : helper?.applyPragmaKey,
      ),
    );
  } catch (e) {
    Logs().e('Database open failed: $e');
    // Delete encryption key and database, retry without encryption
    const FlutterSecureStorage().delete(key: 'database_password').catchError((_) {});
    final dbFile = File(path);
    if (await dbFile.exists()) await dbFile.delete();
    if (PlatformInfos.isIOS) {
      await Future<void>.delayed(const Duration(milliseconds: 300));
    }
    database = await factory.openDatabase(
      path,
      options: OpenDatabaseOptions(version: 1),
    );
  }

  return await MatrixSdkDatabase.init(
    clientName,
    database: database,
    maxFileSize: 1000 * 1000 * 10,
    fileStorageLocation: fileStorageLocation?.uri,
    deleteFilesAfterDuration: const Duration(days: 30),
  );
}

Future<String> _getDatabasePath(String clientName) async {
  final databaseDirectory = PlatformInfos.isIOS || PlatformInfos.isMacOS
      ? await getLibraryDirectory()
      : await getApplicationSupportDirectory();

  return join(databaseDirectory.path, '$clientName.sqlite');
}

Future<void> _migrateLegacyLocation(
  String sqlFilePath,
  String clientName,
) async {
  final oldPath = PlatformInfos.isDesktop
      ? (await getApplicationSupportDirectory()).path
      : await getDatabasesPath();

  final oldFilePath = join(oldPath, clientName);
  if (oldFilePath == sqlFilePath) return;

  final maybeOldFile = File(oldFilePath);
  if (await maybeOldFile.exists()) {
    Logs().i(
      'Migrate legacy location for database from "$oldFilePath" to "$sqlFilePath"',
    );
    await maybeOldFile.copy(sqlFilePath);
    await maybeOldFile.delete();
  }
}

/// On iOS, migrate DB from Library (old path that caused 6922) to Documents.
Future<void> _migrateFromLibraryToDocuments(String newPath, String clientName) async {
  final libraryDir = await getLibraryDirectory();
  final oldPath = join(libraryDir.path, '$clientName.sqlite');
  if (oldPath == newPath) return;
  final oldFile = File(oldPath);
  if (await oldFile.exists()) {
    Logs().i(
      'Migrate iOS database from Library to Documents: "$oldPath" -> "$newPath"',
    );
    await oldFile.copy(newPath);
    await oldFile.delete();
  }
}
