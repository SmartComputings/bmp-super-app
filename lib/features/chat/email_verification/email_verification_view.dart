import 'package:bmp/shared/utils/app_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:bmp/shared/widgets/layouts/login_scaffold.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'email_verification.dart';

class EmailVerificationView extends StatelessWidget {
  final EmailVerificationController controller;

  const EmailVerificationView(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return LoginScaffold(
      appBar: AppBar(
        title: Text(L10n.of(context).emailVerification),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (controller.loading) ...[
                const AppLoadingWidget(),
                const SizedBox(height: 24),
                Text(
                  L10n.of(context).verifyingYourEmail,
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  L10n.of(context).pleaseWaitWhileWeCompleteRegistration,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ] else if (controller.success) ...[
                const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 64,
                ),
                const SizedBox(height: 24),
                Text(
                  L10n.of(context).registrationComplete,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  L10n.of(context).emailVerifiedAndAutoLoginSuccessful,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const AppLoadingWidget(),
              ] else if (controller.error != null) ...[
                const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 64,
                ),
                const SizedBox(height: 24),
                Text(
                  L10n.of(context).verificationFailed,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  controller.error!,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: controller.goToSignup,
                      child: Text(L10n.of(context).tryAgain),
                    ),
                    TextButton(
                      onPressed: controller.goToLogin,
                      child: Text(L10n.of(context).login),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}