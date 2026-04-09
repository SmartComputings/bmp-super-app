import 'package:bmp/shared/utils/snackbar.dart';
import 'package:flutter/material.dart';

import '../localization/l10n.dart';

class SuccessSnackbar {
  static void show(BuildContext context, String message) {
    if (!context.mounted) return;

    try {
      if (context.mounted) {
        CustomSnackbar.show(
          context,
          title: L10n.of(context).success,
          message: message,
          type: SnackbarType.success,
        );
      }
    } catch (e) {
      print('⚠️ Failed to show success snackbar: $e');
    }
  }
}
