import 'package:matrix/matrix.dart';

extension OtherPartyCanReceiveExtension on Room {
  bool get otherPartyCanReceiveMessages {
    if (!encrypted) return true;

    final users = getParticipants()
        .map((u) => u.id)
        .where((userId) => userId != client.userID)
        .toSet();
    if (users.isEmpty) return true;

    for (final userId in users) {
      final userDeviceKeys = client.userDeviceKeys[userId];
      if (userDeviceKeys != null && userDeviceKeys.deviceKeys.isNotEmpty) {
        // Auto-verify all unblocked devices and check
        for (final device in userDeviceKeys.deviceKeys.values) {
          if (!device.blocked && !device.verified) {
            device.setVerified(true);
          }
        }
        final hasValidDevice = userDeviceKeys.deviceKeys.values.any(
          (device) => !device.blocked,
        );
        if (hasValidDevice) return true;
      }
    }
    return false;
  }

  /// Check if encryption is properly set up for this room
  bool get isEncryptionProperlySetUp {
    if (!encrypted) return true;

    // Check if client has encryption enabled
    if (client.encryption == null || !client.encryption!.keyManager.enabled) {
      return false;
    }

    // Check if cross-signing is set up
    if (!client.encryption!.crossSigning.enabled) {
      return false;
    }

    return true;
  }

  /// Get detailed encryption status for debugging
  Map<String, dynamic> get encryptionStatus {
    return {
      'encrypted': encrypted,
      'encryptionEnabled': client.encryption?.keyManager.enabled ?? false,
      'crossSigningEnabled': client.encryption?.crossSigning.enabled ?? false,
      'otherPartyCanReceive': otherPartyCanReceiveMessages,
      'participants': getParticipants().map((u) => u.id).toList(),
      'userDeviceKeys':
          client.userDeviceKeys.map((key, value) => MapEntry(key, {
                'deviceCount': value.deviceKeys.length,
                'verifiedDevices':
                    value.deviceKeys.values.where((d) => d.verified).length,
                'blockedDevices':
                    value.deviceKeys.values.where((d) => d.blocked).length,
              })),
    };
  }
}

class OtherPartyCanNotReceiveMessages implements Exception {
  final String reason;
  final Map<String, dynamic>? details;

  OtherPartyCanNotReceiveMessages(this.reason, [this.details]);

  @override
  String toString() => 'OtherPartyCanNotReceiveMessages: $reason';
}
