import 'package:bmp/shared/utils/app_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'services/email_verification_handler.dart';

class EmailVerificationScreen extends StatefulWidget {
  final Map<String, String> params;
  
  const EmailVerificationScreen({Key? key, required this.params}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  bool _isProcessing = true;
  String? _message;

  @override
  void initState() {
    super.initState();
    _processVerification();
  }

  Future<void> _processVerification() async {
    try {
      final success = await EmailVerificationHandler.handleAutoSignin(widget.params);
      
      if (success) {
        if (mounted) {
          setState(() {
            _message = L10n.of(context).emailVerifiedRedirecting;
          });
        }
        
        await Future.delayed(const Duration(seconds: 2));
        Get.offAllNamed('/home/login');
      } else {
        if (mounted) {
          setState(() {
            _isProcessing = false;
            _message = L10n.of(context).emailVerificationFailedTryAgain;
          });
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isProcessing = false;
          _message = L10n.of(context).verificationError;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(L10n.of(context).emailVerification)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isProcessing) const AppLoadingWidget(),
            const SizedBox(height: 20),
            Text(
              _message ?? L10n.of(context).verifyingYourEmail,
              textAlign: TextAlign.center,
            ),
            if (!_isProcessing) ...[
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Get.offAllNamed('/home/login'),
                child: Text(L10n.of(context).goToLogin),
              ),
            ],
          ],
        ),
      ),
    );
  }
}