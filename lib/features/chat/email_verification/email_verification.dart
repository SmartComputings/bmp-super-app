import 'package:bmp/shared/utils/snackbar.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matrix/matrix.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'email_verification_view.dart';
import 'services/email_verification_handler.dart';
import 'services/registration_service.dart';

class EmailVerification extends StatefulWidget {
  final String? clientSecret;
  final String? sid;
  final String? token;

  const EmailVerification({
    super.key,
    this.clientSecret,
    this.sid,
    this.token,
  });

  @override
  EmailVerificationController createState() => EmailVerificationController();
}

class EmailVerificationController extends State<EmailVerification> {
  bool loading = true;
  String? error;
  bool success = false;

  @override
  void initState() {
    super.initState();
    _handleVerification();
  }

  Future<void> _handleVerification() async {
    Logs().i('DEBUG: Starting email verification process');

    if (widget.clientSecret == null ||
        widget.sid == null ||
        widget.token == null) {
      Logs().e('DEBUG: Missing verification parameters');
      setState(() {
        loading = false;
        error = 'Invalid verification link. Missing required parameters.';
      });
      return;
    }

    final params = {
      'client_secret': widget.clientSecret!,
      'sid': widget.sid!,
      'token': widget.token!,
      'auto_signin': 'true',
    };

    try {
      Logs().i('DEBUG: Processing auto-signin with params: $params');
      final autoSigninSuccess =
          await EmailVerificationHandler.handleAutoSignin(params);

      if (autoSigninSuccess) {
        Logs().i('DEBUG: Auto-signin successful, completing registration');
        // Complete registration with email auth
        final registrationResult =
            await RegistrationService.completeRegistrationWithEmailAuth(
          clientSecret: widget.clientSecret!,
          sid: widget.sid!,
          context: context,
        );

        if (registrationResult['success'] == true && mounted) {
          // Perform auto-login
          final matrix = Matrix.of(context);
          final client = await matrix.getLoginClient();

          final prefs = await SharedPreferences.getInstance();
          final username = prefs.getString('pending_username');
          final password = prefs.getString('pending_password');

          if (username != null && password != null) {
            final loginSuccess = await RegistrationService.performAutoLogin(
              client: client,
              username: username,
              password: password,
            );

            if (loginSuccess) {
              // Clear stored data
              await prefs.remove('pending_username');
              await prefs.remove('pending_password');

              setState(() {
                loading = false;
                success = true;
              });

              // Auto-redirect to login page
              Logs().i('DEBUG: Redirecting to /login');
              context.go('/login');
              return;
            }
          }
        }
      }

      // If we reach here, something failed
      setState(() {
        loading = false;
        error = 'Email verification or auto-login failed.';
      });

      CustomSnackbar.show(
        context,
        title: 'Verification Failed',
        message: 'Email verification was not successful. Please try again.',
        type: SnackbarType.warning,
      );
    } catch (e) {
      Logs().e('DEBUG: Exception in verification: $e');
      setState(() {
        loading = false;
        error = 'An error occurred during verification: $e';
      });

      // Show custom snackbar for verification error
      CustomSnackbar.show(
        context,
        title: 'Verification Error',
        message:
            'Unable to verify email. Please check your connection and try again.',
        type: SnackbarType.error,
      );
    }
  }

  void goToLogin() {
    context.go('/home/login');
  }

  void goToSignup() {
    context.go('/home/signup');
  }

  @override
  Widget build(BuildContext context) => EmailVerificationView(this);
}
