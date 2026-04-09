import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:bmp/shared/data/services/rsa_auth_shared_service.dart';

import '../config/api_config.dart';
import 'secure_token_storage.dart';

class JwtRefreshManager {
  static JwtRefreshManager? _instance;
  static final Dio _dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  ));

  static bool _isRefreshing = false;
  static Completer<String?>? _refreshCompleter;

  JwtRefreshManager._();

  static JwtRefreshManager get instance {
    _instance ??= JwtRefreshManager._();
    return _instance!;
  }

  Future<String?> refreshToken(String username) async {
    if (_isRefreshing && _refreshCompleter != null) {
      if (kDebugMode) print('🔄 Token refresh in progress, waiting...');
      return await _refreshCompleter!.future;
    }

    _isRefreshing = true;
    _refreshCompleter = Completer<String?>();

    try {
      if (kDebugMode) print('🔄 Refreshing JWT token for: $username');

      final refreshToken = await SecureTokenStorage.instance.getRefreshToken();
      
      if (refreshToken == null) {
        if (kDebugMode) print('❌ No refresh token - user must login');
        _completeRefresh(null);
        return null;
      }

      final headers = {
        'Content-Type': 'application/json',
        ...RsaAuthSharedService.generateRsaHeaders(username),
      };

      final response = await _dio.post(
        '${ApiConfig.baseUrl}/api/auth/refresh-token',
        data: {'refreshToken': refreshToken},
        options: Options(headers: headers),
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        final data = response.data['data'];
        final newAccessToken = data['accessToken'] as String;
        final newRefreshToken = data['refreshToken'] as String?;
        final expiresIn = data['expiresIn'] as String? ?? '7d';

        var expirySeconds = 604800; // 7 days
        if (expiresIn.endsWith('d')) {
          expirySeconds = int.parse(expiresIn.replaceAll('d', '')) * 86400;
        } else if (expiresIn.endsWith('h')) {
          expirySeconds = int.parse(expiresIn.replaceAll('h', '')) * 3600;
        }

        final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
        
        await SecureTokenStorage.instance.storeJwtToken(
          token: newAccessToken,
          createdAt: now,
          expiresAt: now + expirySeconds,
          refreshAt: now + expirySeconds - (12 * 3600), // 12h before expiry
        );

        if (newRefreshToken != null) {
          await SecureTokenStorage.instance.storeRefreshToken(
            refreshToken: newRefreshToken,
            expiresAt: now + (30 * 86400), // 30 days
          );
        }

        if (kDebugMode) print('✅ JWT token refreshed successfully');
        _completeRefresh(newAccessToken);
        return newAccessToken;
      }

      if (kDebugMode) print('❌ Token refresh failed');
      _completeRefresh(null);
      return null;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 403) {
        if (kDebugMode) print('❌ Refresh token expired - clearing session');
        await SecureTokenStorage.instance.clearAll();
      }
      if (kDebugMode) print('❌ Token refresh error: $e');
      _completeRefresh(null);
      return null;
    } catch (e) {
      if (kDebugMode) print('❌ Token refresh error: $e');
      _completeRefresh(null);
      return null;
    }
  }

  void _completeRefresh(String? token) {
    if (_refreshCompleter != null && !_refreshCompleter!.isCompleted) {
      _refreshCompleter!.complete(token);
    }
    _isRefreshing = false;
  }

  Future<bool> needsRefresh() async {
    final token = await SecureTokenStorage.instance.getJwtToken();
    return token == null;
  }
}
