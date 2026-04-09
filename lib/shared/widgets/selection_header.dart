import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matrix/matrix.dart';

class SelectionHeader extends StatelessWidget {
  final int selectedCount;
  final VoidCallback onClearSelection;
  final VoidCallback? onBlock;
  final VoidCallback? onDelete;
  final VoidCallback? onArchive;
  final VoidCallback? onMute;
  final VoidCallback? onPin;
  final VoidCallback? onRead;
  final List<Room>? selectedRooms;

  const SelectionHeader({
    super.key,
    required this.selectedCount,
    required this.onClearSelection,
    this.onBlock,
    this.onDelete,
    this.onArchive,
    this.onMute,
    this.onPin,
    this.selectedRooms,
    this.onRead,
  });

  bool get _shouldShowMuteIcon {
    if (selectedRooms == null || selectedRooms!.isEmpty) return false;
    return selectedRooms!
        .any((room) => room.pushRuleState == PushRuleState.notify);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xff262845).withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(18),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.3),
        //     blurRadius: 8.0,
        //     spreadRadius: 2.0,
        //     offset: const Offset(0, 2),
        //   ),
        // ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onClearSelection,
            // child: const Icon(Icons.cancel),
            child: Image.asset(
              "assets/icons/close-circle.png",
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            '$selectedCount',
            style: const TextStyle(
              color: Color(0xff3976F8),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: onRead,
                child: Image.asset(
                  "assets/images/chat_details/message-text.png",
                  width: 24,
                  height: 24,
                  color: Colors.white,
                ),
              ),
            
                const SizedBox(width: 12),
              GestureDetector(
                onTap: onPin,
                child: Image.asset(
                  ImageAssets.chatDetailsArchiveTick,
                 width: 24,
                  height: 24,
                  color: Colors.white,
                ),
              ),
                const SizedBox(width: 12),
              GestureDetector(
                onTap: onArchive,
                child: Image.asset(
                  ImageAssets.chatDetailsArchiveSlash,
                   width: 24,
                  height: 24,
                  color: Colors.white,
                ),
              ),
                const SizedBox(width: 12),
              GestureDetector(
                onTap: onMute,
                child: Image.asset(
                  _shouldShowMuteIcon
                      ? ImageAssets.chatDetailsVolumeSlash
                      : ImageAssets.volumeOnimage,
                   width: 24,
                  height: 24,
                  color: Colors.white,
                ),
              ),
                const SizedBox(width: 12),
              GestureDetector(
                onTap: onDelete,
                child: Image.asset(
                  ImageAssets.chatDetailsTrash,
                   width: 24,
                  height: 24,
                  color: Colors.white,
                ),
              ),
                const SizedBox(width: 12),
              GestureDetector(
                onTap: () {
                  if (selectedRooms != null && selectedRooms!.length == 1) {
                    final room = selectedRooms!.first;
                    context.go('/mainMenuScreen/rooms/${room.id}/details');
                  }
                },
                child: Image.asset(
                  ImageAssets.chatDetailsInfoCircle,
                   width: 24,
                  height: 24,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
