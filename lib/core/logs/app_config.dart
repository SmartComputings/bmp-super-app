import 'package:flutter/foundation.dart';

class AppConfig {
  // Logs will only work in debug mode, automatically disabled in release/production
  // Emergency override: Uncomment line below to force enable logs in release mode
  // static bool get shouldShowLogs => true;
  static bool get shouldShowLogs => kDebugMode;
}