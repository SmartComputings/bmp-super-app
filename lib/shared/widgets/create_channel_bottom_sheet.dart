import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/widgets/attachment_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';
import 'package:bmp/shared/widgets/avatar.dart';

class CreateChannelBottomSheet extends StatefulWidget {
  final String? groupName;
  final Uri? groupAvatar;
  final String? memberCount;
  final Room? room;
  final Function(String)? onCreate;

  const CreateChannelBottomSheet({
    super.key,
    this.groupName,
    this.groupAvatar,
    this.memberCount,
    this.room,
    this.onCreate,
  });

  @override
  State<CreateChannelBottomSheet> createState() => _CreateChannelBottomSheetState();
}

class _CreateChannelBottomSheetState extends State<CreateChannelBottomSheet> {
  final TextEditingController _channelController = TextEditingController();
  String? _errorMessage;
  bool _isCreating = false;

  @override
  void dispose() {
    _channelController.dispose();
    super.dispose();
  }

  bool _isChannelNameUnique(String channelName) {
    if (widget.room == null) return true;
    
    // Get all existing channels in this space/group
    final existingChannels = widget.room!.spaceChildren;
    
    for (final child in existingChannels) {
      if (child.roomId == null) continue;
      final childRoom = widget.room!.client.getRoomById(child.roomId!);
      if (childRoom != null) {
        final existingName = childRoom.name?.toLowerCase().trim();
        final newName = channelName.toLowerCase().trim();
        if (existingName == newName) {
          return false;
        }
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return AttachmentBottomSheet(
      maxHeight: 310,
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
                    mxContent: widget.groupAvatar,
                    name: widget.groupName ?? 'Group',
                    size: 48,
                    isGroup: true,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 4,
                    children: [
                      Text(
                        widget.groupName ?? 'Group',
                        style: const TextStyle(
                          color: Color(0xFFF3F7F8),
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        widget.memberCount ?? '0 Members',
                        style: const TextStyle(
                          color: Color(0xFFC6D4DB),
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
                    if (widget.room?.tags.containsKey('m.favourite') == true)
                      Image.asset(
                        'assets/images/chat_details/archive-tick.png',
                        width: 18,
                        height: 18,
                        color: Colors.white,
                      ),
                    if (widget.room?.pushRuleState != null && widget.room!.pushRuleState != PushRuleState.notify)
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
          const SizedBox(height: 15),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              spacing: 8,
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
                    controller: _channelController,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      hintText:L10n.of(context).enterChannelName,
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
                // Error message display
                if (_errorMessage != null)
                  Text(
                    _errorMessage!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                Column(
                  spacing: 6,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: _isCreating ? null : () async {
                        final channelName = _channelController.text.trim();
                        
                        if (channelName.isEmpty) {
                          setState(() {
                            _errorMessage = L10n.of(context).channelNameEmpty;
                          });
                          return;
                        }
                        
                        if (!_isChannelNameUnique(channelName)) {
                          setState(() {
                            _errorMessage = L10n.of(context).channelNameExists;
                          });
                          return;
                        }
                        
                        setState(() {
                          _errorMessage = null;
                          _isCreating = true;
                        });
                        
                        await widget.onCreate?.call(channelName);
                        
                        if (mounted) {
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
                          shadows: const [
                             BoxShadow(
                              color: Color(0xFF1929FF),
                              blurRadius: 10,
                              offset: Offset(0, 0),
                              spreadRadius: -1,
                            )
                          ],
                        ),
                        child: _isCreating
                            ? const Center(
                              child: SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                ),
                            )
                            : Center(
                              child: Text(L10n.of(context).createGroupChannel,
                                  style: const TextStyle(
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
                        decoration: ShapeDecoration(
                          color: const Color(0xFFFEF2F2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1000),
                          ),
                          shadows: const [
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
                            style: const TextStyle(
                              color: Color(0xFFF63D3D),
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