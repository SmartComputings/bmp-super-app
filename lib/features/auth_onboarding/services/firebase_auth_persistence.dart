import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Firebase Authentication Persistence Handler
class FirebaseAuthPersistence {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Initialize auth state listener
  static void initialize() {
    _auth.authStateChanges().listen((User? user) {
      if (user != null) {
        debugPrint('Firebase: User signed in - ${user.uid}');
        _storeUserSession(user);
      } else {
        debugPrint('Firebase: User signed out');
        _clearUserSession();
      }
    });
  }

  /// Check if user is authenticated
  static bool isAuthenticated() {
    return _auth.currentUser != null;
  }

  /// Get current user
  static User? getCurrentUser() {
    return _auth.currentUser;
  }

  /// Get current user ID
  static String? getCurrentUserId() {
    return _auth.currentUser?.uid;
  }

  /// Get current user phone
  static String? getCurrentUserPhone() {
    return _auth.currentUser?.phoneNumber;
  }

  /// Store user session
  static Future<void> _storeUserSession(User user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('firebase_uid', user.uid);
      if (user.phoneNumber != null) {
        await prefs.setString('firebase_phone', user.phoneNumber!);
      }
      await prefs.setBool('is_firebase_authenticated', true);
      await prefs.setInt('last_firebase_login', DateTime.now().millisecondsSinceEpoch);
      debugPrint('Firebase session stored');
    } catch (e) {
      debugPrint('Failed to store Firebase session: $e');
    }
  }

  /// Clear user session
  static Future<void> _clearUserSession() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('firebase_uid');
      await prefs.remove('firebase_phone');
      await prefs.remove('is_firebase_authenticated');
      await prefs.remove('last_firebase_login');
      debugPrint('Firebase session cleared');
    } catch (e) {
      debugPrint('Failed to clear Firebase session: $e');
    }
  }

  /// Check if user has previous session
  static Future<bool> hasPreviousSession() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isAuthenticated = prefs.getBool('is_firebase_authenticated') ?? false;
      final hasFirebaseUid = prefs.getString('firebase_uid') != null;
      return isAuthenticated && hasFirebaseUid && _auth.currentUser != null;
    } catch (e) {
      debugPrint('Failed to check previous session: $e');
      return false;
    }
  }

  /// Sign out
  static Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _clearUserSession();
      debugPrint('Firebase: User signed out successfully');
    } catch (e) {
      debugPrint('Firebase: Sign out failed - $e');
      rethrow;
    }
  }

  /// Get auth state stream
  static Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// Get Firebase ID token
  static Future<String?> getIdToken({bool forceRefresh = false}) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        return await user.getIdToken(forceRefresh);
      }
      return null;
    } catch (e) {
      debugPrint('Failed to get ID token: $e');
      return null;
    }
  }
}
