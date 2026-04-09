import 'dart:ui';

import 'package:bmp/features/auth_onboarding/widgets/CustomTextField.dart';
import 'package:bmp/features/auth_onboarding/widgets/UnderlineWidget.dart';
import 'package:bmp/shared/utils/app_loading_widget.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/bg_gradient_theme.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/constants/position_constants.dart';
import 'package:bmp/shared/widgets/keyboard_dismissible_popscope.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/localization/l10n.dart';
import 'signup.dart';

class PasswordSignupView extends StatefulWidget {
  final SignupController controller;

  const PasswordSignupView(this.controller, {super.key});

  @override
  State<PasswordSignupView> createState() => _PasswordSignupViewState();
}

class _PasswordSignupViewState extends State<PasswordSignupView> {
  int passwordStrength = 0;
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    widget.controller.passwordController.addListener(_updatePasswordStrength);
  }

  void _updatePasswordStrength() {
    final password = widget.controller.passwordController.text;
    var strength = 0;

    if (password.length >= 6) strength++;
    if (password.contains(RegExp(r'[A-Z]'))) strength++;
    if (password.contains(RegExp(r'[0-9]'))) strength++;
    if (password.contains(RegExp(r'[!@#$%^&*(),.?\":{}|<>]'))) strength++;

    setState(() {
      passwordStrength = strength;
    });
  }

  String strengthText(BuildContext context) {
    switch (passwordStrength) {
      case 0:
      case 1:
        return L10n.of(context).weak;
      case 2:
        return L10n.of(context).medium;
      case 3:
        return L10n.of(context).good;
      case 4:
        return L10n.of(context).strong;
      default:
        return L10n.of(context).weak;
    }
  }

  Color get strengthColor {
    switch (passwordStrength) {
      case 0:
      case 1:
        return const Color(0xFFFF4444);
      case 2:
        return const Color(0xFFFFAA00);
      case 3:
        return const Color(0xFF00AA00);
      case 4:
        return const Color(0xFF5E9BFC);
      default:
        return const Color(0xFFFF4444);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    // final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    // final isKeyboardOpen = keyboardHeight > 0;

    return KeyboardDismissiblePopScope(
      focusNodes: [_passwordFocusNode, _confirmPasswordFocusNode],
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
                color: const Color(0xFF4754FF),
                opacity: 0.6,
              ),

              // Additional gradient shapes
              BgGradientTheme(
                position: ShapePosition.bottomFull,
                height: screenHeight * 0.37,
                colors: const [Color(0xFF1B1C30), Color(0xFFA912BF)],
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
                  child: _buildContent(context, screenHeight, screenWidth),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    double screenHeight,
    double screenWidth,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: screenHeight * 0.05),

        // Logo section
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.only(left: 5),
            width: screenWidth * 0.27,
            height: screenHeight * 0.05,
            child: Image.asset(
              'assets/logo_main.png',
              fit: BoxFit.contain,
            ),
          ),
        ),

        SizedBox(height: screenHeight * 0.015),

        // Create Account Title
        Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 5),
                child: Text(
                  L10n.of(context).createPassword,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.08,
                    fontFamily: 'Work Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.008),
              Container(
                margin: const EdgeInsets.only(left: 5),
                child: const UnderlineWidget(),
              ),
            ],
          ),
        ),

        SizedBox(height: screenHeight * 0.02),

        // Password Image
        Image.asset(
          'assets/images/onboarding/password.png',
          height: 160,
          width: 175,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF4754FF).withOpacity(0.2),
              ),
              child: Icon(
                Icons.lock_outline,
                size: screenWidth * 0.12,
                color: const Color(0xFF4754FF),
              ),
            );
          },
        ),

        SizedBox(height: screenHeight * 0.02),

        // General error message
        if (widget.controller.generalError != null)
          Container(
            margin: EdgeInsets.only(bottom: screenHeight * 0.015),
            padding: EdgeInsets.all(screenWidth * 0.03),
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              border: Border.all(color: Colors.red.shade200),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(Icons.error_outline, color: Colors.red.shade600),
                SizedBox(width: screenWidth * 0.02),
                Expanded(
                  child: Text(
                    widget.controller.generalError!,
                    style: TextStyle(color: Colors.red.shade700),
                  ),
                ),
              ],
            ),
          ),

        // Password TextField
        CustomTextField(
          hintText: L10n.of(context).enterYourPassword,
          prefixImage: Image.asset(
            "assets/icons/lock-icon.png",
            width: 24,
            height: 24,
          ),
          controller: widget.controller.passwordController,
          focusNode: _passwordFocusNode,
          onChanged: (_) => widget.controller.clearPasswordError(),
          obscureText: true,
          showPasswordToggle: true,
          textInputAction: TextInputAction.next,
          readOnly: widget.controller.loading,
          errorText: widget.controller.passwordError,
        ),

        SizedBox(height: screenHeight * 0.02),
        // Confirm Password TextField
        CustomTextField(
          hintText: L10n.of(context).confirmPassword,
          prefixImage: Image.asset(
            "assets/icons/lock-icon.png",
            width: 24,
            height: 24,
          ),
          controller: widget.controller.passwordConfirmController,
          focusNode: _confirmPasswordFocusNode,
          onChanged: (_) => widget.controller.clearPasswordConfirmError(),
          onSubmitted: (_) => widget.controller.register(),
          obscureText: true,
          showPasswordToggle: true,
          textInputAction: TextInputAction.done,
          readOnly: widget.controller.loading,
          errorText: widget.controller.passwordConfirmError,
        ),

        SizedBox(height: screenHeight * 0.02),

        // Password Strength Indicator

        SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Strength bars
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Strength bars
                  ...List.generate(4, (index) {
                    return Container(
                      margin: EdgeInsets.only(right: screenWidth * 0.02),
                      width: 46,
                      height: 4,
                      decoration: BoxDecoration(
                        color: index < passwordStrength
                            ? strengthColor
                            : const Color(0xFF3A3A5C),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    );
                  }),

                  // Add spacing and text after bars
                  SizedBox(width: screenWidth * 0.02),
                  Text(
                    strengthText(context),
                    style: TextStyle(
                      color: strengthColor,
                      fontSize: screenWidth * 0.035,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.01),
              // At least 6 characters requirement
              Row(
                children: [
                  Icon(
                    widget.controller.passwordController.text.length >= 6
                        ? Icons.check_circle
                        : Icons.radio_button_unchecked,
                    color: widget.controller.passwordController.text.length >= 6
                        ? const Color(0xFF4754FF)
                        : const Color(0xFF6B7280),
                    size: screenWidth * 0.04,
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Text(
                    L10n.of(context).atLeast6Characters,
                    style: TextStyle(
                      color: const Color(0xFFD2D4E5),
                      fontSize: screenWidth * 0.03,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        SizedBox(height: screenHeight * 0.05),

        // Continue Button
        GestureDetector(
          onTap: widget.controller.loading
              ? null
              : () async {
                  setState(() => widget.controller.loading = true);
                  widget.controller.register();
                  if (mounted) {
                    setState(() => widget.controller.loading = false);
                  }
                },
          child: Container(
            width: 200,
            height: 61,
            decoration: BoxDecoration(
              color: widget.controller.loading
                  ? const Color(0xFF3976F8).withOpacity(0.7)
                  : const Color(0xFF3976F8),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Center(
              child: widget.controller.loading
                  ? AppLoadingWidget()
                  : Text(
                      L10n.of(context).continueText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
            ),
          ),
        ),

        SizedBox(height: screenHeight * 0.03),

        // Bottom login section
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              L10n.of(context).alreadyHaveAccount,
              style: TextStyle(
                color: const Color(0xFFD2D4E5),
                fontSize: screenWidth * 0.035,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(width: screenWidth * 0.025),
            GestureDetector(
              onTap: widget.controller.loading
                  ? null
                  : () {
                      Navigator.of(context)
                        ..pop()
                        ..pop()
                        ..pop();
                      // context.go('/home/login');
                    },
              child: Text(
                L10n.of(context).logIn,
                style: TextStyle(
                  color: const Color(0xFFD2D4E5),
                  fontSize: screenWidth * 0.035,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: screenHeight * 0.02),
      ],
    );
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    widget.controller.passwordController
        .removeListener(_updatePasswordStrength);
    super.dispose();
  }
}
