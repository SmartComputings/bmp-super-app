import 'dart:convert';

import 'package:bmp/core/config/app_config.dart';
import 'package:bmp/shared/utils/platform_infos.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:matrix/matrix.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/localization/l10n.dart';

class RegistrationService {
  static Future<bool> submitEmailToken(String sid, String clientSecret, String token, BuildContext context) async {
    try {
      final baseUrl = 'https://${AppConfig.defaultHomeserver}';
      final response = await http.post(
        Uri.parse('$baseUrl/_matrix/client/v3/register/email/submitToken'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'sid': sid,
          'client_secret': clientSecret,
          'token': token,
        }),
      );
      Logs().i('DEBUG: Email token submission status: ${response.statusCode}');
      Logs().i('DEBUG: Email token submission response: ${response.body}');
      return response.statusCode == 200;
    } catch (e) {
      Logs().e('DEBUG: Email verification failed: $e');
      throw Exception(L10n.of(context).emailVerificationFailedWithError(e.toString()));
    }
  }

  static Future<Map<String, dynamic>> completeRegistrationWithEmailAuth({
    required String clientSecret,
    required String sid,
    required BuildContext context,
  }) async {
    try {
      Logs().i('DEBUG: Starting completeRegistrationWithEmailAuth');
      final prefs = await SharedPreferences.getInstance();
      final username = prefs.getString('pending_username');
      final password = prefs.getString('pending_password');
      
      Logs().i('DEBUG: Retrieved credentials - username: $username, password: ${password != null ? "[PRESENT]" : "[MISSING]"}');
      
      if (username == null || password == null) {
        Logs().e('DEBUG: Registration data not found in prefs');
        return {'success': false, 'error': L10n.of(context).registrationDataNotFound};
      }

      final baseUrl = 'https://${AppConfig.defaultHomeserver}';
      final registerUrl = '$baseUrl/_matrix/client/v3/register';
      
      Logs().i('DEBUG: Using registerUrl: $registerUrl');
      
      // Get session
      final sessionResponse = await http.post(
        Uri.parse(registerUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
          'initial_device_display_name': PlatformInfos.clientName,
        }),
      );
      
      Logs().i('DEBUG: Session response status: ${sessionResponse.statusCode}');
      Logs().i('DEBUG: Session response body: ${sessionResponse.body}');
      
      String? session;
      if (sessionResponse.statusCode == 401) {
        final authData = jsonDecode(sessionResponse.body);
        session = authData['session'];
        Logs().i('DEBUG: Got session: $session');
      } else if (sessionResponse.statusCode == 400) {
        final errorData = jsonDecode(sessionResponse.body);
        final errcode = errorData['errcode'] ?? '';
        if (errcode == 'M_USER_IN_USE') {
          return {'success': false, 'error': L10n.of(context).usernameAlreadyExists};
        }
      }
      
      if (session == null) {
        Logs().e('DEBUG: Unable to get session');
        return {'success': false, 'error': L10n.of(context).unableToGetSessionTryAgain};
      }
      
      // Complete registration
      final requestBody = {
        'username': username,
        'password': password,
        'initial_device_display_name': PlatformInfos.clientName,
        'auth': {
          'type': 'm.login.email.identity',
          'threepid_creds': {
            'sid': sid,
            'client_secret': clientSecret,
          },
          'session': session,
        },
      };
      
      Logs().i('DEBUG: Complete registration request body: ${jsonEncode(requestBody)}');
      
      final completeResponse = await http.post(
        Uri.parse(registerUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );
      
      Logs().i('DEBUG: Complete registration status: ${completeResponse.statusCode}');
      Logs().i('DEBUG: Complete registration body: ${completeResponse.body}');
      
      if (completeResponse.statusCode == 200) {
        final responseData = jsonDecode(completeResponse.body);
        Logs().i('DEBUG: Registration successful for user: ${responseData['user_id']}');
        
        // Clear stored registration data on success
        await prefs.remove('pending_username');
        await prefs.remove('pending_password');
        
        return {
          'success': true,
          'user_id': responseData['user_id'],
          'access_token': responseData['access_token'],
          'device_id': responseData['device_id'],
          'username': username,
          'password': password,
        };
      } else {
        final errorData = jsonDecode(completeResponse.body);
        final errorMessage = errorData['error'] ?? L10n.of(context).registrationFailed;
        final errcode = errorData['errcode'] ?? '';
        
        Logs().e('DEBUG: Registration failed with status: ${completeResponse.statusCode}, error: $errorMessage');
        
        String userFriendlyError;
        if (errcode == 'M_UNAUTHORIZED' && errorMessage.contains('Unable to get validated threepid')) {
          userFriendlyError = L10n.of(context).emailNotVerifiedYet;
        } else if (errcode == 'M_USER_IN_USE') {
          userFriendlyError = L10n.of(context).usernameAlreadyExistsChooseDifferent;
        } else if (errcode == 'M_THREEPID_IN_USE') {
          userFriendlyError = L10n.of(context).emailAlreadyRegistered;
        } else {
          userFriendlyError = errorMessage;
        }
        
        return {'success': false, 'error': userFriendlyError};
      }
    } catch (e) {
      Logs().e('DEBUG: Exception in completeRegistrationWithEmailAuth: $e');
      return {'success': false, 'error': L10n.of(context).networkErrorCheckConnection};
    }
  }

  static Future<bool> performAutoLogin({
    required Client client,
    required String username,
    required String password,
  }) async {
    try {
      Logs().i('DEBUG: Starting performAutoLogin for user: $username');
      await client.login(
        LoginType.mLoginPassword,
        identifier: AuthenticationUserIdentifier(user: username),
        user: username,
        password: password,
        initialDeviceDisplayName: PlatformInfos.clientName,
      );
      Logs().i('DEBUG: Auto-login successful');
      return true;
    } catch (e) {
      Logs().e('DEBUG: Auto-login failed: $e');
      return false;
    }
  }
}