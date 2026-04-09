import 'dart:async';
import 'dart:convert';

import 'package:bmp/core/config/default_user_service.dart';
import 'package:bmp/core/network/api_client.dart';

import 'package:bmp/core/config/app_config.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/auth_onboarding/login/login_view.dart';
import 'package:bmp/shared/data/services/auth_shared_service.dart';
import 'package:bmp/shared/data/services/customer_shared_service.dart';
import 'package:bmp/shared/data/services/device_info_shared_service.dart';
import 'package:bmp/shared/data/services/security_shared_service.dart';
// CustomerProvider removed

import 'package:bmp/shared/utils/file_selector.dart';
import 'package:bmp/shared/utils/localized_exception_extension.dart';
import 'package:bmp/shared/utils/platform_infos.dart';
import 'package:bmp/shared/utils/session_cleaner.dart';
import 'package:bmp/shared/utils/tor_stub.dart'
    if (dart.library.html) 'package:tor_detector_web/tor_detector_web.dart';
import 'package:bmp/shared/widgets/adaptive_dialogs/show_ok_cancel_alert_dialog.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:matrix/matrix.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_html/html.dart' as html;
import 'package:http/http.dart' as http;

// SecuritySharedService imported above

import 'package:bmp/shared/data/datasources/username_local_datasource.dart';
import 'package:bmp/shared/data/models/username_model.dart';
import '../onBoardingScreens/phone_auth_flow/enter_phone_number_controller.dart';
import '../services/remember_me_service.dart';
import 'package:bmp/shared/data/models/PhoneVerifyModels.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/phone_auth_flow/varification_code_screen.dart';

class Login extends StatefulWidget {
  final Client client;
  const Login({required this.client, super.key});

  @override
  LoginController createState() => LoginController();
}

class LoginController extends State<Login> {
  // cSpell:ignore homeserverController defaultHomeserver homeserver prefs msisdn errcode THREEPID

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController homeserverController = TextEditingController(
    text: AppConfig.defaultHomeserver,
  );
  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  String? usernameError;
  String? passwordError;
  String? generalError;
  String? error;
  bool loading = false;
  bool showPassword = false;
  bool isTorBrowser = false;
  List<LoginFlow>? loginFlows;
  bool rememberMe = false;
  late final EnterPhoneNumberController phoneAuthController =
      EnterPhoneNumberController();

  void toggleShowPassword() =>
      setState(() => showPassword = !loading && !showPassword);

  void clearUsernameError() {
    if (usernameError != null) {
      setState(() => usernameError = null);
    }
  }

  void clearPasswordError() {
    if (passwordError != null) {
      setState(() => passwordError = null);
    }
  }

  void clearGeneralError() {
    if (generalError != null) {
      setState(() => generalError = null);
    }
  }

  bool _validateUsername(String username) {
    if (username.isEmpty) {
      usernameError = L10n.of(context).usernameOrEmailRequired;
      return false;
    }
    usernameError = null;
    return true;
  }

  bool _validatePassword(String password) {
    if (password.isEmpty) {
      passwordError = L10n.of(context).passwordIsRequired;
      return false;
    }
    passwordError = null;
    return true;
  }

  static bool _isEmail(String input) =>
      RegExp(r'(.+)@(.+)\.(.+)').hasMatch(input);

  /// Validates credentials against the Matrix login API without
  /// establishing a persistent session or triggering auto-navigation.
  /// Returns a map with 'success' (bool), and on failure: 'errcode' and 'message'.
  static Future<Map<String, dynamic>> validateCredentials({
    required String username,
    required String password,
  }) async {
    try {
      final homeserver = AppConfig.defaultHomeserver;
      final url = Uri.https(homeserver, '/_matrix/client/v3/login');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'type': 'm.login.password',
          'identifier': _isEmail(username)
              ? {
                  'type': 'm.id.thirdparty',
                  'medium': 'email',
                  'address': username,
                }
              : {
                  'type': 'm.id.user',
                  'user': username,
                },
          'password': password,
          'initial_device_display_name': 'credential_check',
        }),
      );
      if (response.statusCode == 200) {
        // Credentials valid — clean up the temporary session
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        final accessToken = data['access_token'] as String?;
        final userId = data['user_id'] as String?;
        if (accessToken != null) {
          try {
            await http.post(
              Uri.https(homeserver, '/_matrix/client/v3/logout'),
              headers: {
                'Authorization': 'Bearer $accessToken',
                'Content-Type': 'application/json',
              },
            );
          } catch (_) {
            // Best-effort logout; ignore errors
          }
        }
        return {
          'success': true,
          'userId': userId,
        };
      } else {
        final body = jsonDecode(response.body) as Map<String, dynamic>;
        return {
          'success': false,
          'errcode': body['errcode'] ?? 'UNKNOWN',
          'message': body['error'] ?? 'Login failed',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'errcode': 'CONNECTION_ERROR',
        'message': e.toString(),
      };
    }
  }

  static Future<void> performLogin({
    required BuildContext context,
    required String username,
    required String password,
  }) async {
    // NOTE: Auth data is cleared BEFORE this method is called
    // in both email and phone login flows

    final matrix = Matrix.of(context);
    final client = await matrix.getLoginClient();

    if (client.homeserver == null) {
      await client.checkHomeserver(Uri.https(AppConfig.defaultHomeserver, ''));
    }

    await Future.delayed(const Duration(milliseconds: 500));

    await client.login(
      LoginType.mLoginPassword,
      user: username,
      password: password,
      initialDeviceDisplayName: PlatformInfos.clientName,
    );

    if (client.isLogged() && client.userID != null) {
      // Matrix gives us the full ID e.g. @bmp_qrf_836002:matrix.org
      final matrixId = client.userID!;
      final matrixUsername = matrixId.replaceFirst('@', '').split(':')[0];
      final prefs = await SharedPreferences.getInstance();

      await prefs.setString('matrix_id', matrixId);
      await prefs.setString('username', matrixUsername);
      await prefs.setString('current_username', matrixUsername);

      // ─── Eagerly write to Hive BEFORE any async work that may trigger routing ───
      // Matrix client state change may auto-route the app immediately after
      // client.login() completes. If anything on the next screen calls
      // UsernameInjection.getUsername() (which reads Hive, not SharedPreferences)
      // it would get null and send x-username: unknown to the server.
      // Writing here guarantees the username is in Hive before any navigation fires.
      try {
        final dataSource = UsernameLocalDataSourceImpl();
        await dataSource.cacheUsername(
          UsernameModel(
            usernameField: matrixUsername,
            matrixIdField: matrixId,
            lastUpdatedField: DateTime.now(),
          ),
        );
        debugPrint('✅ performLogin: Username cached to Hive: $matrixUsername');
      } catch (e) {
        debugPrint('⚠️ performLogin: Could not cache username to Hive: $e');
      }
      // ────────────────────────────────────────────────────────────────────

      try {
        final tokenResult = await SecuritySharedService.generateToken(matrixUsername);
        if (tokenResult.success) {
          await SecuritySharedService.getCsrfToken(matrixUsername);
        }
      } catch (e) {
        debugPrint('⚠️ Security setup failed: $e');
      }

      // CustomerProvider removed


      try {
        // Use the correctly stripped matrixUsername (not the raw input parameter)
        // to avoid the split('@')[0] bug that returns '' for @user:domain strings
        final customerData =
            await CustomerSharedService.checkUsername(matrixUsername);
        if (customerData['hasCustomer'] == true &&
            customerData['customerId'] != null) {
          final customerId = customerData['customerId'] as String;
          if (!customerId.startsWith('cus_')) {
            await prefs.setString('customer_id', customerId);
          } else {
            debugPrint('⚠️ Login: Rejecting Stripe customer ID: $customerId');
          }
        }

        // Save phone number if available
        final phone = customerData['phone'] as String?;
        if (phone != null && phone.isNotEmpty) {
          await prefs.setString('phone_no', phone);
          debugPrint('✅ Login: Phone number saved: $phone');
        }
      } catch (e) {
        debugPrint('⚠️ Failed to check/store customer ID: $e');
      }
    }
  }

  Future<void> login(
      {required String username, required String password}) async {
    setState(() {
      usernameError = null;
      passwordError = null;
      generalError = null;
      error = null;
    });

    var isValid = true;
    isValid &= _validateUsername(username);
    isValid &= _validatePassword(password);

    if (!isValid) {
      setState(() {});
      return;
    }

    setState(() => loading = true);
    _coolDown?.cancel();

    try {
      if (loginFlows == null) {
        await checkHomeserverAction(legacyPasswordLogin: true);
        if (error != null) {
          setState(() => generalError = error);
          return;
        }
      }

      // Clear old auth data FIRST (before checking default user)
      await SessionCleaner.clearAuthData();

      // Check if this is a default/test user and switch base URL accordingly
      final isDefault =
          DefaultUserService.instance.isDefaultEmailUser(username, password);
      await DefaultUserService.instance.setActiveUserType(isDefault);
      ApiClient.reinitialize();

      await performLogin(
          context: context, username: username, password: password);

      await _saveCredentials();

      final matrix = Matrix.of(context);
      final client = await matrix.getLoginClient();
      await _postDeviceInfo(client, username, password);

      try {
        await Permission.notification.request();
      } catch (e) {
        Logs().w('Login: Failed to request notification permission', e);
      }
    } on MatrixException catch (exception) {
      if (mounted) {
        setState(() {
          switch (exception.errcode) {
            case 'M_FORBIDDEN':
            case 'M_USER_DEACTIVATED':
              generalError = username.isEmail
                  ? L10n.of(context).invalidEmailOrPassword
                  : L10n.of(context).invalidUsernameOrPassword;
              break;
            case 'M_THREEPID_NOT_FOUND':
              generalError = L10n.of(context).emailNotFoundSignUp;
              break;
            case 'M_LIMIT_EXCEEDED':
              generalError = L10n.of(context).tooManyLoginAttempts;
              break;
            case 'M_UNKNOWN':
              generalError = L10n.of(context).serverErrorTryAgain;
              break;
            default:
              generalError = exception.errorMessage ??
                  L10n.of(context).loginFailed(exception.errcode ?? 'UNKNOWN');
          }
        });
      }
      return setState(() => loading = false);
    } catch (exception) {
      if (mounted) {
        setState(() => generalError = L10n.of(context).connectionError);
      }
      return setState(() => loading = false);
    }

    if (mounted) setState(() => loading = false);
  }

  Future<void> _postDeviceInfo(
      Client client, String username, String password) async {
    try {
      final platform = await DeviceInfoSharedService.getPlatform();
      final deviceId = await DeviceInfoSharedService.getDeviceId();
      final fcmToken = await DeviceInfoSharedService.getFcmToken();
      final appVersion = await DeviceInfoSharedService.getAppVersion();

      final matrixUsername = client.userID?.replaceFirst('@', '').split(':')[0];

      String? email;
      String? firstName;
      String? lastName;

      try {
        final threepids = await client.getAccount3PIDs();
        email = threepids
            ?.firstWhereOrNull(
              (t) => t.medium == ThirdPartyIdentifierMedium.email,
            )
            ?.address;
      } catch (_) {}

      try {
        final profile = await client.fetchOwnProfile();
        final displayName = profile.displayName;
        if (displayName != null && displayName.isNotEmpty) {
          final nameParts = displayName.trim().split(RegExp(r'\s+'));
          firstName = nameParts.first;
          lastName = nameParts.length > 1 ? nameParts.skip(1).join(' ') : null;
        }
        debugPrint("displayName: $displayName");
      } catch (_) {}

      final prefs = await SharedPreferences.getInstance();
      if (matrixUsername != null) {
        await prefs.setString('username', matrixUsername);
        await prefs.setString('current_username', matrixUsername);
      }
      if (email != null) await prefs.setString('user_email', email);
      if (firstName != null && firstName.isNotEmpty) {
        await prefs.setString('first_name', firstName);
      }
      if (lastName != null && lastName.isNotEmpty) {
        await prefs.setString('last_name', lastName);
      }

      final authUsername = matrixUsername ??
          (username.isEmail ? username.split('@')[0] : username);
      final authEmail = email ?? (username.isEmail ? username : null);

      if (deviceId != null) {
        await AuthSharedService.postLoginDeviceInfo(
          email: authEmail,
          password: password,
          username: authUsername,
          deviceId: deviceId,
          platform: platform,
          fcmToken: fcmToken,
          appVersion: appVersion,
          firstName: firstName,
          lastName: lastName,
        );
      }
    } catch (_) {}
  }

  Timer? _coolDown;

  void checkWellKnownWithCoolDown(String userId) async {
    _coolDown?.cancel();
    _coolDown = Timer(
      const Duration(seconds: 1),
      () => _checkWellKnown(userId),
    );
  }

  void _checkWellKnown(String userId) async {
    if (mounted) setState(() => usernameError = null);
    if (!userId.isValidMatrixId) return;
    final oldHomeserver = widget.client.homeserver;
    try {
      var newDomain = Uri.https(userId.domain!, '');
      widget.client.homeserver = newDomain;
      DiscoveryInformation? wellKnownInformation;
      try {
        wellKnownInformation = await widget.client.getWellknown();
        if (wellKnownInformation.mHomeserver.baseUrl.toString().isNotEmpty) {
          newDomain = wellKnownInformation.mHomeserver.baseUrl;
        }
      } catch (_) {
        // do nothing, newDomain is already set to a reasonable fallback
      }
      if (newDomain != oldHomeserver) {
        await widget.client.checkHomeserver(newDomain);

        if (widget.client.homeserver == null) {
          widget.client.homeserver = oldHomeserver;
          // okay, the server we checked does not appear to be a matrix server
          Logs().v(
            '$newDomain is not running a homeserver, asking to use $oldHomeserver',
          );
          final dialogResult = await showOkCancelAlertDialog(
            context: context,
            useRootNavigator: false,
            dialogType: DialogType.success,
            title: L10n.of(context)
                .noMatrixServer(newDomain.toString(), oldHomeserver.toString()),
            okLabel: L10n.of(context).ok,
            cancelLabel: L10n.of(context).cancel,
          );
          if (dialogResult == OkCancelResult.ok) {
            if (mounted) setState(() => usernameError = null);
          } else {
            Navigator.of(context, rootNavigator: false).pop();
            return;
          }
        }
        usernameError = null;
        if (mounted) setState(() {});
      } else {
        widget.client.homeserver = oldHomeserver;
        if (mounted) {
          setState(() {});
        }
      }
    } catch (e) {
      widget.client.homeserver = oldHomeserver;
      usernameError = e.toLocalizedString(context);
      if (mounted) setState(() {});
    }
  }

  void passwordForgotten() async {
    final result = await context.push(
      '/home/forgot-password',
      extra: {
        'client': widget.client,
        'email': usernameController.text.isEmail ? usernameController.text : '',
      },
    );

    if (result != null && result is Map<String, String>) {
      usernameController.text = result['email'] ?? '';
      passwordController.text = result['password'] ?? '';
      final username = usernameController.text.trim();
      final password = passwordController.text;
      login(username: username, password: password);
    }
  }

  static int sendAttempt = 0;

  void signUp() async {
    final client = await Matrix.of(context).getLoginClient();
    context.push('/home/account-type', extra: client);
  }

  // void navigateToSignup() async {
  //   final client = await Matrix.of(context).getLoginClient();
  //   context.push('/home/signup', extra: client);
  // }

  Future<void> _checkTorBrowser() async {
    if (!kIsWeb) return;

    Hive.openBox('test').then((value) => null).catchError(
      (e, s) async {
        await showOkAlertDialog(
          context: context,
          title: L10n.of(context).indexedDbErrorTitle,
          message: L10n.of(context).indexedDbErrorLong,
          dialogType: DialogType.error,
        );
        _checkTorBrowser();
      },
    );

    final isTor = await TorBrowserDetector.isTorBrowser;
    isTorBrowser = isTor;
  }

  Future<void> checkHomeserverAction({bool legacyPasswordLogin = false}) async {
    final homeserverInput =
        homeserverController.text.trim().toLowerCase().replaceAll(' ', '-');

    if (homeserverInput.isEmpty) {
      final client = await Matrix.of(context).getLoginClient();
      setState(() {
        error = loginFlows = null;
        loading = false;
        client.homeserver = null;
      });
      return;
    }
    setState(() {
      error = loginFlows = null;
      loading = true;
    });

    final l10n = L10n.of(context);

    try {
      var homeserver = Uri.parse(homeserverInput);
      if (homeserver.scheme.isEmpty) {
        homeserver = Uri.https(homeserverInput, '');
      }
      final client = await Matrix.of(context).getLoginClient();
      final (_, _, loginFlows) = await client.checkHomeserver(homeserver);
      this.loginFlows = loginFlows;
      if (supportsSso && !legacyPasswordLogin) {
        if (!PlatformInfos.isMobile) {
          final consent = await showOkCancelAlertDialog(
            context: context,
            dialogType: DialogType.success,
            title: l10n.appWantsToUseForLogin(homeserverInput),
            message: l10n.appWantsToUseForLoginDescription,
            okLabel: l10n.continueText,
          );
          if (consent != OkCancelResult.ok) return;
        }
        return ssoLoginAction();
      }
    } catch (e) {
      setState(
        () => error = (e).toLocalizedString(
          context,
          ExceptionContext.checkHomeserver,
        ),
      );
    } finally {
      if (mounted) {
        setState(() => loading = false);
      }
    }
  }

  bool _supportsFlow(String flowType) =>
      loginFlows?.any((flow) => flow.type == flowType) ?? false;

  bool get supportsSso => _supportsFlow('m.login.sso');

  bool isDefaultPlatform =
      (PlatformInfos.isMobile || PlatformInfos.isWeb || PlatformInfos.isMacOS);

  bool get supportsPasswordLogin => _supportsFlow('m.login.password');

  void ssoLoginAction() async {
    final redirectUrl = kIsWeb
        ? Uri.parse(html.window.location.href)
            .resolveUri(
              Uri(pathSegments: ['auth.html']),
            )
            .toString()
        : isDefaultPlatform
            ? '${AppConfig.appOpenUrlScheme.toLowerCase()}://login'
            : 'http://localhost:3001//login';
    final client = await Matrix.of(context).getLoginClient();
    final url = client.homeserver!.replace(
      path: '/_matrix/client/v3/login/sso/redirect',
      queryParameters: {'redirectUrl': redirectUrl},
    );

    final urlScheme = isDefaultPlatform
        ? Uri.parse(redirectUrl).scheme
        : "http://localhost:3001";
    final result = await FlutterWebAuth2.authenticate(
      url: url.toString(),
      callbackUrlScheme: urlScheme,
      options: const FlutterWebAuth2Options(),
    );
    final token = Uri.parse(result).queryParameters['loginToken'];
    if (token?.isEmpty ?? false) return;

    setState(() {
      error = null;
      loading = true;
    });
    try {
      await client.login(
        LoginType.mLoginToken,
        token: token,
        initialDeviceDisplayName: PlatformInfos.clientName,
      );
    } catch (e) {
      setState(() {
        error = e.toLocalizedString(context);
      });
    } finally {
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    }
  }

  Future<void> restoreBackup() async {
    final picked = await selectFiles(context);
    final file = picked.firstOrNull;
    if (file == null) return;
    setState(() {
      error = null;
      loading = true;
    });
    try {
      final client = await Matrix.of(context).getLoginClient();
      await client.importDump(String.fromCharCodes(await file.readAsBytes()));
      Matrix.of(context).initMatrix();
    } catch (e) {
      setState(() {
        error = e.toLocalizedString(context);
      });
    } finally {
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _checkTorBrowser();
    _loadSavedCredentials();
  }

  @override
  void dispose() {
    _coolDown?.cancel();
    usernameController.dispose();
    passwordController.dispose();
    homeserverController.dispose();
    usernameFocusNode.dispose();
    passwordFocusNode.dispose();
    phoneAuthController.dispose();
    super.dispose();
  }

  Future<void> initiateEmailLoginAction(BuildContext context) async {
    final email = usernameController.text.trim();

    if (email.isEmpty) {
      setState(() => usernameError = L10n.of(context).emailRequired);
      return;
    }

    setState(() => loading = true);

    try {
      final result = await phoneAuthController.initiateEmailLoginOtp(email);

      if (!mounted) return;
      setState(() => loading = false);

      if (result['success'] == true) {
        final sessionId = result['session_id'] as String?;

        if (sessionId != null) {
          // Navigate to Email Verification Screen
          final phoneResponse = PhoneVerifyModels();
          phoneResponse.data = Data(sessionId: sessionId, success: true);

          if (!context.mounted) return;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VarificationCodeScreen(
                phone: email, // Using email as the identifier
                phoneResponse: phoneResponse,
                controller: phoneAuthController,
                isEmailLogin: true,
                isRegister: false,
                onSuccess: (String? finalSessionId) async {
                  // This callback is triggered when OTP is verified
                  final data = phoneAuthController.lastVerificationData;
                  if (data != null &&
                      data['matrix_username'] != null &&
                      data['matrix_password'] != null) {
                    final matrixUsername = data['matrix_username'] as String;
                    final matrixPassword = data['matrix_password'] as String;

                    // Perform the actual Matrix login
                    if (!mounted) return;
                    setState(() => loading = true);
                    try {
                      await LoginController.performLogin(
                        context: context,
                        username: matrixUsername,
                        password: matrixPassword,
                      );
                      // Finalize navigation: pop the verification screen
                      if (!mounted) return;
                      Navigator.of(context).pop();

                      // The Matrix listener will handle redirection to /home
                    } catch (e) {
                      setState(() =>
                          generalError = 'Login failed after verification');
                    } finally {
                      if (mounted) setState(() => loading = false);
                    }
                  }
                },
              ),
            ),
          );
        }
      } else {
        final message = result['message'] ?? '';
        if (message.contains('not_registered') ||
            message.contains('not found')) {
          setState(
              () => generalError = 'Email not found. Please sign up first.');
        } else {
          setState(() => generalError = message);
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() => generalError = L10n.of(context).connectionError);
      }
    } finally {
      if (mounted) setState(() => loading = false);
    }
  }

  Future<void> _loadSavedCredentials() async {
    final credentials = await RememberMeService.getSavedCredentials();
    final savedRememberMe = await RememberMeService.getRememberMeState();

    if (savedRememberMe && credentials['username'] != null) {
      usernameController.text = credentials['username']!;
      if (credentials['password'] != null) {
        passwordController.text = credentials['password']!;
      }

      setState(() {
        rememberMe = true;
      });
    }
  }

  Future<void> _saveCredentials() async {
    await RememberMeService.saveCredentials(
      username: usernameController.text.trim(),
      password: passwordController.text,
      rememberMe: rememberMe,
    );
  }

  void onRememberMeChanged(bool value) {
    setState(() {
      rememberMe = value;
    });
  }

  @override
  Widget build(BuildContext context) => LoginView(this);
}

enum MoreLoginActions { importBackup, privacy, about }

class IdentityProvider {
  final String? id;
  final String? name;
  final String? icon;
  final String? brand;

  IdentityProvider({this.id, this.name, this.icon, this.brand});

  factory IdentityProvider.fromJson(Map<String, dynamic> json) =>
      IdentityProvider(
        id: json['id'],
        name: json['name'],
        icon: json['icon'],
        brand: json['brand'],
      );
}

extension on String {
  static final RegExp _phoneRegex =
      RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
  static final RegExp _emailRegex = RegExp(r'(.+)@(.+)\.(.+)');

  bool get isEmail => _emailRegex.hasMatch(this);

  bool get isPhoneNumber => _phoneRegex.hasMatch(this);
}
