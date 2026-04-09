import 'dart:io';

import 'package:bmp/core/config/app_config.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

abstract class PlatformInfos {
  static bool get isWeb => kIsWeb;
  static bool get isLinux {
    if (kIsWeb) return false;
    try {
      return Platform.isLinux;
    } catch (e) {
      return false;
    }
  }

  static bool get isWindows {
    if (kIsWeb) return false;
    try {
      return Platform.isWindows;
    } catch (e) {
      return false;
    }
  }

  static bool get isMacOS {
    if (kIsWeb) return false;
    try {
      return Platform.isMacOS;
    } catch (e) {
      return false;
    }
  }

  static bool get isIOS {
    if (kIsWeb) return false;
    try {
      return Platform.isIOS;
    } catch (e) {
      return false;
    }
  }

  static bool get isAndroid {
    if (kIsWeb) return false;
    try {
      return Platform.isAndroid;
    } catch (e) {
      return false;
    }
  }

  static bool get isCupertinoStyle => isIOS || isMacOS;

  static bool get isMobile => isAndroid || isIOS;

  /// For desktops which don't support ChachedNetworkImage yet
  static bool get isBetaDesktop => isWindows || isLinux;

  static bool get isDesktop => isLinux || isWindows || isMacOS;

  static bool get usesTouchscreen => !isMobile;

  static bool get supportsVideoPlayer =>
      !PlatformInfos.isWindows && !PlatformInfos.isLinux;

  /// Web could also record in theory but currently only wav which is too large
  static bool get platformCanRecord => (isMobile || isMacOS);

  static String get clientName {
    if (kIsWeb) {
      return '${AppConfig.applicationName} web${kReleaseMode ? '' : 'Debug'}';
    }
    try {
      return '${AppConfig.applicationName} ${Platform.operatingSystem}${kReleaseMode ? '' : 'Debug'}';
    } catch (e) {
      return '${AppConfig.applicationName} unknown${kReleaseMode ? '' : 'Debug'}';
    }
  }

  static Future<String> getVersion() async {
    var version = kIsWeb ? 'Web' : 'Unknown';
    try {
      version = (await PackageInfo.fromPlatform()).version;
    } catch (_) {}
    return version;
  }

  static void showDialog(BuildContext context) async {
    final version = await PlatformInfos.getVersion();
    showAboutDialog(
      context: context,
      children: [
        Text('Version: $version'),
        TextButton.icon(
          onPressed: () => launchUrlString(AppConfig.sourceCodeUrl),
          icon: const Icon(Icons.source_outlined),
          label: Text(L10n.of(context).sourceCode),
        ),
        Builder(
          builder: (innerContext) {
            return TextButton.icon(
              onPressed: () {
                context.go('/logs');
                Navigator.of(innerContext).pop();
              },
              icon: const Icon(Icons.list_outlined),
              label: const Text('Logs'),
            );
          },
        ),
        Builder(
          builder: (innerContext) {
            return TextButton.icon(
              onPressed: () {
                context.go('/configs');
                Navigator.of(innerContext).pop();
              },
              icon: const Icon(Icons.settings_applications_outlined),
              label: const Text('Advanced Configs'),
            );
          },
        ),
      ],
      applicationIcon: Image.asset(
        'assets/logo.png',
        width: 64,
        height: 64,
        filterQuality: FilterQuality.medium,
      ),
      applicationName: AppConfig.applicationName,
    );
  }
}
