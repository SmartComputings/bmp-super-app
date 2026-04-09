import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/chat/chat_encryption_settings/chat_encryption_settings_view.dart';
import 'package:bmp/shared/utils/snackbar.dart';
import 'package:bmp/shared/widgets/adaptive_dialogs/show_ok_cancel_alert_dialog.dart';
import 'package:bmp/shared/widgets/future_loading_dialog.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matrix/matrix.dart';

import '../bootstrap/bootstrap_dialog.dart';

class ChatEncryptionSettings extends StatefulWidget {
  const ChatEncryptionSettings({super.key});

  @override
  ChatEncryptionSettingsController createState() =>
      ChatEncryptionSettingsController();
}

class ChatEncryptionSettingsController extends State<ChatEncryptionSettings> {
  String? get roomId => GoRouterState.of(context).pathParameters['roomid'];

  Room get room => Matrix.of(context).client.getRoomById(roomId!)!;

  Future<void> unblock(DeviceKeys key) async {
    if (key.blocked) {
      await key.setBlocked(false);
    }
  }

  void enableEncryption(_) async {
    if (room.encrypted) {
      showOkAlertDialog(
        context: context,
        dialogType: DialogType.warning,
        title: L10n.of(context).sorryThatsNotPossible,
        message: L10n.of(context).disableEncryptionWarning,
      );
      return;
    }
    if (room.joinRules == JoinRules.public) {
      showOkAlertDialog(
        context: context,
            dialogType: DialogType.warning,
        title: L10n.of(context).sorryThatsNotPossible,
        message: L10n.of(context).noEncryptionForPublicRooms,
      );
      return;
    }
    if (!room.canChangeStateEvent(EventTypes.Encryption)) {
      showOkAlertDialog(
        context: context,
            dialogType: DialogType.warning,
        title: L10n.of(context).sorryThatsNotPossible,
        message: L10n.of(context).noPermission,
      );
      return;
    }

    // Check if client encryption is properly set up
    final client = Matrix.of(context).client;
    if (client.encryption == null || !client.encryption!.keyManager.enabled) {
      // Instead of just showing an error, offer to complete the encryption setup
      final shouldCompleteSetup = await showOkCancelAlertDialog(
        context: context,
          dialogType: DialogType.warning,
        title: L10n.of(context).encryptionSetupTitle,
        message:
         L10n.of(context).encryptionSetupMessage,
        okLabel: L10n.of(context).encryptionSetupOk,
        cancelLabel: L10n.of(context).cancel,
      );

      if (shouldCompleteSetup == OkCancelResult.ok) {
        // Show the bootstrap dialog to complete encryption setup
        try {
          final success = await BootstrapDialog(
            client: client,
          ).show(context);

          if (success == true) {
            // Bootstrap completed successfully, now try to enable encryption
            if (mounted) {
              CustomSnackbar.show(
                context,
                title: L10n.of(context).success,
                message:L10n.of(context).encryptionSetupCompleted
,
                type: SnackbarType.success,
              );
            }

            // Reset the encryption message flag in SharedPreferences
            try {
              Matrix.of(context)
                  .store
                  .setBool('encryption_message_shown', false);
            } catch (e) {
              // Ignore errors when setting the flag
            }

            // Force a state refresh to update the UI
            setState(() {});

            // Debug: Log encryption status after bootstrap
            Logs().d(
                'Post-bootstrap encryption status: ${client.encryption != null ? 'encryption available' : 'encryption null'}',);
            if (client.encryption != null) {
              Logs().d(
                  'KeyManager enabled: ${client.encryption!.keyManager.enabled}',);
              Logs().d(
                  'CrossSigning enabled: ${client.encryption!.crossSigning.enabled}',);
            }

            // Check if encryption is now ready and try to enable it
            if (client.encryption != null &&
                client.encryption!.keyManager.enabled) {
              try {
                Logs()
                    .d('Attempting to enable encryption for room: ${room.id}');
                Logs().d('Room encrypted before: ${room.encrypted}');

                await showFutureLoadingDialog(
                  context: context,
                  future: () async {
                    await room.enableEncryption();
                    Logs().d('Room enableEncryption completed');
                    return true;
                  },
                );

                // Force a refresh of the room state
                await room.client.onSync.stream.first;

                Logs().d('Room encrypted after: ${room.encrypted}');

                // Show success message
                if (mounted) {
                  CustomSnackbar.show(
                    context,
                    title: L10n.of(context).success,
                    message: L10n.of(context).encryptionEnabledSuccess
,
                    type: SnackbarType.success,
                  );
                  setState(() {});
                }
              } catch (e) {
                Logs().e('Failed to enable room encryption', e);
                if (mounted) {
                  showOkAlertDialog(
                    context: context,
                        dialogType: DialogType.error,
                    title: L10n.of(context).encryptionError,

                    message: L10n.of(context).enableEncryptionFailed(e.toString())
,
                  );
                }
              }
            } else {
              Logs().w('Client encryption not ready after bootstrap');
              Logs().w('Client encryption: ${client.encryption != null}');
              if (client.encryption != null) {
                Logs().w(
                    'KeyManager enabled: ${client.encryption!.keyManager.enabled}',);
                Logs().w(
                    'CrossSigning enabled: ${client.encryption!.crossSigning.enabled}',);
              }
            }
            return;
          }
        } catch (e) {
          if (mounted) {
            showOkAlertDialog(
              context: context,
                  dialogType: DialogType.error,
              title: L10n.of(context).encryptionSetupFailedTitle,

              message:
                  L10n.of(context).completeEncryptionSetupFailed(e.toString())
,
            );
          }
          return;
        }
      }
      return;
    }

    final consent = await showOkCancelAlertDialog(
      context: context,
        dialogType: DialogType.warning,
      title: L10n.of(context).areYouSure,
      message: L10n.of(context).enableEncryptionWarning,
      okLabel: L10n.of(context).yes,
      cancelLabel: L10n.of(context).cancel,
    );
    if (consent != OkCancelResult.ok) return;

    try {
      await showFutureLoadingDialog(
        context: context,
        future: () => room.enableEncryption(),
      );

      // Show success message
      if (mounted) {
        CustomSnackbar.show(
          context,
          title: L10n.of(context).success,
          message: L10n.of(context).encryptionEnabledSuccess,
          type: SnackbarType.success,
        );
      }
    } catch (e) {
      if (mounted) {
        showOkAlertDialog(
          context: context,
              dialogType: DialogType.error,
          title: L10n.of(context).encryptionError,
          message: L10n.of(context).enableEncryptionFailed(e.toString())
,
        );
      }
    }
  }

  void startVerification() async {
    // Auto-verify without manual dialog
    try {
      final req = await room.client.userDeviceKeys[room.directChatMatrixID]!
          .startVerification();
      await req.acceptSas();
      setState(() {});
    } catch (e) {
      Logs().e('Auto verification failed', e);
    }
  }

  void toggleDeviceKey(DeviceKeys key) {
    setState(() {
      key.setBlocked(!key.blocked);
    });
  }

  @override
  Widget build(BuildContext context) => ChatEncryptionSettingsView(this);
}
