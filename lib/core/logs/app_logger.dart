import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'app_config.dart';

class AppLogger {
  static bool _isLoggingEnabled = AppConfig.shouldShowLogs;
  
  static void init({bool? enableLogs}) {
    _isLoggingEnabled = enableLogs ?? AppConfig.shouldShowLogs;
  }
  
  static void debug(String message, {Map<String, dynamic>? data}) {
    if (_isLoggingEnabled) {
      final msg = data != null ? '$message | Data: $data' : message;
      debugPrint('🔍 [DEBUG] $msg');
    }
  }
  
  static void info(String message, {Map<String, dynamic>? data}) {
    if (_isLoggingEnabled) {
      final msg = data != null ? '$message | Data: $data' : message;
      debugPrint('ℹ️ [INFO] $msg');
    }
  }
  
  static void warning(String message, {Object? error, Map<String, dynamic>? data}) {
    if (_isLoggingEnabled) {
      final msg = data != null ? '$message | Data: $data' : message;
      debugPrint('⚠️ [WARNING] $msg${error != null ? ' | Error: $error' : ''}');
    }
  }
  
  static void error(String message, {Object? error, StackTrace? stackTrace, Map<String, dynamic>? data}) {
    if (_isLoggingEnabled) {
      final msg = data != null ? '$message | Data: $data' : message;
      debugPrint('❌ [ERROR] $msg${error != null ? ' | Error: $error' : ''}');
      if (stackTrace != null) debugPrint('StackTrace: $stackTrace');
    }
  }
  
  static void success(String message, {Map<String, dynamic>? data}) {
    if (_isLoggingEnabled) {
      final msg = data != null ? '$message | Data: $data' : message;
      debugPrint('✅ [SUCCESS] $msg');
    }
  }
  
  static void api(String message, {Map<String, dynamic>? data}) {
    if (_isLoggingEnabled) {
      final msg = data != null ? '$message | Data: $data' : message;
      debugPrint('🌐 [API] $msg');
    }
  }
  
  static void network(String message, {Map<String, dynamic>? data}) {
    if (_isLoggingEnabled) {
      final msg = data != null ? '$message | Data: $data' : message;
      debugPrint('📡 [NETWORK] $msg');
    }
  }

  static String formatJson(dynamic data) {
    try {
      if (data is String) {
        final decoded = jsonDecode(data);
        return jsonEncode(decoded);
      }
      return jsonEncode(data);
    } catch (_) {
      return data.toString();
    }
  }

  static String _getTimestamp() {
    final now = DateTime.now();
    return '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}.${now.millisecond.toString().padLeft(3, '0')}';
  }

  static void printDebug(
    String message, {
    RequestOptions? request,
    Response? response,
  }) {
    if (!_isLoggingEnabled) return;

    final timestamp = _getTimestamp();

    if (request != null && response != null) {
      final buffer = StringBuffer();
      buffer.writeln('');
      buffer.writeln('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      buffer.writeln('🚀 API CALL → $message     [⏰ $timestamp]');
      buffer.writeln('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      buffer.writeln('📤 REQUEST');
      buffer.writeln('URL     : ${request.uri}');
      buffer.writeln('METHOD  : ${request.method}');
      if (request.headers.isNotEmpty) {
        buffer.writeln('HEADERS :');
        buffer.writeln(formatJson(request.headers));
      }
      if (request.data != null && request.data.toString().isNotEmpty) {
        buffer.writeln('BODY    :');
        buffer.writeln(formatJson(request.data));
      }
      buffer.writeln('');
      buffer.writeln('📥 RESPONSE');
      buffer.writeln('STATUS  : ${response.statusCode}');
      if (response.data != null) {
        buffer.writeln('BODY    :');
        buffer.writeln(formatJson(response.data));
      }
      buffer.writeln('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      buffer.writeln('');
      log(buffer.toString());
    } else {
      debugPrint('🔍 [DEBUG] $message [⏰ $timestamp]');
    }
  }

  static String apiLogMessage({
    required String method,
    required String path,
    required bool isError,
  }) {
    final endpoint = extractApiEndpoint(path);
    return isError
        ? '❌ API FAILED → $method $endpoint'
        : '✅ API SUCCESS → $method $endpoint';
  }

  static String extractApiEndpoint(String path) {
    try {
      final uri = Uri.parse(path);
      final segments = uri.pathSegments;
      final apiIndex = segments.indexOf('api');
      if (apiIndex == -1 || apiIndex == segments.length - 1) {
        return uri.path;
      }
      return segments.sublist(apiIndex + 1).join('/');
    } catch (_) {
      return path;
    }
  }
}