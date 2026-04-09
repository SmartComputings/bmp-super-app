import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:flutter/material.dart';

class AutoMessageSender {
  static Future<void> sendMessageToRoom({
    required BuildContext context,
    required String roomId,
    required String message,
  }) async {
    try {
      final client = Matrix.of(context).client;
      final room = client.getRoomById(roomId);
      
      if (room != null) {
        await room.sendTextEvent(message);
        print('✅ ${L10n.of(context).messageSentToRoom} $roomId: $message');
      } else {
        print('  ${L10n.of(context).roomNotFound}: $roomId');
      }
    } catch (e) {
      print('  ${L10n.of(context).errorSendingMessage}: $e');
    }
  }

  static Future<void> sendMessageToRoomAlias({
    required BuildContext context,
    required String roomAlias,
    required String message,
  }) async {
    try {
      final client = Matrix.of(context).client;
      final room = client.rooms.firstWhere(
        (r) => r.canonicalAlias == roomAlias,
        orElse: () => throw Exception(L10n.of(context).roomNotFound),
      );
      
      await room.sendTextEvent(message);
      print('✅ ${L10n.of(context).messageSentToRoomAlias} $roomAlias: $message');
    } catch (e) {
      print('  ${L10n.of(context).errorSendingMessageToAlias}: $e');
    }
  }

  static Future<void> sendMessageToUser({
    required BuildContext context,
    required String userId,
    required String message,
  }) async {
    try {
      final client = Matrix.of(context).client;
      final roomId = await client.startDirectChat(userId);
      await client.getRoomById(roomId)?.sendTextEvent(message);
      print('✅ ${L10n.of(context).directMessageSentTo} $userId: $message');
    } catch (e) {
      print('  ${L10n.of(context).errorSendingDirectMessage}: $e');
    }
  }
}