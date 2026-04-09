import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Secure Token Storage Service
/// 
/// Provides encrypted storage for sensitive security tokens (JWT, CSRF)
/// using platform-specific secure storage (Keychain on iOS, Keystore on Android).
/// 
/// This replaces the insecure SharedPreferences-based token storage.
class SecureTokenStorage {
  static SecureTokenStorage? _instance;
  static FlutterSecureStorage? _storage;
  
  // Storage keys
  static const String _keyJwtToken = 'secure_jwt_token';
  static const String _keyJwtCreatedAt = 'secure_jwt_created_at';
  static const String _keyJwtExpiresAt = 'secure_jwt_expires_at';
  static const String _keyJwtRefreshAt = 'secure_jwt_refresh_at';
  static const String _keyRefreshToken = 'secure_refresh_token';
  static const String _keyRefreshTokenExpiresAt = 'secure_refresh_token_expires_at';
  static const String _keyCsrfToken = 'secure_csrf_token';
  static const String _keyCsrfExpiresAt = 'secure_csrf_expires_at';
  static const String _keyUsername = 'secure_username';
  
  // Safety buffers
  static const int jwtSafetyBufferSeconds = 300; // 5 minutes
  static const int csrfSafetyBufferSeconds = 60; // 1 minute (refresh at 14 mins for 15 min expiry)
  
  SecureTokenStorage._();
  
  /// Get singleton instance
  static SecureTokenStorage get instance {
    _instance ??= SecureTokenStorage._();
    return _instance!;
  }
  
  /// Get secure storage instance with optimal security options
  FlutterSecureStorage get storage {
    _storage ??= const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
        keyCipherAlgorithm: KeyCipherAlgorithm.RSA_ECB_OAEPwithSHA_256andMGF1Padding,
        storageCipherAlgorithm: StorageCipherAlgorithm.AES_GCM_NoPadding,
      ),
      iOptions: IOSOptions(
        accessibility: KeychainAccessibility.first_unlock_this_device,
      ),
    );
    return _storage!;
  }
  
  // ============================================
  // JWT Token Management
  // ============================================
  
  /// Store JWT token with expiry metadata
  Future<void> storeJwtToken({
    required String token,
    required int createdAt,
    required int expiresAt,
    required int refreshAt,
    String? refreshToken,
    int? refreshTokenExpiresAt,
  }) async {
    try {
      await storage.write(key: _keyJwtToken, value: token);
      await storage.write(key: _keyJwtCreatedAt, value: createdAt.toString());
      await storage.write(key: _keyJwtExpiresAt, value: expiresAt.toString());
      await storage.write(key: _keyJwtRefreshAt, value: refreshAt.toString());
      
      if (refreshToken != null) {
        await storage.write(key: _keyRefreshToken, value: refreshToken);
      }
      if (refreshTokenExpiresAt != null) {
        await storage.write(key: _keyRefreshTokenExpiresAt, value: refreshTokenExpiresAt.toString());
      }
      
      _debugLog('JWT token stored securely${refreshToken != null ? ' (with refresh token)' : ''}');
    } catch (e) {
      _debugLog('Failed to store JWT token: $e');
      rethrow;
    }
  }
  
  /// Get stored JWT token with automatic validation
  /// Returns null if token is missing, expired, or needs refresh
  Future<String?> getJwtToken() async {
    try {
      final token = await storage.read(key: _keyJwtToken);
      
      if (token == null) {
        _debugLog('No JWT token found in secure storage');
        return null;
      }
      
      final currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      final expiresAtStr = await storage.read(key: _keyJwtExpiresAt);
      final refreshAtStr = await storage.read(key: _keyJwtRefreshAt);
      
      final expiresAt = expiresAtStr != null ? int.tryParse(expiresAtStr) : null;
      final refreshAt = refreshAtStr != null ? int.tryParse(refreshAtStr) : null;
      
      // Safety Check 1: Will expire soon? (within safety buffer)
      if (expiresAt != null && currentTime >= (expiresAt - jwtSafetyBufferSeconds)) {
        _debugLog('JWT will expire within ${jwtSafetyBufferSeconds}s, needs refresh');
        await clearJwtToken();
        return null;
      }
      
      // Safety Check 2: Passed refresh time?
      if (refreshAt != null && currentTime >= refreshAt) {
        _debugLog('JWT refresh time reached');
        await clearJwtToken();
        return null;
      }
      
      final remainingMinutes = expiresAt != null 
          ? ((expiresAt - currentTime) ~/ 60) 
          : 0;
      _debugLog('JWT valid (expires in ${remainingMinutes}m)');
      return token;
    } catch (e) {
      _debugLog('Error getting JWT token: $e');
      return null;
    }
  }
  
  /// Clear JWT token and all related metadata
  Future<void> clearJwtToken() async {
    await storage.delete(key: _keyJwtToken);
    await storage.delete(key: _keyJwtCreatedAt);
    await storage.delete(key: _keyJwtExpiresAt);
    await storage.delete(key: _keyJwtRefreshAt);
    await storage.delete(key: _keyRefreshToken);
    await storage.delete(key: _keyRefreshTokenExpiresAt);
    _debugLog('JWT and Refresh tokens cleared from secure storage');
  }

  /// Clear all stored security tokens and metadata
  Future<void> clearAll() async {
    await clearJwtToken();
    await clearCsrfToken();
    await storage.delete(key: _keyUsername);
    _debugLog('All security data cleared from secure storage');
  }
  
  // ============================================
  // Refresh Token Management
  // ============================================
  
  /// Get stored refresh token
  Future<String?> getRefreshToken() async {
    return await storage.read(key: _keyRefreshToken);
  }

  /// Store refresh token and its expiry
  Future<void> storeRefreshToken({
    required String refreshToken,
    required int expiresAt,
  }) async {
    try {
      await storage.write(key: _keyRefreshToken, value: refreshToken);
      await storage.write(
          key: _keyRefreshTokenExpiresAt, value: expiresAt.toString());
      _debugLog('Refresh token stored securely');
    } catch (e) {
      _debugLog('Failed to store refresh token: $e');
      rethrow;
    }
  }

  /// Check if refresh token is expired
  Future<bool> isRefreshTokenExpired() async {
    try {
      final expiresAtStr = await storage.read(key: _keyRefreshTokenExpiresAt);
      if (expiresAtStr == null) return true;
      
      final expiresAt = int.tryParse(expiresAtStr);
      if (expiresAt == null) return true;
      
      final currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      return currentTime >= expiresAt;
    } catch (e) {
      _debugLog('Error checking refresh token expiry: $e');
      return true;
    }
  }
  
  // ============================================
  // CSRF Token Management
  // ============================================
  
  /// Store CSRF token with expiry
  Future<void> storeCsrfToken({
    required String token,
    required int expiresAt,
  }) async {
    try {
      await storage.write(key: _keyCsrfToken, value: token);
      await storage.write(key: _keyCsrfExpiresAt, value: expiresAt.toString());
      
      final remainingMinutes = ((expiresAt - (DateTime.now().millisecondsSinceEpoch ~/ 1000)) / 60).round();
      _debugLog('CSRF token stored securely (expires in ${remainingMinutes}m)');
    } catch (e) {
      _debugLog('Failed to store CSRF token: $e');
      rethrow;
    }
  }
  
  /// Get stored CSRF token with automatic validation
  /// Returns null if token is missing or expired
  Future<String?> getCsrfToken() async {
    try {
      final token = await storage.read(key: _keyCsrfToken);
      
      if (token == null) {
        _debugLog('No CSRF token found in secure storage');
        return null;
      }
      
      final expiresAtStr = await storage.read(key: _keyCsrfExpiresAt);
      final expiresAt = expiresAtStr != null ? int.tryParse(expiresAtStr) : null;
      
      if (expiresAt == null) {
        _debugLog('No CSRF expiry data found, clearing token');
        await clearCsrfToken();
        return null;
      }
      
      final currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      
      // Safety Check: Will expire soon? (within safety buffer)
      if (currentTime >= (expiresAt - csrfSafetyBufferSeconds)) {
        final remainingSeconds = expiresAt - currentTime;
        _debugLog('CSRF will expire in ${remainingSeconds}s (<${csrfSafetyBufferSeconds}s buffer), needs refresh');
        await clearCsrfToken();
        return null;
      }
      
      final remainingMinutes = ((expiresAt - currentTime) / 60).round();
      _debugLog('CSRF valid (expires in ${remainingMinutes}m)');
      return token;
    } catch (e) {
      _debugLog('Error getting CSRF token: $e');
      return null;
    }
  }
  
  /// Clear CSRF token and metadata
  Future<void> clearCsrfToken() async {
    await storage.delete(key: _keyCsrfToken);
    await storage.delete(key: _keyCsrfExpiresAt);
    _debugLog('CSRF token cleared from secure storage');
  }
  
  // ============================================
  // Username Management
  // ============================================
  
  /// Store username securely
  Future<void> storeUsername(String username) async {
    await storage.write(key: _keyUsername, value: username);
  }
  
  /// Get stored username
  Future<String?> getUsername() async {
    return await storage.read(key: _keyUsername);
  }
  
  // ============================================
  // Utility Methods
  // ============================================
  

  
  /// Migrate tokens from SharedPreferences to secure storage
  /// Call this once during app upgrade to migrate existing tokens
  Future<void> migrateFromSharedPreferences() async {
    // This method intentionally left as a stub
    // The actual implementation will be done when updating security_service.dart
    // to ensure backward compatibility during migration
    _debugLog('Token migration from SharedPreferences initiated');
  }
  
  /// Debug logging (only in debug mode, never logs actual tokens)
  void _debugLog(String message) {
    if (kDebugMode) {
      print('🔐 SecureTokenStorage: $message');
    }
  }
}
