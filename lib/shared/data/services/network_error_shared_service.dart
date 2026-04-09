import 'package:flutter/material.dart';
import 'package:bmp/shared/widgets/bmp_chat_app.dart';
import 'package:bmp/shared/utils/snackbar.dart';
import 'package:bmp/core/localization/l10n.dart';

/// Shared service for handling and displaying network errors
class NetworkErrorSharedService {
  /// Shows a message indicating slow or no internet connection
  static void showSlowInternetMessage() {
    final context = BmpChatApp.navigatorKey.currentContext;
    if (context != null) {
      CustomSnackbar.show(
        context,
        title: L10n.of(context).error,
        message: L10n.of(context).connectionError,
        type: SnackbarType.error,
      );
    }
  }
}
