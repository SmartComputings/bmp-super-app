import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bmp/core/logs/app_logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:bmp/shared/data/services/network_error_shared_service.dart';
import 'package:bmp/shared/data/services/rsa_auth_shared_service.dart';
import 'package:bmp/shared/data/services/security_shared_service.dart';
import '../../shared/di/username_injection.dart';
import '../../shared/utils/logout_action.dart';
import '../../shared/widgets/bmp_chat_app.dart';
import '../config/api_config.dart';
import '../errors/api_exception.dart';
import '../errors/error_extractor.dart';
import '../errors/network_exception.dart';
import '../security/secure_token_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ApiClient {
  static final Dio _dio = Dio();
  static bool _initialized = false;

  /// Default username when no user is logged in
  static const String _unknownUser = 'unknown';

  // Token refresh mutex to prevent concurrent refresh attempts
  static bool _isRefreshingToken = false;
  static Completer<bool>? _refreshCompleter;
  static PackageInfo? _packageInfo;

  /// Safely complete the refresh completer (prevents double-complete error)
  static void _safeCompleteRefresh(bool success) {
    if (_refreshCompleter != null && !_refreshCompleter!.isCompleted) {
      _refreshCompleter!.complete(success);
    }
    _isRefreshingToken = false;
  }

  static void initialize() {
    if (_initialized) return;

    if (kDebugMode) print('🔧 DEBUG: Initializing ApiClient with base URL: ${ApiConfig.baseUrl}');

    _dio.options = BaseOptions(
      baseUrl: ApiConfig.baseUrl,
      connectTimeout: const Duration(seconds: 45),
      receiveTimeout: const Duration(seconds: 50),
      sendTimeout: const Duration(seconds: 50),
      headers: {'Content-Type': 'application/json'},
    );


    if (kDebugMode) print('🔧 DEBUG: Dio base URL set to: ${_dio.options.baseUrl}');

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: _onRequest,
      onResponse: _onResponse,
      onError: _onError,
    ),);

    _initialized = true;
  }

  /// Re-initialize Dio with the current base URL.
  /// Call this when the active user type changes (default ↔ regular)
  /// so that Dio picks up the new base URL from ApiConfig.
  /// Only updates the base URL — does NOT re-add interceptors.
  static void reinitialize() {
    final newBaseUrl = ApiConfig.baseUrl;
    _dio.options.baseUrl = newBaseUrl;
    if (kDebugMode) print('🔄 ApiClient re-initialized with base URL: $newBaseUrl');
  }

  static Future<void> _onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      // Get flags from extra data
      final includeRsa = options.extra['includeRsa'] ?? false;
      final skipCsrf = options.extra['skipCsrf'] ?? false;
      // final requiresSignature = options.extra['requiresSignature'] ?? false;  // Commented out - signature generation disabled

      // debugPrint("==INTERCEPTOR: extra keys=${options.extra.keys.toList()}");
      // debugPrint("==INTERCEPTOR: signatureData=${options.extra['signatureData']}");

      // Use the complete header building logic from getHeaders
      final headers = await getHeaders(
        includeRsa: includeRsa,
        skipCsrf: skipCsrf,
      );

      // Add HMAC signature headers if required (COMMENTED OUT - signature generation disabled)
      // final signatureData = options.extra['signatureData'] as Map<String, dynamic>?;
      // if (signatureData != null) {
      //   headers['x-signature'] = signatureData['signature'] as String;
      //   headers['x-timestamp'] = signatureData['timestamp'].toString();
      //   debugPrint("==INTERCEPTOR: Added signature headers - signature=${headers['x-signature']}, timestamp=${headers['x-timestamp']}");
      // } else {
      //   debugPrint("==INTERCEPTOR: signatureData is NULL, skipping signature headers");
      // }

      // Replace all headers with the complete set
      options.headers.clear();
      options.headers.addAll(headers);
      // debugPrint("=(---22)===[generateSignature]: ${headers['x-signature']}++++++");

      debugPrint('=== Request Headers (Interceptor) ===');
      options.headers.forEach((key, value) {
        if (key.toLowerCase().contains('token') || 
            key.toLowerCase().contains('authorization') ||
            key.toLowerCase().contains('signature')) {
          debugPrint('$key: ${value.toString().substring(0, value.toString().length > 10 ? 10 : value.toString().length)}...[MASKED]');
        } else {
          debugPrint('$key: $value');
        }
      });
      debugPrint('=====================================');

      handler.next(options);
    } catch (e) {
      handler.reject(DioException(
        requestOptions: options,
        error: 'Failed to prepare request',
        type: DioExceptionType.unknown,
      ),);
    }
  }

  static void _onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  static void _onError(DioException error, ErrorInterceptorHandler handler) async {
    // Skip token refresh for 429 (rate limited) - don't make it worse
    if (error.response?.statusCode == 429) {
      if (kDebugMode) print('⚠️ Rate limited (429) - NOT retrying to avoid making it worse');
      handler.next(error);
      return;
    }

    // Handle 426 Upgrade Required
    if (error.response?.statusCode == 426) {
      if (kDebugMode) print('🛑 426 Upgrade Required intercepted - Redirecting to Update Screen');
      
      final context = BmpChatApp.navigatorKey.currentContext;
      if (context != null) {
        // Use go() to replace current stack and prevent back navigation
        context.go('/app-update-required');
      }
      
      handler.reject(error); 
      return;
    }

    // Handle token errors (CSRF, JWT expired, etc.) with retry logic
    // NOTE: Retry is limited to ONE attempt only (retryCount < 1)
    // This uses 3 API calls: JWT refresh + CSRF generation + retry
    // Backend limit: 3 calls per 15 minutes - this is at the limit but necessary
    if ((error.response?.statusCode == 403 || error.response?.statusCode == 401)) {
      final retryCount = error.requestOptions.extra['retryCount'] ?? 0;

      if (retryCount < 1) {
        try {
          if (kDebugMode) print('🔄 Token error (${error.response?.statusCode}) on: ${error.requestOptions.method} ${error.requestOptions.path}');

          // Check if another refresh is already in progress
          if (_isRefreshingToken) {
            if (kDebugMode) print('🔄 Token refresh already in progress, waiting...');
            // Wait for the ongoing refresh to complete
            final success = await _refreshCompleter?.future ?? false;
            if (success) {
              // Retry with fresh tokens
              if (kDebugMode) print('✅ Using tokens from concurrent refresh');
              final includeRsa = error.requestOptions.extra['includeRsa'] ?? false;
              final skipCsrf = error.requestOptions.extra['skipCsrf'] ?? false;
              final freshHeaders = await getHeaders(
                includeRsa: includeRsa,
                skipCsrf: skipCsrf,
                skipTokenGeneration: true, // Don't generate, just use existing
              );

              final options = error.requestOptions;
              options.headers.clear();
              options.headers.addAll(freshHeaders);
              options.extra['retryCount'] = retryCount + 1;

              final response = await _dio.fetch(options);
              handler.resolve(response);
              return;
            } else {
              if (kDebugMode) print('❌ Concurrent token refresh failed');
              handler.next(error);
              return;
            }
          }

          // Start token refresh with mutex
          _isRefreshingToken = true;
          _refreshCompleter = Completer<bool>();

          if (kDebugMode) print('🔄 Refreshing tokens (attempt ${retryCount + 1})...');

          // Get username for token generation from UsernameInjection
          final username = UsernameInjection.getUsernameSync() ?? await UsernameInjection.getUsername() ?? _unknownUser;
          if (username == _unknownUser) {
            if (kDebugMode) print('❌ Cannot refresh tokens: username not found');
            _safeCompleteRefresh(false);
            handler.next(error);
            return;
          }

          // Try refresh token first
          if (kDebugMode) print('🔐 Attempting to refresh access token in error interceptor...');
          final refreshResult = await SecuritySharedService.refreshAccessToken(username);
          
          if (!refreshResult.success) {
            if (kDebugMode) print('🔄 Refresh token failed: ${refreshResult.message}. Trying RSA generation...');
            
            // Clear old tokens and try RSA generation
            await SecureTokenStorage.instance.clearJwtToken();
            await SecureTokenStorage.instance.clearCsrfToken();
            await SecuritySharedService.invalidateCsrfToken();
            
            final rsaResult = await SecuritySharedService.generateToken(username);
            
            if (!rsaResult.success) {
              if (kDebugMode) print('❌ Both refresh and RSA failed. Forcing logout.');
              _safeCompleteRefresh(false);

              
              final context = BmpChatApp.navigatorKey.currentContext;
              if (context != null) {
                await forceLogout(context);
              }
              
              handler.next(error);
              return;
            }
          }

          if (kDebugMode) print('✅ Session restored successfully');
          _safeCompleteRefresh(true);

          // Now get fresh headers with new JWT (will generate fresh CSRF too)
          final includeRsa = error.requestOptions.extra['includeRsa'] ?? false;
          final skipCsrf = error.requestOptions.extra['skipCsrf'] ?? false;
          final freshHeaders = await getHeaders(
            includeRsa: includeRsa,
            skipCsrf: skipCsrf,
            skipTokenGeneration: true, // Use newly generated JWT, don't regenerate
          );

          // Ensure fresh CSRF is generated (since we cleared it above)
          if (!skipCsrf && !freshHeaders.containsKey('x-csrf-token')) {
            if (kDebugMode) print('🔄 Generating fresh CSRF token after JWT refresh');
            final csrfResult = await SecuritySharedService.getCsrfToken(username);
            if (csrfResult.success && csrfResult.data != null) {
              final csrfToken = csrfResult.data!['csrfToken'] as String?;
              if (csrfToken != null) {
                freshHeaders['x-csrf-token'] = csrfToken;
              }
            }
          }

          // Regenerate signature if required
          // final requiresSignature = error.requestOptions.extra['requiresSignature'] ?? false;
          // if (requiresSignature) {
          //   if (kDebugMode) print('🔐 Regenerating HMAC signature after token refresh');
          //
          //   // Extract relative path from full URL if needed
          //   String requestPath = error.requestOptions.path;
          //   if (requestPath.startsWith('http')) {
          //     final uri = Uri.parse(requestPath);
          //     requestPath = uri.path; // Get only the path part
          //   }
          //   if (kDebugMode) print('🔐 Using path for signature: $requestPath');
          //
          //   final signatureResult = await SecurityService.generateSignature(
          //     method: error.requestOptions.method,
          //     path: requestPath,
          //     body: error.requestOptions.data,
          //   );
          //   if (signatureResult.success && signatureResult.data != null) {
          //     error.requestOptions.extra['signatureData'] = signatureResult.data;
          //     if (kDebugMode) print('✅ Fresh signature generated');
          //   } else {
          //     if (kDebugMode) print('❌ Failed to regenerate signature: ${signatureResult.message}');
          //     _safeCompleteRefresh(false);
          //     handler.next(error);
          //     return;
          //   }
          // }

          // Update request with fresh headers
          final options = error.requestOptions;
          options.headers.clear();
          options.headers.addAll(freshHeaders);
          options.extra['retryCount'] = retryCount + 1;

          if (kDebugMode) print('✅ Retrying request with fresh tokens');
          final response = await _dio.fetch(options);
          handler.resolve(response);
          return;
        } catch (e) {
          if (kDebugMode) print('❌ Token refresh failed: $e');
          _safeCompleteRefresh(false);
        }
      } else {
        if (kDebugMode) print('⚠️ Max retry attempts reached - NOT retrying again');
      }
    }


    // Handle network errors
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout) {
      if (kDebugMode) print('⏱️ Connection timeout detected');
      try {
        NetworkErrorSharedService.showSlowInternetMessage();
      } catch (e) {
        if (kDebugMode) print('  Failed to show timeout dialog: $e');
      }

      handler.reject(DioException(
        requestOptions: error.requestOptions,
        error: NetworkException('Connection timeout', NetworkErrorType.timeout),
        type: DioExceptionType.connectionTimeout,
      ),);
    } else if (error.type == DioExceptionType.connectionError) {
      if (kDebugMode) print('🚫 Connection error detected');
      try {
        NetworkErrorSharedService.showSlowInternetMessage();
      } catch (e) {
        if (kDebugMode) print('  Failed to show connection error dialog: $e');
      }

      handler.reject(DioException(
        requestOptions: error.requestOptions,
        error: NetworkException('No internet connection', NetworkErrorType.noConnection),
        type: DioExceptionType.connectionError,
      ),);
    } else {
      handler.next(error);
    }
  }

  static Future<ApiResponse<T>> request<T>({
    required String path,
    required String method,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic)? fromJson,
    bool includeRsa = false,
    bool skipCsrf = false,
    bool requiresSignature = false,
  }) async {
    initialize();

    // Removed debug logs for production

    // Connectivity check is now handled in getHeaders()

    try {
      // Generate HMAC signature BEFORE creating Options (COMMENTED OUT - signature generation disabled)
      Map<String, dynamic>? signatureData;
      // debugPrint("=========[generateSignature]==========---111==${requiresSignature}==");
      // if (requiresSignature) {
      //
      //   debugPrint("=========[generateSignature]=========00====");
      //   if (kDebugMode) debugPrint('🔐 Generating HMAC signature for: $method $path');
      //   final signatureResult = await SecurityService.generateSignature(
      //     method: method,
      //     path: path,
      //     body: data,
      //   );
      //
      //   debugPrint("========[generateSignature]=========11====");
      //   if (!signatureResult.success || signatureResult.data == null) {
      //     throw ApiException('Failed to generate signature: ${signatureResult.message}');
      //   }
      //
      //   signatureData = signatureResult.data;
      //   if (kDebugMode) {
      //     debugPrint('🔐 HMAC Signature generated');
      //     debugPrint('🔐 Timestamp: ${signatureData!['timestamp']}');
      //   }
      // }
      // debugPrint("========[generateSignature]===========22====");
      // debugPrint("==BEFORE OPTIONS: signatureData=${signatureData}");
      final options = Options(extra: {
        'includeRsa': includeRsa,
        'skipCsrf': skipCsrf,
        // 'requiresSignature': requiresSignature,  // Commented out - signature generation disabled
        // 'signatureData': signatureData,  // Commented out - signature generation disabled
      },);
      // debugPrint("==AFTER OPTIONS: extra['signatureData']=${options.extra?['signatureData']}");
      // debugPrint("==options========:signatureData:${signatureData},${options}================");

      final Response response;

      // Ensure base URL is set
      if (_dio.options.baseUrl.isEmpty) {
        _dio.options.baseUrl = ApiConfig.baseUrl;
        debugPrint('🔧 DEBUG: Base URL was empty, setting to: ${ApiConfig.baseUrl}');
      }

      // Use the path directly (Dio handles base URL concatenation)
      final requestPath = path;

      switch (method.toUpperCase()) {
        case 'GET':
          response = await _dio.get(requestPath, queryParameters: queryParameters, options: options);
          break;
        case 'POST':
          response = await _dio.post(requestPath, data: data, queryParameters: queryParameters, options: options);
          break;
        case 'PUT':
          response = await _dio.put(requestPath, data: data, queryParameters: queryParameters, options: options);
          break;
        case 'DELETE':
          response = await _dio.delete(requestPath, queryParameters: queryParameters, options: options);
          break;
        case 'PATCH':
          response = await _dio.patch(requestPath, data: data, queryParameters: queryParameters, options: options);
          break;
        default:
          throw ApiException('Unsupported HTTP method: $method'); // Note: Cannot localize here without context
      }

      AppLogger.printDebug(
        AppLogger.apiLogMessage(
          method: method.toUpperCase(),
          path: response.requestOptions.path,
          isError: false,
        ),
        request: response.requestOptions,
        response: response,
      );

      return _handleResponse<T>(response, fromJson);
    } on DioException catch (e) {
      AppLogger.printDebug(
        AppLogger.apiLogMessage(
          method: method.toUpperCase(),
          path: e.requestOptions.path,
          isError: true,
        ),
        request: e.requestOptions,
        response: e.response,
      );

      throw _handleDioException(e);
    } catch (e) {
      if (kDebugMode) {
        debugPrint('  UNEXPECTED ERROR in ApiClient.request:');
        debugPrint('  Error: $e');
        debugPrint('  Type: ${e.runtimeType}');
      }
      throw ApiException('Unexpected error: $e');
    }
  }

  static ApiResponse<T> _handleResponse<T>(Response response, T Function(dynamic)? fromJson) {
    final responseData = response.data;

    // Handle new backend response format
    if (responseData is Map<String, dynamic>) {
      final success = responseData['success'] ?? false;
      final status = responseData['status'] ?? response.statusCode ?? 200;
      final message = responseData['message']?.toString() ?? '';
      final timestamp = responseData['timestamp']?.toString() ?? DateTime.now().toIso8601String();
      final data = responseData['data'];

      if (success) {
        T? parsedData;
        if (fromJson != null && data != null) {
          parsedData = fromJson(data);
        }
        // Removed debug log

        return ApiResponse<T>(
          success: true,
          status: status,
          message: message,
          timestamp: timestamp,
          data: parsedData ?? data,
        );
      } else {
        final errorMessage = ErrorExtractor.extractMessage(responseData);
        throw ApiException(
          errorMessage,
          statusCode: status,
        );
      }
    }

    // Fallback for legacy responses
    return ApiResponse<T>(
      success: true,
      status: response.statusCode ?? 200,
      message: 'Success', // Note: Cannot localize here without context
      timestamp: DateTime.now().toIso8601String(),
      data: fromJson != null ? fromJson(responseData) : responseData,
    );
  }

  static Exception _handleDioException(DioException e) {
    // Removed debug logs

    if (e.error is NetworkException) {
      return e.error as NetworkException;
    }

    if (e.response?.data is Map<String, dynamic>) {
      final responseData = e.response!.data as Map<String, dynamic>;
      final message = ErrorExtractor.extractMessage(responseData);

      // Removed debug log

      return ApiException(
        message,
        statusCode: e.response?.statusCode ?? 500,
      );
    }

    // Check for network-related errors
    if (_isNetworkError(e)) {
      if (kDebugMode) print('🚫 Network error detected: ${e.type}');

      // Show dialog only for actual connection errors
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout) {
        if (kDebugMode) print('⚠️ Showing network error dialog');
        _showSlowInternetMessage();
      }

      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          return NetworkException('Connection timeout', NetworkErrorType.timeout);
        case DioExceptionType.connectionError:
          return NetworkException('No internet connection', NetworkErrorType.noConnection);
        default:
          return NetworkException('Network error', NetworkErrorType.unknown);
      }
    }

    // Try to extract message from response body if it's a string
    if (e.response?.data is String) {
      try {
        final jsonData = jsonDecode(e.response!.data);
        if (jsonData is Map<String, dynamic> && jsonData['message'] != null) {
          return ApiException(jsonData['message'], statusCode: e.response?.statusCode ?? 500);
        }
      } catch (parseError) {
        if (kDebugMode) print('  Failed to parse error response: $parseError');
      }
    }

    // Check for server errors (502, 503, 504)
    if (e.response?.statusCode != null) {
      final status = e.response!.statusCode!;
      if (status == 502) {
        return ApiException(
          'Server is temporarily unavailable (Bad Gateway). Please try again later.',
          statusCode: 502,
        );
      }
      if (status == 503) {
        return ApiException(
          'Server is executing maintenance. Please try again later.',
          statusCode: 503,
        );
      }
      if (status == 504) {
        return ApiException(
          'Server request timed out (Gateway Timeout). Please try again later.',
          statusCode: 504,
        );
      }
    }

    return ApiException('Network error: ${e.message ?? 'Unknown network error'}. Base URL: ${_dio.options.baseUrl}'); // Note: Cannot localize here without context
  }



  /// Legacy header builder for backward compatibility
  static Future<Map<String, String>> getHeaders({
    bool includeRsa = false,
    bool skipCsrf = false,
    bool skipTokenGeneration = false, // Skip auto-generation during retry
  }) async {
    // Get username from UsernameInjection (Hive)
    final username = UsernameInjection.getUsernameSync() ?? await UsernameInjection.getUsername() ?? _unknownUser;
    // Get locale from SharedPreferences (non-sensitive setting)
    final prefs = await SharedPreferences.getInstance();
    final currentLocale = prefs.getString('app_locale') ?? 'en';

    final headers = <String, String>{
      'Content-Type': 'application/json',
      'x-username': username,
      'locale': currentLocale,
    };

    // Always add RSA headers first if required (required by some backend endpoints)
    if (includeRsa) {
      final rsaHeaders = RsaAuthSharedService.generateRsaHeaders(username);
      headers.addAll(rsaHeaders);
    }

    // Add version control headers
    try {
      _packageInfo ??= await PackageInfo.fromPlatform();
      if (_packageInfo != null) {
        headers['x-app-version'] = _packageInfo!.version.split('-')[0];
        headers['x-platform'] = Platform.operatingSystem;
      }
    } catch (e) {
      if (kDebugMode) print('⚠️ Failed to add version headers: $e');
    }

    // Get JWT token (SecurityService handles all validation)
    var jwtToken = await SecuritySharedService.getStoredToken();
    if (kDebugMode) print('🔍 JWT Token Status: ${jwtToken != null ? 'Valid' : 'Missing/Expired'}');

    // Only generate token if not skipping and username is valid
    if (jwtToken == null && username != _unknownUser && !skipTokenGeneration) {
      if (kDebugMode) print('🔄 Access token missing or expired. Trying refresh token...');
      
      final refreshResult = await SecuritySharedService.refreshAccessToken(username);
      
      if (refreshResult.success && refreshResult.data != null) {
        jwtToken = refreshResult.data!['token'] as String;
        if (kDebugMode) print('✅ JWT retrieved via refresh token');
      } else {
        if (kDebugMode) print('🔄 Refresh failed/unavailable. Generating new token with RSA...');
        final tokenResult = await SecuritySharedService.generateToken(username);
        if (tokenResult.success && tokenResult.data != null) {
          jwtToken = tokenResult.data!['token'] as String;
          if (kDebugMode) print('✅ JWT generated and stored in SecureStorage');
        } else {
          if (kDebugMode) print('  JWT generation failed: ${tokenResult.message}');
          throw Exception('JWT generation failed: ${tokenResult.message}');
        }
      }
    } else if (jwtToken == null && skipTokenGeneration) {
      if (kDebugMode) print('⚠️ Skipping token generation (skipTokenGeneration=true)');
    }

    if (jwtToken != null) {
      headers['Authorization'] = 'Bearer $jwtToken';
      if (kDebugMode) print('✅ Using JWT token');
    }

    // Get CSRF token (SecurityService handles all validation)
    if (headers.containsKey('Authorization') && !skipCsrf) {
      if (kDebugMode) print('🔍 Getting CSRF token');

      var csrfToken = await SecuritySharedService.getStoredCsrfToken();

      if (csrfToken == null) {
        if (kDebugMode) print('🔄 Generating new CSRF token');
        final csrfResult = await SecuritySharedService.getCsrfToken(username);

        if (csrfResult.success && csrfResult.data != null) {
          csrfToken = csrfResult.data!['csrfToken'] as String?;
        }
      }

      if (csrfToken != null) {
        headers['x-csrf-token'] = csrfToken;
        if (kDebugMode) print('✅ CSRF token added');
      } else {
        if (kDebugMode) print('⚠️ No CSRF token available');
      }
    }

    if (kDebugMode) {
      print('🔍 Headers ready (${headers.length} headers)');
      _printPostmanHeaders(headers);
    }
    return headers;
  }
  static Future<Map<String, String>> getHeadersWithoutUser({String? username}) async {
    // Get locale from SharedPreferences (non-sensitive setting)
    final prefs = await SharedPreferences.getInstance();
    final currentLocale = prefs.getString('app_locale') ?? 'en';

    final headers = <String, String>{
      'Content-Type': 'application/json',
      // 'x-username': username ?? _unknownUser,
      'locale': currentLocale,
    };
    
    if (username != null) {
      final rsaHeaders = RsaAuthSharedService.generateRsaHeaders(username);
      headers.addAll(rsaHeaders);
    } else {
      final rsaHeaders = await RsaAuthSharedService.generateRsaHeadersWithoutUserName();
      headers.addAll(rsaHeaders);
    }

    // Add version control headers
    try {
      _packageInfo ??= await PackageInfo.fromPlatform();
      if (_packageInfo != null) {
        headers['x-app-version'] = _packageInfo!.version.split('-')[0];
        headers['x-platform'] = Platform.operatingSystem;
      }
    } catch (e) {
      if (kDebugMode) print('⚠️ Failed to add version headers: $e');
    }

    return headers;
  }

  static bool _isNetworkError(dynamic error) {
    return error is SocketException ||
        error.toString().contains('timeout') ||
        error.toString().contains('Request timeout') ||
        error.toString().contains('Failed host lookup') ||
        error.toString().contains('Network is unreachable') ||
        error.toString().contains('No address associated with hostname') ||
        error.toString().contains('Connection refused') ||
        error.toString().contains('Connection timed out');
  }

  static void _showSlowInternetMessage() {
    try {
      NetworkErrorSharedService.showSlowInternetMessage();
    } catch (e) {
      // Ignore dialog errors
    }
  }

  static void _printPostmanHeaders(Map<String, String> headers) {
    print('📋 Request Headers:');
    headers.forEach((key, value) {
      // Mask sensitive values
      if (key.toLowerCase().contains('token') || 
          key.toLowerCase().contains('authorization') ||
          key.toLowerCase().contains('signature')) {
        print('   $key: ${value.substring(0, 10)}...[MASKED]');
      } else {
        print('   $key: $value');
      }
    });
  }

  static void _logImageData(Map<String, dynamic> data) {
    try {
      // Check if this is customer creation with identifying_information
      if (data.containsKey('identifying_information')) {
        final identifyingInfo = data['identifying_information'] as List?;
        if (identifyingInfo != null) {
          for (var i = 0; i < identifyingInfo.length; i++) {
            final info = identifyingInfo[i] as Map<String, dynamic>?;
            if (info != null) {
              print('📝 DOCUMENT [$i] TYPE: ${info['type']}');

              // Ensure front image is above 20KB
              if (info.containsKey('image_front')) {
                final frontImage = ensureImageSizeAbove20KB(info['image_front'] as String);
                info['image_front'] = frontImage;
                final frontSizeKB = _calculateBase64SizeKB(frontImage);
                print('🖼️ FRONT IMAGE [$i] SIZE: ${frontSizeKB}KB');
                print('🖼️ FRONT IMAGE [$i]: $frontImage');
              }

              // Ensure back image is above 20KB
              if (info.containsKey('image_back')) {
                final backImage = ensureImageSizeAbove20KB(info['image_back'] as String);
                info['image_back'] = backImage;
                final backSizeKB = _calculateBase64SizeKB(backImage);
                print('🖼️ BACK IMAGE [$i] SIZE: ${backSizeKB}KB');
                print('🖼️ BACK IMAGE [$i]: $backImage');
              }
            }
          }
        }
      }
    } catch (e) {
      print('⚠️ Error logging image data: $e');
    }
  }

  static double _calculateBase64SizeKB(String base64String) {
    try {
      // Remove data URL prefix if present
      var cleanBase64 = base64String;
      if (base64String.contains(',')) {
        cleanBase64 = base64String.split(',')[1];
      }

      // Calculate size: base64 length * 3/4 (accounting for padding)
      final sizeBytes = (cleanBase64.length * 3 / 4).round();
      return sizeBytes / 1024; // Convert to KB
    } catch (e) {
      return 0.0;
    }
  }

  /// Ensures image size is at least 20KB
  static String ensureImageSizeAbove20KB(String base64Image) {
    final currentSizeKB = _calculateBase64SizeKB(base64Image);
    if (currentSizeKB >= 20.0) {
      return base64Image;
    }

    // Extract data part
    var prefix = '';
    var datapart = base64Image;
    if (base64Image.contains(',')) {
      final parts = base64Image.split(',');
      prefix = '${parts[0]},';
      datapart = parts[1];
    }

    // Calculate padding needed
    final targetSizeBytes = (20.0 * 1024).round();
    final currentSizeBytes = (datapart.length * 3 / 4).round();
    final paddingBytes = targetSizeBytes - currentSizeBytes;
    final paddingChars = ((paddingBytes * 4) / 3).round();

    // Add padding
    final padding = 'A' * paddingChars;
    final result = prefix + datapart + padding;

    print('✅ Image padded from ${currentSizeKB.toStringAsFixed(2)}KB to ${_calculateBase64SizeKB(result).toStringAsFixed(2)}KB');
    return result;
  }
}

class ApiResponse<T> {
  final bool success;
  final int status;
  final String message;
  final String timestamp;
  final T? data;

  ApiResponse({
    required this.success,
    required this.status,
    required this.message,
    required this.timestamp,
    this.data,
  });
}