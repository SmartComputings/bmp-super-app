import 'dart:io';
import 'dart:ui';

import 'package:bmp/core/config/app_fonts.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/phone_auth_flow/enter_phone_number_controller.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/phone_auth_flow/models/models/country_model.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/phone_auth_flow/widgets/animated_input_field.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/phone_auth_flow/widgets/auth_method_toggle.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/phone_auth_flow/widgets/country_picker_sheet.dart';
import 'package:bmp/features/auth_onboarding/widgets/CustomButton.dart';
import 'package:bmp/features/auth_onboarding/widgets/CustomTextField.dart';
import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/bg_gradient_theme.dart';
import 'package:bmp/core/config/default_user_service.dart';
import 'package:bmp/core/network/api_client.dart';
import 'package:bmp/shared/utils/session_cleaner.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/constants/position_constants.dart';
import 'package:flutter/material.dart';
import '../../../../shared/widgets/hide_keyboard.dart';
import 'package:bmp/features/auth_onboarding/signup/show_dialog_helper.dart';
import 'package:bmp/features/auth_onboarding/login/login.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/phone_auth_flow/varification_code_screen.dart';
import 'package:bmp/shared/utils/snackbar.dart';
import 'package:bmp/shared/data/models/PhoneVerifyModels.dart';

class EnterPhoneNumberScreen extends StatefulWidget {
  final bool isLogin;
  final String? linkPhoneUsername;
  final String? linkPhonePassword;
  final bool fromPasswordScreen;
  const EnterPhoneNumberScreen({
    super.key,
    this.isLogin = false,
    this.linkPhoneUsername,
    this.linkPhonePassword,
    this.fromPasswordScreen = false,
  });

  @override
  State<EnterPhoneNumberScreen> createState() => _EnterPhoneNumberScreenState();
}

class _EnterPhoneNumberScreenState extends State<EnterPhoneNumberScreen> {
  late EnterPhoneNumberController _controller;
  final _formKey = GlobalKey<FormState>();

  // Authentication method state
  AuthMethod _selectedAuthMethod = AuthMethod.phone;

  // Email controller for email authentication
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  static const int minPhoneLength = 6;
  String? _emailError;

  @override
  void initState() {
    super.initState();
    _controller = EnterPhoneNumberController();
    _controller.setIsLogin(widget.isLogin);
    _controller.setLinkPhoneUsername(widget.linkPhoneUsername);
    _controller.setLinkPhonePassword(widget.linkPhonePassword);
    _controller.addListener(_onControllerUpdate);

    // Show important note with delay for login screens
  }

  @override
  void dispose() {
    _controller.removeListener(_onControllerUpdate);
    _controller.dispose();
    _emailController.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  void _onControllerUpdate() {
    if (mounted) {
      setState(() {});
    }
  }

  void _showCountryPicker() async {
    final result = await showModalBottomSheet<CountryModel>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: CountryPickerSheet(
          countries: _controller.allCountries,
          onCountrySelected: (country) => country,
          selectedCountry: _controller.selectedCountry,
        ),
      ),
    );

    if (result != null) {
      _controller.selectCountry(result);
    }
  }

  // Helper method to validate phone number with context
  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return L10n.of(context).pleaseEnterPhoneNumber;
    }

    //  final requiredLength = _controller.getPhoneLengthForCountry(_controller.selectedCountry.code);

    if (value.length < minPhoneLength) {
      return L10n.of(context).phoneNumberMustBeDigits(minPhoneLength);
    }

    // if (value.length > requiredLength) {
    //   return L10n.of(context).phoneNumberCannotExceedDigits(requiredLength);
    // }

    // Basic digit validation
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return L10n.of(context).phoneNumberMustContainOnlyDigits;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    // Media Query variables (responsive sizes)
    final isLargeDevice = context.screenWidth > 600;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        // Check if keyboard is visible
        if (MediaQuery.of(context).viewInsets.bottom > 0) {
          // Keyboard is visible, close it
          FocusScope.of(context).unfocus();
        } else {
          // Keyboard is closed, allow back navigation
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
                    child: Stack(
                      children: [
                        Form(
                          key: _formKey,
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: context.percentWidth * 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: context.percentHeight * 2),
                                  // 2%
                                  // Top Bar: Logo + Help Icon
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: context.screenWidth * 0.025),
                                        width: context.screenWidth * 0.27,
                                        height: context.screenHeight * 0.05,
                                        child: Image.asset(
                                          ImageAssets.applogo,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: context.percentHeight * 9),
                                  // 8%

                                  // Title - Hidden if security update task is shown
                                  if (!(widget.fromPasswordScreen &&
                                      _selectedAuthMethod ==
                                          AuthMethod.phone)) ...[
                                    Text(
                                      widget.linkPhoneUsername != null
                                          ? L10n.of(context).securityUpdateRequired
                                          : (widget.isLogin
                                              ? L10n.of(context).login
                                              : L10n.of(context).signUpForAccount),
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
                                      widget.linkPhoneUsername != null
                                          ? L10n.of(context).linkPhoneToSecureAccount
                                          : (widget.isLogin
                                              ? L10n.of(context).logInToYourAccount
                                              : L10n.of(context)
                                                  .enterYourPhoneNumber),
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
                                      widget.linkPhoneUsername != null
                                          ? 'You must link a phone number to secure your account before accessing the app.'
                                          : (_selectedAuthMethod == AuthMethod.phone
                                              ? L10n.of(context)
                                                  .verificationSMSMessage
                                              : L10n.of(context)
                                                  .enterEmailOrUsernameToContinue),
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: context.screenWidth * 0.03,
                                        fontFamily: 'Work Sans',
                                        height: 1.4,
                                      ),
                                    ),
                                  ],
                                  // SizedBox(height: context.percentHeight * 1),
                                  // Onboarding Note for Login

                                  //  // Conditional Phone update task from EnterPasswordScreen
                                  //   if (widget.fromPasswordScreen && _selectedAuthMethod == AuthMethod.phone) ...[
                                  //     SizedBox(height: context.percentHeight * 1),
                                  //     _buildSecurityUpdateTask(),
                                  //   ],

                                  SizedBox(height: context.percentHeight * 1),

                                  // Important Login Note Card

                                  // Authentication Method Toggle (only show for login AND not linking phone AND not iOS)
                                  if (widget.isLogin &&
                                      widget.linkPhoneUsername == null &&
                                      !Platform.isIOS) ...[
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              context.screenWidth * 0.02),
                                      child: AuthMethodToggle(
                                        selectedMethod: _selectedAuthMethod,
                                        onMethodChanged: (method) {
                                          setState(() {
                                            _selectedAuthMethod = method;
                                            // Clear errors when switching methods
                                            _controller.clearError();
                                            _emailError = null;
                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                        height: context.percentHeight * 3.4),
                                  ] else ...[
                                    // For registration, phone linking, or iOS, add extra spacing
                                    SizedBox(
                                        height: context.percentHeight * 3.4),
                                  ],
                                  // Conditional Input Fields based on Auth Method
                                  if (_selectedAuthMethod ==
                                          AuthMethod.phone ||
                                      widget.linkPhoneUsername != null) ...[
                                    // Phone Input Container with Custom Country Picker
                                    AnimatedPhoneInputField(
                                      phoneController:
                                          _controller.phoneController,
                                      hintText: L10n.of(context).phoneNumber,
                                      dialCode:
                                          _controller.selectedCountry.dialCode,
                                      errorMessage: _controller.errorMessage,
                                      //  maxLength: 18,
                                      validator: _validatePhoneNumber,
                                      onCountryTap: () {
                                        _showCountryPicker();
                                      },
                                      onChanged: (value) {
                                        if (_controller.errorMessage != null) {
                                          _controller.clearError();
                                        }
                                      },
                                    ),
                                  ] else ...[
                                    // Email/Username Input Field
                                    CustomTextField(
                                      hintText: L10n.of(context).enterEmail,
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.done,
                                      controller: _emailController,
                                      focusNode: _emailFocusNode,
                                      onChanged: (_) {
                                        if (_emailError != null) {
                                          setState(() => _emailError = null);
                                        }
                                      },
                                      onSubmitted: (_) =>
                                          _handleEmailContinue(),
                                      clearable: true,
                                      errorText: _emailError,
                                    ),
                                  ],

                                  SizedBox(height: context.percentHeight * 10),

                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: context.screenWidth * 0.02),
                                    child: Text(
                                      L10n.of(context).ageRestrictionMessage,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: const Color(0xFFD2D4E5),
                                        fontSize: context.screenWidth * 0.028,
                                        fontFamily: 'Neometric',
                                        height: 1.4,
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: context.screenHeight * 0.02),

                                  // Continue Button
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              context.screenWidth * 0.1),
                                      child: CustomButton(
                                        text: L10n.of(context).continueButton,
                                        loading: _controller.isLoading,
                                        onPressed: _controller.isLoading
                                            ? null
                                            : _handleContinue,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleContinue() async {
    debugPrint('🔄 _handleContinue called');
    debugPrint('🔄 linkPhoneUsername: ${widget.linkPhoneUsername}');
    debugPrint('🔄 selectedAuthMethod: $_selectedAuthMethod');
    debugPrint('🔄 isLogin: ${widget.isLogin}');
    
    // If in phone linking mode, always use phone authentication
    if (widget.linkPhoneUsername != null || _selectedAuthMethod == AuthMethod.phone) {
      if (_formKey.currentState?.validate() ?? false) {
        var phoneDigits = _controller.phoneController.text.trim();
        if (phoneDigits.startsWith('0')) {
          phoneDigits = phoneDigits.substring(1);
        }
        final fullPhone = '${_controller.selectedCountry.dialCode}$phoneDigits';
        
        debugPrint('🔄 Full phone number: $fullPhone');

        // Skip phone existence check for login and phone linking mode
        // For login, we'll let Firebase handle the verification and then check on backend
        if (widget.linkPhoneUsername == null) {
          // Check phone existence for both registration and login
          _controller.setLoading(true);
          try {
            // Switch environment if it's a default/tester user
            final isDefault =
                DefaultUserService.instance.isDefaultPhoneUser(fullPhone);
            await DefaultUserService.instance.setActiveUserType(isDefault);
            ApiClient.reinitialize();

            debugPrint('🔄 Checking phone existence...');
            final phoneExists = await _controller.checkPhoneExists(fullPhone);
            _controller.setLoading(false);

            if (widget.isLogin) {
              // For login, phone MUST exist
              if (!phoneExists) {
                showErrorDialog(
                  context,
                  L10n.of(context).error,
                  L10n.of(context).phoneNumberNotFound,
                );
                return;
              }
            } else {
              // For registration (signup), phone MUST NOT exist
              if (phoneExists) {
                showErrorDialog(
                  context,
                  L10n.of(context).error,
                  L10n.of(context).phoneNumberAlreadyInUse,
                );
                return;
              }
            }
          } catch (e) {
            _controller.setLoading(false);
            debugPrint('❌ Error checking phone existence: $e');
            showErrorDialog(
              context,
              L10n.of(context).error,
              L10n.of(context).connectionError,
            );
            return;
          }
        } else {
          debugPrint('🔄 Skipping phone existence check for phone linking');
        }

        debugPrint('🔄 Proceeding to show verification dialog...');
        FocusScope.of(context).unfocus();

        // Clear old auth data before proceeding
        await SessionCleaner.clearAuthData();

        // Verify context is still valid after async operations
        if (!mounted) return;

        // Skip confirmation dialog on iOS, show it on Android
        if (Platform.isIOS) {
          // iOS: Direct API call without confirmation dialog
          debugPrint('🍎 iOS: Skipping confirmation dialog, calling API directly');
          final success = await _controller.performSendOtp(context, fullPhone);
          
          if (success && _controller.firebaseVerificationId != null) {
            _controller.phoneNumber = fullPhone;
            _controller.initializeScreen(_controller.phoneNumber);
            
            if (mounted) {
              CustomSnackbar.show(
                context,
                title: L10n.of(context).success,
                message: L10n.of(context).otpSentSuccessfully,
                type: SnackbarType.success,
              );
              
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VarificationCodeScreen(
                    phone: _controller.phoneNumber,
                    phoneResponse: _controller.phoneVerifyModels,
                    controller: _controller,
                  ),
                ),
              );
            }
          } else {
            if (mounted) {
              CustomSnackbar.show(
                context,
                title: L10n.of(context).error,
                message: _controller.errorMessage ?? 'Failed to send OTP. Please try again.',
                type: SnackbarType.error,
              );
            }
          }
        } else {
          // Android: Show confirmation dialog first
          debugPrint('🤖 Android: Showing confirmation dialog');
          await _controller.showPhoneVerificationDialog(context, phoneNo: fullPhone);
        }

      } else {
        // Show validation error from validator
        final validationError =
            _validatePhoneNumber(_controller.phoneController.text);
        if (validationError != null) {
          _controller.setError(validationError);
        }
      }
    } else {
      _handleEmailContinue();
    }
  }

  Future<void> _handleEmailContinue() async {
    // Clear previous errors
    setState(() {
      _emailError = null;
    });

    // Validate email input
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      setState(() => _emailError = L10n.of(context).emailRequired);
      return;
    }

    // Strict email regex validation
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      setState(
          () => _emailError = L10n.of(context).customerKycInvalidEmailFormat);
      return;
    }

    // Step 1: Initiate Email Login (Passwordless Authentication)
    _controller.setLoading(true);

    try {
      _controller.setCurrentEmail(email);
      final result = widget.isLogin
          ? await _controller.initiateEmailLoginOtp(email)
          : await _controller.initiateEmailRegisterOtp(email);

      if (!mounted) return;
      _controller.setLoading(false);

      if (result['success'] == true) {
        final sessionId = result['session_id'] as String?;

        if (sessionId != null) {
          // Navigate to Email Verification Screen
          final phoneResponse = PhoneVerifyModels();
          phoneResponse.data = Data(sessionId: sessionId, success: true);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VarificationCodeScreen(
                phone: email, // Using email as the identifier
                phoneResponse: phoneResponse,
                controller: _controller,
                isEmailLogin: true,
                isRegister: !widget.isLogin,
                onSuccess: (String? finalSessionId) async {
                  if (widget.isLogin) {
                    // Step 2: Verify Email OTP and handle phone linking
                    await _handleEmailLoginSuccess(finalSessionId);
                  } else {
                    // Registration Flow: Just proceed (SignupView handles this)
                    // Usually registration goes to the next step.
                  }
                },
              ),
            ),
          );
        }
      } else {
        setState(() => _emailError = result['message']);
      }
    } catch (e) {
      if (mounted) {
        setState(() =>
            _emailError = L10n.of(context).connectionError);
      }
    } finally {
      if (mounted) _controller.setLoading(false);
    }
  }

  /// Handle successful email login verification
  Future<void> _handleEmailLoginSuccess(String? sessionId) async {
    final data = _controller.lastVerificationData;
    if (data == null) {
      CustomSnackbar.show(
        context,
        title: L10n.of(context).error,
        message: 'Verification data not found',
        type: SnackbarType.error,
      );
      return;
    }

    final phoneLinked = data['phone_linked'] as bool? ?? false;
    final matrixUsername = data['matrix_username'] as String?;
    final matrixPassword = data['matrix_password'] as String?;

    if (phoneLinked) {
      // Case 1: phone_linked = true - Perform Matrix login and navigate to Home
      if (matrixUsername != null && matrixPassword != null) {
        _controller.setLoading(true);
        try {
          await LoginController.performLogin(
            context: context,
            username: matrixUsername,
            password: matrixPassword,
          );
          // Pop OTP screen and navigate to home
          if (!mounted) return;
          Navigator.of(context).pop();
        } catch (e) {
          CustomSnackbar.show(
            context,
            title: L10n.of(context).error,
            message: 'Auto-login failed after verification',
            type: SnackbarType.error,
          );
        } finally {
          if (mounted) _controller.setLoading(false);
        }
      }
    } else {
      // Case 2: phone_linked = false - User must link phone before accessing the app
      if (!mounted) return;
      Navigator.of(context).pop(); // Pop OTP screen
      
      // Navigate to Phone Linking Flow (full screen)
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EnterPhoneNumberScreen(
            isLogin: false, // Phone linking mode
            linkPhoneUsername: matrixUsername,
            linkPhonePassword: matrixPassword,
            fromPasswordScreen: true,
          ),
        ),
      );
    }
  }

  Widget _buildSecurityUpdateTask() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: const Color(0xFF5F18BF).withOpacity(0.15),
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
        border: Border.all(
          color: const Color(0xFF5F18BF).withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(screenWidth * 0.02),
            decoration: BoxDecoration(
              color: const Color(0xFF5F18BF).withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.security_rounded,
              color: const Color(0xFF5F18BF),
              size: screenWidth * 0.05,
            ),
          ),
          SizedBox(width: screenWidth * 0.04),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  L10n.of(context).securityUpdateRequired,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Work Sans',
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                Text(
                  L10n.of(context).linkPhoneToSecureAccount,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: screenWidth * 0.03,
                    fontFamily: 'Work Sans',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
