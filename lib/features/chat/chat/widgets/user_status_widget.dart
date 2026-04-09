import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/date_time_extension.dart';
import 'package:bmp/shared/widgets/presence_builder.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';

class UserStatusWidget extends StatelessWidget {
  final Room room;

  const UserStatusWidget({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    final isGroup = !room.isDirectChat;

    if (isGroup) {
      final memberCount = (room.summary.mInvitedMemberCount ?? 0) + (room.summary.mJoinedMemberCount ?? 0);
      return Text(
        '$memberCount members',
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 10,
          fontFamily: 'Neometric',
          fontWeight: FontWeight.w600,
        ),
      );
    }

    return PresenceBuilder(
      userId: room.directChatMatrixID,
      client: room.client,
      builder: (context, presence) {
        if (presence?.presence.isOnline == true) {
          return _buildStatusRow(
            Colors.green,
            L10n.of(context).currentlyActive,
          );
        }

        final lastActiveTimestamp = presence?.lastActiveTimestamp;
        if (lastActiveTimestamp != null) {
          return _buildStatusRow(
            Colors.grey,
            L10n.of(context).lastActiveAgo(
              lastActiveTimestamp.localizedTimeShort(context),
            ),
          );
        }

        return Text(
          'Offline',
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 10,
            fontFamily: 'Neometric',
            fontWeight: FontWeight.w600,
          ),
        );
      },
    );
  }

  Widget _buildStatusRow(Color dotColor, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: dotColor,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 10,
            fontFamily: 'Neometric',
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
