import 'dart:convert';

import 'package:bmp/core/config/api_config.dart';
import 'package:bmp/core/errors/api_exception.dart';
import 'package:bmp/core/logs/app_logger.dart';
import 'package:bmp/core/network/api_client.dart';
import 'package:bmp/shared/data/services/auth_shared_service.dart';
import 'package:bmp/shared/data/services/customer_shared_service.dart';
import 'package:bmp/shared/data/services/device_info_shared_service.dart';
import 'package:bmp/shared/data/services/security_shared_service.dart';
// CustomerProvider removed

import 'package:bmp/shared/utils/session_cleaner.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../shared/data/models/PhoneVerifyModels.dart';

class PhoneAuthService {
  /// Send OTP to phone number for signup



  static Future<PhoneVerifyModels> sendOtp(String phone) async {
    AppLogger.info('Sending OTP to phone: $phone');
   print("=======   ApiConfig.signupOtpUrl:${   ApiConfig.signupOtpUrl}             ===========");

    try {
      final dio = Dio();
      final response = await dio.post(
        ApiConfig.signupOtpUrl,
        data: {'phone': phone},
        options: Options(
          headers: await ApiClient.getHeadersWithoutUser(),
        ),
      );




      if (response.statusCode == 200 && response.data != null) {
        final data = response.data as Map<String, dynamic>;

        if (data['success'] == true) {

          final phoneVerifyModels =PhoneVerifyModels.fromJson(data);
          AppLogger.success('OTP sent successfully to $phone');
          return phoneVerifyModels;
        } else {
          final errorMessage = data['message'] as String? ?? 'OTP not sent';
          throw ApiException(errorMessage);
        }
      } else {
        throw ApiException('Failed to send OTP');
      }
    } catch (e) {
      AppLogger.error('Failed to send OTP: $e');
      if (e is ApiException) {
        rethrow;
      }
      if (e is DioException && e.response != null) {
        final responseData = e.response!.data;
        if (responseData is Map<String, dynamic> && responseData['message'] != null) {
          throw ApiException(responseData['message'] as String);
        }
      }
      throw ApiException('Failed to send OTP: ${e.toString()}');
    }
  }

  /// Verify OTP for phone authentication
  static Future<Map<String, dynamic>> verifyOtp({
    required String sessionsId,
    required String otp,
    required BuildContext context,
    String? deviceId,
  }) async {
    AppLogger.info('Verifying OTP for sessionsId: $sessionsId (device_id: $deviceId)');

    // Clear old user data before login (same as login controller)
    debugPrint('🧹 Clearing old user data before OTP verification...');
    await SessionCleaner.clearAuthData();
    debugPrint('✅ Old user data cleared');

    try {

      final requestBody = <String, dynamic>{
        "session_id": sessionsId,
        "otp": otp,
      };

      if (deviceId != null) {
        requestBody["device_id"] = deviceId;
      }

      final data = json.encode(requestBody);
      final dio = Dio();
      final response = await dio.request(
        ApiConfig.verifyOtpUrl,
        options: Options(
          method: 'POST',
          headers: await ApiClient.getHeadersWithoutUser(),
        ),
        data: data,
      );

      debugPrint("===========response.statusMessage:${response.statusMessage},${response.data}======00====");

      if (response.statusCode == 200) {
        debugPrint(json.encode(response.data));
      }
      else {
        debugPrint("===========response.statusMessage:${response.statusMessage}==========");
      }
      if (response.statusCode == 200 && response.data != null) {
        final loginResult = response.data as Map<String, dynamic>;
        AppLogger.success('OTP verified successfully');


        //   debugdebugPrint('🔑 Matrix login client: ${client.accessToken}');
        // final matrix = Matrix.of(context);
        // final client = await matrix.getLoginClient();
        //

        // ✅ CRITICAL: Initialize Matrix client FIRST
        // await _initializeMatrixClient(context, loginResult);
        //   await client.restoreLogin(
        //   accessToken: loginResult['access_token'] as String,
        //   userId: loginResult['user_id'] as String,
        //   deviceId: loginResult['device_id'] as String?,
        // );

        // ✅ THEN store user credentials
        // await _storeUserCredentials(loginResult, phone);
        // After storing credentials, initialize the Matrix client properly

        // Request notification permission after login (same as login controller)
        try {
          final status = await Permission.notification.request();
        } catch (e) {
          debugPrint('⚠️ Failed to request notification permission: $e');
        }

        return loginResult;
      } else {
        throw ApiException('Invalid OTP');
      }
    } catch (e) {
      AppLogger.error('Failed to verify OTP: $e');
      if (e is ApiException) {
        rethrow;
      }
      throw ApiException('Invalid OTP');
    }
  }

  /// Store user credentials after successful OTP verification
  static Future<void> _storeUserCredentials(Map<String, dynamic> loginResult, String phone) async {
    try {
      debugPrint('📥 OTP Verification Response: $loginResult');
      final prefs = await SharedPreferences.getInstance();

      // Extract user data from Matrix login response
      final userId = loginResult['user_id'] as String?;
      final accessToken = loginResult['access_token'] as String?;
      final deviceId = loginResult['device_id'] as String?;
      final homeServer = loginResult['home_server'] as String?;

      debugPrint('🔍 Extracted credentials:');
      debugPrint('   matrix_id: $userId');
      debugPrint('   access_token: ${accessToken?.substring(0, 20)}...');
      debugPrint('   device_id: $deviceId');
      debugPrint('   home_server: $homeServer');

      // Store Matrix credentials first
      if (accessToken != null) {
        await prefs.setString('matrix_access_token', accessToken);
        debugPrint('✅ Access token stored: ${accessToken.substring(0, 20)}...');
      }

      if (deviceId != null) {
        await prefs.setString('matrix_device_id', deviceId);
        debugPrint('✅ Device ID stored: $deviceId');
      }

      if (homeServer != null) {
        await prefs.setString('home_server', homeServer);
        debugPrint('✅ Home server stored: $homeServer');
      }

      if (userId != null) {
        // Extract username from user_id (format: @username:homeserver)
        final matrixUsername = userId.replaceFirst('@', '').split(':')[0];
        await prefs.setString('matrix_id', userId);
        await prefs.setString('username', matrixUsername);
        await prefs.setString('current_username', matrixUsername);

        debugPrint('✅ Matrix identifiers stored:');
        debugPrint('   matrix_id: $userId');
        debugPrint('   username: $matrixUsername');
        debugPrint('   current_username: $matrixUsername');

        // Generate JWT token with RSA like existing login
        final tokenResult = await SecuritySharedService.generateToken(matrixUsername);

        if (tokenResult.success && tokenResult.data != null) {
          debugPrint('✅ JWT token generated successfully');

          // Generate CSRF token
          final csrfResult = await SecuritySharedService.getCsrfToken(matrixUsername);

          if (csrfResult.success && csrfResult.data != null) {
            debugPrint('✅ CSRF token generated successfully');
            debugPrint('🔐 Complete security setup completed for: $matrixUsername');
          }
        }

        // Check and store customer ID after successful login
        await _checkAndStoreCustomerId(matrixUsername);

        // Post device info to auth API
        await _postDeviceInfoForOtp(matrixUsername, phone);

        // Matrix client initialization handled by Matrix.of(context) in main app

        // Note: Customer provider will be initialized by the calling controller
      } else {
        debugPrint('⚠️ No user ID found in login result');
      }

      debugPrint('🎉 All credentials stored successfully!');

    } catch (e) {
      debugPrint('❌ Failed to store user credentials: $e');
    }
  }

  /// Check and store customer ID after OTP login
  static Future<void> _checkAndStoreCustomerId(String username) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final customerData = await CustomerSharedService.checkUsername(username);

      if (customerData['hasCustomer'] == true && customerData['customerId'] != null) {
        final customerId = customerData['customerId'] as String;
        // Validate - don't store Stripe IDs (they start with 'cus_')
        if (customerId.startsWith('cus_')) {
          debugPrint('⚠️ PhoneAuthService: Rejecting Stripe customer ID: $customerId');
          return;
        }
        await prefs.setString('customer_id', customerId);
        debugPrint('✅ Customer ID stored on OTP login: $customerId');
      }
    } catch (e) {
      debugPrint('⚠️ Failed to check/store customer ID: $e');
    }
  }

  /// Post device info to auth API for phone-based login
  /// Purpose: Register device for push notifications, security tracking, and audit trail
  static Future<void> _postDeviceInfoForOtp(String username, String phone) async {
    try {
      final platform = await DeviceInfoSharedService.getPlatform();
      final deviceId = await DeviceInfoSharedService.getDeviceId();
      final fcmToken = await DeviceInfoSharedService.getFcmToken();
      final appVersion = await DeviceInfoSharedService.getAppVersion();

      if (deviceId != null) {
        await AuthSharedService.postLoginDeviceInfo(
          email: null, // No email in phone-based auth
          password: '', // No password in phone-based auth
          username: username,
          deviceId: deviceId,
          platform: platform,
          fcmToken: fcmToken, // Essential for push notifications
          appVersion: appVersion,
          firstName: null, // Will be set later if available
          lastName: null, // Will be set later if available
        );
        debugPrint('✅ Device registered for phone-based login: $phone');
      }
    } catch (e) {
      debugPrint('⚠️ Failed to register device: $e');
    }
  }



  /// Initialize customer status after phone auth
/// Configure Matrix client with OTP response credentials
// static void _configureMatrixClient(Client client, Map<String, dynamic> loginResult) {
//   final accessToken = loginResult['access_token'] as String?;
//   final userId = loginResult['user_id'] as String?;
//   final deviceId = loginResult['device_id'] as String?;

//   if (accessToken == null || userId == null) {
//     throw Exception('Missing Matrix credentials in OTP response');
//   }

//   // 1. Set the access token (automatically sets isLogged = true)
//   client.setAccessToken(accessToken);

//   // 2. Set user ID
//   client.userID = userId;

//   // 3. Set device ID if available
//   if (deviceId != null) {
//     client.deviceID = deviceId;
//   }

//   debugPrint('✅ Matrix client configured with OTP credentials');
//   debugPrint('   User: $userId');
//   debugPrint('   Device: $deviceId');
// }
/// Initialize Matrix client with credentials from OTP response
/// CRITICAL: This makes phone auth work exactly like email login
// static Future<void> _initializeMatrixClient(
//   BuildContext context,
//   Map<String, dynamic> loginResult,
// ) async {
//   try {
//     final matrix = Matrix.of(context);
//     final client = await matrix.getLoginClient();

//     // Extract credentials from backend response
//     final accessToken = loginResult['access_token'] as String?;
//     final userId = loginResult['user_id'] as String?;
//     final deviceId = loginResult['device_id'] as String?;

//     if (accessToken == null || userId == null) {
//       debugPrint('❌ Missing Matrix credentials in OTP response');
//       return;
//     }

//     debugPrint('🚀 Initializing Matrix client with phone auth credentials...');

//     // 1. Set access token (makes client.isLogged = true)
//     client.setAccessToken(accessToken);

//     // 2. Set user ID
//     client.userID = userId;

//     // 3. Set device ID if available
//     if (deviceId != null) {
//       client.deviceID = deviceId;
//     }

//     // 4. CRITICAL: Start Matrix SDK sync
//     await matrix.initMatrix();

//     debugPrint('✅ Matrix client initialized successfully!');
//     debugPrint('   User: $userId');
//     debugPrint('   Device: ${client.deviceID}');
//     debugPrint('   Access token: ${accessToken.substring(0, 20)}...');

//   } catch (e) {
//     debugPrint('❌ Failed to initialize Matrix client: $e');
//     rethrow; // Important: let the UI handle this error
//   }
// }

}