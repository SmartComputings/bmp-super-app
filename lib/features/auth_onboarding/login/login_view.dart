import 'dart:ui';

import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/auth_onboarding/widgets/CountryDropdown.dart';
import 'package:bmp/features/auth_onboarding/widgets/CustomTextField.dart';
import 'package:bmp/features/auth_onboarding/widgets/RememberMeToggle.dart';
import 'package:bmp/shared/utils/app_loading_widget.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/bg_gradient_theme.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/constants/position_constants.dart';
import 'package:bmp/shared/widgets/comming_soon_dialogue.dart';
import 'package:bmp/shared/widgets/keyboard_dismissible_popscope.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

import 'login.dart';

class LoginView extends StatelessWidget {
  final LoginController controller;

  const LoginView(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissiblePopScope(
      focusNodes: [controller.usernameFocusNode, controller.passwordFocusNode],
      child: KeyboardDismissiblePopScope(
        focusNodes: [
          controller.usernameFocusNode,
          controller.passwordFocusNode
        ],
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              // Background base color
              Positioned.fill(
                child: Container(
                  color: const Color(0xFF1B1C30),
                ),
              ),

              // Main blue circle background
              BgGradientTheme(
                position: ShapePosition.center,
                width: context.screenWidth * 1.8,
                height: context.screenHeight * 0.85,
                color: const Color(0xFF4754FF),
                opacity: 0.6,
              ),

              // Additional gradient shapes for the background effect
              BgGradientTheme(
                position: ShapePosition.bottomFull,
                height: context.screenHeight * 0.37,
                colors: const [Color(0xFF1B1C30), Color(0xFFA912BF)],
                opacity: 0.8,
              ),
              BgGradientTheme(
                position: ShapePosition.bottomLeft,
                height: context.screenHeight * 0.31,
                color: const Color(0xFF1B1C30),
                opacity: 0.8,
              ),
              BgGradientTheme(
                position: ShapePosition.bottomRight,
                height: context.screenHeight * 0.19,
                color: const Color(0xFF1B1C30),
                opacity: 0.8,
              ),
              BgGradientTheme(
                position: ShapePosition.bottomCenter,
                height: context.screenHeight * 0.12,
                color: const Color(0xFF1B1C30),
                opacity: 0.8,
              ),

              BgGradientTheme(
                position: ShapePosition.topLeft,
                width: context.screenWidth * 0.5,
                height: context.screenHeight * 0.25,
                color: Colors.black,
                opacity: 0.3,
              ),

              BgGradientTheme(
                position: ShapePosition.topRight,
                width: context.screenWidth * 0.5,
                height: context.screenHeight * 0.25,
                color: Colors.black,
                opacity: 0.3,
              ),

              // Blur effect overlay
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 85, sigmaY: 85),
                  child: Container(color: Colors.transparent),
                ),
              ),

              // Main content
              Positioned.fill(
                child: SafeArea(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.percentWidth * 10,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: context.percentHeight * 12),
                        // Logo section
                        SizedBox(
                          width: context.percentWidth * 65,
                          height: context.percentHeight * 12,
                          child: Image.asset(
                            'assets/logo_main.png',
                            fit: BoxFit.contain,
                          ),
                        ),

                        const SizedBox(height: 48),

                        // General error message
                        if (controller.generalError != null)
                          Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.1),
                              border: Border.all(
                                color: Colors.red.withOpacity(0.3),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.error_outline,
                                  color: Colors.red,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    controller.generalError!,
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.close, size: 16),
                                  onPressed: () =>
                                      controller.clearGeneralError(),
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          ),

                        CustomTextField(
                          hintText: L10n.of(context).enterEmail,
                          prefixIcon: Icons.alternate_email,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          controller: controller.usernameController,
                          focusNode: controller.usernameFocusNode,
                          onChanged: (value) {
                            controller.checkWellKnownWithCoolDown(value);
                            controller.clearUsernameError();
                          },
                          suffixImage: controller.usernameError == null &&
                                  controller
                                      .usernameController.text.isNotEmpty &&
                                  controller.usernameController.text.isEmail
                              ? Image.asset(
                                  'assets/chat_icons/gmail_done_icon.png',
                                  width: 15,
                                  height: 15,
                                )
                              : null,
                          clearable: !(controller.usernameError == null &&
                              controller.usernameController.text.isNotEmpty),
                          readOnly: controller.loading,
                          errorText: controller.usernameError,
                          onSubmitted: (_) =>
                              controller.initiateEmailLoginAction(context),
                        ),

                        const SizedBox(height: 25),
                        // Language selector and Remember me row
                        Row(
                          children: [
                            // Language selector
                            const Expanded(
                              child: CountryDropdown(),
                            ),

                            // Remember me toggle
                            Padding(
                              padding: EdgeInsets.only(
                                left: context.percentWidth * 3.95,
                              ),
                              child: RememberMeToggle(
                                initialValue: controller.rememberMe,
                                onChanged: controller.onRememberMeChanged,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Social login section
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              L10n.of(context).orLoginWith,
                              style: const TextStyle(
                                color: Color(0xFFD2D4E5),
                                fontSize: 14,
                                fontFamily: 'Work Sans',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () => showComingSoonDialog(
                                    context,
                                    L10n.of(context).twitterLoginComingSoon,
                                  ),
                                  child: Container(
                                    width: 33,
                                    height: 33,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFF1F2166),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        'assets/icons/twitter_icon.png',
                                        width: 16,
                                        height: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                GestureDetector(
                                  onTap: () => showComingSoonDialog(
                                    context,
                                    L10n.of(context).googleLoginComingSoon,
                                  ),
                                  child: Container(
                                    width: 33,
                                    height: 33,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFF1F2166),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        'assets/icons/google_icon.png',
                                        width: 16,
                                        height: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        controller.loading
                            ? Container(
                                width: context.percentWidth * 55,
                                height: context.percentHeight * 8,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF3976F8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                ),
                                child: const AppLoadingWidget(),
                              )
                            : GestureDetector(
                                onTap: () {
                                  print('DEBUG: GestureDetector tapped');
                                  controller.initiateEmailLoginAction(context);
                                },
                                child: Container(
                                  width: context.percentWidth * 55,
                                  height: context.percentHeight * 8,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF3976F8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      L10n.of(context).logIn,
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

                        SizedBox(height: context.percentHeight * 2),
                        // Bottom signup section
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                L10n.of(context).doYouHaveAccount,
                                style: const TextStyle(
                                  color: Color(0xFFD2D4E5),
                                  fontSize: 12,
                                  fontFamily: 'Work Sans',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(width: 10),
                              InkWell(
                                onTap: controller.loading
                                    ? null
                                    : controller.signUp,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    L10n.of(context).register,
                                    style: const TextStyle(
                                      color: Color(0xFFD2D4E5),
                                      fontSize: 14,
                                      fontFamily: 'Work Sans',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
    );
  }
}
