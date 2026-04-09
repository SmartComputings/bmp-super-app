import 'dart:ui';

import 'package:bmp/core/config/app_fonts.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/phone_auth_flow/enter_phone_number_controller.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/phone_auth_flow/varification_code_screen.dart';
import 'package:bmp/features/auth_onboarding/widgets/CustomButton.dart';
import 'package:bmp/features/auth_onboarding/widgets/CustomTextField.dart';
import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/bg_gradient_theme.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/constants/position_constants.dart';
import 'package:bmp/shared/widgets/hide_keyboard.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/data/models/PhoneVerifyModels.dart';

class EnterEmailScreen extends StatefulWidget {
  final String phoneNumber;
  final bool isLogin;
  final EnterPhoneNumberController controller;

  const EnterEmailScreen({
    super.key,
    required this.phoneNumber,
    this.isLogin = true,
    required this.controller,
  });

  @override
  State<EnterEmailScreen> createState() => _EnterEmailScreenState();
}

class _EnterEmailScreenState extends State<EnterEmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  String? _emailError;

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLargeDevice = context.screenWidth > 600;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

        if (isKeyboardOpen) {
          FocusScope.of(context).unfocus();
        } else {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: HideKeyboardOnOutsideTap(
          child: SingleChildScrollView(
            child: Container(
              width: context.screenWidth,
              height: context.screenHeight,
              color: const Color(0xFF1B1C30),
              child: Stack(
                children: [
                  BgGradientTheme(
                    position: ShapePosition.center,
                    width: context.percentWidth * 180,
                    height: context.percentWidth * 180,
                    color: const Color(0xFF363EC1),
                    opacity: 0.6,
                  ),
                  BgGradientTheme(
                    position: ShapePosition.bottomFull,
                    height: context.percentHeight * 37,
                    colors: const [Color(0xFF1B1C30), Color(0xFFA912BF)],
                    opacity: 0.8,
                  ),
                  BgGradientTheme(
                    position: ShapePosition.bottomLeft,
                    height: context.percentHeight * 44,
                    gradient: const LinearGradient(
                      colors: [Color(0xFFA912BF), Color(0xFF1B1C30)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    opacity: 0.9,
                  ),
                  BgGradientTheme(
                    position: ShapePosition.bottomRight,
                    height: context.percentHeight * 31,
                    color: const Color(0xFF1B1C30),
                    opacity: 0.8,
                  ),
                  BgGradientTheme(
                    position: ShapePosition.topRight,
                    height: context.percentHeight * 44,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF1B1C30), Color(0x88A912BF)],
                      stops: [0.5, 0.5],
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight,
                    ),
                    opacity: 0.8,
                  ),
                  BgGradientTheme(
                    position: ShapePosition.bottomRight,
                    height: context.percentHeight * 19,
                    color: const Color(0xFF1B1C30),
                    opacity: 0.8,
                  ),
                  BgGradientTheme(
                    position: ShapePosition.bottomCenter,
                    height: context.percentHeight * 12.5,
                    color: const Color(0xFF1B1C30),
                    opacity: 0.8,
                  ),
                  BgGradientTheme(
                    position: ShapePosition.topLeft,
                    width: context.percentWidth * 50,
                    height: context.percentHeight * 25,
                    color: Colors.black,
                    opacity: 0.3,
                  ),
                  BgGradientTheme(
                    position: ShapePosition.topRight,
                    width: context.percentWidth * 50,
                    height: context.percentHeight * 25,
                    color: Colors.black,
                    opacity: 0.3,
                  ),
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 85, sigmaY: 85),
                      child: Container(color: Colors.transparent),
                    ),
                  ),
                  SafeArea(
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: context.percentWidth * 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: context.percentHeight * 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  width: context.screenWidth * 0.27,
                                  height: context.screenHeight * 0.05,
                                  child: Image.asset(
                                    ImageAssets.applogo,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                    color: Color(0xFFD2D4E5),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: context.percentHeight * 8),
                            Text(
                              L10n.of(context).login,
                              style: TextStyle(
                                color: const Color(0xFFD2D4E5),
                                fontSize: isLargeDevice
                                    ? 36
                                    : context.percentWidth * 8,
                                fontFamily: AppFonts.allRoundGothic,
                                fontWeight: FontWeight.w700,
                                height: 1.2,
                              ),
                            ),
                            SizedBox(height: context.percentHeight * 2),
                            Text(
                              L10n.of(context).enterEmail,
                              style: TextStyle(
                                color: const Color(0xFFD2D4E5),
                                fontSize: isLargeDevice
                                    ? 24
                                    : context.percentWidth * 5.3,
                                fontFamily: AppFonts.allRoundGothic,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: context.percentHeight * 1),
                            Text(
                              L10n.of(context).verificationSMSMessage, // You can change this to an email instruction
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: context.screenWidth * 0.03,
                                fontFamily: 'Work Sans',
                                height: 1.4,
                              ),
                            ),
                            SizedBox(height: context.percentHeight * 7.4),
                            CustomTextField(
                              hintText: L10n.of(context).exampleEmail,
                              prefixIcon: Icons.alternate_email,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailController,
                              focusNode: _emailFocusNode,
                              onChanged: (_) {
                                if (_emailError != null) {
                                  setState(() => _emailError = null);
                                }
                              },
                              onSubmitted: (_) => _handleContinue(),
                              readOnly: widget.controller.isLoading,
                              errorText: _emailError,
                            ),
                            SizedBox(height: context.percentHeight * 10),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Center(
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth:
                                        isLargeDevice ? 400 : double.infinity,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40),
                                    child: ListenableBuilder(
                                      listenable: widget.controller,
                                      builder: (context, _) {
                                        return CustomButton(
                                          text: L10n.of(context).continueButton,
                                          loading: widget.controller.isLoading,
                                          onPressed: widget.controller.isLoading
                                              ? null
                                              : _handleContinue,
                                        );
                                      }
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: context.percentHeight * 5),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleContinue() async {
    setState(() {
      _emailError = null;
    });

    final email = _emailController.text.trim();

    if (email.isEmpty) {
      setState(() => _emailError = L10n.of(context).emailRequired);
      return;
    }

    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(email)) {
      setState(() => _emailError = L10n.of(context).pleaseEnterValidEmail);
      return;
    }

    final result = await widget.controller.initiateEmailLoginOtp(email);

    if (!mounted) return;

    if (result['success'] == true) {
      final sessionId = result['session_id'] as String?;
      
      PhoneVerifyModels phoneResponse = PhoneVerifyModels();
      if (sessionId != null) {
        phoneResponse.data = Data(
          sessionId: sessionId,
          success: true,
        );
      }
      
      widget.controller.phoneNumber = widget.phoneNumber; // Store phone just in case
      // Initialize the timer with 1 minute (60 seconds) for email
      widget.controller.initializeScreen(email, duration: 60);

      // We will need to set a flag in the controller or pass arguments to know it's an email OTP
      // For now, let's navigate to the VarificationCodeScreen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VarificationCodeScreen(
            phone: email, // display email instead of phone on the OTP screen
            phoneResponse: phoneResponse,
            controller: widget.controller,
            isEmailLogin: true,
          ),
        ),
      );
    } else {
      setState(() {
        _emailError = result['message'] ?? 'Failed to send OTP to email';
      });
    }
  }
}
