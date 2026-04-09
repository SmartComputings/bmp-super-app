import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// Shared service for retrieving device and platform information
class DeviceInfoSharedService {
  static final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  /// Returns platform name (android/ios)
  static Future<String> getPlatform() async {
    return Platform.isAndroid ? 'android' : 'ios';
  }

  /// Returns unique device ID
  static Future<String?> getDeviceId() async {
    if (Platform.isAndroid) {
      final androidInfo = await _deviceInfo.androidInfo;
      return androidInfo.id;
    } else if (Platform.isIOS) {
      final iosInfo = await _deviceInfo.iosInfo;
      return iosInfo.identifierForVendor;
    }
    return null;
  }

  /// Returns FCM token for push notifications
  static Future<String?> getFcmToken() async {
    try {
      return await FirebaseMessaging.instance.getToken();
    } catch (e) {
      return null;
    }
  }

  /// Returns app version string
  static Future<String> getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }
}
