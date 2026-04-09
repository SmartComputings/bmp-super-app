import 'package:matrix/matrix.dart';
import 'other_party_can_receive.dart';

class EncryptionHelper {
  /// Check if encryption is properly set up for a client
  static bool isClientEncryptionReady(Client client) {
    if (client.encryption == null) return false;
    if (!client.encryption!.keyManager.enabled) return false;
    if (!client.encryption!.crossSigning.enabled) return false;
    return true;
  }

  /// Check if encryption is properly set up for a room
  static bool isRoomEncryptionReady(Room room) {
    if (!room.encrypted) return true;

    final client = room.client;
    if (!isClientEncryptionReady(client)) return false;

    // If cross-signing is enabled, trust cross-signed devices automatically
    if (client.encryption?.crossSigning.enabled == true) {
      return true;
    }

    // Check if other participants have verified devices
    final participants = room
        .getParticipants()
        .map((u) => u.id)
        .where((userId) => userId != client.userID)
        .toSet();

    if (participants.isEmpty) return true;

    for (final userId in participants) {
      final userDeviceKeys = client.userDeviceKeys[userId];
      if (userDeviceKeys == null || userDeviceKeys.deviceKeys.isEmpty) {
        return false;
      }

      // Check if at least one device is verified and not blocked
      final hasValidDevice = userDeviceKeys.deviceKeys.values.any(
        (device) => !device.blocked && device.verified,
      );
      if (!hasValidDevice) return false;
    }

    return true;
  }

  /// Get detailed encryption status for debugging
  static Map<String, dynamic> getEncryptionStatus(Client client, Room? room) {
    final status = <String, dynamic>{
      'clientEncryptionReady': isClientEncryptionReady(client),
      'encryptionEnabled': client.encryption?.keyManager.enabled ?? false,
      'crossSigningEnabled': client.encryption?.crossSigning.enabled ?? false,
      'isUnknownSession': client.isUnknownSession,
    };

    if (room != null) {
      status.addAll({
        'roomEncrypted': room.encrypted,
        'roomEncryptionReady': isRoomEncryptionReady(room),
        'otherPartyCanReceive': room.otherPartyCanReceiveMessages,
        'participants': room.getParticipants().map((u) => u.id).toList(),
      });
    }

    return status;
  }

  /// Get recommendations for fixing encryption issues
  static List<String> getEncryptionRecommendations(Client client, Room? room) {
    final recommendations = <String>[];

    if (!isClientEncryptionReady(client)) {
      recommendations.add('Complete encryption setup for your device');
      if (client.encryption == null) {
        recommendations.add('Enable encryption on your device');
      } else if (!client.encryption!.keyManager.enabled) {
        recommendations.add('Set up encryption keys on your device');
      } else if (!client.encryption!.crossSigning.enabled) {
        recommendations.add('Complete cross-signing setup');
      }
    }

    if (room != null && room.encrypted && !isRoomEncryptionReady(room)) {
      recommendations.add('Verify devices for other participants');
      recommendations
          .add('Ensure other participants have completed encryption setup');
    }

    if (recommendations.isEmpty) {
      recommendations.add('Encryption is properly configured');
    }

    return recommendations;
  }

  /// Check if a specific user can receive encrypted messages
  static bool canUserReceiveEncryptedMessages(Client client, String userId) {
    if (userId == client.userID) return true;

    final userDeviceKeys = client.userDeviceKeys[userId];
    if (userDeviceKeys == null || userDeviceKeys.deviceKeys.isEmpty) {
      return false;
    }

    // Check if at least one device is verified and not blocked
    return userDeviceKeys.deviceKeys.values.any(
      (device) => !device.blocked && device.verified,
    );
  }

  /// Clear invalid device keys for a user
  static Future<void> clearInvalidDeviceKeys(Client client, String userId) async {
    try {
      final userDeviceKeys = client.userDeviceKeys[userId];
      if (userDeviceKeys != null) {
        // Remove invalid devices
        final validDevices = <String, DeviceKeys>{};
        for (final entry in userDeviceKeys.deviceKeys.entries) {
          if (!entry.value.blocked) {
            validDevices[entry.key] = entry.value;
          }
        }
        userDeviceKeys.deviceKeys.clear();
        userDeviceKeys.deviceKeys.addAll(validDevices);
      }
    } catch (e) {
      Logs().e('Failed to clear invalid device keys', e);
    }
  }
}
