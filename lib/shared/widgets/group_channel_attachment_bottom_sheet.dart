import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';
import 'package:bmp/shared/widgets/avatar.dart';
import 'attachment_bottom_sheet.dart';

class GroupChannelAttachmentBottomSheet extends StatelessWidget {
  final List<AttachmentOption> attachmentOptions;
  final String? groupName;
  final Uri? groupAvatar;
  final String? memberCount;
  final Room? room;

  const GroupChannelAttachmentBottomSheet({
    super.key,
    required this.attachmentOptions,
    this.groupName,
    this.groupAvatar,
    this.memberCount,
    this.room,
  });

  @override
  Widget build(BuildContext context) {
    return AttachmentBottomSheet(
      maxHeight: 379,
      // padding: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // spacing: 10,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    width: double.infinity,
                    child: Row(
                      spacing: 10,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF1F252D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1000),
                            ),
                          ),
                          child: Avatar(
                            mxContent: groupAvatar,
                            name: groupName ?? 'Group',
                            size: 48,
                            isGroup: true,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 4,
                            children: [
                              Text(
                                groupName ?? 'Group',
                                style: TextStyle(
                                  color: const Color(0xFFF3F7F8),
                                  fontSize: 14,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                memberCount ?? '0 Members',
                                style: TextStyle(
                                  color: const Color(0xFFC6D4DB),
                                  fontSize: 10,
                                  fontFamily: 'Neometric',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 4,
                          children: [
                            if (room?.tags.containsKey('m.favourite') == true)
                              Image.asset(
                                'assets/images/chat_details/archive-tick.png',
                                width: 18,
                                height: 18,
                                color: Colors.white,
                              ),
                            if (room?.pushRuleState != null &&
                                room!.pushRuleState != PushRuleState.notify)
                              Image.asset(
                                'assets/images/chat_details/volume-slash.png',
                                width: 18,
                                height: 18,
                                color: Colors.white,
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(6),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: const Color(0x7F1F252D),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            height: 245,
            child: ListView.separated(
              itemCount: attachmentOptions.length,
              separatorBuilder: (context, index) => SizedBox(height: 6),
              itemBuilder: (context, index) =>
                  _buildAttachmentItem(attachmentOptions[index]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttachmentItem(AttachmentOption option) {
    return GestureDetector(
      onTap: option.onTap,
      child: Container(
        width: double.infinity,
        decoration: ShapeDecoration(
          color: const Color(0xFF3976F8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: ShapeDecoration(
            color: option.isSelected
                ? const Color(0xF2252844)
                : const Color(0xFF222588),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          child: Row(
            spacing: 12,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            option.title,
                            style: TextStyle(
                              color: const Color(0xFFF3F7F8),
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Text(
                          option.time ?? '',
                          style: TextStyle(
                            color: const Color(0xFFC6D4DB),
                            fontSize: 12,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            option.subtitle,
                            style: TextStyle(
                              color: option.isSelected
                                  ? const Color(0xFFF3F7F8)
                                  : const Color(0xFFC6D4DB),
                              fontSize: 14,
                              fontFamily: 'Work Sans',
                              fontWeight: FontWeight.w700,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (option.badgeCount != null && option.badgeCount! > 0)
                          Container(
                            height: 22,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 4),
                            decoration: ShapeDecoration(
                              color: const Color(0xFF3976F8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1000),
                              ),
                            ),
                            child: Text(
                              '${option.badgeCount}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Neometric',
                                fontWeight: FontWeight.w700,
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
    );
  }

  static void show(BuildContext context, List<AttachmentOption> options,
      [String? groupName, Uri? groupAvatar, String? memberCount, Room? room]) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => GroupChannelAttachmentBottomSheet(
        attachmentOptions: options,
        groupName: groupName,
        groupAvatar: groupAvatar,
        memberCount: memberCount,
        room: room,
      ),
    );
  }
}

class AttachmentOption {
  final String title;
  final String subtitle;
  final String? time;
  final int? badgeCount;
  final bool isSelected;
  final VoidCallback? onTap;

  AttachmentOption({
    required this.title,
    required this.subtitle,
    this.time,
    this.badgeCount,
    this.isSelected = false,
    this.onTap,
  });
}
