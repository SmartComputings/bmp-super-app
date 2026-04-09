import 'package:bmp/shared/utils/snackbar.dart';
import 'package:flutter/material.dart';

import 'error_extractor.dart';

class ErrorSnackbar {
  static void show(BuildContext context, dynamic error) {
    if (!context.mounted) return;

    String message;
    if (error is Map<String, dynamic>) {
      message = ErrorExtractor.extractMessage(error);
    } else if (error is String) {
      message = error;
    } else {
      message = error.toString();
      // Remove common exception prefixes
      if (message.startsWith('')) {
        message = message.substring(' '.length);
      }
      if (message.startsWith(' ')) {
        message = message.substring(' '.length);
      }
    }

    print('📱 SHOWING SNACKBAR: $message');

    try {
      if (context.mounted) {
CustomSnackbar.show(context,          title: "Error",
          message: message,
          type: SnackbarType.error,
        );
      }
    } catch (e) {
      print('⚠️ Failed to show snackbar: $e');
    }
  }
}
