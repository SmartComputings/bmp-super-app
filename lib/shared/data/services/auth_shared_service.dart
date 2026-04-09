import 'package:bmp/core/network/api_client.dart';
import 'package:bmp/core/config/api_config.dart';

/// Shared service for authentication-related API calls
class AuthSharedService {
  /// POST /auth/login - register device info after login
  static Future<ApiResponse> postLoginDeviceInfo({
    required String? email,
    required String password,
    required String username,
    required String deviceId,
    required String platform,
    required String? fcmToken,
    required String appVersion,
    required String? firstName,
    required String? lastName,
  }) async {
    // Assuming backend endpoint for device registration
    // This was previously in finance module but is needed globally for push notifications
    final path = '${ApiConfig.baseUrl}/auth/device-info';
    
    return await ApiClient.request(
        path: path,
        method: 'POST',
        includeRsa: true,
        data: {
          'email': email,
          'password': password,
          'username': username,
          'deviceId': deviceId,
          'platform': platform,
          'fcmToken': fcmToken,
          'appVersion': appVersion,
          'firstName': firstName,
          'lastName': lastName,
        },
    );
  }
}
