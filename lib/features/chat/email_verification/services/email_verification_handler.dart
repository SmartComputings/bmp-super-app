import 'dart:convert';

import 'package:bmp/core/config/app_config.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class EmailVerificationHandler {
  static Map<String, String> parseEmailVerificationUrl(String url) {
    final uri = Uri.parse(url);
    return {
      'client_secret': uri.queryParameters['client_secret'] ?? '',
      'sid': uri.queryParameters['sid'] ?? '',
      'token': uri.queryParameters['token'] ?? '',
    };
  }

  static bool hasEmailVerificationParams(Map<String, String> params) {
    return params['client_secret']!.isNotEmpty &&
           params['sid']!.isNotEmpty &&
           params['token']!.isNotEmpty;
  }

  static Future<bool> handleAutoSignin(Map<String, String> params) async {
    if (!hasEmailVerificationParams(params)) return false;

    try {
      final prefs = await SharedPreferences.getInstance();
      final username = prefs.getString('pending_username');
      final password = prefs.getString('pending_password');
      
      if (username == null || password == null) return false;

      final baseUrl = 'https://${AppConfig.defaultHomeserver}';
      final registerUrl = '$baseUrl/_matrix/client/v3/register';
      
      final response = await http.post(
        Uri.parse(registerUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
          'auth': {
            'type': 'm.login.email.identity',
            'threepid_creds': {
              'sid': params['sid'],
              'client_secret': params['client_secret'],
            },
          },
        }),
      );
      
      return response.statusCode == 200;
    } catch (e) {
      print('Auto-signin failed: $e');
      return false;
    }
  }
}