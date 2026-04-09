import 'dart:ui';

import 'package:bmp/features/auth_onboarding/widgets/CustomButton.dart';
import 'package:bmp/features/auth_onboarding/widgets/CustomTextField.dart';
import 'package:bmp/features/auth_onboarding/widgets/UnderlineWidget.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/phone_auth_flow/widgets/animated_input_field.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/phone_auth_flow/models/models/country_model.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/phone_auth_flow/widgets/country_picker_sheet.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/bg_gradient_theme.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/constants/position_constants.dart';
import 'package:bmp/shared/widgets/keyboard_dismissible_popscope.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/localization/l10n.dart';
import '../../../core/network/api_client.dart';
import '../../../shared/widgets/hide_keyboard.dart';
import 'password_signup_view.dart';
import 'show_dialog_helper.dart';
import 'signup.dart';
import 'package:bmp/shared/data/models/PhoneVerifyModels.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/phone_auth_flow/varification_code_screen.dart';
import 'package:bmp/shared/utils/snackbar.dart';
import 'package:bmp/features/auth_onboarding/login/login.dart';

class SignupView extends StatefulWidget {
  final SignupController controller;

  const SignupView(this.controller, {super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  int passwordStrength = 0;
  final FocusNode _emailFocusNode = FocusNode();

  // Phone input state
  final TextEditingController _phoneController = TextEditingController();
  String? _phoneError;
  String? localUsernameError;
  String? localEmailError;
  static const int _minPhoneLength = 6;
  CountryModel _selectedCountry = CountryModel(
    name: 'Colombia',
    code: 'CO',
    dialCode: '+57',
  );

  List<CountryModel> get _allCountries {
    return codes
        .map((country) => CountryModel(
              name: country['name']!,
              code: country['code']!,
              dialCode: country['dial_code']!,
            ))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    widget.controller.passwordController.addListener(_updatePasswordStrength);
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _emailFocusNode.dispose();
    super.dispose();
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
          countries: _allCountries,
          onCountrySelected: (country) => country,
          selectedCountry: _selectedCountry,
        ),
      ),
    );
    if (result != null) {
      setState(() {
        _selectedCountry = result;
        _phoneController.clear();
        _phoneError = null;
      });
    }
  }

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return L10n.of(context).pleaseEnterPhoneNumber;
    }
    if (value.length < _minPhoneLength) {
      return L10n.of(context).phoneNumberMustBeDigits(_minPhoneLength);
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return L10n.of(context).phoneNumberMustContainOnlyDigits;
    }
    return null;
  }

  void _updatePasswordStrength() {
    final password = widget.controller.passwordController.text;
    var strength = 0;

    if (password.length >= 6) strength++;
    if (password.contains(RegExp(r'[A-Z]'))) strength++;
    if (password.contains(RegExp(r'[0-9]'))) strength++;
    if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) strength++;

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

  SignupController get controller => widget.controller;

  void clearLocalEmailError() {
    if (localEmailError != null) {
      setState(() => localEmailError = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom;
    final isKeyboardOpen = keyboardHeight > 0;

    return KeyboardDismissiblePopScope(
      focusNodes: [_emailFocusNode],
      onNavigateBack: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(L10n.of(context).confirmGoBack),
            content: Text(L10n.of(context).goBackProgressLost),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(L10n.of(context).cancel),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(L10n.of(context).goBack),
              ),
            ],
          ),
        );
        if (shouldPop == true) {
          Navigator.of(context).pop();
        }
      },
      child: HideKeyboardOnOutsideTap(
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
                    controller: ScrollController(),
                    padding: EdgeInsets.only(
                      left: screenWidth * 0.1,
                      right: screenWidth * 0.1,
                      bottom: MediaQuery.of(context).viewInsets.bottom +
                          bottomPadding,
                    ),
                    child: _buildMainContent(context, screenHeight, screenWidth),
                  ),
                ),

                // Positioned images - only show when keyboard is closed
                if (!isKeyboardOpen)
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

  Widget _buildMainContent(
    BuildContext context,
    double screenHeight,
    double screenWidth,
  ) {
    return Column(
      children: [
        SizedBox(height: screenHeight * 0.050),

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

        SizedBox(height: screenHeight * 0.018),

        // Create Account Title
        Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 5),
                child: Text(
                  L10n.of(context).createAccount,
                  style: const TextStyle(
                    color: Color(0xFFD2D4E5) /* Text-Icon-Body */,
                    fontSize: 32,
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

        SizedBox(height: screenHeight * 0.030),

        // General error message
        if (controller.generalError != null)
          Container(
            margin: EdgeInsets.only(bottom: screenHeight * 0.02),
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
                    controller.generalError!,
                    style: TextStyle(color: Colors.red.shade700),
                  ),
                ),
              ],
            ),
          ),

        // Username TextField
        CustomTextField(
          hintText: L10n.of(context).username,
          prefixIcon: Icons.person_outline,
          controller: widget.controller.fullNameController,
          onChanged: (_) {
            if (localUsernameError != null) {
              setState(() => localUsernameError = null);
            }
          },
          textInputAction: TextInputAction.next,
          readOnly: widget.controller.loading,
          errorText: localUsernameError,
        ),
        SizedBox(height: screenHeight * 0.018),
        AnimatedPhoneInputField(
          phoneController: _phoneController,
          hintText: L10n.of(context).phoneNumber,
          dialCode: _selectedCountry.dialCode,
          errorMessage: _phoneError,
          validator: _validatePhoneNumber,
          onCountryTap: () {
            _showCountryPicker();
          },
          onChanged: (value) {
            if (_phoneError != null) {
              setState(() => _phoneError = null);
            }
          },
        ),

        SizedBox(height: screenHeight * 0.018),

        // Email TextField
        CustomTextField(
          hintText: L10n.of(context).exampleEmail,
          prefixIcon: Icons.alternate_email,
          suffixImage: Image.asset(
            'assets/chat_icons/gmail_done_icon.png',
            width: 12,
            height: 12,
          ),
          controller: controller.emailController,
          focusNode: _emailFocusNode,
          onChanged: (_) => clearLocalEmailError(),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          readOnly: controller.loading,
          errorText: localEmailError,
          obscureText: false,
        ),

        SizedBox(height: screenHeight * 0.030),

        // Continue Button

        CustomButton(
          text: L10n.of(context).continueButton,
          loading: controller.loading,
          onPressed: controller.loading
              ? null
              : () async {
                  setState(() => controller.loading = true);

                  final phone = _phoneController.text.trim();
                  final username =
                      widget.controller.fullNameController.text.trim();
                  final email = controller.emailController.text.trim();

                  var hasErrors = false;

                  if (username.isEmpty) {
                    setState(() =>
                        localUsernameError = L10n.of(context).usernameRequired);
                    hasErrors = true;
                  }

                  final phoneValidation = _validatePhoneNumber(phone);
                  if (phoneValidation != null) {
                    setState(() => _phoneError = phoneValidation);
                    hasErrors = true;
                  }

                  if (email.isEmpty) {
                    setState(
                      () => localEmailError = L10n.of(context).emailRequired,
                    );
                    hasErrors = true;
                  } else if (!RegExp(
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                  ).hasMatch(email)) {
                    setState(
                      () => localEmailError =
                          L10n.of(context).pleaseEnterValidEmail,
                    );
                    hasErrors = true;
                  }

                  if (hasErrors) {
                    setState(() => controller.loading = false);
                    return;
                  }

                  // Generate formatted phone number once to be used in both validation and OTP steps
                  var phoneDigits = phone;
                  if (phoneDigits.startsWith('0')) {
                    phoneDigits = phoneDigits.substring(1);
                  }
                  final fullPhone = '${_selectedCountry.dialCode}$phoneDigits';

                  // Step 0: Check if username is already taken
                  try {
                    final usernameCheck =
                        await controller.checkUsernameAvailability(username);
                    if (usernameCheck['success'] == true) {
                      final available = usernameCheck['available'] == true;

                      if (!available) {
                        setState(() => controller.loading = false);
                        showErrorDialog(
                          context,
                          L10n.of(context).error,
                          'This username is already taken. Please choose another.',
                        );
                        return;
                      }
                    }
                  } catch (e) {
                    debugPrint('⚠️ Username check failed (non-blocking): $e');
                  }

                  // Check if phone number already exists
                  try {
                    final headers = await ApiClient.getHeadersWithoutUser();
                    debugPrint('DEBUG: Headers at phone check: $headers');
                    debugPrint(
                        'DEBUG: Body at phone check: {"phone": "$fullPhone"}');

                    final phoneExists =
                        await controller.checkPhoneExists(fullPhone);
                    if (phoneExists) {
                      setState(() => controller.loading = false);
                      showErrorDialog(
                        context,
                        L10n.of(context).error,
                        L10n.of(context).emailAlreadyInUse,
                      );
                      return;
                    }
                  } catch (e) {
                    setState(() => controller.loading = false);
                    showErrorDialog(
                      context,
                      L10n.of(context).error,
                      L10n.of(context).connectionError,
                    );
                    return;
                  }

                  // Step 2: Email Check & Send OTP
                  controller.phoneAuthController.setCurrentEmail(email);
                  final initiateResult = await controller.phoneAuthController
                      .initiateEmailRegisterOtp(email);

                  if (initiateResult['success'] == true) {
                    final sessionId = initiateResult['session_id'] as String?;

                    debugPrint(
                        '🔑 Extracted Session ID from initiate: $sessionId');

                    PhoneVerifyModels phoneResponse = PhoneVerifyModels();
                    if (sessionId != null) {
                      phoneResponse.data = Data(
                        sessionId: sessionId,
                        success: true,
                      );
                    }

                    setState(() => controller.loading = false);

                    if (!context.mounted) return;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VarificationCodeScreen(
                          phone: email,
                          phoneResponse: phoneResponse,
                          controller: controller.phoneAuthController,
                          isEmailLogin: true,
                          isRegister: true,
                          onSuccess: (sessionId) async {
                            // Show loading on the Email VarificationCodeScreen instead of SignupView
                            controller.phoneAuthController
                                .setVerificationLoading(true);

                            // 1. Trigger Firebase Phone OTP Process Immediately
                            final phoneAuth = controller.phoneAuthController;
                            final success = await phoneAuth.performSendOtp(
                                context, fullPhone);

                            if (!context.mounted) return;
                            controller.phoneAuthController
                                .setVerificationLoading(false);

                            if (success &&
                                phoneAuth.firebaseVerificationId != null) {
                              phoneAuth.phoneNumber = fullPhone;
                              phoneAuth.initializeScreen(fullPhone);

                              // 2. Replace Email OTP Screen with Phone OTP Screen
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VarificationCodeScreen(
                                    phone: fullPhone,
                                    phoneResponse: phoneResponse,
                                    controller: phoneAuth,
                                    allowBackNavigation: false,
                                    isRegister: true,
                                    onSuccess: (newSessionId) async {
                                      // 3. Show loading spinner while finalizing registration
                                      setState(() => controller.loading = true);

                                      // 4. Extract session ID and display name
                                      // Prioritize the new session ID from verify-phone, fallback to email stage session
                                      final completeSessionId = newSessionId ??
                                          phoneResponse.data?.sessionId;
                                      final username = controller
                                          .fullNameController.text
                                          .trim();

                                      if (completeSessionId != null &&
                                          username.isNotEmpty) {
                                        final completeResult = await controller
                                            .completeRegistration(
                                                completeSessionId, username);

                                        if (!context.mounted) return;
                                        setState(
                                            () => controller.loading = false);

                                        if (completeResult['success'] == true) {
                                          // 4.5. Auto-Login using returned Matrix credentials
                                          final data = completeResult['data'];
                                          if (data != null &&
                                              data['matrix_username'] != null &&
                                              data['matrix_password'] != null) {
                                            try {
                                              await LoginController
                                                  .performLogin(
                                                context: context,
                                                username:
                                                    data['matrix_username'],
                                                password:
                                                    data['matrix_password'],
                                              );
                                            } catch (e) {
                                              debugPrint(
                                                  '⚠️ Auto-login failed after registration: $e');
                                            }
                                          }

                                          // 5. Pop Phone VarificationCodeScreen & Proceed
                                          Navigator.of(context).pop();

                                          // 6. Navigate to Dashboard / Home Screen
                                          context.go('/onboarding');
                                        } else {
                                          // Handle errors with proper loading state management
                                          final errorMessage = completeResult['message'] ?? 'Registration failed';
                                          final errorCode = completeResult['errorCode'];
                                          
                                          // Show error message
                                          CustomSnackbar.show(
                                            context,
                                            title: L10n.of(context).error,
                                            message: errorMessage,
                                            type: SnackbarType.error,
                                          );
                                          
                                          // Pop the OTP screen to allow user to edit their information
                                          Navigator.of(context).pop();
                                          
                                          // If it's a username taken error, focus on the username field
                                          if (errorCode == 'USERNAME_TAKEN') {
                                            // Set local error to show on the username field
                                            setState(() {
                                              localUsernameError = errorMessage;
                                            });
                                            // Focus on username field after a short delay
                                            Future.delayed(const Duration(milliseconds: 300), () {
                                              FocusScope.of(context).requestFocus(FocusNode());
                                            });
                                          }
                                        }
                                      } else {
                                        setState(
                                            () => controller.loading = false);
                                        CustomSnackbar.show(
                                          context,
                                          title: L10n.of(context).error,
                                          message:
                                              'Registration failed, missing session or name.',
                                          type: SnackbarType.error,
                                        );
                                      }
                                    },
                                  ),
                                ),
                              );
                            } else {
                              // If Firebase fails, we just stay on Email OTP screen (or go back to try again)
                              // Error snackbar is handled within performSendOtp
                            }
                          },
                        ),
                      ),
                    );
                  } else {
                    setState(() => controller.loading = false);
                    showErrorDialog(
                      context,
                      L10n.of(context).error,
                      initiateResult['message'] ??
                          'Failed to send OTP to email.',
                    );
                  }
                },
        ),

        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ), // Bottom login section
        if (!controller.emailVerificationSent)
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  L10n.of(context).doYouHaveAccount,
                  style: TextStyle(
                    color: const Color(0xFFD2D4E5),
                    fontSize: screenWidth * 0.037,
                    fontFamily: 'Work Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(width: screenWidth * 0.027),
                GestureDetector(
                  onTap: controller.loading
                      ? null
                      : () {
                          context.push('/enter_phone?isLogin=true');
                          // Navigator.of(context)
                          //   ..pop()
                          //   ..pop();
                          // // context.go('/home/login');
                        },
                  child: Text(
                    L10n.of(context).logIn,
                    style: TextStyle(
                      color: const Color(0xFFD2D4E5),
                      fontSize: screenWidth * 0.037,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  List<Widget> _buildPositionedImages(
    BuildContext context,
    double screenHeight,
    double screenWidth,
  ) {
    return [
      // Top rightside image
      Positioned(
        top: screenHeight * 0.094,
        right: 0,
        child: SizedBox(
          height: screenHeight * 0.15,
          child: Image.asset(
            'assets/images/onboarding/rightside.png',
            fit: BoxFit.contain,
            alignment: Alignment.topCenter,
          ),
        ),
      ),
      // Bottom leftside image
      Positioned(
        bottom: screenHeight * 0.139,
        left: 0,
        child: SizedBox(
          height: screenHeight * 0.15,
          child: Image.asset(
            'assets/images/onboarding/leftside.png',
            fit: BoxFit.contain,
            alignment: Alignment.bottomCenter,
          ),
        ),
      ),
      // Bottom character image
      Positioned(
        bottom: 0,
        // left: 0,
        // top: 532,
        child: Container(
          width: 375,
          height: 208,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/chat_icons/signup_page_image.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),

      // Positioned(
      //   bottom: 0,
      //   left: 0,
      //   right: 0,
      //   child: Image.asset(
      //     'assets/chat_icons/signup_page_image.png',
      //     height: 208,
      //     fit: BoxFit.contain,
      //     alignment: Alignment.bottomCenter,
      //   ),
      // ),
    ];
  }
}
