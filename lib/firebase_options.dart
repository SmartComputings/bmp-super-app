// File generated for BMP Chat App
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter_dotenv/flutter_dotenv.dart';


class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError('Web platform not configured');
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static String _getEnvOrThrow(String key) {
    final value = dotenv.env[key];
    if (value == null || value.isEmpty) {
      throw Exception('Missing required environment variable: $key');
    }
    return value;
  }

  static FirebaseOptions get android => FirebaseOptions(
    apiKey: _getEnvOrThrow('FIREBASE_ANDROID_API_KEY'),
    appId: _getEnvOrThrow('FIREBASE_ANDROID_APP_ID'),
    messagingSenderId: _getEnvOrThrow('FIREBASE_MESSAGING_SENDER_ID'),
    projectId: _getEnvOrThrow('FIREBASE_PROJECT_ID'),
    storageBucket: _getEnvOrThrow('FIREBASE_STORAGE_BUCKET'),
  );

  static FirebaseOptions get ios => FirebaseOptions(
    apiKey: _getEnvOrThrow('FIREBASE_IOS_API_KEY'),
    appId: _getEnvOrThrow('FIREBASE_IOS_APP_ID'),
    messagingSenderId: _getEnvOrThrow('FIREBASE_MESSAGING_SENDER_ID'),
    projectId: _getEnvOrThrow('FIREBASE_PROJECT_ID'),
    storageBucket: _getEnvOrThrow('FIREBASE_STORAGE_BUCKET'),
    iosBundleId: _getEnvOrThrow('FIREBASE_IOS_BUNDLE_ID'),
  );
}
