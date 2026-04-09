import 'package:go_router/go_router.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/auth_onboarding/login/login.dart';
import 'package:bmp/core/constant/app_colors.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/phone_auth_flow/enter_phone_number_controller.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/phone_auth_flow/varification_code_screen.dart';
import 'package:bmp/features/auth_onboarding/widgets/CustomButton.dart';
import 'package:bmp/features/auth_onboarding/widgets/CustomTextField.dart';
import 'package:bmp/shared/data/models/PhoneVerifyModels.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/bg_gradient_theme.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/constants/position_constants.dart';
import 'package:bmp/shared/utils/snackbar.dart';
import 'package:flutter/material.dart';
import '../../../../shared/widgets/hide_keyboard.dart';
import 'package:gap/gap.dart';

class EmailLinkingScreen extends StatefulWidget {
  final String username;
  final String idToken;
  final dynamic verifyResult;
  final EnterPhoneNumberController controller;

  const EmailLinkingScreen({
    super.key,
    required this.username,
    required this.idToken,
    required this.verifyResult,
    required this.controller,
  });

  @override
  State<EmailLinkingScreen> createState() => _EmailLinkingScreenState();
}

class _EmailLinkingScreenState extends State<EmailLinkingScreen> {
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  String? _emailError;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  Future<void> _handleContinue() async {
    setState(() => _emailError = null);
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      setState(() => _emailError = L10n.of(context).emailRequired);
      return;
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      setState(
          () => _emailError = L10n.of(context).customerKycInvalidEmailFormat);
      return;
    }

    setState(() => _isLoading = true);

    try {
      final result = await widget.controller.initiateEmailLinking(
        email,
        widget.username,
      );

      if (!mounted) return;
      setState(() => _isLoading = false);

      if (result['success'] == true) {
        final sessionId = result['session_id'] as String?;
        if (sessionId != null) {
          widget.controller.setCurrentEmail(email);
          widget.controller.initializeScreen(email, duration: 60);

          final phoneResponse = PhoneVerifyModels();
          phoneResponse.data = Data(sessionId: sessionId, success: true);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VarificationCodeScreen(
                phone: email,
                phoneResponse: phoneResponse,
                controller: widget.controller,
                isEmailLogin: true,
                isRegister: false,
                isLinking: true,
                onSuccess: (finalSessionId) async {
                  debugPrint('✅ Email linked successfully via Full Screen!');
                  // After successful linking, we MUST perform the final login
                  // Using the Matrix credentials stored in the controller
                  final mUsername = widget.controller.matrixUsername;
                  final mPassword = widget.controller.matrixPassword;

                  if (mUsername != null && mPassword != null) {
                    try {
                      await LoginController.performLogin(
                        context: context,
                        username: mUsername,
                        password: mPassword,
                      );
                      if (context.mounted) {
                        context.go('/onboarding');
                      }
                    } catch (e) {
                      debugPrint('❌ Auto-login failed after linking: $e');
                    }
                  } else {
                    debugPrint(
                        '⚠️ No Matrix credentials found in controller after linking');
                  }
                },
              ),
            ),
          );
        }
      } else {
        CustomSnackbar.show(
          context,
          title: L10n.of(context).error,
          message: result['message'] ?? 'Failed to initiate linking',
          type: SnackbarType.error,
        );
      }
    } catch (e) {
      if (mounted) setState(() => _isLoading = false);
      CustomSnackbar.show(
        context,
        title: L10n.of(context).error,
        message: 'Something went wrong, please try again',
        type: SnackbarType.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return HideKeyboardOnOutsideTap(
      child: Scaffold(
        backgroundColor: AppColors.cardOptionsBg,
        body: Stack(
          children: [
            BgGradientTheme(
              position: ShapePosition.center,
              width: context.screenWidth * 1.8,
              height: context.screenWidth * 1.8,
              color: AppColors.verificationGradientBlue,
              opacity: 0.6,
            ),
            BgGradientTheme(
              position: ShapePosition.bottomFull,
              height: context.screenHeight * 0.37,
              colors: const [
                AppColors.cardOptionsBg,
                AppColors.verificationGradientPurple,
              ],
              opacity: 0.8,
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.screenWidth * 0.08,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(40),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back_ios,
                            color: Colors.white),
                        padding: EdgeInsets.zero,
                        alignment: Alignment.centerLeft,
                      ),
                      const Gap(30),
                      Text(
                        L10n.of(context).linkEmailTitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Neometric',
                        ),
                      ),
                      const Gap(12),
                       Text(
                        L10n.of(context).linkEmailSubtitle,
                        style: const TextStyle(
                          color: Color(0xFFD2D4E5),
                          fontSize: 15,
                          height: 1.4,
                        ),
                      ),
                      const Gap(40),
                      CustomTextField(
                        hintText: L10n.of(context).emailHint,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        controller: _emailController,
                        focusNode: _emailFocusNode,
                        errorText: _emailError,
                        onChanged: (_) {
                          if (_emailError != null) {
                            setState(() => _emailError = null);
                          }
                        },
                        onSubmitted: (_) => _handleContinue(),
                      ),
                      const Gap(60),
                      Center(
                        child: CustomButton(
                          text: L10n.of(context).continueButton,
                          loading: _isLoading,
                          onPressed: _isLoading ? null : _handleContinue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
