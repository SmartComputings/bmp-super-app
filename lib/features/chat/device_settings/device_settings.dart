import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:collection/collection.dart' show IterableExtension;
import 'package:matrix/encryption/utils/key_verification.dart';
import 'package:matrix/matrix.dart';

import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/chat/device_settings/device_settings_view.dart';
import 'package:bmp/features/chat/key_verification/key_verification_dialog.dart';
import 'package:bmp/shared/utils/snackbar.dart';
import 'package:bmp/shared/widgets/adaptive_dialogs/show_ok_cancel_alert_dialog.dart';
import 'package:bmp/shared/widgets/adaptive_dialogs/show_text_input_dialog.dart';
import 'package:bmp/shared/widgets/future_loading_dialog.dart';
import 'package:bmp/shared/widgets/matrix.dart';

class DevicesSettings extends StatefulWidget {
  const DevicesSettings({super.key});

  @override
  DevicesSettingsController createState() => DevicesSettingsController();
}

class DevicesSettingsController extends State<DevicesSettings> {
  List<Device>? devices;
  bool _deviceRemovalMessageShown = false;
  static const String _deviceRemovalMessageShownKey =
      'device_removal_message_shown';

  Future<bool> loadUserDevices(BuildContext context) async {
    if (devices != null) return true;
    devices = await Matrix.of(context).client.getDevices();
    return true;
  }

  void reload() => setState(() => devices = null);

  bool? chatBackupEnabled;

  @override
  void initState() {
    _checkChatBackup();
    _loadDeviceRemovalMessageShown();
    super.initState();
  }

  void _loadDeviceRemovalMessageShown() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _deviceRemovalMessageShown =
          prefs.getBool(_deviceRemovalMessageShownKey) ?? false;
    });
  }

  void _saveDeviceRemovalMessageShown(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_deviceRemovalMessageShownKey, value);
    setState(() {
      _deviceRemovalMessageShown = value;
    });
  }

  // Method to reset the device removal message flag (can be called from other parts of the app)
  static Future<void> resetDeviceRemovalMessageFlag() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_deviceRemovalMessageShownKey, false);
  }

  void _checkChatBackup() async {
    final client = Matrix.of(context).client;
    if (client.encryption?.keyManager.enabled == true) {
      if (await client.encryption?.keyManager.isCached() == false ||
          await client.encryption?.crossSigning.isCached() == false ||
          client.isUnknownSession && !mounted) {
        setState(() {
          chatBackupEnabled = false;
        });
        return;
      }
    }
  }

  void removeDevicesAction(List<Device> devices) async {
    if (await showOkCancelAlertDialog(
          context: context,
          title: L10n.of(context).areYouSure,
          okLabel: L10n.of(context).remove,
          cancelLabel: L10n.of(context).cancel,
          message: L10n.of(context).removeDevicesDescription,
     dialogType: DialogType.warning,
        ) ==
        OkCancelResult.cancel) {
      return;
    }

    final matrix = Matrix.of(context);
    final deviceIds = <String>[];
    final currentDeviceId = matrix.client.deviceID;

    // Filter out the current device to prevent self-removal
    for (final userDevice in devices) {
      if (userDevice.deviceId != currentDeviceId) {
        // Check if device has recent activity (protected devices)
        if (userDevice.lastSeenTs != null &&
            DateTime.now().millisecondsSinceEpoch - userDevice.lastSeenTs! <
                24 * 60 * 60 * 1000) {
          Logs().w(
              'Skipping recently active device: ${userDevice.deviceId} (lastSeen: ${userDevice.lastSeenTs})',);
          continue;
        }
        deviceIds.add(userDevice.deviceId);
      }
    }

    // Check if we have any devices to remove
    if (deviceIds.isEmpty) {
      if (mounted) {
        CustomSnackbar.show(
          context,
          title: L10n.of(context).warning,
          message: L10n.of(context).noDevicesSelectedForRemoval,
          type: SnackbarType.warning,
        );
      }
      return;
    }

    try {
      final result = await showFutureLoadingDialog(
        context: context,
        delay: false,
        future: () async {
          // Add timeout to prevent hanging
          try {
            Logs().i('Starting device deletion for devices: $deviceIds');

            // Try direct deletion first without UIA
            try {
              return await matrix.client.deleteDevices(deviceIds).timeout(
                const Duration(seconds: 30),
                onTimeout: () {
                  throw TimeoutException(
                      'Device removal timed out after 30 seconds',);
                },
              );
            } on MatrixException catch (matrixError) {
              Logs()
                  .w('Direct deletion failed with error: ${matrixError.error}');

              // Check if it's a permission issue
              if (matrixError.error == 'M_FORBIDDEN') {
                // Only show the message if it hasn't been shown before
                if (!_deviceRemovalMessageShown) {
                  _saveDeviceRemovalMessageShown(true);
                  throw Exception(
                      L10n.of(context).deviceDeletionNotAllowed,);
                } else {
                  // If message was already shown, just throw a generic error
                  throw Exception(
                      L10n.of(context).deviceDeletionFailed,);
                }
              }

              // Check if it requires UIA
              if (matrixError.requireAdditionalAuthentication) {
                Logs().i('UIA required, attempting with authentication...');
                return await matrix.client
                    .uiaRequestBackground(
                  (auth) => matrix.client.deleteDevices(
                    deviceIds,
                    auth: auth,
                  ),
                )
                    .timeout(
                  const Duration(seconds: 30),
                  onTimeout: () {
                    throw TimeoutException(
                        'Device removal with authentication timed out after 30 seconds',);
                  },
                );
              } else {
                // Re-throw if it's not a UIA issue
                rethrow;
              }
            }
          } catch (e) {
            // Log the error for debugging
            Logs().e('Error in device removal request', e);
            rethrow;
          }
        },
      );

      if (result.error != null) {
        // Show error message
        if (mounted) {
          CustomSnackbar.show(
            context,
            title: L10n.of(context).error,
            message: L10n.of(context).failedToRemoveDevices(result.error.toString()),
            type: SnackbarType.error,
          );
        }
        return;
      }

      // Success - reload the device list
      if (mounted) {
        // Reset the message flag on successful deletion
        _saveDeviceRemovalMessageShown(false);
        CustomSnackbar.show(
          context,
          title: L10n.of(context).success,
          message: L10n.of(context).devicesRemovedSuccessfully,
          type: SnackbarType.success,
        );
        reload();
      }
    } catch (e) {
      // Handle any other errors
      if (mounted) {
        CustomSnackbar.show(
          context,
          title: L10n.of(context).error,
          message: L10n.of(context).errorRemovingDevices(e.toString()),
          type: SnackbarType.error,
        );
      }
      Logs().e('Error removing devices', e);
    }
  }

  void renameDeviceAction(Device device) async {
    final displayName = await showTextInputDialog(
      context: context,
      title: L10n.of(context).changeDeviceName,
      okLabel: L10n.of(context).ok,
      cancelLabel: L10n.of(context).cancel,
      hintText: device.displayName,
    );
    if (displayName == null) return;
    final success = await showFutureLoadingDialog(
      context: context,
      future: () => Matrix.of(context)
          .client
          .updateDevice(device.deviceId, displayName: displayName),
    );
    if (success.error == null) {
      reload();
    }
  }

  void verifyDeviceAction(Device device) async {
    final consent = await showOkCancelAlertDialog(
      context: context,
        dialogType: DialogType.warning,
      title: L10n.of(context).verifyOtherDevice,
      message: L10n.of(context).verifyOtherDeviceDescription,
      okLabel: L10n.of(context).ok,
      cancelLabel: L10n.of(context).cancel,
    );
    if (consent != OkCancelResult.ok) return;
    final req = await Matrix.of(context)
        .client
        .userDeviceKeys[Matrix.of(context).client.userID!]!
        .deviceKeys[device.deviceId]!
        .startVerification();
    req.onUpdate = () {
      if ({KeyVerificationState.error, KeyVerificationState.done}
          .contains(req.state)) {
        setState(() {});
      }
    };
    await KeyVerificationDialog(request: req).show(context);
  }

  void blockDeviceAction(Device device) async {
    final key = Matrix.of(context)
        .client
        .userDeviceKeys[Matrix.of(context).client.userID!]!
        .deviceKeys[device.deviceId]!;
    if (key.directVerified) {
      await key.setVerified(false);
    }
    await key.setBlocked(true);
    setState(() {});
  }

  void unblockDeviceAction(Device device) async {
    final key = Matrix.of(context)
        .client
        .userDeviceKeys[Matrix.of(context).client.userID!]!
        .deviceKeys[device.deviceId]!;
    await key.setBlocked(false);
    setState(() {});
  }

  bool _isOwnDevice(Device userDevice) =>
      userDevice.deviceId == Matrix.of(context).client.deviceID;

  Device? get thisDevice => devices!.firstWhereOrNull(
        _isOwnDevice,
      );

  List<Device> get notThisDevice => List<Device>.from(devices!)
    ..removeWhere(_isOwnDevice)
    ..sort((a, b) => (b.lastSeenTs ?? 0).compareTo(a.lastSeenTs ?? 0));

  @override
  Widget build(BuildContext context) => DevicesSettingsView(this);
}
