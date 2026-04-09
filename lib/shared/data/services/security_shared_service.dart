import 'dart:async';
import 'dart:io';

import 'package:bmp/core/config/api_config.dart';
import 'package:bmp/core/logs/security_logger.dart';
import 'package:bmp/core/network/api_client.dart';
import 'package:bmp/core/security/secure_token_storage.dart';
import 'package:bmp/shared/data/services/network_error_shared_service.dart';
import 'package:bmp/shared/data/services/rsa_auth_shared_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Result type for security operations
class SecurityResult {
  final bool success;
  final String message;
  final dynamic data;

  SecurityResult({required this.success, required this.message, this.data});
}

/// Shared service for security-related operations (JWT, CSRF tokens, PIN, etc.)
/// This was migrated from the finance module as it is core to all API security.
class SecuritySharedService {
  static final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
    ),
  );

  // Mutex for token generation to prevent concurrent requests (429 rate limit)
  static bool _isGeneratingToken = false;
  static Completer<SecurityResult>? _tokenCompleter;
  static String? _pendingUsername;

  // Mutex for CSRF token generation to prevent concurrent requests
  static bool _isGeneratingCsrf = false;
  static Completer<SecurityResult>? _csrfCompleter;
  static String? _pendingCsrfUsername;
  
  static PackageInfo? _packageInfo;

  /// Get common headers for all security requests
  static Future<Map<String, String>> _getCommonHeaders(String username) async {
    final prefs = await SharedPreferences.getInstance();
    final currentLocale = prefs.getString('app_locale') ?? 'en';

    final headers = <String, String>{
      'Content-Type': 'application/json',
      'x-username': username,
      'locale': currentLocale,
    };

    try {
      _packageInfo ??= await PackageInfo.fromPlatform();
      if (_packageInfo != null) {
        headers['x-app-version'] = _packageInfo!.version.split('-')[0];
        headers['x-platform'] = Platform.operatingSystem;
      }
    } catch (e) {
      debugPrint('⚠️ SecuritySharedService: Failed to add version headers: $e');
    }

    return headers;
  }

  /// GET /security/generate-token
  static Future<SecurityResult> generateToken(String username) async {
    if (_isGeneratingToken && _pendingUsername == username && _tokenCompleter != null) {
      return await _tokenCompleter!.future;
    }

    _isGeneratingToken = true;
    _pendingUsername = username;
    _tokenCompleter = Completer<SecurityResult>();

    SecurityLogger.info('Generating token', {'username': username});

    try {
      final headers = await _getCommonHeaders(username);
      final rsaHeaders = RsaAuthSharedService.generateRsaHeaders(username);
      headers.addAll(rsaHeaders);

      Response? response;
      var retryCount = 0;
      const maxRetries = 3;

      while (retryCount < maxRetries) {
        try {
          response = await _dio.post(
            ApiConfig.generateTokenUrl,
            data: {'username': username},
            options: Options(headers: headers),
          );
          break;
        } on DioException catch (e) {
          if (e.response?.statusCode == 429 && retryCount < maxRetries - 1) {
            final waitSeconds = (retryCount + 1) * 2;
            await Future.delayed(Duration(seconds: waitSeconds));
            retryCount++;
            // Refresh RSA headers for retry
            headers.addAll(RsaAuthSharedService.generateRsaHeaders(username));
          } else {
            rethrow;
          }
        }
      }

      if (response == null) throw Exception('Max retries exceeded');

      final data = response.data;
      if (response.statusCode == 200 && data['success'] == true) {
        final jwtData = data['data'];
        final token = jwtData['token'] as String?;
        final currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
        const expirySeconds = 604800; // 7 days

        if (token != null) {
          await SecureTokenStorage.instance.storeJwtToken(
            token: token,
            createdAt: currentTime,
            expiresAt: currentTime + expirySeconds,
            refreshAt: currentTime + (expirySeconds ~/ 2),
            refreshToken: jwtData['refreshToken'] as String?,
            refreshTokenExpiresAt: jwtData['refreshTokenExpiresAt'] as int?,
          );
        }

        final result = SecurityResult(
          success: true,
          message: data['message'] ?? 'Token generated successfully',
          data: jwtData,
        );
        _tokenCompleter!.complete(result);
        return result;
      } else {
        final result = SecurityResult(
          success: false,
          message: data['message'] ?? 'Token generation failed',
        );
        _tokenCompleter!.complete(result);
        return result;
      }
    } catch (e) {
      SecurityLogger.error('Token generation failed', {'error': e.toString()});
      final result = SecurityResult(success: false, message: e.toString());
      _tokenCompleter!.complete(result);
      return result;
    } finally {
      _isGeneratingToken = false;
    }
  }

  /// GET /security/csrf-token
  static Future<SecurityResult> getCsrfToken(String username) async {
    if (_isGeneratingCsrf && _pendingCsrfUsername == username && _csrfCompleter != null) {
      return await _csrfCompleter!.future;
    }

    _isGeneratingCsrf = true;
    _pendingCsrfUsername = username;
    _csrfCompleter = Completer<SecurityResult>();

    try {
      final jwtToken = await SecureTokenStorage.instance.getJwtToken();
      if (jwtToken == null) {
        final result = SecurityResult(success: false, message: 'No JWT token found');
        _csrfCompleter!.complete(result);
        return result;
      }

      final headers = await _getCommonHeaders(username);
      headers['Authorization'] = 'Bearer $jwtToken';
      headers.addAll(RsaAuthSharedService.generateRsaHeaders(username));

      final response = await _dio.get(
        ApiConfig.csrfTokenUrl,
        options: Options(headers: headers),
      );

      final data = response.data;
      if (response.statusCode == 200 && data['success'] == true) {
        final csrfToken = data['data']?['csrfToken'] as String?;
        final expiresAt = data['data']?['expiresAt'] as int?;
        
        if (csrfToken != null) {
          final currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
          await SecureTokenStorage.instance.storeCsrfToken(
            token: csrfToken,
            expiresAt: expiresAt ?? (currentTime + (15 * 60)),
          );
        }

        final result = SecurityResult(
          success: true,
          message: data['message'] ?? 'CSRF token retrieved successfully',
          data: data['data'],
        );
        _csrfCompleter!.complete(result);
        return result;
      } else {
        final result = SecurityResult(success: false, message: data['message'] ?? 'CSRF retrieval failed');
        _csrfCompleter!.complete(result);
        return result;
      }
    } catch (e) {
      final result = SecurityResult(success: false, message: e.toString());
      _csrfCompleter!.complete(result);
      return result;
    } finally {
      _isGeneratingCsrf = false;
    }
  }

  /// POST /api/auth/refresh-token
  static Future<SecurityResult> refreshAccessToken(String username) async {
    final refreshToken = await SecureTokenStorage.instance.getRefreshToken();
    if (refreshToken == null) {
      return SecurityResult(success: false, message: 'No refresh token available');
    }

    try {
      final headers = await _getCommonHeaders(username);
      headers['x-refresh-token'] = refreshToken;
      headers.addAll(RsaAuthSharedService.generateRsaHeaders(username));

      final response = await _dio.post(
        ApiConfig.authRefreshUrl,
        data: {'username': username},
        options: Options(headers: headers),
      );

      final data = response.data;
      if (response.statusCode == 200 && data['success'] == true) {
        // Update stored token...
        final jwtData = data['data'];
        final token = jwtData['token'] as String?;
        final currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
        const expirySeconds = 604800;

        if (token != null) {
          await SecureTokenStorage.instance.storeJwtToken(
            token: token,
            createdAt: currentTime,
            expiresAt: currentTime + expirySeconds,
            refreshAt: currentTime + (expirySeconds ~/ 2),
            refreshToken: jwtData['refreshToken'] as String?,
            refreshTokenExpiresAt: jwtData['refreshTokenExpiresAt'] as int?,
          );
        }

        return SecurityResult(
          success: true,
          message: 'Token refreshed successfully',
          data: jwtData,
        );
      } else {
        return SecurityResult(success: false, message: data['message'] ?? 'Refresh failed');
      }
    } catch (e) {
      return SecurityResult(success: false, message: e.toString());
    }
  }

  /// Invalidates current CSRF token locally
  static Future<void> invalidateCsrfToken() async {
    await SecureTokenStorage.instance.clearCsrfToken();
  }

  /// Gets stored JWT token
  static Future<String?> getStoredToken() async {
    return await SecureTokenStorage.instance.getJwtToken();
  }

  /// Gets stored CSRF token
  static Future<String?> getStoredCsrfToken() async {
    return await SecureTokenStorage.instance.getCsrfToken();
  }
}
