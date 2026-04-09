import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/widgets/adaptive_dialogs/show_ok_cancel_alert_dialog.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppExitDialogue {
  static Future<void> show(BuildContext context) async {
    bool isLogged = false;
    try {
      final matrix = Matrix.of(context);
      isLogged = matrix.widget.clients.any((c) => c.isLogged());
    } catch (e) {
      // Default to false if Matrix is not found
    }

    if (!isLogged) {
      SystemNavigator.pop();
      return;
    }

    final result = await showOkCancelAlertDialog(
           dialogType: DialogType.warning,
      useRootNavigator: false,
      context: context,
      title: L10n.of(context).areYouSure,
      message: L10n.of(context).doYouWantToExitTheApp,
      okLabel: L10n.of(context).exit,
      cancelLabel: L10n.of(context).cancel,
    );
    
    if (result == OkCancelResult.ok) {
      SystemNavigator.pop();
    }
  }
}
