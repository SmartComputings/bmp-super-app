import 'package:bmp/shared/utils/snackbar.dart';
import 'package:flutter/material.dart';

class ApiErrorSnackbar {
  static void show(BuildContext context, Map<String, dynamic> errorResponse) {
    try {
      final message = errorResponse['message'] ?? 'An error occurred';
      final errors = errorResponse['errors'] as List<dynamic>? ?? [];
      
      String fullMessage = message;
      if (errors.isNotEmpty) {
        final errorMessages = errors.map((error) => 
          error['originalMessage'] ?? error['message'] ?? 'Invalid field'
        ).join('\n');
        fullMessage = '$message\n$errorMessages';
      }

      CustomSnackbar.show(context,
        title: 'Error',
        message: fullMessage,
        type: SnackbarType.error,
      );
    } catch (e) {
      // Context is disposed, ignore
    }
  }
}