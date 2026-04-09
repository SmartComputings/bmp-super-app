import 'package:matrix/matrix.dart';
import 'package:flutter/material.dart';
import 'package:bmp/core/localization/l10n.dart';

class AutoEncryptionSetup {
  /// Auto-enable encryption after login
  static Future<void> setupEncryptionAfterLogin(BuildContext context, Client client) async {
    try {
      // Wait for initial sync
      await client.onSync.stream.first;
      
      // Auto-verify all devices
      await _autoVerifyAllDevices(context, client);
      
      // Auto-enable encryption for all rooms
      await _autoEnableRoomEncryption(context, client);
      
    } catch (e) {
      Logs().e(L10n.of(context).autoEncryptionSetupFailed, e);
    }
  }
  
  static Future<void> _autoVerifyAllDevices(BuildContext context, Client client) async {
    try {
      for (final userDeviceKeys in client.userDeviceKeys.values) {
        for (final device in userDeviceKeys.deviceKeys.values) {
          if (!device.verified && !device.blocked) {
            await device.setVerified(true);
          }
        }
      }
    } catch (e) {
      Logs().e(L10n.of(context).autoDeviceVerificationFailed, e);
    }
  }
  
  static Future<void> _autoEnableRoomEncryption(BuildContext context, Client client) async {
    try {
      for (final room in client.rooms) {
        if (!room.encrypted && room.canChangeStateEvent(EventTypes.Encryption)) {
          try {
            await room.enableEncryption();
          } catch (e) {
            Logs().w('[Matrix] Auto room encryption failed - ${e.toString()}');
          }
        }
      }
    } catch (e) {
      Logs().e(L10n.of(context).autoRoomEncryptionFailed, e);
    }
  }
}