import 'package:bmp/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:io' show Platform;

/// Firebase Phone Authentication Service
/// Handles all Firebase Phone Auth operations
class FirebasePhoneAuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Send OTP to phone number
  static Future<void> sendOtp({
    required String phoneNumber,
    required Function(String verificationId, int? resendToken) onCodeSent,
    required Function(PhoneAuthCredential) onVerificationCompleted,
    required Function(FirebaseAuthException) onVerificationFailed,
    required Function(String) onCodeAutoRetrievalTimeout,
    int? forceResendingToken,
  }) async {
    print('[iOS Debug] FirebasePhoneAuthService.sendOtp called');
    print('[iOS Debug] Phone number: $phoneNumber');
    print('[iOS Debug] Platform: ${Platform.operatingSystem}');
    print('[iOS Debug] Force resending token: $forceResendingToken');
    debugPrint('Firebase: Sending OTP to $phoneNumber');

    // Safety check to ensure Firebase is initialized
    try {
      if (Firebase.apps.isEmpty) {
        debugPrint('⚠️ Firebase not initialized in FirebasePhoneAuthService. Initializing now...');
        
        // Ensure environment variables are loaded for DefaultFirebaseOptions
        if (!dotenv.isInitialized) {
          debugPrint('📂 Loading .env for on-demand Firebase initialization...');
          await dotenv.load(fileName: ".env");
        }

        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
        debugPrint('✅ Firebase initialized on-demand');
      }
    } catch (e) {
      debugPrint('❌ On-demand Firebase initialization failed: $e');
    }

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {
        print('[iOS Debug] Verification completed automatically');
        print('[iOS Debug] Credential: ${credential.toString()}');
        onVerificationCompleted(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print('[iOS Debug] Verification failed');
        print('[iOS Debug] Error code: ${e.code}');
        print('[iOS Debug] Error message: ${e.message}');
        print('[iOS Debug] Error details: ${e.toString()}');
        debugPrint('🔥 Firebase: Verification failed - ${e.code}');
        onVerificationFailed(e);
      },
      codeSent: (String verificationId, int? resendToken) {
        print('[iOS Debug] Code sent successfully');
        print('[iOS Debug] Verification ID: $verificationId');
        print('[iOS Debug] Resend token: $resendToken');
        onCodeSent(verificationId, resendToken);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print('[iOS Debug] Code auto-retrieval timeout');
        print('[iOS Debug] Verification ID: $verificationId');
        onCodeAutoRetrievalTimeout(verificationId);
      },
      forceResendingToken: forceResendingToken,
      timeout: const Duration(seconds: 60),
    );
  }

  /// Verify OTP code
  static Future<UserCredential> verifyOtp({
    required String verificationId,
    required String smsCode,
  }) async {
    print('[iOS Debug] FirebasePhoneAuthService.verifyOtp called');
    print('[iOS Debug] Verification ID: $verificationId');
    print('[iOS Debug] SMS Code: $smsCode');
    debugPrint('Firebase: Verifying OTP code');
    
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    print('[iOS Debug] Credential created, attempting sign in');

    try {
      final result = await _auth.signInWithCredential(credential);
      print('[iOS Debug] Sign in successful');
      print('[iOS Debug] User ID: ${result.user?.uid}');
      return result;
    } catch (e) {
      print('[iOS Debug] Sign in failed: $e');
      rethrow;
    }
  }

  /// Sign in with credential (for auto-verification)
  static Future<UserCredential> signInWithCredential(
    PhoneAuthCredential credential,
  ) async {
    return await _auth.signInWithCredential(credential);
  }

  /// Resend OTP
  static Future<void> resendOtp({
    required String phoneNumber,
    required Function(String verificationId, int? resendToken) onCodeSent,
    required Function(PhoneAuthCredential) onVerificationCompleted,
    required Function(FirebaseAuthException) onVerificationFailed,
    required Function(String) onCodeAutoRetrievalTimeout,
    int? forceResendingToken,
  }) async {
    debugPrint('Firebase: Resending OTP to $phoneNumber');

    await sendOtp(
      phoneNumber: phoneNumber,
      onCodeSent: onCodeSent,
      onVerificationCompleted: onVerificationCompleted,
      onVerificationFailed: onVerificationFailed,
      onCodeAutoRetrievalTimeout: onCodeAutoRetrievalTimeout,
      forceResendingToken: forceResendingToken,
    );
  }

  /// Sign out
  static Future<void> signOut() async {
    await _auth.signOut();
    debugPrint('Firebase: User signed out');
  }

  /// Get current user
  static User? getCurrentUser() {
    return _auth.currentUser;
  }

  /// Check if user is authenticated
  static bool isUserAuthenticated() {
    return _auth.currentUser != null;
  }

  /// Get auth state changes stream
  static Stream<User?> authStateChanges() {
    return _auth.authStateChanges();
  }

  /// Get user-friendly error message
  static String getErrorMessage(FirebaseAuthException e, BuildContext context) {
    switch (e.code) {
      case 'invalid-phone-number':
        return 'The phone number format is invalid';
      case 'invalid-verification-code':
        return 'The verification code is invalid';
      case 'code-expired':
        return 'The verification code has expired';
      case 'session-expired':
        return 'The verification session has expired. Please request a new code.';
      case 'quota-exceeded':
        return 'SMS quota exceeded. Please try again later.';
      case 'too-many-requests':
        return 'Too many verification attempts. Please try again later.';
      case 'network-request-failed':
        return 'Network error. Please check your connection and try again.';
      case 'invalid-app-credential':
        return 'Invalid app credential. Please contact support.';
      case 'missing-phone-number':
        return 'Phone number is required';
      case 'user-disabled':
        return 'This account has been disabled';
      case 'operation-not-allowed':
        return 'Phone authentication is not enabled';
      case 'captcha-check-failed':
        return 'reCAPTCHA verification failed';
      default:
        return e.message ?? 'An error occurred during verification';
    }
  }

  /// Validate phone number format (E.164)
  static bool isValidPhoneNumber(String phoneNumber) {
    // E.164 format: +[country code][number]
    final regex = RegExp(r'^\+[1-9]\d{1,14}$');
    return regex.hasMatch(phoneNumber);
  }

  /// Format phone number to E.164
  static String formatPhoneNumber(String countryCode, String phoneNumber) {
    // Remove any non-digit characters
    final cleaned = phoneNumber.replaceAll(RegExp(r'\D'), '');
    return '$countryCode$cleaned';
  }
}
