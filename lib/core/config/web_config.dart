import 'package:flutter/foundation.dart';

class WebConfig {
  static bool get isFirebaseMessagingEnabled => !kIsWeb;
}