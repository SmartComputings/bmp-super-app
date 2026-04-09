import 'dart:convert';
import 'dart:math';

import 'package:bmp/core/config/setting_keys.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/client_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:matrix/matrix.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _passwordStorageKey = 'database_password';

Future<String?> getDatabaseCipher() async {
  String? password;

  try {
    const secureStorage = FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
    );
    
    // Try to read existing key first
    password = await secureStorage.read(key: _passwordStorageKey);
    
    if (password == null) {
      // No existing key - generate a new one
      Logs().i('No database encryption key found, generating new key');
      final rng = Random.secure();
      final list = Uint8List(32);
      list.setAll(0, Iterable.generate(list.length, (i) => rng.nextInt(256)));
      final newPassword = base64UrlEncode(list);
      await secureStorage.write(
        key: _passwordStorageKey,
        value: newPassword,
      );

      // Verify the key was written successfully (with retry)
      for (var attempt = 0; attempt < 3; attempt++) {
        password = await secureStorage.read(key: _passwordStorageKey);
        if (password != null) break;
        await Future.delayed(const Duration(milliseconds: 100));
      }
      
      if (password == null) {
        Logs().e('Failed to store database encryption key after 3 attempts');
        throw MissingPluginException('Failed to store encryption key');
      }
      Logs().i('Database encryption key generated and stored successfully');
    } else {
      Logs().i('Database encryption key loaded from secure storage');
    }
  } on MissingPluginException catch (e) {
    // Platform doesn't support secure storage - ONLY then delete the key
    const FlutterSecureStorage()
        .delete(key: _passwordStorageKey)
        .catchError((_) {});
    Logs().w('Database encryption is not supported on this platform', e);
    _sendNoEncryptionWarning(e);
    password = null;
  } catch (e, s) {
    // IMPORTANT: Do NOT delete the key here!
    // If we delete the key, existing encrypted databases will become unreadable
    Logs().e('Error accessing database encryption key', e, s);
    
    // Re-throw the error to prevent app from starting with wrong/no key
    // The database builder will handle the error and try recovery
    rethrow;
  }

  return password;
}

void _sendNoEncryptionWarning(Object exception) async {
  final store = await SharedPreferences.getInstance();
  final isStored = AppSettings.noEncryptionWarningShown.getItem(store);

  if (isStored == true) return;

  final l10n = await lookupL10n(PlatformDispatcher.instance.locale);
  ClientManager.sendInitNotification(
    l10n.noDatabaseEncryption,
    exception.toString(),
  );

  await AppSettings.noEncryptionWarningShown.setItem(store, true);
}
