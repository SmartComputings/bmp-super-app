import 'package:bmp/shared/utils/adaptive_loader_widget.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:matrix/matrix.dart';

import 'package:bmp/core/config/themes.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/chat/chat/chat.dart';
import 'package:bmp/shared/utils/date_time_extension.dart';
import 'package:bmp/shared/utils/matrix_sdk_extensions/matrix_locals.dart';
import 'package:bmp/shared/utils/sync_status_localization.dart';
import 'package:bmp/shared/widgets/avatar.dart';
import 'package:bmp/shared/widgets/presence_builder.dart';

class ChatAppBarTitle extends StatefulWidget {
  final ChatController controller;
  const ChatAppBarTitle(this.controller, {super.key});

  @override
  State<ChatAppBarTitle> createState() => _ChatAppBarTitleState();
}

class _ChatAppBarTitleState extends State<ChatAppBarTitle> {
  final TextEditingController _renameController = TextEditingController();

  @override
  void dispose() {
    _renameController.dispose();
    super.dispose();
  }

  void _showRenameDialog(BuildContext context, Room room) {
    _renameController.text = room.name;
    final actualMembersCount = (room.summary.mInvitedMemberCount ?? 0) + (room.summary.mJoinedMemberCount ?? 0);
    
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 720),
          child: Container(
            width: 382,
            padding: const EdgeInsets.only(top: 16, left: 6, right: 6, bottom: 24),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: const Color(0x7F5F18BF),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFF5F18BF)),
                borderRadius: BorderRadius.circular(10),
              ),
              shadows: const [BoxShadow(color: Color(0xFF1B1C30), blurRadius: 16, offset: Offset(0, 0), spreadRadius: 0)],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 24,
              children: [
                Container(
                  width: 40,
                  height: 6,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    spacing: 10,
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF1F252D),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)),
                        ),
                        child: room.avatar != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Avatar(mxContent: room.avatar, name: room.name, size: 48),
                              )
                            : const Icon(Icons.group, color: Colors.white),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 4,
                          children: [
                            ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 210),
                              child: Text(
                                room.name,
                                style: const TextStyle(color: Color(0xFFF3F7F8), fontSize: 14, fontFamily: 'Montserrat', fontWeight: FontWeight.w700),
                              ),
                            ),
                            Text(
                              '$actualMembersCount ${L10n.of(context).members}',
                              style: const TextStyle(color: Color(0xFFC6D4DB), fontSize: 10, fontFamily: 'Neometric', fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 16,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 48,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: ShapeDecoration(
                          color: const Color(0x7F050926),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)),
                        ),
                        child: TextField(
                          controller: _renameController,
                          style: const TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'Work Sans', fontWeight: FontWeight.w400),
                          decoration: InputDecoration(
                            hintText: L10n.of(context).renameChannel,
                            hintStyle: const TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'Work Sans', fontWeight: FontWeight.w400),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Column(
                        spacing: 10,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              if (_renameController.text.trim().isNotEmpty) {
                                await room.setName(_renameController.text.trim());
                                Navigator.of(context).pop();
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              height: 48,
                              decoration: ShapeDecoration(
                                color: const Color(0xFF3976F8),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)),
                                shadows: const [BoxShadow(color: Color(0xFF1929FF), blurRadius: 10, offset: Offset(0, 0), spreadRadius: -1)],
                              ),
                              child: Center(
                                child: Text(
                                  L10n.of(context).renameGroupChannel,
                                  style: const TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'Work Sans', fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Container(
                              width: double.infinity,
                              height: 48,
                              decoration: ShapeDecoration(
                                color: const Color(0xFFFEF2F2),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)),
                                shadows: const [BoxShadow(color: Color(0xFF1929FF), blurRadius: 10, offset: Offset(0, 0), spreadRadius: -1)],
                              ),
                              child: Center(
                                child: Text(
                                  L10n.of(context).cancel,
                                  style: const TextStyle(color: Color(0xFFF63D3D), fontSize: 14, fontFamily: 'Work Sans', fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final room = widget.controller.room;
    if (widget.controller.selectedEvents.isNotEmpty) {
      return Text(
        widget.controller.selectedEvents.length.toString(),
        style: TextStyle(
          color: Theme.of(context).colorScheme.onTertiaryContainer,
        ),
      );
    }
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: widget.controller.isArchived
          ? null
          : () {
              if (!room.isDirectChat && room.canChangeStateEvent(EventTypes.RoomName)) {
                _showRenameDialog(context, room);
              } else if (FluffyThemes.isThreeColumnMode(context)) {
                widget.controller.toggleDisplayChatDetailsColumn();
              } else {
                context.go('/mainMenuScreen/rooms/${room.id}/details');
              }
            },
      child: Row(
        children: [
          Hero(
            tag: 'content_banner',
            child: Avatar(
              mxContent: room.avatar,
              name: room.getLocalizedDisplayname(
                MatrixLocals(L10n.of(context)),
              ),
              size: 32,
              presenceUserId: room.isDirectChat ? room.directChatMatrixID : null,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  room.getLocalizedDisplayname(MatrixLocals(L10n.of(context))),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                StreamBuilder(
                  stream: room.client.onSyncStatus.stream,
                  builder: (context, snapshot) {
                    final status = room.client.onSyncStatus.value ??
                        const SyncStatusUpdate(SyncStatus.waitingForResponse);
                    final hide = FluffyThemes.isColumnMode(context) ||
                        (room.client.onSync.value != null &&
                            status.status != SyncStatus.error &&
                            room.client.prevBatch != null);
                    return AnimatedSize(
                      duration: FluffyThemes.animationDuration,
                      child: hide
                          ? room.isDirectChat
                              ? PresenceBuilder(
                                  userId: room.directChatMatrixID,
                                  client: room.client,
                                  builder: (context, presence) {
                                    final style = Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.white70,
                                    );
                                    
                                    if (presence?.presence.isOnline == true) {
                                      return Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            width: 8,
                                            height: 8,
                                            decoration: const BoxDecoration(
                                              color: Colors.green,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            L10n.of(context).currentlyActive,
                                            style: style,
                                          ),
                                        ],
                                      );
                                    }
                                    
                                    final lastActiveTimestamp = presence?.lastActiveTimestamp;
                                    if (lastActiveTimestamp != null) {
                                      return Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            width: 8,
                                            height: 8,
                                            decoration: const BoxDecoration(
                                              color: Colors.grey,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            L10n.of(context).lastActiveAgo(
                                              lastActiveTimestamp.localizedTimeShort(context),
                                            ),
                                            style: style,
                                          ),
                                        ],
                                      );
                                    }
                                    
                                    return Text(
                                      'Offline',
                                      style: style,
                                    );
                                  },
                                )
                              : Text(
                                  L10n.of(context).countParticipants(
                                    (room.summary.mInvitedMemberCount ?? 0) +
                                        (room.summary.mJoinedMemberCount ?? 0),
                                  ),
                                  style: Theme.of(context).textTheme.bodySmall,
                                )
                          : Row(
                              children: [
                                const SizedBox.square(
                                  dimension: 10,
                                  child:AdaptiveLoaderWidget()
                                ),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    status.calcLocalizedString(context),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: status.error != null
                                          ? Theme.of(context).colorScheme.error
                                          : null,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
