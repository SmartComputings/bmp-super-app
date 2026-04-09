import 'package:bmp/shared/utils/snackbar.dart';
import 'package:flutter/material.dart';

import 'api_exception.dart';
import 'network_exception.dart';

class ErrorHandler {
  static String extractErrorMessage(dynamic error) {
    if (error is ApiException) {
      return error.message;
    } else if (error is NetworkException) {
      return error.message;
    } else if (error is Map<String, dynamic>) {
      // Handle nested error format: error.error.error.message
      if (error['error'] != null &&
          error['error']['error'] != null &&
          error['error']['error']['message'] != null) {
        return _decodeHtmlEntities(error['error']['error']['message']);
      }
      // Handle backend response format
      if (error['message'] != null) {
        return _decodeHtmlEntities(error['message']);
      }
      // Handle validation errors
      if (error['errors'] != null && error['errors'] is List) {
        final errors = error['errors'] as List;
        if (errors.isNotEmpty) {
          return errors.first['message'] ?? 'Validation error';
        }
      }
    }
    return error.toString();
  }

  static String _decodeHtmlEntities(String text) {
    return text
        .replaceAll('&quot;', '"')
        .replaceAll('&#39;', "'")
        .replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>');
  }

  static List<ValidationError>? extractValidationErrors(dynamic error) {
    if (error is ApiException && error.errors != null) {
      return error.errors;
    } else if (error is Map<String, dynamic> && error['errors'] != null) {
      final errors = error['errors'] as List;
      return errors.map((e) => ValidationError.fromJson(e)).toList();
    }
    return null;
  }

  static void showError(BuildContext context, dynamic error) {
    final message = extractErrorMessage(error);
    final validationErrors = extractValidationErrors(error);

    print('🚨 ErrorHandler: Showing error message: $message');

    if (validationErrors != null && validationErrors.isNotEmpty) {
      _showValidationDialog(context, validationErrors);
    } else {
CustomSnackbar.show(context,        title: "",
        message: message,
        type: SnackbarType.error,
      );
    }
  }

  static void _showValidationDialog(
      BuildContext context, List<ValidationError> errors) {
    final message = errors.map((e) => '${e.field}: ${e.message}').join('\n');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Validation Errors'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
