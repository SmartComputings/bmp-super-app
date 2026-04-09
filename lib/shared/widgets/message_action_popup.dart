import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';
import 'package:bmp/features/chat/chat/chat.dart';
import 'package:bmp/core/localization/l10n.dart';

class MessageActionPopup extends StatelessWidget {
  final ChatController controller;
  final Offset position;
  final VoidCallback onClose;
  final Event? event;

  const MessageActionPopup({
    super.key,
    required this.controller,
    required this.position,
    required this.onClose,
    this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx - 95,
      top: position.dy - 250,
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: [
            Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 190,
                    padding: const EdgeInsets.all(10),
                    decoration: ShapeDecoration(
                      color: const Color(0xF2252844),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 34,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(),
                            child: Wrap(
                              alignment: WrapAlignment.spaceEvenly,
                              children: [
                                _buildEmoji('👍'),
                                _buildEmoji('🔥'),
                                _buildEmoji('✅'),
                                _buildEmoji('🤣'),
                                _buildEmoji('😬'),
                                _buildEmoji('🥹'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    width: 144,
                    height: 200,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: ShapeDecoration(
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(L10n.of(context)!.messages.toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 20)),
                        _buildActionItem(L10n.of(context)!.reply, () => _replyToMessage()),
                        _buildActionItem(L10n.of(context)!.copy, () => _copyMessage()),
                        _buildActionItem(L10n.of(context)!.forward, () => _forwardMessage()),
                        if (_canShowPinOption()) _buildActionItem(L10n.of(context)!.pin, () => _pinMessage()),
                        _buildActionItem(L10n.of(context)!.delete, () => _deleteMessage()),
                        _buildActionItem(L10n.of(context)!.report, () => _reportMessage()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmoji(String emoji) {
    return GestureDetector(
      onTap: () {
        _sendReaction(emoji);
        onClose();
      },
      child: Text(
        emoji,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: const Color(0xFFF3F7F8),
          fontSize: 24,
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildActionItem(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: () {
        onTap();
        onClose();
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(width: 18, height: 18, child: Stack()),
            const SizedBox(width: 10),
            SizedBox(
              width: 92,
              child: Text(
                text,
                style: TextStyle(
                  color: const Color(0xFFF3F7F8),
                  fontSize: 12,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendReaction(String emoji) {
    if (event != null) {
      controller.room.sendReaction(event!.eventId, emoji);
    }
  }

  void _replyToMessage() {
    if (event != null) {
      controller.selectedEvents.clear();
      controller.selectedEvents.add(event!);
      controller.replyAction();
    }
  }

  void _copyMessage() {
    if (event != null) {
      controller.selectedEvents.clear();
      controller.selectedEvents.add(event!);
      controller.copyEventsAction();
    }
  }

  void _forwardMessage() {
    if (event != null) {
      controller.selectedEvents.clear();
      controller.selectedEvents.add(event!);
      controller.forwardEventsAction();
    }
  }

  void _pinMessage() {
    if (event != null) {
      controller.selectedEvents.clear();
      controller.selectedEvents.add(event!);
      controller.pinEvent();
    }
  }

  void _deleteMessage() {
    if (event != null) {
      controller.selectedEvents.clear();
      controller.selectedEvents.add(event!);
      controller.redactEventsAction();
    }
  }

  void _reportMessage() {
    if (event != null) {
      controller.selectedEvents.clear();
      controller.selectedEvents.add(event!);
      controller.reportEventAction();
    }
  }

  bool _canShowPinOption() {
    if (event == null) return false;
    
    // Hide pin option if message is encrypted and not decrypted
    if (event!.type == EventTypes.Encrypted || 
        event!.messageType == MessageTypes.BadEncrypted) {
      return false;
    }
    
    // Check if message is sent
    if (!event!.status.isSent) {
      return false;
    }
    
    // In direct chats, allow anyone to pin
    if (controller.room.isDirectChat) {
      return true;
    }
    
    // For group chats: Allow users to pin their own messages OR if they have admin permissions
    final currentUserId = controller.room.client.userID;
    
    // User can pin their own message
    if (event!.senderId == currentUserId) {
      return true;
    }
    
    // Or user has admin/moderator permissions
    return controller.room.canChangeStateEvent(EventTypes.RoomPinnedEvents);
  }
}