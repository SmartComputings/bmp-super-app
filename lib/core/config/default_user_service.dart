import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Singleton service that loads the default/test users from
/// `assets/config/default_users.json` and controls which API base URL
/// the app should use.
///
/// • Default users → dev base URL (from JSON)
/// • All other users → .env CUSTOMER_API_BASE_URL
///
/// The active user type is persisted to SharedPreferences so it
/// survives app restarts.
class DefaultUserService {
  DefaultUserService._();
  static final DefaultUserService _instance = DefaultUserService._();
  static DefaultUserService get instance => _instance;

  static const String _prefKey = 'is_default_user';

  bool _loaded = false;
  String _devBaseUrl = '';
  List<Map<String, dynamic>> _emailUsers = [];
  List<Map<String, dynamic>> _phoneUsers = [];

  /// Whether the currently active user is a default/test user.
  bool _isDefaultUser = false;

  /// Call once during app startup. Loads the JSON asset AND restores
  /// the persisted user-type flag from SharedPreferences.
  Future<void> load() async {
    if (_loaded) return;
    try {
      final jsonString =
          await rootBundle.loadString('assets/config/default_users.json');
      final data = json.decode(jsonString) as Map<String, dynamic>;

      _devBaseUrl = data['dev_base_url'] as String? ?? '';
      _emailUsers = (data['email_users'] as List<dynamic>?)
              ?.cast<Map<String, dynamic>>() ??
          [];
      _phoneUsers = (data['phone_users'] as List<dynamic>?)
              ?.cast<Map<String, dynamic>>() ??
          [];

      // Restore persisted user type from SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      _isDefaultUser = prefs.getBool(_prefKey) ?? false;

      _loaded = true;

      if (kDebugMode) {
        print(
            '✅ DefaultUserService loaded: ${_emailUsers.length} email users, ${_phoneUsers.length} phone users');
        print('✅ DefaultUserService dev URL: $_devBaseUrl');
        print('✅ DefaultUserService .env URL: ${_getEnvBaseUrl()}');
        print(
            '✅ DefaultUserService restored user type: ${_isDefaultUser ? "DEFAULT (dev)" : "REGULAR (.env)"}');
        print('✅ DefaultUserService active base URL: ${getBaseUrl()}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('⚠️ DefaultUserService: Failed to load default_users.json: $e');
      }
    }
  }

  /// Read the base URL from .env file.
  static String _getEnvBaseUrl() {
    final envUrl = dotenv.env['CUSTOMER_API_BASE_URL'];
    if (envUrl != null && envUrl.isNotEmpty) {
      // Strip trailing whitespace / comments that dotenv might include
      return envUrl.trim().split(RegExp(r'\s+')).first;
    }
    return '';
  }

  /// Check if the given email/username + password matches a default user.
  bool isDefaultEmailUser(String username, String password) {
    if (!_loaded) {
      if (kDebugMode) print('⚠️ DefaultUserService: not loaded, cannot check email user');
      return false;
    }
    for (final user in _emailUsers) {
      if (user['username'] == username && user['password'] == password) {
        if (kDebugMode) print('✅ DefaultUserService: MATCH found for email user: $username');
        return true;
      }
    }
    if (kDebugMode) print('❌ DefaultUserService: No match for email user: $username');
    return false;
  }

  /// Check if the given phone number matches a default phone user.
  /// Pin check is optional — pass `null` to match by phone only.
  bool isDefaultPhoneUser(String phone, [String? pin]) {
    if (!_loaded) {
      if (kDebugMode) print('⚠️ DefaultUserService: not loaded, cannot check phone user');
      return false;
    }
    for (final user in _phoneUsers) {
      if (user['phone'] == phone) {
        if (pin == null) {
          if (kDebugMode) print('✅ DefaultUserService: MATCH found for phone: $phone');
          return true;
        }
        if (user['pin'] == pin) {
          if (kDebugMode) print('✅ DefaultUserService: MATCH found for phone+pin: $phone');
          return true;
        }
      }
    }
    if (kDebugMode) print('❌ DefaultUserService: No match for phone: $phone');
    return false;
  }

  /// Toggle the active user type and persist it to SharedPreferences.
  /// Call this right before login API calls.
  Future<void> setActiveUserType(bool isDefault) async {
    _isDefaultUser = isDefault;

    // Persist so app restarts remember which URL to use
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_prefKey, isDefault);
    } catch (e) {
      if (kDebugMode) print('⚠️ DefaultUserService: Failed to persist user type: $e');
    }

    if (kDebugMode) {
      final url = getBaseUrl();
      print('🔀 DefaultUserService: Active user type → ${isDefault ? "DEFAULT (dev)" : "REGULAR (.env)"}');
      print('🔀 DefaultUserService: Base URL is now → $url');
    }
  }

  /// Returns `true` if the currently active user is a default/test user.
  bool get isDefaultUser => _isDefaultUser;

  /// Returns the appropriate base URL for the current user type.
  ///
  /// • Default user → dev URL from JSON
  /// • Non-default user → CUSTOMER_API_BASE_URL from .env
  /// • Fallback → .env value if service hasn't loaded
  String getBaseUrl() {
    if (!_loaded) {
      // Not loaded yet — use .env as fallback
      final envUrl = _getEnvBaseUrl();
      if (kDebugMode) print('🔧 DEBUG: Service not loaded, using env URL: $envUrl');
      if (envUrl.isNotEmpty) return envUrl;
      if (kDebugMode) print('🔧 DEBUG: Using hardcoded fallback URL');
      return 'https://dev-backend.be-mindpower.net/api';
    }

    if (_isDefaultUser && _devBaseUrl.isNotEmpty) {
      // Default/test user → always use the dev URL from JSON
      return _devBaseUrl;
    }

    // Non-default user → use whatever .env says
    final envUrl = _getEnvBaseUrl();
    if (envUrl.isNotEmpty) return envUrl;

    // Ultimate fallback
    return _devBaseUrl.isNotEmpty
        ? _devBaseUrl
        : 'https://dev-backend.be-mindpower.net/api';
  }
}
