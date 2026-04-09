import 'app_logger.dart';

class SecurityLogger {
  static const String _prefix = 'SecurityService';

  static void info(String message, [Map<String, dynamic>? data]) {
    final logMessage = data != null ? '$message - Data: $data' : message;
    AppLogger.info('$_prefix: $logMessage');
  }

  static void error(String message, [Map<String, dynamic>? data]) {
    final logMessage = data != null ? '$message - Data: $data' : message;
    AppLogger.error('$_prefix: $logMessage');
  }

  static void warning(String message, [Map<String, dynamic>? data]) {
    final logMessage = data != null ? '$message - Data: $data' : message;
    AppLogger.warning('$_prefix: $logMessage');
  }

  static void debug(String message, [Map<String, dynamic>? data]) {
    final logMessage = data != null ? '$message - Data: $data' : message;
    AppLogger.debug('$_prefix: $logMessage');
  }

  static void api(String message, [Map<String, dynamic>? data]) {
    final logMessage = data != null ? '$message - Data: $data' : message;
    AppLogger.api('$_prefix: $logMessage');
  }

  static void apiResponse(String message, {
    int? statusCode,
    String? responseBody,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? additionalData,
  }) {
    final data = <String, dynamic>{};
    if (statusCode != null) data['statusCode'] = statusCode;
    if (responseBody != null) data['responseBody'] = responseBody;
    if (headers != null) data['headers'] = headers;
    if (additionalData != null) data.addAll(additionalData);
    
    final logMessage = '$message - ${data.isNotEmpty ? 'Data: $data' : ''}';
    AppLogger.api('$_prefix: $logMessage');
  }

  static void network(String message, [Map<String, dynamic>? data]) {
    final logMessage = data != null ? '$message - Data: $data' : message;
    AppLogger.network('$_prefix: $logMessage');
  }
}