import 'dart:convert';
import 'dart:typed_data';
import 'package:basic_utils/basic_utils.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:pointycastle/export.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Shared service for RSA-based authentication headers.
/// This was migrated from the finance module as it is core to all API security.
class RsaAuthSharedService {
  static String? _cachedPrivateKey;
  static String? _cachedAlgorithmIdentifier;
  
  static String _getPrivateKey() {
    if (_cachedPrivateKey != null) return _cachedPrivateKey!;
    
    final envKey = dotenv.env['RSA_PRIVATE_KEY'];
    if (envKey != null) {
      _cachedPrivateKey = envKey.replaceAll('\\n', '\n');
      return _cachedPrivateKey!;
    }
    
    throw Exception('RSA_PRIVATE_KEY not found in .env file');
  }
  
  static String _getAlgorithmIdentifier() {
    if (_cachedAlgorithmIdentifier != null) return _cachedAlgorithmIdentifier!;
    
    final envKey = dotenv.env['RSA_SHA256_ALGORITHM_ID'];
    if (envKey != null) {
      _cachedAlgorithmIdentifier = envKey;
      return _cachedAlgorithmIdentifier!;
    }
    
    // Default SHA256 algorithm identifier
    _cachedAlgorithmIdentifier = '0609608648016503040201';
    return _cachedAlgorithmIdentifier!;
  }

  /// Generates RSA headers for authenticated requests (using userId)
  static Map<String, String> generateRsaHeaders(String userId) {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    // Note: The deviceId logic here must match the backend's expectation
    final deviceId = 'flutter$userId'.replaceAll('_', '').replaceAll('-', '');
    final payload = '$timestamp-$userId-$deviceId';
    
    final signature = _signPayload(payload);
    
    return {
      'X-App-Payload': payload,
      'X-App-Signature': signature,
    };
  }

  /// Generates RSA headers for unauthenticated/guest requests (no userId)
  static Future<Map<String, String>> generateRsaHeadersWithoutUserName() async {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final _messaging = FirebaseMessaging.instance;
    
    String? deviceId;
    try {
      deviceId = await _messaging.getToken();
    } catch (e) {
      debugPrint('❌ RsaAuthSharedService: Failed to get FCM token: $e');
      if (e.toString().contains('TOO_MANY_REGISTRATIONS')) {
        await _messaging.deleteToken();
        deviceId = await _messaging.getToken();
      } else {
        // Fallback or rethrow based on criticality of the request
        deviceId = 'unknown_device_$timestamp';
      }
    }
    
    final payload = '$timestamp-$deviceId';
    final signature = _signPayload(payload);
    return {
      'X-App-Payload': payload,
      'X-App-Signature': signature,
    };
  }

  static String _signPayload(String payload) {
    try {
      final privateKey = CryptoUtils.rsaPrivateKeyFromPem(_getPrivateKey());
      final algorithmIdentifier = _getAlgorithmIdentifier();
      final signer = RSASigner(SHA256Digest(), algorithmIdentifier);
      signer.init(true, PrivateKeyParameter<RSAPrivateKey>(privateKey));
      final signature = signer.generateSignature(Uint8List.fromList(utf8.encode(payload)));
      return base64Encode(signature.bytes);
    } catch (e) {
      debugPrint('❌ RsaAuthSharedService: Error signing payload: $e');
      rethrow;
    }
  }
}
