import 'dart:ui';

import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/auth_onboarding/widgets/CustomButton.dart';
import 'package:bmp/features/auth_onboarding/widgets/CustomTextField.dart';
import 'package:bmp/features/auth_onboarding/widgets/UnderlineWidget.dart';
import 'package:bmp/shared/utils/snackbar.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/bg_gradient_theme.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/constants/position_constants.dart';
import 'package:bmp/shared/widgets/keyboard_dismissible_popscope.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matrix/matrix.dart';

class ForgotPassword extends StatefulWidget {
  final Client client;
  final String initialEmail;

  const ForgotPassword({
    super.key,
    required this.client,
    this.initialEmail = '',
  });

  @override
  State<ForgotPassword> createState() => ForgotPasswordController();
}

class ForgotPasswordController extends State<ForgotPassword> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  static int sendAttempt = 0;
  int currentStep = 0;
  bool isLoading = false;
  bool showPassword = false;
  bool showConfirmPassword = false;
  String? errorMessage;
  String? confirmPasswordError;
  String? clientSecret;
  String? sid;
  int passwordStrength = 0;

  @override
  void initState() {
    super.initState();
    emailController.text = widget.initialEmail;
    passwordController.addListener(_updatePasswordStrength);
    print(
      'DEBUG: Controllers initialized - Email: ${emailController.hashCode}, Password: ${passwordController.hashCode}, Confirm: ${confirmPasswordController.hashCode}',
    );
  }

  void _updatePasswordStrength() {
    final password = passwordController.text;
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
        return const Color(0xFF4754FF);
      default:
        return const Color(0xFFFF4444);
    }
  }

  Future<void> sendResetEmail() async {
    if (emailController.text.trim().isEmpty) {
      setState(() => errorMessage = L10n.of(context).emailIsRequired);
      return;
    }

    // Validate email format
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
        .hasMatch(emailController.text.trim())) {
      setState(() => errorMessage = L10n.of(context).pleaseEnterValidEmail);
      return;
    }

    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      // Check if client is connected
      if (!widget.client.isLogged()) {
        // Try to connect to homeserver first
        await widget.client
            .checkHomeserver(Uri.parse('https://server.be-mindpower.net'));
      }

      clientSecret = DateTime.now().millisecondsSinceEpoch.toString();
      print('DEBUG: Homeserver: ${widget.client.homeserver}');
      print('DEBUG: Sending reset email to: ${emailController.text.trim()}');
      print('DEBUG: Client secret: $clientSecret');
      print('DEBUG: Send attempt: $sendAttempt');

      final response = await widget.client.requestTokenToResetPasswordEmail(
        clientSecret!,
        emailController.text.trim(),
        sendAttempt++,
      );

      print('DEBUG: Response received: ${response.sid}');
      sid = response.sid;
      setState(() {
        currentStep = 1;
        isLoading = false;
      });
    } catch (e) {
      print('DEBUG: Error sending reset email: $e');
      print('DEBUG: Error type: ${e.runtimeType}');
      var errorMsg = L10n.of(context).failedToSendResetEmail;

      if (e is MatrixException) {
        switch (e.error) {
          case MatrixError.M_THREEPID_NOT_FOUND:
            errorMsg = L10n.of(context).emailNotFound;
            break;
          case MatrixError.M_THREEPID_IN_USE:
            errorMsg = L10n.of(context).emailAlreadyInUse;
            break;
          case MatrixError.M_SERVER_NOT_TRUSTED:
            errorMsg = L10n.of(context).serverConfigError;
            break;
          case MatrixError.M_UNKNOWN:
            errorMsg = L10n.of(context).serverError;
            break;
          default:
            errorMsg =
                e.errorMessage ?? L10n.of(context).failedToSendResetEmail;
        }
      } else if (e.toString().contains('SocketException') ||
          e.toString().contains('network')) {
        errorMsg = L10n.of(context).networkError;
      } else if (e.toString().contains('timeout') ||
          e.toString().contains('TimeoutException')) {
        errorMsg = L10n.of(context).requestTimeout;
      } else if (e.toString().contains('404')) {
        errorMsg = L10n.of(context).emailServiceNotAvailable;
      } else if (e.toString().contains('500')) {
        errorMsg = L10n.of(context).serverErrorTryLater;
      }

      setState(() {
        errorMessage = errorMsg;
        isLoading = false;
      });
    }
  }

  Future<void> resetPassword() async {
    setState(() {
      errorMessage = null;
      confirmPasswordError = null;
    });

    if (passwordController.text.isEmpty) {
      setState(() => errorMessage = L10n.of(context).passwordIsRequired);
      return;
    }

    if (passwordController.text.length < 6) {
      setState(() => errorMessage = L10n.of(context).passwordMinLength);
      return;
    }

    if (confirmPasswordController.text.isEmpty) {
      setState(
        () => confirmPasswordError = L10n.of(context).confirmPasswordRequired,
      );
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      setState(
        () => confirmPasswordError = L10n.of(context).passwordsDoNotMatch,
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final data = <String, dynamic>{
        'new_password': passwordController.text,
        'logout_devices': false,
        "auth": AuthenticationThreePidCreds(
          type: AuthenticationTypes.emailIdentity,
          threepidCreds: ThreepidCreds(
            sid: sid!,
            clientSecret: clientSecret!,
          ),
        ).toJson(),
      };

      await widget.client.request(
        RequestType.POST,
        '/client/v3/account/password',
        data: data,
      );

      CustomSnackbar.show(
        context,
        title: "",
        message: L10n.of(context).passwordHasBeenChanged,
        type: SnackbarType.error,
      );

      context.pop(
        {'email': emailController.text, 'password': passwordController.text},
      );
    } catch (e) {
      setState(() {
        confirmPasswordError = L10n.of(context).emailNotVerified;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    // final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    // final isKeyboardOpen = keyboardHeight > 0;

    return KeyboardDismissiblePopScope(
      focusNodes: [
        _emailFocusNode,
        _passwordFocusNode,
        _confirmPasswordFocusNode
      ],
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
                opacity: 0.8,
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
                opacity: 0.6,
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
                  child: _buildMainContent(context, screenHeight, screenWidth),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainContent(
    BuildContext context,
    double screenHeight,
    double screenWidth,
  ) {
    return Column(
      children: [
        SizedBox(height: screenHeight * 0.063),

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

        SizedBox(height: screenHeight * 0.025),

        // Title
        Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 5),
                child: Text(
                  currentStep == 0
                      ? L10n.of(context).resetPassword
                      : L10n.of(context).checkYourEmail,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.085,
                    fontFamily: 'Work Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Container(
                margin: const EdgeInsets.only(left: 5),
                child: const UnderlineWidget(),
              ),
            ],
          ),
        ),

        SizedBox(height: screenHeight * 0.038),

        if (currentStep == 0) ...[
          // Email TextField
          CustomTextField(
            hintText: L10n.of(context).enterYourEmail,
            prefixIcon: Icons.alternate_email,
            controller: emailController,
            focusNode: _emailFocusNode,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            readOnly: isLoading,
            errorText: errorMessage,
            onChanged: (_) => setState(() => errorMessage = null),
            onSubmitted: (_) => sendResetEmail(),
          ),

          SizedBox(height: screenHeight * 0.038),

          // Send Reset Link Button
          CustomButton(
            text: L10n.of(context).sendResetLink,
            onPressed: isLoading ? null : sendResetEmail,
            loading: isLoading,
          ),
        ] else ...[
          // Email sent icon
          SizedBox(
            width: screenWidth * 0.27,
            height: screenWidth * 0.27,
            child: Icon(
              Icons.mark_email_read,
              size: screenWidth * 0.2,
              color: const Color(0xFF4754FF),
            ),
          ),

          SizedBox(height: screenHeight * 0.02),

          // Email sent message
          Text(
            L10n.of(context).weSentResetLink(emailController.text),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color.fromARGB(255, 112, 125, 243),
              fontSize: screenWidth * 0.037,
              fontFamily: 'Work Sans',
              fontWeight: FontWeight.w400,
            ),
          ),

          SizedBox(height: screenHeight * 0.02),

          // Warning message
          Container(
            padding: EdgeInsets.all(screenWidth * 0.04),
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.1),
              border: Border.all(color: Colors.orange.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              L10n.of(context).verificationWarning,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.orange.shade300,
                fontSize: screenWidth * 0.035,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          SizedBox(height: screenHeight * 0.025),

          // New Password TextField
          CustomTextField(
            key: const Key('new_password_field'),
            hintText: L10n.of(context).enterNewPassword,
            prefixIcon: Icons.lock_outline,
            controller: passwordController,
            focusNode: _passwordFocusNode,
            obscureText: true,
            showPasswordToggle: true,
            textInputAction: TextInputAction.next,
            readOnly: isLoading,
            errorText: errorMessage,
            onChanged: (_) {
              setState(() => errorMessage = null);
              _updatePasswordStrength();
            },
          ),

          SizedBox(height: screenHeight * 0.025),

          // Confirm Password TextField
          CustomTextField(
            key: const Key('confirm_password_field'),
            hintText: L10n.of(context).confirmNewPassword,
            prefixIcon: Icons.lock_outline,
            controller: confirmPasswordController,
            focusNode: _confirmPasswordFocusNode,
            obscureText: true,
            showPasswordToggle: true,
            textInputAction: TextInputAction.done,
            readOnly: isLoading,
            errorText: confirmPasswordError,
            onChanged: (_) => setState(() => confirmPasswordError = null),
            onSubmitted: (_) => resetPassword(),
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
                  children: List.generate(4, (index) {
                    return Container(
                      margin: EdgeInsets.only(right: screenWidth * 0.02),
                      width: screenWidth * 0.16,
                      height: 4,
                      decoration: BoxDecoration(
                        color: index < passwordStrength
                            ? strengthColor
                            : const Color(0xFF3A3A5C),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    );
                  }),
                ),
                SizedBox(height: screenHeight * 0.008),
                // Strength text
                Text(
                  strengthText(context),
                  style: TextStyle(
                    color: strengthColor,
                    fontSize: screenWidth * 0.035,
                    fontFamily: 'Work Sans',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                // At least 6 characters requirement
                Row(
                  children: [
                    Icon(
                      passwordController.text.length >= 6
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked,
                      color: passwordController.text.length >= 6
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

          SizedBox(height: screenHeight * 0.038),

          // Reset Password Button
          CustomButton(
            text: L10n.of(context).resetPassword,
            onPressed: isLoading ? null : resetPassword,
            loading: isLoading,
          ),
        ],

        SizedBox(height: screenHeight * 0.02),

        // Back to login button
        TextButton(
          onPressed: () => context.pop(),
          child: Text(
            L10n.of(context).backToLogin,
            style: TextStyle(
              color: const Color(0xFF4754FF),
              fontSize: screenWidth * 0.04,
              fontFamily: 'Work Sans',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    passwordController.removeListener(_updatePasswordStrength);
    super.dispose();
  }
}
