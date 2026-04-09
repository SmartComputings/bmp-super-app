import 'package:bmp/features/chat/chat_list/chat_list_item.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:bmp/shared/utils/room_archive_helper.dart';
import 'package:flutter/material.dart';

class ArchiveChatListItem extends ChatListItem {
  const ArchiveChatListItem(
    super.room, {
    super.key,
    required super.onTap,
    super.onForget,
  });

  @override
  State<ChatListItem> createState() => _ArchiveChatListItemState();
}

class _ArchiveChatListItemState extends State<ArchiveChatListItem>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  
  @override
  bool get wantKeepAlive => true;

  void _showArchiveMessageOptions() {
    showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(100, 100, 100, 100),
      color: Colors.black.withOpacity(0.9),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      items: [
        PopupMenuItem(
          value: 'unarchive',
          child: _buildMenuItemWithImage(
            ImageAssets.chatDetailsArchiveTick,
            L10n.of(context).unArchive,
          ),
        ),
      ],
    ).then((value) {
      print('Selected menu item: $value');
      if (value == 'unarchive') {
        _unarchiveRoom();
      }
    });
  }

  Widget _buildMenuItemWithImage(String imagePath, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 20,
            height: 20,
            color: Colors.white,
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  void _unarchiveRoom() async {
    try {
      await RoomArchiveHelper.unarchiveRoom(widget.room);
      widget.onForget?.call();
    } catch (e) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
      onLongPress: _showArchiveMessageOptions,
      child: ChatListItem(
        widget.room,
        onTap: widget.onTap,
        onForget: widget.onForget,
        isSelected: false,
        isSelectionMode: false,
        onLongPress: (context) => _showArchiveMessageOptions(),
      ),
    );
  }
}