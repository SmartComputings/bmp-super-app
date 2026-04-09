import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';

class UrlHandler {
  // static bool isEmailVerificationUrl(String url) {
  //   final uri = Uri.parse(url);
  //   // final hasParams = EmailVerificationHandler.hasEmailVerificationParams(uri);
  //   Logs().i('DEBUG: Checking URL for verification params: $url -> $hasParams');
  //   return hasParams;
  // }
  
  static void handleEmailVerificationUrl(BuildContext context, String url) {
    // final uri = Uri.parse(url);
    // final params = EmailVerificationHandler.parseEmailVerificationUrl(uri);
    
    // Logs().i('DEBUG: Parsed params - client_secret: ${params['client_secret']}, sid: ${params['sid']}, token: ${params['token']}');
    
    // if (params['client_secret'] != null && params['sid'] != null && params['token'] != null) {
    //   final redirectUrl = '/verify-email?client_secret=${params['client_secret']}&sid=${params['sid']}&token=${params['token']}';
    //   Logs().i('DEBUG: Redirecting to: $redirectUrl');
    //   context.go(redirectUrl);
    // } else {
    //   Logs().e('DEBUG: Missing required parameters for email verification');
    // }
  }
}