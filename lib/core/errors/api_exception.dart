class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final List<ValidationError>? errors;

  ApiException(
    this.message, {
    this.statusCode,
    this.errors,
  });

  @override
  String toString() => message;

  bool get isValidationError => statusCode == 422 && errors != null;
  bool get isAuthError => statusCode == 401;
  bool get isNotFound => statusCode == 404;
  bool get isServerError => statusCode != null && statusCode! >= 500;
}

class ValidationError {
  final String field;
  final String message;
  final String? originalMessage;
  final dynamic value;

  ValidationError({
    required this.field,
    required this.message,
    this.originalMessage,
    this.value,
  });

  factory ValidationError.fromJson(Map<String, dynamic> json) {
    return ValidationError(
      field: json['field'] ?? '',
      message: json['message'] ?? '',
      originalMessage: json['originalMessage'],
      value: json['value'],
    );
  }
  
  Map<String, dynamic> toJson() => {
    'field': field,
    'message': message,
    if (originalMessage != null) 'originalMessage': originalMessage,
    if (value != null) 'value': value,
  };
}