import 'dart:ui';

import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/auth_onboarding/login_welcome/login_welcome_screen.dart';
import 'package:bmp/features/auth_onboarding/widgets/CustomButton.dart';
import 'package:bmp/features/auth_onboarding/widgets/UnderlineWidget.dart';
import 'package:bmp/features/auth_onboarding/widgets/custom_keyboard.dart';
import 'package:bmp/features/auth_onboarding/widgets/pin_input_field.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/utils/snackbar.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/constants/position_constants.dart';
import 'package:bmp/shared/widgets/app_lock.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/bg_gradient_theme.dart';
import 'package:bmp/shared/widgets/keyboard_dismissible_popscope.dart';
import 'package:bmp/shared/widgets/message_question_widget.dart';
import 'package:flutter/material.dart';
import 'create_pin_controller.dart';

import '../../../../../shared/utils/image/assets/image_assets.dart';

class Create_Pin_Screen extends StatefulWidget {
  final bool isChanging;
  final bool isUnlockMode;
  final bool showBackButton;
  final Function(String)? onPinConfirmed;
  final Function(String)? onPinUnlock;
  final Function(String)? onPinVerify;

  const Create_Pin_Screen({
    super.key,
    this.isChanging = false,
    this.isUnlockMode = false,
    this.showBackButton = true,
    this.onPinConfirmed,
    this.onPinUnlock,
    this.onPinVerify,
  });

  @override
  State<Create_Pin_Screen> createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<Create_Pin_Screen> {
  late CreatePinController _controller;
  final TextEditingController _pinController = TextEditingController();
  final FocusNode _pinFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _controller = CreatePinController(
      isChanging: widget.isChanging,
      isUnlockMode: widget.isUnlockMode,
      onPinConfirmed: widget.onPinConfirmed ?? _defaultPinConfirmed,
      onPinUnlock: widget.onPinUnlock,
      onPinVerify: widget.onPinVerify,
    );

    // Listen to controller changes to update PIN display
    _controller.addListener(() {
      _pinController.text = _controller.currentPin;
    });
  }

  void _defaultPinConfirmed(String pin) async {
    // Default behavior for PIN confirmation (settings/onboarding)
    try {
      await AppLock.of(context).changePincode(pin);
      if (mounted) {
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      // Handle error
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _pinController.dispose();
    _pinFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return KeyboardDismissiblePopScope(
      focusNodes: [_pinFocusNode],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: screenWidth,
          height: screenHeight,
          color: const Color(0xFF1B1C30),
          child: Stack(
            children: [
              // Main blue circle background
              BgGradientTheme(
                position: ShapePosition.center,
                width: screenWidth * 1.8,
                height: screenWidth * 1.8,
                color: const Color(0xFF363EC1),
                opacity: 0.6,
              ),

              // Additional gradient shapes for the background effect
              BgGradientTheme(
                position: ShapePosition.bottomFull,
                height: screenHeight * 0.37,
                colors: const [Color(0xFF1B1C30), Color(0xFFA912BF)],
                opacity: 0.8,
              ),
              BgGradientTheme(
                position: ShapePosition.bottomLeft,
                height: screenHeight * 0.44,
                gradient: const LinearGradient(
                  colors: [Color(0xFFA912BF), Color(0xFF1B1C30)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                opacity: 0.9,
              ),
              BgGradientTheme(
                position: ShapePosition.bottomRight,
                height: screenHeight * 0.31,
                color: const Color(0xFF1B1C30),
                opacity: 0.8,
              ),
              BgGradientTheme(
                position: ShapePosition.topRight,
                height: screenHeight * 0.44,
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
                height: screenHeight * 0.19,
                color: const Color(0xFF1B1C30),
                opacity: 0.8,
              ),
              BgGradientTheme(
                position: ShapePosition.bottomCenter,
                height: screenHeight * 0.125,
                color: const Color(0xFF1B1C30),
                opacity: 0.8,
              ),

              BgGradientTheme(
                position: ShapePosition.topLeft,
                width: screenWidth * 0.5,
                height: screenHeight * 0.25,
                color: Colors.black,
                opacity: 0.3,
              ),

              BgGradientTheme(
                position: ShapePosition.topRight,
                width: screenWidth * 0.5,
                height: screenHeight * 0.25,
                color: Colors.black,
                opacity: 0.3,
              ),

              // Blur effect overlay
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 85, sigmaY: 85),
                child: Container(color: Colors.transparent),
              ),

              // Main content
              SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.1,
                    right: screenWidth * 0.1,
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: context.screenHeight * 0.03,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          widget.showBackButton
                              ? IconButton(
                                  icon: const Icon(Icons.arrow_back,
                                      color: Color(0xFFD2D4E5)),
                                  onPressed: () => Navigator.of(context).pop(),
                                )
                              : Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  width: screenWidth * 0.27,
                                  height: screenHeight * 0.05,
                                  child: Image.asset(
                                    ImageAssets.logoMain,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                          if (!widget.showBackButton)
                            const MessageQuestionWidget(isInSettings: false),
                        ],
                      ),

                      SizedBox(height: screenHeight * 0.023),

                      // Create Account Title
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: AnimatedBuilder(
                              animation: _controller,
                              builder: (context, child) {
                                return Text(
                                  _controller.getTitle(context),
                                  style: TextStyle(
                                    color: const Color(0xFFD2D4E5),
                                    fontSize: screenWidth * 0.081,
                                    fontFamily: 'Work Sans',
                                    fontWeight: FontWeight.w700,
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: const UnderlineWidget(),
                          ),
                          SizedBox(
                            height: screenHeight * 0.03,
                          ),
                          Center(
                            child: Image.asset(
                              ImageAssets.pinwidgetpng,
                              width: context.screenWidth * 0.45,
                              height: context.screenHeight * 0.09,
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          Center(
                            child: AnimatedBuilder(
                              animation: _controller,
                              builder: (context, child) {
                                return Text(
                                  _controller.getSubtitle(context),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: const Color(0xFFD2D4E5),
                                    fontSize: context.screenWidth * 0.025,
                                    fontFamily: 'Neometric',
                                    fontWeight: FontWeight.w400,
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.08,
                          ),
                          Center(
                            child: AnimatedBuilder(
                              animation: _controller,
                              builder: (context, child) {
                                return PinInputField(
                                  controller: _pinController,
                                  focusNode: _pinFocusNode,
                                  pinLength: 4,
                                  autoFocus: !_controller.inputBlocked,
                                  onPinComplete: () {},
                                  dotColor: const Color(0xFFF2FBF9),
                                  textColor: const Color(0xFFF2FBF9),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          Center(
                            child: AnimatedBuilder(
                              animation: _controller,
                              builder: (context, child) {
                                return CustomKeyboard(
                                  controller: _pinController,
                                  isPinKeyboard: true,
                                  buttonColor: const Color(0x7F050926),
                                  textColor: const Color(0xFFD2D4E5),
                                  onNumberPressed: (number) => _controller.onNumberPressed(number, context),
                                  onBackspacePressed:
                                      _controller.onBackspacePressed,
                                  isDisabled: _controller.inputBlocked ||
                                      _controller.isProcessing,
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          // Error Text Display
                          AnimatedBuilder(
                            animation: _controller,
                            builder: (context, child) {
                              return _controller.errorText != null
                                  ? Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      child: Text(
                                        _controller.errorText!,
                                        style: const TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 14,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  : const SizedBox(height: 16);
                            },
                          ),

                          // Continue Button (only for onboarding flow)
                          if (!widget.isUnlockMode && !widget.isChanging)
                            Center(
                              child: CustomButton(
                                text: L10n.of(context).continueText,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginWelcomeScreen(),
                                    ),
                                  );
                                },
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
