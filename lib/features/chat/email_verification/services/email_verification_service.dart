import 'dart:convert';

import 'package:bmp/core/config/app_config.dart';
import 'package:bmp/shared/utils/platform_infos.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:matrix/matrix.dart';

import '../../../../core/localization/l10n.dart';

class EmailVerificationService {
  static Future<Map<String, dynamic>> verifyEmailAndLogin({
    required String clientSecret,
    required String sid,
    required String token,
    required String username,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final baseUrl = 'https://${AppConfig.defaultHomeserver}';
      
      // First, submit the token to verify the email
      final submitUrl = '$baseUrl/_matrix/client/v3/register/email/submitToken';
      final submitResponse = await http.post(
        Uri.parse(submitUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'sid': sid,
          'client_secret': clientSecret,
          'token': token,
        }),
      );
      
      if (submitResponse.statusCode != 200) {
        return {
          'success': false,
          'error': L10n.of(context).emailVerificationFailed,
        };
      }
      
      // Get session for registration
      final registerUrl = '$baseUrl/_matrix/client/v3/register';
      final sessionResponse = await http.post(
        Uri.parse(registerUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
          'initial_device_display_name': PlatformInfos.clientName,
        }),
      );
      
      String? session;
      if (sessionResponse.statusCode == 401) {
        final authData = jsonDecode(sessionResponse.body);
        session = authData['session'];
      }
      
      if (session == null) {
        return {
          'success': false,
          'error': L10n.of(context).unableToGetSession,
        };
      }
      
      // Complete registration with email verification
      final completeResponse = await http.post(
        Uri.parse(registerUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
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
        }),
      );
      
      if (completeResponse.statusCode == 200) {
        final responseData = jsonDecode(completeResponse.body);
        return {
          'success': true,
          'user_id': responseData['user_id'],
          'access_token': responseData['access_token'],
          'device_id': responseData['device_id'],
        };
      } else {
        final errorData = jsonDecode(completeResponse.body);
        return {
          'success': false,
          'error': errorData['error'] ?? L10n.of(context).registrationFailed,
        };
      }
    } catch (e) {
      return {
        'success': false,
        'error': '${L10n.of(context).networkError}: ${e.toString()}',
      };
    }
  }
  
  static Future<bool> loginWithCredentials({
    required Client client,
    required String username,
    required String password,
  }) async {
    try {
      final identifier = AuthenticationUserIdentifier(user: username);
      
      await client.login(
        LoginType.mLoginPassword,
        identifier: identifier,
        user: username,
        password: password,
        initialDeviceDisplayName: PlatformInfos.clientName,
      );
      
      return true;
    } catch (e) {
      Logs().e('Auto-login failed: $e');
      return false;
    }
  }
}