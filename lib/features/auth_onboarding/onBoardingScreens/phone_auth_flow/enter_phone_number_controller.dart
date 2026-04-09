import 'dart:async';
import 'dart:convert';

import 'package:bmp/features/auth_onboarding/onBoardingScreens/phone_auth_flow/enter_email_screen.dart';
import 'package:bmp/features/auth_onboarding/signup/show_dialog_helper.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/phone_auth_flow/varification_code_screen.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../core/config/api_config.dart';
import '../../../../../core/config/default_user_service.dart';
import '../../../../../core/network/api_client.dart';
import '../../../../../shared/utils/session_cleaner.dart';

import '../../../../../core/localization/l10n.dart';
import '../../../../../shared/data/models/PhoneVerifyModels.dart';
import '../../../../../shared/utils/snackbar.dart';
import '../../services/firebase_phone_auth_service.dart';
import '../../widgets/phone_verification_dialog.dart';
// RSA auth import removed

import 'models/models/country_model.dart';

class EnterPhoneNumberController extends ChangeNotifier {
  final TextEditingController phoneController = TextEditingController();
  PhoneVerifyModels phoneVerifyModels = PhoneVerifyModels();

  bool _isDisposed = false;

  CountryModel _selectedCountry = CountryModel(
    name: 'Colombia',
    code: 'CO',
    dialCode: '+57',
  );
  bool _isLoading = false;
  String? _errorMessage;
  bool _isLogin = false;
  String? _currentEmail;
  String? _matrixUsername;
  String? _matrixPassword;

  // Firebase-specific fields
  String? _firebaseVerificationId;
  int? _firebaseResendToken;

  // Getters
  CountryModel get selectedCountry => _selectedCountry;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isLogin => _isLogin;
  String? get currentEmail => _currentEmail;
  String? get firebaseVerificationId => _firebaseVerificationId;
  String? get matrixUsername => _matrixUsername;
  String? get matrixPassword => _matrixPassword;

  void setCurrentEmail(String? email) {
    _currentEmail = email;
    notifyListeners();
  }

  void setIsLogin(bool value) {
    _isLogin = value;
    notifyListeners();
  }

  void setMatrixCredentials(String? username, String? password) {
    _matrixUsername = username;
    _matrixPassword = password;
    notifyListeners();
  }

  void clearMatrixCredentials() {
    _matrixUsername = null;
    _matrixPassword = null;
    notifyListeners();
  }

  static const int minPhoneLength = 6;

  // Validate phone number for selected country
  String? validatePhoneNumber(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return L10n.of(context).pleaseEnterPhoneNumber;
    }

    // Basic digit validation
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return L10n.of(context).phoneNumberMustContainOnlyDigits;
    }

    // Allow leading zero: accept requiredLength or requiredLength+1 if starts with '0'
    final hasLeadingZero = value.startsWith('0');
    final effectiveLength = hasLeadingZero ? value.length - 1 : value.length;

    if (effectiveLength < minPhoneLength) {
      return L10n.of(context).phoneNumberMustBeDigits(minPhoneLength);
    }

    // if (effectiveLength > minPhoneLength) {
    //   return L10n.of(context).phoneNumberCannotExceedDigits(requiredLength);
    // }

    return null;
  }

  List<CountryModel> get allCountries {
    return codes
        .map(
          (country) => CountryModel(
            name: country['name']!,
            code: country['code']!,
            dialCode: country['dial_code']!,
          ),
        )
        .toList();
  }

  //verificaions
  bool _isPinComplete = false;
  bool _isVerificationLoading = false;
  Map<String, dynamic>? _lastVerificationData;
  String _otpCode = '';
  String phoneNumber = '';
  Timer? _timer;
  int _remainingSeconds = 200;
  int _timerDuration = 300; // Default 5 minutes
  String? _verificationsErrorMessage;
  // Getters
  bool get isPinComplete => _isPinComplete;
  bool get isVerificationLoading => _isVerificationLoading;
  Map<String, dynamic>? get lastVerificationData => _lastVerificationData;
  void setVerificationLoading(bool value) {
    _isVerificationLoading = value;
    _safeNotifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    _safeNotifyListeners();
  }

  String get otpCode => _otpCode;
  int get remainingSeconds => _remainingSeconds;
  String? get verificationsErrorMessage => _verificationsErrorMessage;

  // Link phone mode (for existing users migrating)
  String? _linkPhoneUsername;
  String? _linkPhonePassword;
  String? get linkPhoneUsername => _linkPhoneUsername;
  String? get linkPhonePassword => _linkPhonePassword;
  void setLinkPhoneUsername(String? username) {
    debugPrint(
        '📝 EnterPhoneNumberController: setLinkPhoneUsername = $username');
    _linkPhoneUsername = username;
  }

  void setLinkPhonePassword(String? password) {
    debugPrint(
        '📝 EnterPhoneNumberController: setLinkPhonePassword = $password');
    _linkPhonePassword = password;
  }

  @override
  void dispose() {
    _isDisposed = true;
    phoneController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _safeNotifyListeners() {
    if (!_isDisposed) {
      notifyListeners();
    }
  }

  void selectCountry(CountryModel country) {
    _selectedCountry = country;
    phoneController.clear(); // Clear phone when country changes
    _errorMessage = null;
    _safeNotifyListeners();
  }

  Future<void> handleContinue(BuildContext context) async {
    debugPrint('🔄 handleContinue called in controller');
    FocusScope.of(context).unfocus();

    var phone = phoneController.text.trim();
    if (phone.isEmpty) {
      debugPrint('❌ Phone number is empty');
      _errorMessage = L10n.of(context).pleaseEnterYourPhoneNumber;
      _safeNotifyListeners();
      return;
    }

    // Strip leading zero before combining with country dial code
    if (phone.startsWith('0')) {
      phone = phone.substring(1);
    }

    final fullPhoneNumber = '${_selectedCountry.dialCode}$phone';
    debugPrint('🔄 Full phone number in controller: $fullPhoneNumber');

    // Clear old auth data FIRST (before checking default user)
    await SessionCleaner.clearAuthData();

    // Check if this is a default/test phone user and switch base URL accordingly
    final isDefault =
        DefaultUserService.instance.isDefaultPhoneUser(fullPhoneNumber);
    await DefaultUserService.instance.setActiveUserType(isDefault);
    ApiClient.reinitialize();

    debugPrint('🔄 About to show phone verification dialog');
    debugPrint('🔄 isLogin: $_isLogin');
    
    // Show phone verification dialog for all cases
    await showPhoneVerificationDialog(context, phoneNo: fullPhoneNumber);
  }

  /// Send OTP using Firebase Phone Authentication
  Future<bool> performSendOtp(BuildContext context, String phoneNo) async {
    debugPrint('🔥 performSendOtp called with phone: $phoneNo');
    
    _isLoading = true;
    _errorMessage = null;
    _safeNotifyListeners();

    // Completer to wait for onCodeSent callback
    final completer = Completer<bool>();

    try {
      // Validate phone number format
      if (!FirebasePhoneAuthService.isValidPhoneNumber(phoneNo)) {
        debugPrint('❌ Invalid phone number format: $phoneNo');
        _errorMessage = L10n.of(context).pleaseEnterPhoneNumber;
        _isLoading = false;
        _safeNotifyListeners();
        return false;
      }

      debugPrint('✅ Phone number format is valid: $phoneNo');

      // Check APNS token on iOS for debugging
      if (defaultTargetPlatform == TargetPlatform.iOS) {
        try {
          final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
          debugPrint('🍎 iOS: APNS Token for Phone Auth: $apnsToken');
          if (apnsToken == null) {
            debugPrint(
                '⚠️ iOS: APNS Token is NULL. Firebase will fall back to reCAPTCHA (Safari).');
            debugPrint(
                '👉 Ensure "Push Notifications" capability is added in Xcode and a real device is used.');
          }
        } catch (e) {
          debugPrint('❌ iOS: Failed to get APNS token: $e');
        }
      }

      debugPrint('🔥 Starting Firebase sendOtp...');

      // Use Firebase to send OTP
      await FirebasePhoneAuthService.sendOtp(
        phoneNumber: phoneNo,
        onCodeSent: (String verificationId, int? resendToken) {
          debugPrint('🔥 Firebase: onCodeSent callback triggered');
          debugPrint('🔥 Verification ID: $verificationId');
          debugPrint('🔥 Resend Token: $resendToken');
          
          _firebaseVerificationId = verificationId;
          _firebaseResendToken = resendToken;
          _isLoading = false;
          _safeNotifyListeners();
          debugPrint('🔥 Firebase: OTP sent successfully');

          // Complete the future so navigation can proceed
          if (!completer.isCompleted) {
            debugPrint('🔥 Completing future with success');
            completer.complete(true);
          }
        },
        onVerificationCompleted: (PhoneAuthCredential credential) async {
          debugPrint('🔥 Firebase: Auto-verification completed');
          _isLoading = false;
          _safeNotifyListeners();

          // Complete with true for auto-verification
          if (!completer.isCompleted) {
            debugPrint('🔥 Completing future with auto-verification success');
            completer.complete(true);
          }
        },
        onVerificationFailed: (FirebaseAuthException e) {
          debugPrint('🔥 Firebase: Verification failed - ${e.code}: ${e.message}');
          _errorMessage = FirebasePhoneAuthService.getErrorMessage(e, context);
          _isLoading = false;
          _safeNotifyListeners();
          
          if (context.mounted) {
            CustomSnackbar.show(
              context,
              title: L10n.of(context).error,
              message: _errorMessage!,
              type: SnackbarType.error,
            );
          }

          // Complete with false on failure
          if (!completer.isCompleted) {
            debugPrint('🔥 Completing future with failure');
            completer.complete(false);
          }
        },
        onCodeAutoRetrievalTimeout: (String verificationId) {
          debugPrint('🔥 Firebase: Auto-retrieval timeout');
          _firebaseVerificationId = verificationId;
        },
      );

      debugPrint('🔥 Waiting for Firebase callbacks...');
      // Wait for onCodeSent or other callbacks to complete
      final result = await completer.future;
      debugPrint('🔥 Firebase operation completed with result: $result');
      return result;
      
    } catch (e) {
      debugPrint('❌ performSendOtp exception: $e');
      _isLoading = false;
      final errorMsg = e
          .toString()
          .replaceAll('Exception: ', '')
          .replaceAll('[firebase_auth]', '')
          .trim();
      _errorMessage = errorMsg;
      _safeNotifyListeners();
      
      if (context.mounted) {
        CustomSnackbar.show(
          context,
          title: L10n.of(context).error,
          message: _errorMessage!,
          type: SnackbarType.error,
        );
      }

      if (!completer.isCompleted) {
        debugPrint('🔥 Completing future with exception failure');
        completer.complete(false);
      }
      return false;
    }
  }

  Future<void> showPhoneVerificationDialog(BuildContext screenContext,
      {String phoneNo = '',
      Future<void> Function(String? sessionId)? onSuccess}) async {
    final result = await showDialog<bool>(
      context: screenContext,
      barrierDismissible: false,
      useRootNavigator: true,
      builder: (context) => PhoneVerificationDialog(
        phoneNumber: phoneNo,
        onEdit: () {
          Navigator.of(context).pop(false);
        },
        onOk: () {
          Navigator.of(context).pop(true);
        },
      ),
    );
    
    // Only proceed if user confirmed (pressed OK)
    if (result == true) {
      debugPrint('🔥 Starting Firebase OTP send process for: $phoneNo');
      
      final success = await performSendOtp(screenContext, phoneNo);
      
      debugPrint('🔥 Firebase OTP send result: $success');
      debugPrint('🔥 Firebase verification ID: $_firebaseVerificationId');
      
      if (success && _firebaseVerificationId != null) {
        phoneNumber = phoneNo;
        initializeScreen(phoneNumber);
        
        if (screenContext.mounted) {
          debugPrint('🔥 Navigating to verification screen...');
          
          CustomSnackbar.show(
            screenContext,
            title: L10n.of(screenContext).success,
            message: L10n.of(screenContext).otpSentSuccessfully,
            type: SnackbarType.success,
          );
          
          Navigator.push(
            screenContext,
            MaterialPageRoute(
              builder: (context) => VarificationCodeScreen(
                phone: phoneNumber,
                phoneResponse: phoneVerifyModels,
                controller: this,
                onSuccess: onSuccess,
              ),
            ),
          );
        }
      } else {
        debugPrint('❌ Failed to send OTP or get verification ID');
        if (screenContext.mounted) {
          CustomSnackbar.show(
            screenContext,
            title: L10n.of(screenContext).error,
            message: _errorMessage ?? 'Failed to send OTP. Please try again.',
            type: SnackbarType.error,
          );
        }
      }
    }
  }

  void clearError() {
    _errorMessage = null;
    _safeNotifyListeners();
  }

  void setError(String error) {
    _errorMessage = error;
    _safeNotifyListeners();
  }

  /////////////////Verifications///////////////////////

  String formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  Future<void> initializeScreen(String? phoneNumber, {int duration = 300}) async {
    _timerDuration = duration;
    _remainingSeconds = duration;
    _startTimer();
    // if (phoneNumber != null) {
    //   // _phoneNumber = phoneNumber;
    //   // await prefs.setString('pending_verification_phone', _phoneNumber);
    //   // await prefs.setInt('verification_start_time', DateTime.now().millisecondsSinceEpoch);
    //   _startTimer();
    // } else if (savedPhone != null && savedTime != null) {
    //   // _phoneNumber = savedPhone;
    //   final elapsed = (DateTime.now().millisecondsSinceEpoch - savedTime) ~/ 1000;
    //   _remainingSeconds = 300 - elapsed;
    //   if (_remainingSeconds > 0) {
    //     _startTimer();
    //   } else {
    //     await _clearVerificationData();
    //     // Navigation should be handled by the UI
    //   }
    // }
    _safeNotifyListeners();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        _remainingSeconds--;
        _safeNotifyListeners();
      } else {
        _timer?.cancel();
        _clearVerificationData();
        // Navigation should be handled by the UI
      }
    });
  }

  void _clearVerificationData() {
    // Reset local verification state
    _firebaseVerificationId = null;
    _firebaseResendToken = null;
  }

  void onPinComplete(bool isComplete) {
    _isPinComplete = isComplete;
    _safeNotifyListeners();
  }

  void onPinChanged(String pin) {
    _otpCode = pin;
    _verificationsErrorMessage = null;
    _safeNotifyListeners();
  }

  /// Verify OTP using Firebase Phone Authentication
  Future<Map<String, dynamic>> verifyOtp(BuildContext context) async {
    if (_otpCode.length != 6)
      return {'success': false, 'message': 'Invalid OTP length'};

    if (_firebaseVerificationId == null) {
      // Session expired: Reset timer to allow immediate resend
      _timer?.cancel();
      _remainingSeconds = 0;
      _safeNotifyListeners();

      return {'success': false, 'message': 'Verification session expired'};
    }

    _isVerificationLoading = true;
    _verificationsErrorMessage = null;
    _safeNotifyListeners();

    try {
      // Verify OTP with Firebase
      debugPrint('🔥 Firebase: Verifying OTP...');

      // Note: firebase_auth 4.16.0 has a known PigeonUserDetails deserialization bug.
      // The OTP verification succeeds on the native side but the Dart return value
      // fails to deserialize. We catch this and check FirebaseAuth.instance.currentUser.
      User? firebaseUser;
      try {
        final userCredential = await FirebasePhoneAuthService.verifyOtp(
          verificationId: _firebaseVerificationId!,
          smsCode: _otpCode,
        );
        firebaseUser = userCredential.user;
      } catch (pigeonError) {
        if (pigeonError is TypeError &&
            pigeonError.toString().contains('PigeonUserDetails')) {
          debugPrint(
              '⚠️ PigeonUserDetails bug detected, checking auth state...');
          firebaseUser = FirebaseAuth.instance.currentUser;
          if (firebaseUser == null) {
            // The error was real, not the known bug
            rethrow;
          }
          debugPrint('✅ User is authenticated despite Pigeon error');
        } else {
          rethrow;
        }
      }

      debugPrint(
          '✅ Firebase verification successful - UID: ${firebaseUser?.uid}');

      // Get Firebase ID token
      String? idToken;
      try {
        idToken = await firebaseUser?.getIdToken();
        debugPrint('🔑 Firebase ID Token: $idToken');
      } catch (e) {
        debugPrint('⚠️ Failed to get ID token: $e');
      }

      _timer?.cancel();
      _clearVerificationData();

      _isVerificationLoading = false;
      _safeNotifyListeners();

      return {
        'success': true,
        'message': L10n.of(context).otpVerifiedSuccessfully,
        'idToken': idToken,
      };
    } on FirebaseAuthException catch (e) {
      debugPrint('❌ Firebase error: ${e.code}');
      final errorMsg = FirebasePhoneAuthService.getErrorMessage(e, context);
      _verificationsErrorMessage = errorMsg;
      _isVerificationLoading = false;
      _safeNotifyListeners();
      return {'success': false, 'message': errorMsg};
    } catch (e) {
      debugPrint('❌ Verification error: $e');
      final errorMsg = e
          .toString()
          .replaceAll('Exception: ', '')
          .replaceAll('[firebase_auth]', '')
          .trim();
      _verificationsErrorMessage = errorMsg;
      _isVerificationLoading = false;
      _safeNotifyListeners();
      return {'success': false, 'message': errorMsg};
    }
  }

  /// Send Firebase ID token to backend for verification and user creation.
  /// Returns the Matrix credentials on success.
  Future<Map<String, dynamic>> firebaseVerifyPhone(String idToken) async {
    try {
      debugPrint('📱 Sending Firebase ID token to backend...');
      final dio = Dio();
      final url = ApiConfig.firebaseVerifyUrl;
      final headers = await ApiClient.getHeadersWithoutUser();
      final payload = {'firebaseIdToken': idToken};

      debugPrint('🌐 URL: $url');
      debugPrint('📋 Headers: $headers');
      debugPrint('📦 Payload: $payload');

      final response = await dio.request(
        url,
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: json.encode(payload),
      );

      debugPrint(
          '📱 Firebase verify response: ${response.statusCode} - ${response.data}');

      if (response.statusCode == 200 && response.data != null) {
        final responseData = response.data as Map<String, dynamic>;
        if (responseData['success'] == true && responseData['data'] != null) {
          return {
            'success': true,
            'data': responseData['data'],
          };
        }
      }

      return {
        'success': false,
        'message': response.data?['message'] ?? 'Firebase verification failed',
      };
    } on DioException catch (e) {
      debugPrint(
          '❌ Firebase verify API error: ${e.response?.statusCode} - ${e.response?.data}');
      final errorData = e.response?.data;
      final errorMessage =
          errorData is Map ? errorData['message'] : 'Server error';
      return {
        'success': false,
        'message': errorMessage ?? 'Firebase verification failed',
      };
    } catch (e) {
      debugPrint('❌ Firebase verify error: $e');
      return {
        'success': false,
        'message': e.toString(),
      };
    }
  }

  /// Finalize Phone Registration step for Signup Flow
  Future<Map<String, dynamic>> verifyRegisterPhoneConfig(
      String sessionId, String firebaseIdToken) async {
    try {
      debugPrint('📱 Sending Firebase ID token to verify-phone API...');
      final dio = Dio();
      final url = '${ApiConfig.baseUrl}/new-auth/register/verify-phone';
      final headers = await ApiClient.getHeadersWithoutUser();
      final payload = {
        'session_id': sessionId,
        'firebase_id_token': firebaseIdToken,
      };

      debugPrint('🌐 POST $url');
      debugPrint('📋 Headers: $headers');
      debugPrint('📦 Payload: $payload');

      final response = await dio.post(
        url,
        options: Options(headers: headers),
        data: jsonEncode(payload),
      );

      debugPrint(
          '📱 Register Verify Phone Response: ${response.statusCode} - ${response.data}');

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;
        // New API: { "message": "Phone verified successfully" }
        // Accommodating both new simple response and legacy nested responses
        if (data['message'] != null || data['success'] == true) {
          return {'success': true, 'data': data['data'] ?? data};
        }
        return {
          'success': false,
          'message': 'Phone verification failed, please try again'
        };
      }
      return {
        'success': false,
        'message': 'Phone verification failed, please try again'
      };
    } on DioException catch (e) {
      debugPrint(
          '❌ verify-phone API error: ${e.response?.statusCode} - ${e.response?.data}');
      return {
        'success': false,
        'message': e.response?.data?['message'] ??
            'Phone verification failed, please try again',
      };
    } catch (e) {
      debugPrint('❌ verify-phone error: $e');
      return {
        'success': false,
        'message': 'Phone verification failed, please try again'
      };
    }
  }

  /// Check if a username has a phone number linked.
  /// Returns {'exists': bool, 'hasPhoneLinked': bool, 'phoneNumber': String?}
  static Future<Map<String, dynamic>> checkUsernamePhone(
      String username) async {
    try {
      debugPrint('📱 Checking username phone status: $username');
      final dio = Dio();
      final url = ApiConfig.checkUsernamePhoneUrl(username);
      final headers = await ApiClient.getHeadersWithoutUser(username: username);

      debugPrint('🌐 URL: $url');
      debugPrint('📋 Headers: $headers');
      debugPrint('📦 Payload: N/A (GET)');

      final response = await dio.request(
        url,
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      debugPrint(
          '📱 Check username response: ${response.statusCode} - ${response.data}');

      if (response.statusCode == 200 && response.data != null) {
        final responseData = response.data as Map<String, dynamic>;
        if (responseData['success'] == true && responseData['data'] != null) {
          return {
            'success': true,
            'data': responseData['data'],
          };
        }
      }

      return {'success': false, 'message': 'Failed to check username'};
    } on DioException catch (e) {
      debugPrint(
          '❌ Check username API error: ${e.response?.statusCode} - ${e.response?.data}');
      return {
        'success': false,
        'message': e.response?.data?['message'] ?? 'Server error'
      };
    } catch (e) {
      debugPrint('❌ Check username error: $e');
      return {'success': false, 'message': e.toString()};
    }
  }

  /// Check if a phone number already exists
  Future<bool> checkPhoneExists(String phone) async {
    try {
      final dio = Dio();
      final headers = await ApiClient.getHeadersWithoutUser();
      final url = ApiConfig.checkPhoneUrl;
      final payload = {'phone': phone};

      debugPrint('📱 Checking phone exists: $url');
      debugPrint('📦 Payload: $payload');

      final response = await dio.post(
        url,
        options: Options(headers: headers),
        data: jsonEncode(payload),
      );

      debugPrint(
          '📱 Check phone response: ${response.statusCode} - ${response.data}');

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data['data'];
        if (data != null && data['exists'] != null) {
          return data['exists'] as bool;
        }
      }
      return false; // Safely assume not exists if parsing fails
    } on DioException catch (e) {
      debugPrint(
          '❌ Check phone API error: ${e.response?.statusCode} - ${e.response?.data}');
      return false;
    } catch (e) {
      debugPrint('❌ Check phone error: $e');
      return false;
    }
  }

  /// Initiate Email Login OTP
  Future<Map<String, dynamic>> initiateEmailLoginOtp(String email) async {
    _isLoading = true;
    _errorMessage = null;
    _safeNotifyListeners();

    try {
      final dio = Dio();
      final headers = await ApiClient.getHeadersWithoutUser();
      final url = ApiConfig.initiateEmailLoginUrl;
      final payload = {'email': email};

      debugPrint('🌐 POST $url');
      debugPrint('📦 Payload: $payload');

      final response = await dio.post(
        url,
        options: Options(headers: headers),
        data: jsonEncode(payload),
      );

      _isLoading = false;
      _safeNotifyListeners();

      debugPrint(
          '📧 Initiate Email OTP Response: ${response.statusCode} - ${response.data}');

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;
        if (data['success'] == true) {
          // Check if email exists for login
          final bool exists = (data['exists'] == true) ||
              (data['data'] != null && data['data']['exists'] == true);

          if (!exists) {
            return {
              'success': false,
              'message': 'Email not found. Please sign up first.'
            };
          }

          String? extractedSessionId;
          if (data['data'] != null) {
            extractedSessionId =
                data['data']['session_id'] ?? data['data']['sessionId'];
          }
          extractedSessionId ??= data['session_id'] ?? data['sessionId'];

          return {
            'success': true,
            'session_id': extractedSessionId,
          };
        }
        return {
          'success': false,
          'message': data['message'] ?? 'Failed to send OTP'
        };
      }
      return {'success': false, 'message': 'Failed to send OTP'};
    } on DioException catch (e) {
      _isLoading = false;
      _safeNotifyListeners();
      debugPrint(
          '❌ Initiate Email Login OTP API error: ${e.response?.statusCode} - ${e.response?.data}');
      return {
        'success': false,
        'message': e.response?.data?['message'] ?? 'Server error'
      };
    } catch (e) {
      _isLoading = false;
      _safeNotifyListeners();
      debugPrint('❌ Initiate Email Login OTP error: $e');
      return {'success': false, 'message': e.toString()};
    }
  }

  /// Initiate Email Register OTP
  Future<Map<String, dynamic>> initiateEmailRegisterOtp(String email) async {
    _isLoading = true;
    _errorMessage = null;
    _safeNotifyListeners();

    try {
      final dio = Dio();
      final headers = await ApiClient.getHeadersWithoutUser();
      final url = ApiConfig.initiateEmailRegisterUrl;
      final payload = {'email': email};

      debugPrint('🌐 POST $url');
      debugPrint('📦 Payload: $payload');

      final response = await dio.post(
        url,
        options: Options(headers: headers),
        data: jsonEncode(payload),
      );

      debugPrint(
          '📧 Initiate Email Register OTP Response: ${response.statusCode} - ${response.data}');

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;
        // New API format (200 OK means success/available)
        if (data['exists'] == false || data['session_id'] != null) {
          return {
            'success': true,
            'session_id': data['session_id'],
            'message': data['message']
          };
        }

        // Legacy format fallback
        if (data['success'] == true) {
          final bool exists = (data['exists'] == true) ||
              (data['data'] != null && data['data']['exists'] == true);

          if (exists) {
            return {
              'success': false,
              'message': data['message'] ??
                  'This email is already registered. Please log in to continue.'
            };
          }

          String? extractedSessionId;
          if (data['data'] != null) {
            extractedSessionId =
                data['data']['session_id'] ?? data['data']['sessionId'];
          }
          return {
            'success': true,
            'session_id': extractedSessionId,
            'data': data['data']
          };
        }
        return {
          'success': false,
          'message': data['message'] ?? 'Failed to initiate OTP'
        };
      }
      return {'success': false, 'message': 'Invalid response from server'};
    } on DioException catch (e) {
      if (e.response?.statusCode == 409) {
        final data = e.response?.data;
        return {
          'success': false,
          'message': data is Map
              ? (data['message'] ?? 'This email is already registered.')
              : 'This email is already registered.'
        };
      }
      debugPrint(
          '❌ Initiate Email Register OTP API error: ${e.response?.statusCode} - ${e.response?.data}');
      return {
        'success': false,
        'message': e.response?.data?['message'] ?? 'Connection error'
      };
    } catch (e) {
      debugPrint('❌ Initiate Email Register OTP error: $e');
      return {'success': false, 'message': 'Connection error'};
    } finally {
      _isLoading = false;
      _safeNotifyListeners();
    }
  }

  /// Verify Email Login OTP
  Future<Map<String, dynamic>> verifyEmailLoginOtp(String sessionId) async {
    _isVerificationLoading = true;
    _safeNotifyListeners();

    try {
      final dio = Dio();
      final headers = await ApiClient.getHeadersWithoutUser();
      final url = ApiConfig.verifyEmailLoginUrl;
      final payload = {
        'session_id': sessionId,
        'email_otp': _otpCode,
      };

      debugPrint('🌐 POST $url');
      debugPrint('📦 Payload: $payload');

      final response = await dio.post(
        url,
        options: Options(headers: headers),
        data: jsonEncode(payload),
      );

      _isVerificationLoading = false;
      _safeNotifyListeners();

      debugPrint(
          '📧 Verify Email OTP Response: ${response.statusCode} - ${response.data}');

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;
        if (data['success'] == true &&
            data['data'] != null &&
            data['data']['success'] == true) {
          _lastVerificationData = data['data'];
          return {'success': true, 'data': data['data']};
        }
        return {'success': false, 'message': 'Invalid or expired OTP'};
      }
      return {
        'success': false,
        'message': 'Something went wrong, please try again'
      };
    } on DioException catch (e) {
      _isVerificationLoading = false;
      _safeNotifyListeners();
      debugPrint(
          '❌ Verify Email Login OTP API error: ${e.response?.statusCode} - ${e.response?.data}');
      return {
        'success': false,
        'message': e.response?.data?['message'] ??
            'Something went wrong, please try again',
      };
    } catch (e) {
      _isVerificationLoading = false;
      _safeNotifyListeners();
      debugPrint('❌ Verify Email Login OTP error: $e');
      return {
        'success': false,
        'message': 'Something went wrong, please try again'
      };
    }
  }

  /// Verify Email Register OTP
  Future<Map<String, dynamic>> verifyEmailRegisterOtp(String sessionId) async {
    _isVerificationLoading = true;
    _safeNotifyListeners();

    try {
      final dio = Dio();
      final headers = await ApiClient.getHeadersWithoutUser();
      final url = ApiConfig.verifyEmailRegisterUrl;
      final payload = {
        'session_id': sessionId,
        'email_otp': _otpCode,
      };

      debugPrint('🌐 POST $url');
      debugPrint('📦 Payload: $payload');

      final response = await dio.post(
        url,
        options: Options(headers: headers),
        data: jsonEncode(payload),
      );

      debugPrint(
          '📧 Verify Email Register OTP Response: ${response.statusCode} - ${response.data}');

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;
        // The new API returns { "message": "Email verified successfully" }
        // Assume success if it's 200 OK
        if (data['success'] == true || data['message'] != null) {
          return {'success': true, 'data': data['data'] ?? data};
        }
        return {
          'success': false,
          'message': data['message'] ?? 'Verification failed'
        };
      }
      return {'success': false, 'message': 'Invalid response from server'};
    } on DioException catch (e) {
      debugPrint(
          '❌ Verify Email Register OTP API error: ${e.response?.statusCode} - ${e.response?.data}');
      return {
        'success': false,
        'message': e.response?.data?['message'] ?? 'Connection error'
      };
    } catch (e) {
      debugPrint('❌ Verify Email Register OTP error: $e');
      return {'success': false, 'message': 'Connection error'};
    } finally {
      _isVerificationLoading = false;
      _safeNotifyListeners();
    }
  }

  /// Link phone number to existing user account via Firebase ID token.
  Future<Map<String, dynamic>> linkPhoneToUser(
      String username, String idToken) async {
    try {
      debugPrint('📱 Linking phone to user: $username (Secure API)');

      final dio = Dio();
      final headers = await ApiClient.getHeadersWithoutUser(username: username);
      final url = ApiConfig.linkPhoneUrl(username);

      final payload = {
        'firebase_id_token': idToken,
      };

      debugPrint('🌐 URL: $url');
      debugPrint('📋 Headers: $headers');
      debugPrint('📦 Payload: $payload');

      final response = await dio.post(
        url,
        options: Options(headers: headers),
        data: json.encode(payload),
      );

      debugPrint(
          '📱 Link phone response: ${response.statusCode} - ${response.data}');

      if (response.statusCode == 200 && response.data != null) {
        final responseData = response.data as Map<String, dynamic>;

        // Success case
        if (responseData['success'] == true || responseData['data'] != null) {
          return {
            'success': true,
            'data': responseData['data'],
            'message': responseData['message'] ?? 'Phone linked successfully'
          };
        }
      }

      return {
        'success': false,
        'message': response.data?['message'] ?? 'Failed to link phone',
      };
    } on DioException catch (e) {
      debugPrint(
          '❌ Link phone API error: ${e.response?.statusCode} - ${e.response?.data}');

      final errorData = e.response?.data;
      String errorMessage = 'Failed to link phone';

      if (errorData is Map) {
        errorMessage = errorData['message'] ?? errorMessage;
      }

      // Specific error handling based on status codes
      if (e.response?.statusCode == 400) {
        errorMessage = 'Missing Token: $errorMessage';
      } else if (e.response?.statusCode == 401) {
        errorMessage = 'Invalid Token: $errorMessage';
      } else if (e.response?.statusCode == 404) {
        errorMessage = 'User Not Found: $errorMessage';
      }

      return {
        'success': false,
        'message': errorMessage,
      };
    } catch (e) {
      debugPrint('❌ Link phone error: $e');
      return {'success': false, 'message': e.toString()};
    }
  }

  /// Resend OTP using Firebase
  Future<bool> resendOtp() async {
    try {
      debugPrint('🔥 Firebase: Resending OTP...');
      await FirebasePhoneAuthService.resendOtp(
        phoneNumber: phoneNumber,
        onCodeSent: (String verificationId, int? resendToken) {
          _firebaseVerificationId = verificationId;
          _firebaseResendToken = resendToken;
          debugPrint('🔥 Firebase: OTP resent successfully');
        },
        onVerificationCompleted: (PhoneAuthCredential credential) async {
          debugPrint('🔥 Firebase: Auto-verification on resend');
        },
        onVerificationFailed: (FirebaseAuthException e) {
          debugPrint('🔥 Firebase: Resend failed');
          _verificationsErrorMessage = e.message;
        },
        onCodeAutoRetrievalTimeout: (String verificationId) {
          _firebaseVerificationId = verificationId;
        },
        forceResendingToken: _firebaseResendToken,
      );

      // Reset timer to original duration (5 minutes for phone)
      _remainingSeconds = 300;
      _timer?.cancel();
      _startTimer();
      _safeNotifyListeners();
      return true;
    } catch (e) {
      debugPrint('❌ Resend error: $e');
      final errorMsg = e
          .toString()
          .replaceAll('Exception: ', '')
          .replaceAll('[firebase_auth]', '')
          .trim();
      _verificationsErrorMessage = errorMsg;
      _safeNotifyListeners();
      return false;
    }
  }

  void handleBackPress() {
    _timer?.cancel();
    _clearVerificationData();
  }

  /// Initiate Email Linking after phone verification
  Future<Map<String, dynamic>> initiateEmailLinking(
      String email, String username) async {
    _isVerificationLoading = true;
    _safeNotifyListeners();

    try {
      final dio = Dio();
      final headers = await ApiClient.getHeadersWithoutUser();
      final url = ApiConfig.initiateEmailLinkUrl;
      final payload = {
        'email': email,
        'username': username,
      };

      debugPrint('🌐 POST $url');
      debugPrint('📦 Payload: $payload');

      final response = await dio.post(
        url,
        options: Options(headers: headers),
        data: jsonEncode(payload),
      );

      debugPrint(
          '📧 Initiate Email Link Response: ${response.statusCode} - ${response.data}');

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;
        if (data['success'] == true && data['data'] != null) {
          return {'success': true, 'session_id': data['data']['session_id']};
        }
      }
      return {
        'success': false,
        'message': response.data?['message'] ?? 'Failed to initiate email link'
      };
    } on DioException catch (e) {
      debugPrint(
          '❌ Initiate Email Link API error: ${e.response?.statusCode} - ${e.response?.data}');
      return {
        'success': false,
        'message': e.response?.data?['message'] ?? 'Connection error'
      };
    } catch (e) {
      debugPrint('❌ Initiate Email Link error: $e');
      return {'success': false, 'message': e.toString()};
    } finally {
      _isVerificationLoading = false;
      _safeNotifyListeners();
    }
  }

  /// Verify Email Linking OTP
  Future<Map<String, dynamic>> verifyEmailLinking(
      String sessionId, String otp) async {
    _isVerificationLoading = true;
    _safeNotifyListeners();

    try {
      final dio = Dio();
      final headers = await ApiClient.getHeadersWithoutUser();
      final url = ApiConfig.verifyEmailLinkUrl;
      final payload = {
        'session_id': sessionId,
        'email_otp': otp,
      };

      debugPrint('🌐 POST $url');
      debugPrint('📦 Payload: $payload');

      final response = await dio.post(
        url,
        options: Options(headers: headers),
        data: jsonEncode(payload),
      );

      debugPrint(
          '📧 Verify Email Link Response: ${response.statusCode} - ${response.data}');

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;
        if (data['success'] == true &&
            data['data'] != null &&
            data['data']['success'] == true) {
          return {'success': true, 'data': data['data']};
        }
      }
      return {
        'success': false,
        'message': response.data?['message'] ?? 'Invalid or expired OTP'
      };
    } on DioException catch (e) {
      debugPrint(
          '❌ Verify Email Link API error: ${e.response?.statusCode} - ${e.response?.data}');
      return {
        'success': false,
        'message': e.response?.data?['message'] ?? 'Invalid or expired OTP'
      };
    } catch (e) {
      debugPrint('❌ Verify Email Link error: $e');
      return {'success': false, 'message': 'Connection error'};
    } finally {
      _isVerificationLoading = false;
      _safeNotifyListeners();
    }
  }
}
