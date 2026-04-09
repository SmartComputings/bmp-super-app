import 'dart:ui';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:matrix/matrix.dart';

abstract class AppConfig {
  static String _applicationName = 'BMP';

  static String get applicationName => _applicationName;
  static String? _applicationWelcomeMessage;

  static String? get applicationWelcomeMessage => _applicationWelcomeMessage;
  static String get defaultHomeserver {
    final value = dotenv.env['MATRIX_HOMESERVER'];
    if (value == null || value.isEmpty) {
      throw Exception('MATRIX_HOMESERVER not found in .env file');
    }
    return value;
  }
  static double fontSizeFactor = 1;
  static const Color chatColor = primaryColor;
  static Color? colorSchemeSeed = primaryColor;
  static const double messageFontSize = 13.0;
  static const bool allowOtherHomeservers = true;
  static const bool enableRegistration = true;
  static const Color primaryColor = Color(0xFF0D6EFD);
  static const Color primaryColorLight = Color(0xFF626A95);
  static const Color secondaryColor = Color(0xFF0B0F2C);
  static String get privacyUrl {
    final value = dotenv.env['MATRIX_PRIVACY_URL'];
    if (value == null || value.isEmpty) {
      throw Exception('MATRIX_PRIVACY_URL not found in .env file');
    }
    return value;
  }

  static const Set<String> defaultReactions = {'👍', '❤️', '😂', '😮', '😢'};
  static const String website = 'https://app.be-mindpower.net';
  static const String enablePushTutorial =
      'https://github.com/krille-chan/bmp/wiki/Push-Notifications-without-Google-Services';
  static const String encryptionTutorial =
      'https://github.com/krille-chan/bmp/wiki/How-to-use-end-to-end-encryption-in-bmp';
  static const String startChatTutorial =
      'https://github.com/krille-chan/bmp/wiki/How-to-Find-Users-in-bmp';
  static const String appId = 'net.be-mindpower.BMP';
  static const String appOpenUrlScheme = 'net.be-mindpower';
  static String get webBaseUrl {
    final value = dotenv.env['MATRIX_WEB_BASE_URL'];
    if (value == null || value.isEmpty) {
      throw Exception('MATRIX_WEB_BASE_URL not found in .env file');
    }
    return value;
  }
  static const String sourceCodeUrl =
      'https://github.com/krille-chan/bmp';
  static const String supportUrl =
      'https://github.com/krille-chan/bmp/issues';
  static const String changelogUrl =
      'https://github.com/krille-chan/bmp/blob/main/CHANGELOG.md';
  static final Uri newIssueUrl = Uri(
    scheme: 'https',
    host: 'github.com',
    path: '/krille-chan/bmp/issues/new',
  );
  static bool renderHtml = true;
  static bool hideRedactedEvents = false;
  static bool hideUnknownEvents = true;
  static bool hideUnimportantStateEvents = true;
  static bool separateChatTypes = false;
  static bool autoplayImages = true;
  static bool sendTypingNotifications = true;
  static bool sendPublicReadReceipts = true;
  static bool swipeRightToLeftToReply = true;
  static bool? sendOnEnter;
  static bool showPresences = true;
  static bool displayNavigationRail = false;
  static bool experimentalVoip = false;
  static bool alwaysShowMessageTimestamps =
  true; // Show timestamps for every message like WhatsApp
  static const bool hideTypingUsernames = false;
  static const bool hideAllStateEvents = false;
  static const String inviteLinkPrefix = 'https://be-mindpower.net/#/';
  static const String deepLinkPrefix = 'im.bmp://chat/';
  static const String schemePrefix = 'matrix:';
  static const String pushNotificationsChannelId = 'bmp_push';
  static const String pushNotificationsAppId = 'chat.bmp';
  static const double borderRadius = 18.0;
  static const double columnWidth = 360.0;
  static Uri get homeserverList {
    final host = dotenv.env['MATRIX_HOMESERVER'];
    if (host == null || host.isEmpty) {
      throw Exception('MATRIX_HOMESERVER not found in .env file');
    }
    return Uri(
      scheme: 'https',
      host: host,
      path: '',
    );
  }

  static void loadFromJson(Map<String, dynamic> json) {
    if (json['chat_color'] != null) {
      try {
        colorSchemeSeed = Color(json['chat_color']);
      } catch (e) {
        Logs().w(
          'Invalid color in config.json! Please make sure to define the color in this format: "0xffdd0000"',
          e,
        );
      }
    }
    if (json['application_name'] is String) {
      _applicationName = json['application_name'];
    }
    if (json['application_welcome_message'] is String) {
      _applicationWelcomeMessage = json['application_welcome_message'];
    }
    if (json['default_homeserver'] is String) {
      // Ignore JSON config for homeserver, use .env instead
    }
    if (json['privacy_url'] is String) {
      // Ignore JSON config for privacy URL, use .env instead
    }
    if (json['web_base_url'] is String) {
      // Ignore JSON config for web base URL, use .env instead
    }
    if (json['render_html'] is bool) {
      renderHtml = json['render_html'];
    }
    if (json['hide_redacted_events'] is bool) {
      hideRedactedEvents = json['hide_redacted_events'];
    }
    if (json['hide_unknown_events'] is bool) {
      hideUnknownEvents = json['hide_unknown_events'];
    }
  }
}

// Build optimization flags
const bool kEnableLogging = false;
const bool kEnableAnalytics = true;
const bool kEnableCrashReporting = true;
const bool kEnablePerformanceMonitoring = false;