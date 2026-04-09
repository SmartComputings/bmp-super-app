import 'package:matrix/matrix.dart';

class StartupDebug {
  static void logStartupStep(String step) {
    Logs().i('[STARTUP] $step');
  }
  
  static void logError(String step, dynamic error) {
    Logs().e('[STARTUP ERROR] $step: $error');
  }
}