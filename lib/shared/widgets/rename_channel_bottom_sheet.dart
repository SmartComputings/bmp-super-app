import 'package:bmp/shared/widgets/attachment_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';
import 'package:bmp/shared/widgets/avatar.dart';
import 'package:bmp/core/localization/l10n.dart';

class RenameChannelBottomSheet extends StatefulWidget {
  final String? channelName;
  final Uri? channelAvatar;
  final String? memberCount;
  final Room? channelRoom;
  final Function(String)? onRename;

  const RenameChannelBottomSheet({
    super.key,
    this.channelName,
    this.channelAvatar,
    this.memberCount,
    this.channelRoom,
    this.onRename,
  });

  @override
  State<RenameChannelBottomSheet> createState() => _RenameChannelBottomSheetState();
}

class _RenameChannelBottomSheetState extends State<RenameChannelBottomSheet> {
  final TextEditingController _renameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _renameController.text = widget.channelName ?? '';
  }

  @override
  void dispose() {
    _renameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AttachmentBottomSheet(
      maxHeight: 308,
      // padding: const EdgeInsets.only(top: 16, left: 0, right: 0, bottom: 24),
      child: Column(
        children: [
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1000),
                    ),
                  ),
                  child: Avatar(
                    mxContent: widget.channelAvatar,
                    name: widget.channelName ?? 'Channel',
                    size: 48,
                    isGroup: false,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 4,
                    children: [
                      Text(
                        '#${widget.channelName ?? 'Channel'}',
                        style: TextStyle(
                          color: const Color(0xFFF3F7F8),
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        widget.memberCount ?? '0 Members',
                        style: TextStyle(
                          color: const Color(0xFFC6D4DB),
                          fontSize: 10,
                          fontFamily: 'Neometric',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 4,
                  children: [
                    if (widget.channelRoom?.tags.containsKey('m.favourite') == true)
                      Image.asset(
                        'assets/images/chat_details/archive-tick.png',
                        width: 18,
                        height: 18,
                        color: Colors.white,
                      ),
                    if (widget.channelRoom?.pushRuleState != null && widget.channelRoom!.pushRuleState != PushRuleState.notify)
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
          SizedBox(height: 15),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              spacing: 14,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 48,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: ShapeDecoration(
                    color: const Color(0x7F050926),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1000),
                    ),
                  ),
                  child: TextField(
                    controller: _renameController,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Rename Channel',
                      hintStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (_renameController.text.trim().isNotEmpty) {
                          widget.onRename?.call(_renameController.text.trim());
                          Navigator.of(context).pop();
                        }
                      },
                      child: Container(
                        width: 194,
                        height: 46,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF3976F8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1000),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0xFF1929FF),
                              blurRadius: 10,
                              offset: Offset(0, 0),
                              spreadRadius: -1,
                            )
                          ],
                        ),
                        child: Center(
                          child: Text(
                            L10n.of(context).renameGroupChannel,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Work Sans',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        width: 79,
                        height: 46,
                        // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                        decoration: ShapeDecoration(
                          color: const Color(0xFFFEF2F2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1000),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0xFF1929FF),
                              blurRadius: 10,
                              offset: Offset(0, 0),
                              spreadRadius: -1,
                            )
                          ],
                        ),
                        child: Center(
                          child: Text(
                           L10n.of(context).cancel,
                            style: TextStyle(
                              color: const Color(0xFFF63D3D),
                              fontSize: 14,
                              fontFamily: 'Work Sans',
                              fontWeight: FontWeight.w700,
                            ),
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
    );
  }


}