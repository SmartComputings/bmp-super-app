import 'dart:convert';

import 'package:bmp/core/config/app_config.dart';
import 'package:bmp/core/config/api_config.dart';
import 'package:bmp/core/network/api_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:matrix/matrix.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/localization/l10n.dart';
import '../../../core/errors/matrix_error_handler.dart';
import 'package:bmp/shared/utils/platform_infos.dart';
import 'email_verification_page.dart';
import 'show_dialog_helper.dart';
import 'signup_view.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/phone_auth_flow/enter_phone_number_controller.dart';

class Signup extends StatefulWidget {
  final Client client;
  const Signup({required this.client, super.key});

  @override
  SignupController createState() => SignupController();
}

class SignupController extends State<Signup> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();

  late final EnterPhoneNumberController phoneAuthController =
      EnterPhoneNumberController();

  String? usernameError;
  String? passwordError;
  String? passwordConfirmError;
  String? emailError;
  String? generalError;
  bool loading = false;
  bool showPassword = false;
  bool showPasswordConfirm = false;
  bool emailVerificationSent = false;
  bool emailVerified = false;

  void toggleShowPassword() =>
      setState(() => showPassword = !loading && !showPassword);

  void toggleShowPasswordConfirm() =>
      setState(() => showPasswordConfirm = !loading && !showPasswordConfirm);

  void clearUsernameError() {
    if (usernameError != null) {
      setState(() => usernameError = null);
    }
  }

  void clearEmailError() {
    if (emailError != null) {
      setState(() => emailError = null);
    }
  }

  void clearPasswordError() {
    if (passwordError != null) {
      setState(() => passwordError = null);
    }
  }

  void clearPasswordConfirmError() {
    if (passwordConfirmError != null) {
      setState(() => passwordConfirmError = null);
    }
  }

  String? _validatePassword(String password) {
    final l10n = L10n.of(context);

    if (password.length < 6) {
      return l10n.passwordMinLength;
    }

    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return l10n.passwordMustContainUppercase;
    }

    if (!RegExp(r'[a-z]').hasMatch(password)) {
      return l10n.passwordMustContainLowercase;
    }

    if (!RegExp(r'[0-9]').hasMatch(password)) {
      return l10n.passwordMustContainNumber;
    }

    if (!RegExp(r'[!@#\$%^&*?]').hasMatch(password)) {
      return l10n.passwordMustContainSpecialChar;
    }

    final lowerPassword = password.toLowerCase();
    final username = usernameController.text.toLowerCase();

    // Check for username in password
    if (username.isNotEmpty && lowerPassword.contains(username)) {
      return l10n.passwordCannotContainUsername;
    }

    // Check for common words
    final commonWords = [
      'password',
      'admin',
      'user',
      'login',
      'qwerty',
      'welcome',
    ];
    for (final word in commonWords) {
      if (lowerPassword.contains(word)) {
        return l10n.passwordCannotContainCommonWords;
      }
    }

    // Check for simple sequences
    final sequences = ['123456', '654321', 'abcdef', 'fedcba', '1234', 'abcd'];
    for (final seq in sequences) {
      if (lowerPassword.contains(seq)) {
        return l10n.passwordCannotContainSequences;
      }
    }

    return null;
  }

  void register() async {
    if (loading) return; // Prevent multiple calls

    // Set loading immediately
    setState(() {
      loading = true;
      usernameError = null;
      passwordError = null;
      passwordConfirmError = null;
      emailError = null;
      generalError = null;
    });

    final fullName = fullNameController.text.trim();
    final username = usernameController.text.trim();
    final password = passwordController.text;
    final email = emailController.text.trim();

    final l10n = L10n.of(context);
    var hasErrors = false;

    if (username.isEmpty) {
      setState(() => usernameError = l10n.usernameRequired);
      hasErrors = true;
    } else if (username.contains(' ')) {
      setState(() => usernameError = l10n.usernameCannotContainSpaces);
      hasErrors = true;
    } else if (!RegExp(r'^[a-zA-Z0-9._-]+$').hasMatch(username)) {
      setState(() => usernameError = l10n.usernameInvalidCharacters);
      hasErrors = true;
    }

    if (email.isEmpty) {
      setState(() => emailError = l10n.emailRequired);
      hasErrors = true;
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      setState(() => emailError = l10n.pleaseEnterValidEmail);
      hasErrors = true;
    }

    if (password.isEmpty) {
      setState(() => passwordError = l10n.passwordRequired);
      hasErrors = true;
    } else {
      final passwordValidation = _validatePassword(password);
      if (passwordValidation != null) {
        setState(() => passwordError = passwordValidation);
        hasErrors = true;
      }
    }

    if (password != passwordConfirmController.text) {
      setState(() => passwordConfirmError = l10n.passwordsDoNotMatch);
      hasErrors = true;
    }

    if (hasErrors) {
      if (mounted) {
        setState(() => loading = false);
      }
      return;
    }

    Logs().e('DEBUG: Starting registration request');

    try {
      print('DEBUG: Starting mandatory email verification flow');

      // Always start with email verification first
      await _getSessionAndStartEmailVerification(
        fullName,
        email,
        username,
        password,
      );
    } catch (exception) {
      Logs().e('DEBUG: Exception: $exception');
      if (mounted) {
        setState(
          () => generalError = L10n.of(context).connectionError,
        );
      }
    } finally {
      // Loading is already set to false before navigation
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    }
  }

  String? _clientSecret;
  String? _sid;
  String? _pendingSession;
  String? _pendingUsername;
  String? _pendingPassword;

  Future<void> completeEmailVerification(String fullName) async {
    if (_sid == null || _clientSecret == null || _pendingSession == null) {
      throw Exception(L10n.of(context).noPendingVerification);
    }

    try {
      final baseUrl = 'https://${AppConfig.defaultHomeserver}';

      print('DEBUG: Proceeding with registration using verified email...');

      final registerUrl = '$baseUrl/_matrix/client/v3/register';

      final requestBody = {
        'username': _pendingUsername,
        'password': _pendingPassword,
        'initial_device_display_name': PlatformInfos.clientName,
        'auth': {
          'type': 'm.login.email.identity',
          'threepid_creds': {
            'sid': _sid,
            'client_secret': _clientSecret,
          },
          'session': _pendingSession,
        },
      };

      print('DEBUG: Attempting registration with verified email');

      final response = await http.post(
        Uri.parse(registerUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );

      print('DEBUG: Registration response: ${response.statusCode}');
      print('DEBUG: Registration body: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print(
          'DEBUG: Registration successful for user: ${responseData['user_id']}',
        );

        // ✅ Extract access token and user_id from response
        final accessToken = responseData['access_token'];
        final userId = responseData['user_id'];

        // ✅ Now set the display name (post-registration)
        final displayNameUrl =
            '$baseUrl/_matrix/client/v3/profile/$userId/displayname';

        final displayNameBody = {
          'displayname':
              fullName ?? _pendingUsername, // fallback if name not provided
        };

        final nameResponse = await http.put(
          Uri.parse(displayNameUrl),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $accessToken',
          },
          body: jsonEncode(displayNameBody),
        );

        if (nameResponse.statusCode == 200 || nameResponse.statusCode == 204) {
          print('DEBUG: Display name set successfully.');
        } else {
          print('DEBUG: Failed to set display name: ${nameResponse.body}');
        }

        // ✅ Clear stored registration data
        final prefs = await SharedPreferences.getInstance();
        await prefs.remove('pending_username');
        await prefs.remove('pending_password');
        await prefs.remove('pending_displayname');

        // Registration successful - return normally
        return;
      } else if (response.statusCode == 401) {
        final errorData = jsonDecode(response.body);
        final errorMessage = errorData['error'] ?? 'Registration failed';
        final errcode = errorData['errcode'] ?? '';

        print('DEBUG: Registration failed: $errorMessage');

        if (errcode == 'M_UNAUTHORIZED' &&
            (errorMessage.contains('Unable to get validated threepid') ||
                errorMessage.contains('not validated') ||
                errorMessage.contains('not verified'))) {
          throw Exception(L10n.of(context).emailVerificationRequiredMessage);
        } else {
          throw Exception(
              '${L10n.of(context).registrationFailed}: $errorMessage');
        }
      } else {
        final errorData = jsonDecode(response.body);
        final errorMessage =
            errorData['error'] ?? L10n.of(context).registrationFailed;
        throw Exception(
            '${L10n.of(context).registrationFailed}: $errorMessage');
      }
    } catch (e) {
      print('DEBUG: Complete verification error: $e');
      rethrow;
    }
  }

  /// Check if phone number already exists via registration API.
  /// Returns true if phone exists, false otherwise.
  Future<bool> checkPhoneExists(String phone) async {
    try {
      final dio = Dio();
      final headers = await ApiClient.getHeadersWithoutUser();

      final url = ApiConfig.checkPhoneUrl;
      final payload = {'phone': phone};

      debugPrint('📱 Checking phone exists: $url');
      final response = await dio.post(
        url,
        options: Options(headers: headers),
        data: jsonEncode(payload),
      );

      debugPrint(
          '📱 Check phone response: ${response.statusCode} - ${response.data}');

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data as Map<String, dynamic>;
        // New API format (200 OK means available)
        if (data['exists'] != null) {
          return data['exists'] == true;
        }
        // Legacy format fallback
        if (data['success'] == true && data['data'] != null) {
          return data['data']['exists'] == true;
        }
      }
      return false;
    } on DioException catch (e) {
      debugPrint(
          '❌ checkPhoneExists DioException: ${e.response?.statusCode} - ${e.response?.data}');
      if (e.response?.statusCode == 409) {
        // 409 Conflict means phone exists according to the new API spec
        final data = e.response?.data;
        if (data is Map<String, dynamic> && data['exists'] == true) {
          return true;
        }
        // Fallback: if it's 409, assume it exists
        return true;
      }
      return false;
    } catch (e) {
      debugPrint('❌ checkPhoneExists error: $e');
      return false;
    }
  }

  /// Check if a username is available (true if not exists and available)
  Future<Map<String, dynamic>> checkUsernameAvailability(
      String username) async {
    try {
      final dio = Dio();
      final headers = await ApiClient.getHeadersWithoutUser();
      final url = ApiConfig.usernameAvailabilityUrl(username);

      debugPrint('🔍 Checking username availability: $url');
      debugPrint('📋 Headers: $headers');

      final response = await dio.get(
        url,
        options: Options(headers: headers),
      );

      debugPrint(
          '📱 Username availability response: ${response.statusCode} - ${response.data}');
      debugPrint('🚩 USERNAME AVAILABILITY RESULT: ${response.data}');

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data['data'];
        return {
          'success': true,
          'exists': data != null && data['exists'] == true,
          'available': data != null && data['available'] == true,
        };
      }

      return {'success': false, 'message': 'Failed to check username'};
    } on DioException catch (e) {
      debugPrint(
          '❌ checkUsernameAvailability DioException: ${e.response?.statusCode} - ${e.response?.data}');
      return {
        'success': false,
        'message': e.response?.data?['message'] ?? 'Connection error'
      };
    } catch (e) {
      debugPrint('❌ checkUsernameAvailability error: $e');
      return {'success': false, 'message': e.toString()};
    }
  }

  /// Finalize Registration Setup Webhook
  Future<Map<String, dynamic>> completeRegistration(
      String sessionId, String displayName) async {
    try {
      final dio = Dio();
      final url = '${ApiConfig.baseUrl}/new-auth/register/complete';
      final headers = await ApiClient.getHeadersWithoutUser();
      final payload = {
        'session_id': sessionId,
        'display_name': displayName,
        'deviceId': PlatformInfos.clientName,
      };

      debugPrint('🚀 Finalizing Registration...');
      debugPrint('🌐 POST $url');
      debugPrint('📋 Headers: $headers');
      debugPrint('📦 Payload: $payload');

      final response = await dio.post(
        url,
        options: Options(headers: headers),
        data: jsonEncode(payload),
      );

      debugPrint(
          '📱 Register Complete Response: ${response.statusCode} - ${response.data}');
      debugPrint('🚩 REGISTER COMPLETE RESULT: ${response.data}');

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;
        if (data['success'] == true) {
          return {
            'success': true,
            'data': data['data'],
          };
        }
      }

      // Handle duplicate entry explicit error case
      if (response.data != null && response.data['success'] == false) {
        if (response.data['message'] == 'ER_DUP_ENTRY') {
          return {
            'success': false,
            'isDuplicate': true,
            'message':
                'Full name or email already exists. Please choose another.'
          };
        }
      }

      return {
        'success': false,
        'message': response.data?['message'] ?? 'Registration failed, please try again'
      };
    } on DioException catch (e) {
      debugPrint(
          '❌ register/complete API error: ${e.response?.statusCode} - ${e.response?.data}');
      
      // Handle specific error cases
      if (e.response?.statusCode == 409) {
        final errorData = e.response?.data;
        if (errorData != null) {
          final message = errorData['message'] as String?;
          final errors = errorData['errors'] as Map<String, dynamic>?;
          final errorCode = errors?['code'] as String?;
          
          // Handle USERNAME_TAKEN error specifically
          if (errorCode == 'USERNAME_TAKEN') {
            return {
              'success': false,
              'isDuplicate': true,
              'errorCode': 'USERNAME_TAKEN',
              'message': message ?? 'This username is already taken. Please choose a different username.',
            };
          }
          
          // Handle other duplicate entry errors
          if (message == 'ER_DUP_ENTRY') {
            return {
              'success': false,
              'isDuplicate': true,
              'message': 'Username or email already exists. Please choose another.'
            };
          }
          
          // Return the specific error message from API
          return {
            'success': false,
            'message': message ?? 'Registration failed, please try again'
          };
        }
      }
      
      return {
        'success': false,
        'message': e.response?.data?['message'] ?? 'Registration failed, please try again',
      };
    } catch (e) {
      debugPrint('❌ register/complete error: $e');
      return {
        'success': false,
        'message': 'Registration failed, please try again'
      };
    }
  }

  void resetRegistration() async {
    // Clear stored registration data
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('pending_username');
    await prefs.remove('pending_password');

    setState(() {
      emailVerificationSent = false;
      emailVerified = false;
      generalError = null;
      _clientSecret = null;
      _sid = null;
      _pendingSession = null;
      _pendingUsername = null;
      _pendingPassword = null;
    });
  }

  void loginView() {
    context.go('/home/login');
  }

  Future<void> _getSessionAndStartEmailVerification(
    String fullName,
    String email,
    String username,
    String password,
  ) async {
    try {
      final baseUrl = 'https://${AppConfig.defaultHomeserver}';
      final availableUrl = '$baseUrl/_matrix/client/v3/register/available';
      final availableResponse = await http.get(
        Uri.parse('$availableUrl?username=$username'),
        headers: {'Content-Type': 'application/json'},
      );

      print(
        'DEBUG: Username availability check: ${availableResponse.statusCode}',
      );
      print('DEBUG: Username availability response: ${availableResponse.body}');

      if (availableResponse.statusCode == 400) {
        final error = BmpMatrixError.fromResponse(availableResponse);
        if (error.errcode == 'M_USER_IN_USE') {
          if (mounted) {
            setState(() => loading = false);
            showErrorDialog(
              context,
              MatrixErrorHandler.getErrorTitle(error, context),
              MatrixErrorHandler.getErrorMessage(error, context),
            );
          }
          return;
        }
      }

      // Now send email verification token
      // First try to register with email to check for existing email
      final registerUrl = '$baseUrl/_matrix/client/v3/register';
      final checkResponse = await http.post(
        Uri.parse(registerUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
          'initial_device_display_name': PlatformInfos.clientName,
          'threepids': [
            {
              'medium': 'email',
              'address': email,
            }
          ],
        }),
      );

      if (checkResponse.statusCode == 400) {
        final error = BmpMatrixError.fromResponse(checkResponse);
        print(
          'DEBUG: Registration check error: ${error.errcode} - ${error.error}',
        );

        if (error.errcode == 'M_USER_IN_USE') {
          if (mounted) {
            setState(() {
              usernameError =
                  MatrixErrorHandler.getErrorMessage(error, context);
              loading = false;
            });
          }
          return;
        } else if (error.errcode == 'M_THREEPID_IN_USE' ||
            error.errcode == 'M_EMAIL_IN_USE') {
          if (mounted) {
            setState(() {
              emailError = MatrixErrorHandler.getErrorMessage(error, context);
              loading = false;
            });
          }
          return;
        }
      }

      _clientSecret =
          'flutter_client_secret_${DateTime.now().millisecondsSinceEpoch}';
      _pendingUsername = username;
      _pendingPassword = password;
      final tokenUrl = '$baseUrl/_matrix/client/v3/register/email/requestToken';
      final tokenRequestBody = {
        'email': email,
        'send_attempt': DateTime.now().millisecondsSinceEpoch ~/ 1000,
        'client_secret': _clientSecret,
      };

      print('DEBUG: Requesting email token: $tokenUrl');

      final tokenResponse = await http.post(
        Uri.parse(tokenUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(tokenRequestBody),
      );
      print('DEBUG: tokenResponse: $tokenResponse');
      debugPrint('DEBUG: Headers at line 377: ${tokenResponse.headers}');

      print('DEBUG: Token response status: ${tokenResponse.statusCode}');
      print('DEBUG: Token response body: ${tokenResponse.body}');

      if (tokenResponse.statusCode == 200) {
        final tokenData = jsonDecode(tokenResponse.body);
        _sid = tokenData['sid'];

        print('DEBUG: Email verification SID: $_sid');

        // Store registration data for email verification
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('pending_username', username);
        await prefs.setString('pending_password', password);

        // Now get session for registration
        final registerUrl = '$baseUrl/_matrix/client/v3/register';
        final sessionResponse = await http.post(
          Uri.parse(registerUrl),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'username': username,
            'password': password,
            'initial_device_display_name': PlatformInfos.clientName,
          }),
        );

        if (sessionResponse.statusCode == 401) {
          final authData = jsonDecode(sessionResponse.body);
          _pendingSession = authData['session'];
          print('DEBUG: Got session: $_pendingSession');
        } else if (sessionResponse.statusCode == 400) {
          final error = BmpMatrixError.fromResponse(sessionResponse);
          if (error.errcode == 'M_THREEPID_IN_USE' ||
              error.errcode == 'M_EMAIL_IN_USE') {
            if (mounted) {
              setState(() {
                emailError = MatrixErrorHandler.getErrorMessage(error, context);
                loading = false;
              });
            }
            return;
          }
        }

        if (mounted) {
          setState(() {
            generalError = null;
            emailVerificationSent = true;
            loading = false;
          });

          // Navigate to email verification page
          setState(() => loading = false);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => EmailVerificationPage(
                email: email,
                onCompleteVerification: () async {
                  await completeEmailVerification(fullName);
                },
                onStartOver: () {
                  Navigator.of(context).pop();
                  resetRegistration();
                },
              ),
            ),
          );
        }
      } else {
        final error = BmpMatrixError.fromResponse(tokenResponse);
        print('DEBUG: Email token request failed: ${error.error}');

        if (mounted) {
          setState(() {
            loading = false;
            generalError = MatrixErrorHandler.getErrorMessage(error, context);
          });

          showErrorDialog(
            context,
            MatrixErrorHandler.getErrorTitle(error, context),
            MatrixErrorHandler.getErrorMessage(error, context),
          );
        }
      }
    } catch (e) {
      print('DEBUG: Email verification error: $e');
      if (mounted) {
        setState(() {
          loading = false;
          generalError =
              '${L10n.of(context).failedToStartEmailVerification}: $e';
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    fullNameController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SignupView(this);
}
