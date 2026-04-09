import '../errors/api_exception.dart';

class ResponseHandler {
  static T handleSuccess<T>(
    Map<String, dynamic> response,
    T Function(dynamic) fromJson,
  ) {
    final success = response['success'] ?? false;
    final data = response['data'];
    
    if (!success) {
      throw ApiException(
        response['message'] ?? 'Unknown error',
        statusCode: response['status'],
        errors: _parseErrors(response['errors']),
      );
    }

    return fromJson(data);
  }

  static List<ValidationError>? _parseErrors(dynamic errorsData) {
    if (errorsData is! List) return null;
    
    return errorsData
        .map((e) => ValidationError.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  static void handleError(Map<String, dynamic> response) {
    final message = response['message'] ?? 'Unknown error';
    final status = response['status'] ?? 500;
    final errors = _parseErrors(response['errors']);

    throw ApiException(message, statusCode: status, errors: errors);
  }
}