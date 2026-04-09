import 'dart:ui';

import 'package:bmp/core/config/app_fonts.dart';
import 'package:bmp/core/config/default_user_service.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/core/network/api_client.dart';
import 'package:bmp/features/auth_onboarding/login/login.dart';

import 'package:bmp/features/auth_onboarding/onBoardingScreens/phone_auth_flow/enter_phone_number.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/phone_auth_flow/enter_phone_number_controller.dart';

import 'package:bmp/features/auth_onboarding/widgets/CustomButton.dart';
import 'package:bmp/features/auth_onboarding/widgets/CustomTextField.dart';
import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/utils/session_cleaner.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/bg_gradient_theme.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/constants/position_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bmp/shared/widgets/matrix.dart';

import '../../../../shared/widgets/hide_keyboard.dart';

class EnterPasswordScreen extends StatefulWidget {
  final String usernameOrEmail;
  final bool isLogin;

  const EnterPasswordScreen({
    super.key,
    required this.usernameOrEmail,
    this.isLogin = false,
  });

  @override
  State<EnterPasswordScreen> createState() => _EnterPasswordScreenState();
}

class _EnterPasswordScreenState extends State<EnterPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  String? _passwordError;
  bool _isLoading = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLargeDevice = context.screenWidth > 600;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        // Check if keyboard is open
        final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

        if (isKeyboardOpen) {
          // First press: Close keyboard
          FocusScope.of(context).unfocus();
        } else {
          // Second press: Pop the screen
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
                  // Main blue circle background
                  BgGradientTheme(
                    position: ShapePosition.center,
                    width: context.percentWidth * 180,
                    height: context.percentWidth * 180,
                    color: const Color(0xFF363EC1),
                    opacity: 0.6,
                  ),

                  // Additional gradient shapes for the background effect
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

                  // Blur effect overlay
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 85, sigmaY: 85),
                      child: Container(color: Colors.transparent),
                    ),
                  ),

                  // Main content
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

                            // Top Bar: Logo + Back Button
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

                            // Title
                            Text(
                              widget.isLogin
                                  ? L10n.of(context).login
                                  : L10n.of(context).signUpForAccount,
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

                            // Subtitle
                            Text(
                              'Enter your password',
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
                              'Enter your password to continue',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: context.screenWidth * 0.03,
                                fontFamily: 'Work Sans',
                                height: 1.4,
                              ),
                            ),

                            SizedBox(height: context.percentHeight * 7.4),

                            // Password Input Field
                            CustomTextField(
                              hintText: L10n.of(context).password,
                              // prefixImage: Image.asset(
                              //   'assets/icons/password_icon.png',
                              //   width: 22,
                              //   height: 22,
                              // ),
                              // suffixImage: Image.asset(
                              //   'assets/icons/show_password-icon.png',
                              //   width: 22,
                              //   height: 22,
                              // ),
                              obscureText: true,
                              showPasswordToggle: true,
                              textInputAction: TextInputAction.done,
                              controller: _passwordController,
                              focusNode: _passwordFocusNode,
                              onChanged: (_) {
                                if (_passwordError != null) {
                                  setState(() => _passwordError = null);
                                }
                              },
                              onSubmitted: (_) => _handleLogin(),
                              readOnly: _isLoading,
                              errorText: _passwordError,
                            ),

                            SizedBox(height: context.percentHeight * 2),

                            // Forgot Password
                            // Align(
                            //   alignment: Alignment.centerRight,
                            //   child: GestureDetector(
                            //     onTap: _isLoading ? null : _handleForgotPassword,
                            //     child: Text(
                            //       L10n.of(context).forgotYourPassword,
                            //       style: const TextStyle(
                            //         color: Color(0xFFD2D4E5),
                            //         fontSize: 14,
                            //         fontFamily: 'Work Sans',
                            //         fontWeight: FontWeight.w600,
                            //       ),
                            //     ),
                            //   ),
                            // ),

                            SizedBox(height: context.percentHeight * 10),

                            // Continue Button
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
                                    child: CustomButton(
                                      text: L10n.of(context).continueButton,
                                      loading: _isLoading,
                                      onPressed:
                                          _isLoading ? null : _handleLogin,
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

  void _handleForgotPassword() async {
    // Navigate to forgot password screen using GoRouter
    final matrix = Matrix.of(context);
    final client = await matrix.getLoginClient();
    if (!mounted) return;

    context.push('/home/forgot-password', extra: {
      'client': client,
      'email': RegExp(r'(.+)@(.+)\.(.+)').hasMatch(widget.usernameOrEmail)
          ? widget.usernameOrEmail
          : '',
    });
  }

  Future<void> _handleLogin() async {
    // Clear previous errors
    setState(() {
      _passwordError = null;
    });

    final password = _passwordController.text;

    // Validate password
    if (password.isEmpty) {
      setState(() => _passwordError = L10n.of(context).passwordRequired);
      return;
    }

    // Clear old auth data FIRST (before checking default user)
    await SessionCleaner.clearAuthData();

    // Check if this is a default/test email user and switch base URL accordingly
    final isDefault = DefaultUserService.instance.isDefaultEmailUser(widget.usernameOrEmail, password);
    await DefaultUserService.instance.setActiveUserType(isDefault);
    ApiClient.reinitialize();

    // If this is registration flow, navigate to phone number screen
    if (!widget.isLogin) {
      setState(() => _isLoading = true);

      // Add a small delay for better UX
      await Future.delayed(const Duration(milliseconds: 300));

      if (mounted) {
        setState(() => _isLoading = false);

        // Navigate to phone number screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const EnterPhoneNumberScreen(isLogin: false),
          ),
        );
      }
      return;
    }

    // --- LOGIN FLOW ---
    setState(() => _isLoading = true);

    try {
      // Step 1: Validate credentials against Matrix FIRST
      debugPrint('🔐 Step 1: Validating credentials against Matrix...');
      final validationResult = await LoginController.validateCredentials(
        username: widget.usernameOrEmail,
        password: password,
      );
      debugPrint('🔐 Step 1 result: $validationResult');

      if (!mounted) return;

      if (validationResult['success'] != true) {
        // Credentials are invalid — show proper error and stop
        final errcode = validationResult['errcode'] as String? ?? 'UNKNOWN';
        final serverMessage = validationResult['message'] as String? ?? '';
        String errorMessage;

        switch (errcode) {
          case 'M_FORBIDDEN':
          case 'M_USER_DEACTIVATED':
            errorMessage =
                RegExp(r'(.+)@(.+)\.(.+)').hasMatch(widget.usernameOrEmail)
                    ? L10n.of(context).invalidEmailOrPassword
                    : L10n.of(context).invalidUsernameOrPassword;
            break;
          case 'M_LIMIT_EXCEEDED':
            errorMessage = L10n.of(context).tooManyLoginAttempts;
            break;
          case 'CONNECTION_ERROR':
            errorMessage = L10n.of(context).connectionError;
            break;
          default:
            errorMessage = serverMessage.isNotEmpty
                ? serverMessage
                : L10n.of(context).loginFailed(errcode);
        }

        debugPrint('❌ Credential validation failed: $errcode — $errorMessage');
        setState(() {
          _passwordError = errorMessage;
          _isLoading = false;
        });
        return;
      }

      debugPrint('✅ Credentials validated successfully');

      // Step 2: Check if user has phone linked
      // Extract the source-of-truth username from the Matrix userId returned by the server
      final matrixId = validationResult['userId'] as String? ?? '';
      final username = matrixId.contains(':')
          ? matrixId.split(':')[0].replaceFirst('@', '')
          : matrixId;

      debugPrint('📱 Step 2: Checking phone status for username: $username');
      final checkResult =
          await EnterPhoneNumberController.checkUsernamePhone(username);
      debugPrint('📱 Step 2 result: $checkResult');

      if (!mounted) return;

      bool hasPhoneLinked = true; // default to true (safe fallback)

      if (checkResult['success'] == true) {
        final data = checkResult['data'] as Map<String, dynamic>;
        hasPhoneLinked = data['hasPhoneLinked'] == true;
        debugPrint('📱 hasPhoneLinked: $hasPhoneLinked');
      } else {
        debugPrint(
            '⚠️ Check username API failed: ${checkResult['message']}, assuming phone linked');
      }

      if (hasPhoneLinked) {
        // Step 3a: Phone is linked → perform login (Matrix will auto-navigate)
        debugPrint(
            '✅ Phone is linked, performing Matrix login for username: $username');
        await LoginController.performLogin(
          context: context,
          username: username, // Use extracted username localpart
          password: password,
        );
        // Matrix onLoginStateChanged listener will auto-navigate to main screen
        debugPrint('✅ Login complete, Matrix will navigate');
      } else {
        // Step 3b: No phone linked → go to phone screen WITHOUT logging in
        // Pass the extracted username localpart so login happens after phone linking
        debugPrint(
            '📱 No phone linked, redirecting to phone flow for: $username');
        setState(() => _isLoading = false);

        if (mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EnterPhoneNumberScreen(
                isLogin: true,
                linkPhoneUsername: username, // Use extracted username localpart
                linkPhonePassword: password,
                fromPasswordScreen: true,
              ),
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('❌ Login flow error: $e');
      if (mounted) {
        setState(() {
          _passwordError = L10n.of(context).invalidUsernameOrPassword;
          _isLoading = false;
        });
      }
      return;
    }

    if (mounted) {
      setState(() => _isLoading = false);
    }
  }
}
