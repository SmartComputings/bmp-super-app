import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RememberMeService {
  static const _secureStorage = FlutterSecureStorage();
  static const String _rememberMeKey = 'remember_me';
  static const String _usernameKey = 'saved_username';
  static const String _passwordKey = 'saved_password';

  static Future<bool> getRememberMeState() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_rememberMeKey) ?? false;
  }

  static Future<void> setRememberMeState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_rememberMeKey, value);
  }

  static Future<String?> getSavedUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_usernameKey);
  }

  static Future<void> setSavedUsername(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_usernameKey, username);
  }

  static Future<String?> getSavedPassword() async {
    return await _secureStorage.read(key: _passwordKey);
  }

  static Future<void> setSavedPassword(String password) async {
    await _secureStorage.write(key: _passwordKey, value: password);
  }

  static Future<void> clearSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_usernameKey);
    await prefs.setBool(_rememberMeKey, false);
    await _secureStorage.delete(key: _passwordKey);
  }

  static Future<Map<String, String?>> getSavedCredentials() async {
    final rememberMe = await getRememberMeState();
    if (!rememberMe) {
      return {'username': null, 'password': null};
    }

    final username = await getSavedUsername();
    final password = await getSavedPassword();
    
    return {
      'username': username,
      'password': password,
    };
  }

  static Future<void> saveCredentials({
    required String username,
    required String password,
    required bool rememberMe,
  }) async {
    if (rememberMe) {
      await setSavedUsername(username);
      await setSavedPassword(password);
      await setRememberMeState(true);
    } else {
      await clearSavedCredentials();
    }
  }
}