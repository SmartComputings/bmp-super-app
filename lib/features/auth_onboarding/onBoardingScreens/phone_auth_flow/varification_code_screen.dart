import 'dart:ui';
import 'package:bmp/core/constant/app_colors.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/auth_onboarding/login/login.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/phone_auth_flow/enter_phone_number_controller.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/phone_auth_flow/email_linking_screen.dart'; // Add this import
import 'package:bmp/features/auth_onboarding/widgets/UnderlineWidget.dart';
import 'package:bmp/features/auth_onboarding/widgets/bg_gradient_theme.dart';
import 'package:bmp/features/auth_onboarding/widgets/pin_input_widget.dart';
import 'package:bmp/shared/utils/app_loading_widget.dart';
import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:bmp/shared/utils/snackbar.dart';
import 'package:bmp/shared/widgets/hide_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart' show Gap;
import 'package:go_router/go_router.dart';
import '../../../../../shared/data/models/PhoneVerifyModels.dart';
import '../../../../shared/widgets/Backgroundgradient/constants/position_constants.dart';

class VarificationCodeScreen extends StatefulWidget {
  final String phone;
  final PhoneVerifyModels? phoneResponse;
  final EnterPhoneNumberController controller;
  final bool isEmailLogin;
  final Future<void> Function(String? sessionId)? onSuccess;
  final bool allowBackNavigation;
  final bool isRegister;
  final bool isLinking;

  const VarificationCodeScreen({
    super.key,
    required this.phone,
    this.phoneResponse,
    required this.controller,
    this.isEmailLogin = false,
    this.onSuccess,
    this.allowBackNavigation = true,
    this.isRegister = false,
    this.isLinking = false,
  });

  @override
  State<VarificationCodeScreen> createState() => _VarificationCodeScreenState();
}

class _VarificationCodeScreenState extends State<VarificationCodeScreen> {
  late EnterPhoneNumberController _controller;
  final PinInputController _pinController = PinInputController();
  bool _isVerifying = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _controller.addListener(_onControllerUpdate);

    debugPrint("=======Phone: ${widget.phone}=====");
    // Firebase Phone Auth: phoneResponse is now optional
    if (widget.phoneResponse != null && widget.phoneResponse!.data != null) {
      debugPrint(
          "=======Session ID: ${widget.phoneResponse!.data!.sessionId}=====");
    } else {
      debugPrint("=======Using Firebase (no backend session yet)=====");
    }
    
    // Set timer duration based on authentication method
    // Email OTP: 1 minute (60 seconds)
    // Phone OTP: 5 minutes (300 seconds)
    final timerDuration = widget.isEmailLogin ? 60 : 300;
    _controller.initializeScreen(widget.phone, duration: timerDuration);
  }

  @override
  void dispose() {
    _controller.removeListener(_onControllerUpdate);
    super.dispose();
  }

  void _onControllerUpdate() {
    if (mounted) {
      setState(() {});

      // Show error messages
      if (_controller.errorMessage != null) {
        CustomSnackbar.show(
          context,
          title: L10n.of(context).error,
          message: _controller.errorMessage!,
          type: SnackbarType.error,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        // Check if keyboard is visible
        if (MediaQuery.of(context).viewInsets.bottom > 0) {
          // Keyboard is visible, close it
          FocusScope.of(context).unfocus();
        } else {
          // Keyboard is closed, handle back press and navigate
          _controller.handleBackPress();
          if (context.mounted && widget.allowBackNavigation) {
            Navigator.of(context).pop();
          }
        }
      },
      child: HideKeyboardOnOutsideTap(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            width: screenWidth,
            height: screenHeight,
            color: AppColors.cardOptionsBg,
            child: Stack(
              children: [
                BgGradientTheme(
                  position: ShapePosition.center,
                  width: screenWidth * 1.8,
                  height: screenWidth * 1.8,
                  color: AppColors.verificationGradientBlue,
                  opacity: 0.6,
                ),
                BgGradientTheme(
                  position: ShapePosition.bottomFull,
                  height: screenHeight * 0.37,
                  colors: const [
                    AppColors.cardOptionsBg,
                    AppColors.verificationGradientPurple,
                  ],
                  opacity: 0.8,
                ),
                BgGradientTheme(
                  position: ShapePosition.bottomLeft,
                  height: screenHeight * 0.44,
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.cardOptionsBg,
                      AppColors.cardOptionsBg,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  opacity: 0.8,
                ),
                BgGradientTheme(
                  position: ShapePosition.bottomRight,
                  height: screenHeight * 0.31,
                  color: AppColors.verificationGradientPurple,
                  opacity: 0.8,
                ),
                BgGradientTheme(
                  position: ShapePosition.topRight,
                  height: screenHeight * 0.44,
                  gradient: const LinearGradient(
                    colors: [AppColors.cardOptionsBg, Color(0x88A912BF)],
                    stops: [0.5, 0.5],
                    begin: Alignment.topRight,
                    end: Alignment.bottomRight,
                  ),
                  opacity: 0.6,
                ),
                BgGradientTheme(
                  position: ShapePosition.bottomRight,
                  height: screenHeight * 0.19,
                  color: AppColors.cardOptionsBg,
                  opacity: 0.8,
                ),
                BgGradientTheme(
                  position: ShapePosition.bottomCenter,
                  height: screenHeight * 0.125,
                  color: AppColors.cardOptionsBg,
                  opacity: 0.8,
                ),
                BgGradientTheme(
                  position: ShapePosition.topLeft,
                  width: screenWidth * 0.5,
                  height: screenHeight * 0.25,
                  color: AppColors.black,
                  opacity: 0.3,
                ),
                BgGradientTheme(
                  position: ShapePosition.topRight,
                  width: screenWidth * 0.5,
                  height: screenHeight * 0.25,
                  color: Colors.black,
                  opacity: 0.3,
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 85, sigmaY: 85),
                  child: Container(color: Colors.transparent),
                ),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.1,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: screenHeight * 0.035),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: screenWidth * 0.012),
                                  width: screenWidth * 0.27,
                                  height: screenHeight * 0.05,
                                  child: Image.asset(
                                    ImageAssets.logoMain,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Gap(screenHeight * 0.1),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              L10n.of(context).verificationCode,
                              style: TextStyle(
                                color: AppColors.verificationTextGrey,
                                fontSize: screenWidth * 0.075,
                                fontFamily: 'Work Sans',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: UnderlineWidget(),
                          ),
                          SizedBox(height: screenHeight * 0.085),
                          Text(
                            widget.isEmailLogin || widget.isLinking
                                ? L10n.of(context).enterOtpEmail
                                : L10n.of(context).enterOtpSms,
                            style: TextStyle(
                              color: AppColors.verificationTextGrey,
                              fontSize: screenWidth * 0.03,
                              fontFamily: 'Neometric',
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          GestureDetector(
                            onTap: widget.allowBackNavigation
                                ? () {
                                    Navigator.of(context).pop();
                                  }
                                : null,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: screenWidth * 0.025,
                              children: [
                                if (widget.allowBackNavigation)
                                  SvgPicture.asset(
                                    ImageAssets.editIcon,
                                    height: screenHeight * 0.03,
                                    width: screenWidth * 0.06,
                                    color: AppColors.white,
                                  ),
                                Text(
                                  widget.phone,
                                  style: TextStyle(
                                    color: AppColors.verificationTextGrey,
                                    fontSize: screenWidth * 0.035,
                                    fontFamily: 'Work Sans',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.05),
                          PinInputWidget(
                            controller: _pinController,
                            onPinComplete: _controller.onPinComplete,
                            onPinChanged: _controller.onPinChanged,
                          ),
                          SizedBox(height: screenHeight * 0.035),
                          Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: screenWidth * 0.022,
                              children: [
                                Text(
                                  L10n.of(context).resendCode,
                                  style: TextStyle(
                                    color: AppColors.verificationTextGrey,
                                    fontSize: screenWidth * 0.03,
                                    fontFamily: 'Work Sans',
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  _controller
                                      .formatTime(_controller.remainingSeconds),
                                  style: TextStyle(
                                    color: AppColors.verificationTextGrey,
                                    fontSize: screenWidth * 0.035,
                                    fontFamily: 'Work Sans',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.06),
                          GestureDetector(
                            onTap: _controller.remainingSeconds == 0
                                ? _handleResendOtp
                                : null,
                            child: Container(
                              width: screenWidth * 0.55,
                              height: screenHeight * 0.08,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    color: _controller.remainingSeconds == 0
                                        ? Colors.white
                                        : Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  L10n.of(context).sendAgain,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: _controller.remainingSeconds == 0
                                        ? AppColors.white
                                        : Colors.grey,
                                    fontSize: screenWidth * 0.04,
                                    fontFamily: 'Work Sans',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.025),
                          GestureDetector(
                            onTap: _controller.isPinComplete &&
                                    !_controller.isVerificationLoading
                                ? _handleVerifyOtp
                                : null,
                            child: Container(
                              width: screenWidth * 0.55,
                              height: screenHeight * 0.08,
                              decoration: ShapeDecoration(
                                color: _controller.isPinComplete &&
                                        !_controller.isLoading
                                    ? AppColors.onBordingButtonColor
                                    : AppColors.verificationDisabledButton,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                              child: Center(
                                child: _controller.isVerificationLoading
                                    ? const AppLoadingWidget()
                                    : Text(
                                        widget.isLinking
                                            ? L10n.of(context).continueText
                                            : (_controller.isLogin
                                                ? L10n.of(context).logIn
                                                : L10n.of(context).continueButton),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: screenWidth * 0.045,
                                          fontFamily: 'Work Sans',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ..._buildPositionedImages(
                  context,
                  screenHeight,
                  screenWidth,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildPositionedImages(
    BuildContext context,
    double screenHeight,
    double screenWidth,
  ) {
    return [
      Positioned(
        top: screenHeight * 0.299,
        left: 0,
        child: SizedBox(
          height: screenHeight * 0.15,
          child: Image.asset(
            ImageAssets.onboardingLeftside,
            fit: BoxFit.contain,
            alignment: Alignment.bottomCenter,
          ),
        ),
      ),
      Positioned(
        bottom: screenHeight * 0.187,
        right: 0,
        child: SizedBox(
          height: screenHeight * 0.15,
          child: Image.asset(
            ImageAssets.onboardingRightside,
            fit: BoxFit.contain,
            alignment: Alignment.topCenter,
          ),
        ),
      ),
    ];
  }

  Future<void> _handleResendOtp() async {
    // Clear the PIN fields
    _pinController.clear();

    if (widget.isEmailLogin) {
      // For email OTP, reinitiate the email OTP process
      final sessionId = widget.phoneResponse?.data?.sessionId;
      if (sessionId == null) {
        CustomSnackbar.show(
          context,
          title: L10n.of(context).error,
          message: 'Invalid session. Please try again.',
          type: SnackbarType.error,
        );
        return;
      }

      // Resend email OTP by calling the appropriate API
      final result = widget.isRegister
          ? await _controller.initiateEmailRegisterOtp(widget.phone)
          : await _controller.initiateEmailLoginOtp(widget.phone);

      if (result['success'] == true && mounted) {
        // Reset timer to 1 minute for email
        _controller.initializeScreen(widget.phone, duration: 60);
        CustomSnackbar.show(
          context,
          title: "",
          message: L10n.of(context).financeSecurityOTPSentSuccess,
          type: SnackbarType.success,
        );
      } else if (mounted) {
        CustomSnackbar.show(
          context,
          title: L10n.of(context).error,
          message: result['message'] ?? 'Failed to resend OTP',
          type: SnackbarType.error,
        );
      }
    } else {
      // For phone OTP, use Firebase resend
      final success = await _controller.resendOtp();
      if (success && mounted) {
        CustomSnackbar.show(
          context,
          title: "",
          message: L10n.of(context).financeSecurityOTPSentSuccess,
          type: SnackbarType.success,
        );
      }
    }
  }

  Future<void> _handleVerifyOtp() async {
    if (_isVerifying) return;
    setState(() => _isVerifying = true);

    try {
      debugPrint('=== Starting OTP Verification ===');
      debugPrint('Phone: ${widget.phone}');

      if (_controller.remainingSeconds <= 0) {
        debugPrint('ERROR: OTP has expired');
        _pinController.clear();
        CustomSnackbar.show(
          context,
          title: L10n.of(context).error,
          message: L10n.of(context).financeOTPExpired,
          type: SnackbarType.error,
        );
        return;
      }

      if (widget.isEmailLogin) {
        final sessionId = widget.phoneResponse?.data?.sessionId;
        if (sessionId == null) {
          CustomSnackbar.show(
            context,
            title: L10n.of(context).error,
            message: 'Invalid session ID',
            type: SnackbarType.error,
          );
          return;
        }

        final result = widget.isLinking
            ? await _controller.verifyEmailLinking(
                sessionId, _controller.otpCode)
            : (widget.isRegister
                ? await _controller.verifyEmailRegisterOtp(sessionId)
                : await _controller.verifyEmailLoginOtp(sessionId));
        if (!mounted) return;

        if (result['success'] == true) {
          debugPrint('SUCCESS: Email OTP verified successfully');
          if (widget.onSuccess != null) {
            await widget.onSuccess!(sessionId);
          } else {
            _controller.setVerificationLoading(false);
            context.go('/onboarding');
          }
        } else {
          debugPrint(
              'FAILED: Email OTP verification failed - ${result['message']}');
          CustomSnackbar.show(
            context,
            title: L10n.of(context).error,
            message: result['message'] ?? L10n.of(context).verificationFailed,
            type: SnackbarType.error,
          );
        }
        return;
      }

      final result = await _controller.verifyOtp(context);
      if (!mounted) return;

      if (result['success'] != true) {
        debugPrint('FAILED: OTP verification failed - ${result['message']}');
        CustomSnackbar.show(
          context,
          title: L10n.of(context).error,
          message: result['message'] ?? L10n.of(context).verificationFailed,
          type: SnackbarType.error,
        );
        return;
      }

      debugPrint('SUCCESS: OTP verified successfully');
      _controller.setVerificationLoading(true);

      final idToken = result['idToken'] as String?;
      if (idToken == null) {
        _controller.setVerificationLoading(false);
        CustomSnackbar.show(
          context,
          title: L10n.of(context).error,
          message: 'Failed to get Firebase ID token',
          type: SnackbarType.error,
        );
        return;
      }

      // Custom success branch for Signup Phone OTP flow
      if (widget.onSuccess != null && !widget.isEmailLogin) {
        debugPrint('🔀 Branching to ONSUCCESS CALLBACK MODE');

        // 1. Get the session ID passed from the previous Email OTP success
        final sessionId = widget.phoneResponse?.data?.sessionId;

        if (sessionId != null) {
          debugPrint('🚀 Finalizing Phone Verification via API...');
          final apiResult =
              await _controller.verifyRegisterPhoneConfig(sessionId, idToken);

          if (apiResult['success'] != true) {
            _controller.setVerificationLoading(false);
            CustomSnackbar.show(
              context,
              title: L10n.of(context).error,
              message: apiResult['message'] ??
                  'Phone verification failed, please try again',
              type: SnackbarType.error,
            );
            return;
          }
          debugPrint('✅ Phone verified successfully with backend!');

          final responseData = apiResult['data'] as Map<String, dynamic>?;
          final isEmailLinked = responseData?['email_linked'] == true;
          final username = responseData?['username'] as String?;

          // REQ: If email_linked == false -> Start Email Linking Flow
          if (!isEmailLinked &&
              username != null &&
              _controller.currentEmail != null) {
            debugPrint('📧 Email not linked. Initiating Email Linking Flow...');
            final linkInitiate = await _controller.initiateEmailLinking(
              _controller.currentEmail!,
              username,
            );

            if (linkInitiate['success'] == true) {
              final linkSessionId = linkInitiate['session_id'] as String;

              final linkPhoneResponse = PhoneVerifyModels();
              linkPhoneResponse.data =
                  Data(sessionId: linkSessionId, success: true);

              if (!mounted) return;
              // Navigate to a NEW Verification Screen for Email Linking
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VarificationCodeScreen(
                    phone: _controller.currentEmail!,
                    phoneResponse: linkPhoneResponse,
                    controller: _controller,
                    isEmailLogin: true, // Reuse Email UI
                    isRegister: widget.isRegister,
                    isLinking: true,
                    onSuccess: (finalSessionId) async {
                      debugPrint('✅ Email linked successfully!');
                      // Finally proceed with original success callback
                      if (widget.onSuccess != null) {
                        await widget.onSuccess!(finalSessionId);
                      }
                    },
                  ),
                ),
              );
              return;
            } else {
              debugPrint('❌ Failed to initiate email linking');
            }
          }

          final newSessionId = responseData?['session_id'] as String?;
          await widget.onSuccess!(newSessionId ?? sessionId);
          return;
        }
      }

      debugPrint(
          '🔍 _handleVerifyOtp check: linkPhoneUsername = ${_controller.linkPhoneUsername}');

      if (_controller.linkPhoneUsername != null) {
        debugPrint('🔀 Branching to LINK PHONE MODE');
        await _handleLinkPhone(idToken);
      } else {
        debugPrint('🔀 Branching to NEW REGISTRATION MODE');
        await _handleFirebaseVerifyAndLogin(idToken, result);
      }
    } catch (e) {
      debugPrint('❌ _handleVerifyOtp unhandled error: $e');
    } finally {
      if (mounted) {
        setState(() => _isVerifying = false);
      }
    }
  }

  Future<void> _handleLinkPhone(String idToken) async {
    final username = _controller.linkPhoneUsername!;
    final password = _controller.linkPhonePassword;

    final linkResult = await _controller.linkPhoneToUser(username, idToken);

    if (!mounted) return;

    if (linkResult['success'] != true) {
      _controller.setVerificationLoading(false);
      debugPrint('FAILED: Link phone failed - ${linkResult['message']}');
      CustomSnackbar.show(
        context,
        title: L10n.of(context).error,
        message: linkResult['message'] ?? 'Failed to link phone',
        type: SnackbarType.error,
      );
      return;
    }

    debugPrint('✅ Phone linked successfully to $username');

    if (password != null) {
      debugPrint('🔐 Performing Matrix login after phone linking...');
      try {
        await LoginController.performLogin(
          context: context,
          username: username,
          password: password,
        );
        debugPrint('✅ Matrix login complete after phone linking');
      } catch (e) {
        debugPrint('❌ Matrix login failed after phone linking: $e');
        if (mounted) {
          _controller.setVerificationLoading(false);
          CustomSnackbar.show(
            context,
            title: L10n.of(context).error,
            message: 'Login failed: ${e.toString()}',
            type: SnackbarType.error,
          );
        }
        return;
      }
    } else {
      debugPrint('⚠️ No password stored, navigating to /onboarding directly');
      _controller.setVerificationLoading(false);
      if (mounted) context.go('/onboarding');
    }

    if (mounted) {
      _controller.setVerificationLoading(false);
    }
  }

  Future<void> _handleFirebaseVerifyAndLogin(
      String idToken, Map<String, dynamic> result) async {
    final verifyResult = await _controller.firebaseVerifyPhone(idToken);

    if (!mounted) return;

    // 2. Extract verification results
    if (verifyResult['success'] != true) {
      _controller.setVerificationLoading(false);
      CustomSnackbar.show(
        context,
        title: L10n.of(context).error,
        message: verifyResult['message'] ?? 'Login failed',
        type: SnackbarType.error,
      );
      return;
    }

    final data = verifyResult['data'] as Map<String, dynamic>;

    // 2.1 Store credentials for later use (Matrix Login)
    final testCredentials = data['test_credentials'] as Map<String, dynamic>?;
    if (testCredentials != null) {
      final mUsername = testCredentials['username'] as String?;
      final mPassword = testCredentials['password'] as String?;
      if (mUsername != null && mPassword != null) {
        _controller.setMatrixCredentials(mUsername, mPassword);
        debugPrint('🔐 Credentials stored in EnterPhoneNumberController');
      }
    }

    final isEmailLinked = data['email_linked'] == true;
    final username = data['username'] as String?;

    // REQ: If email_linked == false -> Start Email Linking Flow
    if (!isEmailLinked && username != null) {
      if (_controller.currentEmail != null &&
          _controller.currentEmail!.isNotEmpty) {
        // Scenario A: Email is already known (from registration stage or previous attempt)
        _initiateLinkingFlow(
            idToken, result, username, _controller.currentEmail!);
      } else {
        // Scenario B: Email is unknown (typical for direct phone login)
        // Navigate to dedicated Email Linking Screen
        _controller.setVerificationLoading(false);
        if (!mounted) return;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EmailLinkingScreen(
              username: username,
              idToken: idToken,
              verifyResult: result,
              controller: _controller,
            ),
          ),
        );
      }
      return;
    }

    final matrixUsername =
        (data['user_id'] as String?) ?? testCredentials?['username'] as String?;
    final matrixPassword = testCredentials?['password'] as String?;

    // // Extract just the username part if it's in full matrix ID format (@username:server)
    // if (matrixUsername != null && matrixUsername.contains('@')) {
    //   matrixUsername = matrixUsername.replaceFirst('@', '').split(':')[0];
    // }

    debugPrint('🔐 Auto-login with username: $matrixUsername');

    if (matrixUsername == null || matrixPassword == null) {
      _controller.setVerificationLoading(false);
      CustomSnackbar.show(
        context,
        title: L10n.of(context).error,
        message: 'Missing login credentials from server',
        type: SnackbarType.error,
      );
      return;
    }

    try {
      await LoginController.performLogin(
        context: context,
        username: matrixUsername,
        password: matrixPassword,
      );

      if (mounted) {
        _controller.setVerificationLoading(false);
        debugPrint('✅ Auto-login successful');
        CustomSnackbar.show(
          context,
          title: L10n.of(context).success,
          message: result['message'] ?? L10n.of(context).verificationSuccessful,
          type: SnackbarType.success,
        );
        context.go('/onboarding');
      }
    } catch (e) {
      debugPrint('❌ Auto-login failed: $e');
      if (mounted) {
        _controller.setVerificationLoading(false);
        CustomSnackbar.show(
          context,
          title: L10n.of(context).error,
          message: 'Login failed: ${e.toString()}',
          type: SnackbarType.error,
        );
      }
    }
  }

  /// Helper to initiate the linking flow after email is known
  Future<void> _initiateLinkingFlow(String idToken, dynamic result,
      String username, String emailToLink) async {
    _controller.setVerificationLoading(true);
    debugPrint('📧 Initiating Email Linking Flow for: $emailToLink');

    final linkInitiate = await _controller.initiateEmailLinking(
      emailToLink,
      username,
    );

    if (linkInitiate['success'] == true) {
      final linkSessionId = linkInitiate['session_id'] as String;

      final linkPhoneResponse = PhoneVerifyModels();
      linkPhoneResponse.data = Data(sessionId: linkSessionId, success: true);

      if (!mounted) return;
      _controller.setVerificationLoading(false);

      // Navigate to a NEW Verification Screen for Email Linking
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VarificationCodeScreen(
            phone: emailToLink,
            phoneResponse: linkPhoneResponse,
            controller: _controller,
            isEmailLogin: true, // Reuse Email UI
            isRegister: widget.isRegister,
            isLinking: true,
            onSuccess: (finalSessionId) async {
              debugPrint('✅ Email linked successfully!');
              // Finally proceed with auto-login after email is linked
              _handleFirebaseVerifyAndLogin(idToken, result);
            },
          ),
        ),
      );
    } else {
      _controller.setVerificationLoading(false);
      if (!mounted) return;
      CustomSnackbar.show(
        context,
        title: L10n.of(context).error,
        message: linkInitiate['message'] ?? 'Failed to initiate email linking',
        type: SnackbarType.error,
      );
    }
  }
}
