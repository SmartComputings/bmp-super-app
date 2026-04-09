import 'dart:ui';

import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:bmp/shared/utils/matrix_sdk_extensions/matrix_locals.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/utils/room_archive_helper.dart';
import 'package:bmp/shared/utils/room_status_extension.dart';
import 'package:bmp/shared/utils/snackbar.dart';
import 'package:bmp/shared/widgets/adaptive_dialogs/show_ok_cancel_alert_dialog.dart';
import 'package:bmp/shared/widgets/avatar.dart';
import 'package:bmp/shared/widgets/future_loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:matrix/matrix.dart';

import '../../../shared/widgets/group_channel_attachment_bottom_sheet.dart';

enum ArchivedRoomAction { delete, rejoin }

class ChatListItem extends StatefulWidget {
  final Room room;
  final Room? space;
  final bool activeChat;
  final void Function(BuildContext context)? onLongPress;
  final void Function(BuildContext context)? onContextMenu;
  final void Function()? onForget;
  final void Function() onTap;
  final String? filter;
  final bool isSelected;
  final bool isSelectionMode;
  final int? itemIndex;
  final bool hasOpenPopup;
  final VoidCallback? onPopupOpen;
  final VoidCallback? onPopupClose;

  const ChatListItem(
    this.room, {
    this.activeChat = false,
    required this.onTap,
    this.onLongPress,
    this.onContextMenu,
    this.onForget,
    this.filter,
    this.space,
    this.isSelected = false,
    this.isSelectionMode = false,
    this.itemIndex, // Add index parameter
    this.hasOpenPopup = false,
    this.onPopupOpen,
    this.onPopupClose,
    super.key,
  });

  @override
  State<ChatListItem> createState() => _ChatListItemState();
}

class _ChatListItemState extends State<ChatListItem>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  // Sliding animation properties
  late AnimationController _slideController;
  double _dragOffset = 0.0;
  double _maxDrag = 0.0;
  bool _isSlideOpen = false;
  final double _maxDragFraction = 0.25;

  @override
  bool get wantKeepAlive => true;
  Future<bool> archiveAction(BuildContext context) async {
    {
      if ([Membership.leave, Membership.ban].contains(room.membership)) {
        final forgetResult = await showFutureLoadingDialog(
          context: context,
          future: () => room.forget(),
        );
        if (forgetResult.isValue) {
          widget.onForget?.call();
        }
        return forgetResult.isValue;
      }
      final confirmed = await showOkCancelAlertDialog(
        context: context,

        title: L10n.of(context).areYouSure,
        okLabel: L10n.of(context).leave,
        cancelLabel: L10n.of(context).cancel,
        message: L10n.of(context).archiveRoomDescription,
        dialogType: DialogType.warning,
      );
      if (confirmed != OkCancelResult.ok) return false;
      final leaveResult = await showFutureLoadingDialog(
        context: context,
        future: () => room.leave(),
      );
      if (leaveResult.isValue) {
        widget.onForget?.call();
      }
      return leaveResult.isValue;
    }
  }

  AnimationController? _scaleController;
  Animation<double>? _scaleAnimation;
  bool _isPressed = false;

  Room get room => widget.room;
  String? get filter => widget.filter;
  Room? get space => widget.space;

  String _formatChatTime(DateTime dateTime) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final messageDate = DateTime(dateTime.year, dateTime.month, dateTime.day);

    if (messageDate == today) {
      // Today: Show only time in 12-hour AM/PM format like WhatsApp
      // return DateFormat('HH:mm').format(dateTime); // 24-hour format commented out
      return DateFormat('h:mm a', 'en_US')
          .format(dateTime); // 12-hour AM/PM format
    } else if (messageDate == yesterday) {
      // Yesterday: Show only "Yesterday"
      return L10n.of(context).yesterday;
    } else {
      // Older dates: Show date format like "16 Oct 2025"
      return DateFormat('d MMM yyyy').format(dateTime);
    }
  }

  @override
  void initState() {
    super.initState();

    // Scale animation for press feedback
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.98,
    ).animate(
      CurvedAnimation(
        parent: _scaleController!,
        curve: Curves.easeOut,
      ),
    );

    // Slide animation controller
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 220),
    );

    // Listen to room state changes for UI updates
    room.onUpdate.stream.listen((_) {
      if (mounted) {
        setState(() {}); // Rebuild when room state changes
      }
    });
  }

  void _markAsRead() async {
    HapticFeedback.mediumImpact();
    
    // Mark the room as read and clear notification count
    try {
      // First, mark the room as not unread
      await room.markUnread(false);
      
      // Then, set read marker to the last event to clear notification count
      final lastEvent = room.lastEvent;
      if (lastEvent != null) {
        await room.setReadMarker(
          lastEvent.eventId,
          mRead: lastEvent.eventId,
        );
      }
      
      // Also post a read receipt for the last event
      if (lastEvent != null) {
        await room.postReceipt(lastEvent.eventId);
      }
    } catch (e) {
      debugPrint('Error marking room as read: $e');
    }
    
    _isSlideOpen = false;
    // Only animate if slide controller is initialized
    try {
      _animateSlideTo(0);
    } catch (e) {
      // Controller not initialized yet, just reset drag offset
      _dragOffset = 0.0;
    }
    // Force UI update after marking as read
    if (mounted) {
      setState(() {});
    }
  }

  // Sliding gesture handlers
  void _handleDragStart(DragStartDetails details) {
    _slideController.stop();
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    setState(() {
      _dragOffset -= details.primaryDelta ?? 0;
      _dragOffset = _dragOffset.clamp(0, _maxDrag);
    });
  }

  void _handleDragEnd(DragEndDetails details) {
    final velocity = details.primaryVelocity ?? 0.0;
    final shouldOpen =
        (velocity < -300) || (_dragOffset >= _maxDrag * 0.35 && velocity <= 0);
    if (shouldOpen) {
      _animateSlideTo(_maxDrag);
      _isSlideOpen = true;
    } else {
      _animateSlideTo(0);
      _isSlideOpen = false;
    }
  }

  void _animateSlideTo(double target) {
    final start = _dragOffset;
    _slideController
      ..reset()
      ..forward();
    _slideController.addListener(() {
      setState(() {
        _dragOffset = lerpDouble(
          start,
          target,
          Curves.easeOutCubic.transform(_slideController.value),
        )!;
      });
    });
  }

  void _showMessageOptions() {
    HapticFeedback.mediumImpact();

    // Notify parent that popup is opening
    widget.onPopupOpen?.call();

    final renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero, ancestor: overlay);

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx + context.screenWidth * 0.6,
        position.dy + context.screenHeight * 0.075,
        position.dx + context.screenWidth,
        position.dy + context.screenHeight * 0.15,
      ),
      color: const Color(0xff262845).withValues(alpha: 0.95),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(context.screenWidth * 0.06)),
      items: [
        if (room.directChatMatrixID == null)
          PopupMenuItem(
            padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.04, vertical: context.screenHeight * 0.01),
            height: context.screenHeight * 0.037,
            value: 'Detail',
            child: _buildMenuItemWithImage(
              "assets/chat_icons/people.png",
              'Details',
            ),
          ),
        PopupMenuItem(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.04, vertical: context.screenHeight * 0.01),
          height: context.screenHeight * 0.037,
          value: 'select',
          child: _buildMenuItemWithImage(
            ImageAssets.checkBox,
            L10n.of(context).select,
          ),
        ),
        PopupMenuItem(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.04, vertical: context.screenHeight * 0.01),
          height: context.screenHeight * 0.037,
          value: 'read',
          child: _buildMenuItemWithImage(
            ImageAssets.chatMessageText,
            room.isUnread
                ? L10n.of(context).markRead
                : L10n.of(context).markUnread,
          ),
        ),
        PopupMenuItem(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.04, vertical: context.screenHeight * 0.01),
          height: context.screenHeight * 0.037,
          value: 'pin',
          child: _buildMenuItemWithImage(
            room.tags.containsKey('m.favourite')
                ? ImageAssets.chatDetailsArchiveTick
                : ImageAssets.chatDetailsArchiveTick,
            room.tags.containsKey('m.favourite')
                ? L10n.of(context).unpin
                : L10n.of(context).pin,
          ),
        ),
        PopupMenuItem(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.04, vertical: context.screenHeight * 0.01),
          height: context.screenHeight * 0.037,
          value: 'mute',
          child: _buildMenuItemWithImage(
            room.pushRuleState == PushRuleState.notify
                ? ImageAssets.chatDetailsVolumeSlash // Volume off (mute icon)
                : ImageAssets.volumeOnimage, // Volume on icon
            room.pushRuleState == PushRuleState.notify
                ? L10n.of(context).muteChat
                : L10n.of(context).unmuteChat,
          ),
        ),
        PopupMenuItem(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.04, vertical: context.screenHeight * 0.01),
          height: context.screenHeight * 0.037,
          value: 'archive',
          child: _buildMenuItemWithImage(
            ImageAssets.chatDetailsArchiveSlash,
            RoomArchiveHelper.isRoomArchived(room)
                ? L10n.of(context).unArchive
                : L10n.of(context).archive,
          ),
        ),
        PopupMenuItem(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.04, vertical: context.screenHeight * 0.01),
          height: context.screenHeight * 0.037,
          value: 'delete',
          child: _buildMenuItemWithImage(
            room.membership == Membership.leave
                ? ImageAssets.chatDetailsTrash
                : ImageAssets.chatDetailsTrash, // Archive/Delete
            L10n.of(context).delete,
          ),
        ),
        if (room.directChatMatrixID != null)
          PopupMenuItem(
            padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.04, vertical: context.screenHeight * 0.01),
            height: context.screenHeight * 0.037,
            value: 'block',
            child: _buildMenuItemWithImage(
              ImageAssets.chatDetailsInfoCircle, // Block User (report-like)
              L10n.of(context).blockUser,
            ),
          ),
      ],
    ).then((value) {
      // Notify parent that popup is closing
      widget.onPopupClose?.call();
      
      if (value != null) {
        switch (value) {
          case 'Detail':
            _showGroupChannels();
            break;
          case 'select':
            widget.onLongPress?.call(context);
            break;
          case 'pin':
            _togglePin();
            break;
          case 'mute':
            _toggleMute();
            break;
          case 'read':
            room.isUnread ? _markAsRead() : room.markUnread(true);
            break;
          case 'archive':
            RoomArchiveHelper.isRoomArchived(room)
                ? _unarchiveRoom()
                : _archiveRoom();
            break;
          case 'delete':
            _deleteRoom();
            break;
          case 'block':
            _blockUser();
            break;
        }
      }
    });
  }

  Widget _buildMenuItem(IconData icon, String label) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.screenHeight * 0.005),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xffC6D4DB), size: context.screenWidth * 0.045),
          SizedBox(width: context.screenWidth * 0.03),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: context.screenWidth * 0.03,
              fontFamily: 'Work Sans',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItemWithImage(String imagePath, String label) {
    return Row(
      children: [
        Image.asset(
          imagePath,
          width: context.screenWidth * 0.05,
          height: context.screenWidth * 0.05,
          color: Colors.white,
        ),
        SizedBox(width: context.screenWidth * 0.03),
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: context.screenWidth * 0.028, // Reduced from 0.035
            fontFamily: 'Open Sans',
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  void _toggleMute() {
    if (room.pushRuleState == PushRuleState.notify) {
      room.setPushRuleState(PushRuleState.dontNotify);
    } else {
      room.setPushRuleState(PushRuleState.notify);
    }
  }

  void _togglePin() {
    final currentTags = room.tags;
    if (currentTags.containsKey('m.favourite')) {
      room.removeTag('m.favourite');
    } else {
      // Count currently pinned chats
      final pinnedCount = room.client.rooms
          .where((r) => r.tags.containsKey('m.favourite'))
          .length;

      if (pinnedCount >= 3) {
       CustomSnackbar.show(
  context,
  title: L10n.of(context).warning,
  message: L10n.of(context).pinLimitMessage,
  type: SnackbarType.warning,
);

        return;
      }

      room.addTag('m.favourite', order: 0.5);
    }
  }

  void _archiveRoom() async {
    try {
      // Archive in background
      await RoomArchiveHelper.archiveRoom(room);
      // Show loading and immediately hide from UI
      widget.onForget?.call();
    } catch (e) {
      // Handle error - could show snackbar
    }
  }

  void _unarchiveRoom() async {
    try {
      await RoomArchiveHelper.unarchiveRoom(room);
      widget.onForget?.call();
    } catch (e) {
      // Handle error
    }
  }

  void _deleteRoom() async {
    try {
      await room.leave();
      widget.onForget?.call();
    } catch (e) {
      // Handle error
    }
  }

  void _showChatInfo() {
    // Navigate to chat info screen
    // Implementation depends on your routing
  }

  void _blockUser() async {
    final userId = room.directChatMatrixID;
    if (userId == null) return;

    try {
      await room.client.ignoreUser(userId);
      if (mounted) {
        // Wait for the next frame to ensure state is updated
        await Future.delayed(const Duration(milliseconds: 100));
        if (mounted) {
          widget.onForget?.call();
        }
      }
    } catch (e) {
      if (mounted) {
      CustomSnackbar.show(
  context,
  title: L10n.of(context).error,
  message: '${L10n.of(context).error}: $e',
  type: SnackbarType.error,
);


      }
    }
  }

  void _reportChat() {
    // Report functionality
    // Implementation depends on your reporting system
  }

  void _showGroupChannels() {
    // Get all child channels of this space/group
    final channels = <AttachmentOption>[];

    // Get space children
    final spaceChildren = room.spaceChildren;

    for (final child in spaceChildren) {
      if (child.roomId == null) continue;
      final childRoom = room.client.getRoomById(child.roomId!);
      if (childRoom != null) {
        final lastEvent = childRoom.lastEvent;
        final hasNotifications = childRoom.notificationCount > 0;

        // Format time
        String? timeStr;
        if (lastEvent != null) {
          timeStr = _formatChatTime(lastEvent.originServerTs);
        }

        // Get last message preview
        var subtitle = 'No messages yet';
        if (lastEvent != null) {
          final body = lastEvent.calcLocalizedBodyFallback(
                MatrixLocals(L10n.of(context)),
                hideReply: true,
                hideEdit: true,
                plaintextBody: true,
                removeMarkdown: true,
                withSenderNamePrefix: true,
              ) ??
              '';
          if (body.isNotEmpty) {
            subtitle = body;
          }
        }

        channels.add(AttachmentOption(
          title:
              '#${childRoom.getLocalizedDisplayname(MatrixLocals(L10n.of(context)))}',
          subtitle: subtitle,
          time: timeStr,
          badgeCount: hasNotifications ? childRoom.notificationCount : null,
          isSelected: false,
          onTap: () {
            Navigator.of(context).pop();
            // Use a slight delay to ensure bottom sheet is closed before navigation
            Future.delayed(const Duration(milliseconds: 100), () {
              context.go('/mainMenuScreen/rooms/${childRoom.id}');
            });
          },
        ),);
      }
    }

    // If no channels found, show empty state
    if (channels.isEmpty) {
      channels.add(AttachmentOption(
        title: 'No channels found',
        subtitle: 'This group has no channels yet',
        time: null,
        badgeCount: null,
        isSelected: false,
      ),);
    }

    GroupChannelAttachmentBottomSheet.show(
      context,
      channels,
      room.getLocalizedDisplayname(MatrixLocals(L10n.of(context))),
      room.avatar,
      '${(room.summary.mInvitedMemberCount ?? 0) + (room.summary.mJoinedMemberCount ?? 0)} Members',
      room,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMuted = room.pushRuleState != PushRuleState.notify;
    final typingText = room.getLocalizedTypingText(context);
    final lastEvent = room.lastEvent;
    final ownMessage = lastEvent?.senderId == room.client.userID;
    final unread = (room.isUnread &&
            (room.notificationCount > 0 || room.hasNewMessages)) ||
        room.membership == Membership.invite;
    final directChatMatrixId = room.directChatMatrixID;
    final isDirectChat = directChatMatrixId != null;
                    final unreadBubbleSize = unread || room.hasNewMessages
        ? room.notificationCount > 0
            ? context.screenWidth * 0.05
            : context.screenWidth * 0.035
        : 0.0;
    final hasNotifications = room.notificationCount > 0;
    const backgroundColor = Colors.transparent;
    var displayname = room.getLocalizedDisplayname(
      MatrixLocals(L10n.of(context)),
    );

    // If displayname is a Matrix ID (e.g. @user:server.com), try to get
    // the actual display name from the room member state instead.
    if (displayname.startsWith('@') && isDirectChat) {
      try {
        final member = room.unsafeGetUserFromMemoryOrFallback(directChatMatrixId);
        if (member.displayName != null && member.displayName!.isNotEmpty) {
          displayname = member.displayName!;
        } else {
          // Strip @ prefix and :server suffix for a cleaner fallback
          displayname = directChatMatrixId.localpart ?? displayname;
        }
      } catch (_) {
        // Fallback: strip the Matrix ID format
        displayname = directChatMatrixId.localpart ?? displayname;
      }
    }

    if (filter != null && !displayname.toLowerCase().contains(filter!)) {
      return const SizedBox.shrink();
    }

    final needLastEventSender = lastEvent == null
        ? false
        : room.getState(EventTypes.RoomMember, lastEvent.senderId) == null;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.04, vertical: context.screenHeight * 0.005),
      child: LayoutBuilder(
        builder: (context, constraints) {
          _maxDrag = (constraints.maxWidth * _maxDragFraction).clamp(0, context.screenWidth * 0.4);
          final dragFraction = _dragOffset / _maxDrag;
          final scale = 1.0 - (0.05 * dragFraction);
          final widthShrink = constraints.maxWidth - _dragOffset;

          return RepaintBoundary(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(context.screenWidth * 0.04),
              clipBehavior: Clip.hardEdge,
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  // BACKGROUND ACTION LAYER
                  Container(
                    height: context.screenHeight * 0.085,
                    decoration: _dragOffset > 0
                        ? const BoxDecoration(
                            // color: Color(0xff3976F8),
                            //           borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                              colors: [Color(0xff222588), Color(0xff3976F8)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          )
                        : null,
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: context.screenWidth * 0.04),
                      child: InkWell(
                        onTap: _markAsRead,
                        borderRadius: BorderRadius.circular(context.screenWidth * 0.075),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: context.screenWidth * 0.035,
                            vertical: context.screenHeight * 0.01,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (_dragOffset > 0) ...[
                                Image.asset(
                                  "assets/icons/message.png",
                                  height: context.screenWidth * 0.05,
                                  width: context.screenWidth * 0.05,
                                ),
                                SizedBox(width: context.screenWidth * 0.015),
                                Text(
                                  L10n.of(context).read,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // FOREGROUND CARD LAYER
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Transform.scale(
                      scale: scale,
                      alignment: Alignment.centerLeft,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(context.screenWidth * 0.04),
                        child: BackdropFilter(
                          filter: _dragOffset > 0
                              ? ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0)
                              : ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                          child: Container(
                            width: widthShrink,
                            height: context.screenHeight * 0.09,
                            decoration: ShapeDecoration(
                              color: widget.hasOpenPopup
                                  ? const Color(0xFF7216BF)
                                  : widget.isSelected
                                      ? const Color(0xFF7216BF)
                                      : const Color(0xff222588),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(context.screenWidth * 0.045),
                              ),
                            ),
                            child: GestureDetector(
                              onHorizontalDragStart: _handleDragStart,
                              onHorizontalDragUpdate: _handleDragUpdate,
                              onHorizontalDragEnd: _handleDragEnd,
                              onTap: _isSlideOpen
                                  ? () {
                                      _animateSlideTo(0);
                                      _isSlideOpen = false;
                                    }
                                  : () {
                                      debugPrint(
                                        'DEBUG: Chat item tapped for room: ${room.id}',
                                      );
                                      widget.onTap();
                                    },
                              onLongPress: () {
                                if (widget.isSelectionMode) {
                                  widget.onLongPress?.call(context);
                                } else {
                                  _showMessageOptions();
                                }
                              },
                              onTapDown: (_) {
                                setState(() => _isPressed = true);
                                _scaleController?.forward();
                              },
                              onTapUp: (_) {
                                setState(() => _isPressed = false);
                                _scaleController?.reverse();
                              },
                              onTapCancel: () {
                                setState(() => _isPressed = false);
                                _scaleController?.reverse();
                              },
                              behavior: HitTestBehavior.opaque,
                              child: AnimatedBuilder(
                                animation: _scaleAnimation ??
                                    const AlwaysStoppedAnimation(1.0),
                                builder: (context, child) {
                                  return Transform.scale(
                                    scale: _scaleAnimation?.value ?? 1.0,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: context.screenWidth * 0.04,
                                        vertical: context.screenHeight * 0.011,
                                      ),
                                      decoration: widget.isSelected
                                          ? BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(context.screenWidth * 0.045),
                                            )
                                          : null,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          // Avatar with online indicator
                                          SizedBox(
                                            width: context.screenWidth * 0.12,
                                            height: context.screenWidth * 0.12,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Container(
                                                  width: context.screenWidth *
                                                      0.12,
                                                  height: context.screenWidth *
                                                      0.12,
                                                  decoration: ShapeDecoration(
                                                    color: const Color.fromARGB(
                                                      255,
                                                      208,
                                                      102,
                                                      250,
                                                    ),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        context.screenWidth *
                                                            0.06,
                                                      ),
                                                    ),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      context.screenWidth *
                                                          0.06,
                                                    ),
                                                    child: Avatar(
                                                      mxContent: room.avatar,
                                                      size:
                                                          context.screenWidth *
                                                              0.12,
                                                      name: displayname,
                                                      presenceUserId:
                                                          directChatMatrixId,
                                                      presenceBackgroundColor:
                                                          backgroundColor,
                                                      isGroup: !isDirectChat,
                                                    ),
                                                  ),
                                                ),
                                                // Selection tick mark or online indicator
                                                if (widget.isSelected)
                                                  Positioned(
                                                    right: 0,
                                                    bottom: 0,
                                                    child: Container(
                                                      width: context.screenWidth * 0.041,
                                                      height: context.screenWidth * 0.041,
                                                      decoration:
                                                          const BoxDecoration(
                                                        color:
                                                            Color(0xFF3976F8),
                                                        shape: BoxShape.circle,
                                                        border: Border
                                                            .fromBorderSide(
                                                          BorderSide(
                                                            color: Color(
                                                              0xFF1B1C30,
                                                            ),
                                                            width: 1,
                                                          ),
                                                        ),
                                                      ),
                                                      child: Icon(
                                                        Icons.check,
                                                        color: Colors.black,
                                                        size: context.screenWidth * 0.03,
                                                      ),
                                                    ),
                                                  )
                                                else if (directChatMatrixId !=
                                                    null)
                                                  Positioned(
                                                    right: 0,
                                                    bottom: 0,
                                                    child: Container(
                                                      width:
                                                          context.screenWidth *
                                                              0.035,
                                                      height:
                                                          context.screenWidth *
                                                              0.035,
                                                      decoration:
                                                          ShapeDecoration(
                                                        color: const Color(
                                                          0xFF23C426,
                                                        ),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          side:
                                                              const BorderSide(
                                                            width: 2,
                                                            color: Color(
                                                              0xFF131016,
                                                            ),
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            context.screenWidth *
                                                                0.0175,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: context.screenWidth * 0.03),
                                          // Title and subtitle container
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                // Title only
                                                Text(
                                                  displayname,
                                                  style: TextStyle(
                                                    color: Color(0xFFF3F3F3),
                                                    fontSize: context.screenWidth * 0.033,
                                                    fontFamily:
                                                        'All Round Gothic',
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),

                                                // Subtitle with status icons
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child:
                                                          FutureBuilder<String>(
                                                        key: ValueKey(
                                                          '${lastEvent?.eventId}_${lastEvent?.type}_${lastEvent?.redacted}',
                                                        ),
                                                        future:
                                                            needLastEventSender
                                                                ? lastEvent
                                                                    .calcLocalizedBody(
                                                                    MatrixLocals(
                                                                      L10n.of(
                                                                        context,
                                                                      ),
                                                                    ),
                                                                    hideReply:
                                                                        true,
                                                                    hideEdit:
                                                                        true,
                                                                    plaintextBody:
                                                                        true,
                                                                    removeMarkdown:
                                                                        true,
                                                                    withSenderNamePrefix:
                                                                        (!isDirectChat ||
                                                                            directChatMatrixId !=
                                                                                room.lastEvent?.senderId),
                                                                  )
                                                                : Future.value(
                                                                    lastEvent
                                                                            ?.calcLocalizedBodyFallback(
                                                                          MatrixLocals(
                                                                            L10n.of(context),
                                                                          ),
                                                                          hideReply:
                                                                              true,
                                                                          hideEdit:
                                                                              true,
                                                                          plaintextBody:
                                                                              true,
                                                                          removeMarkdown:
                                                                              true,
                                                                          withSenderNamePrefix:
                                                                              (!isDirectChat || directChatMatrixId != room.lastEvent?.senderId),
                                                                        ) ??
                                                                        '',
                                                                  ),
                                                        builder: (context,
                                                            snapshot,) {
                                                          var text =
                                                              snapshot.data ??
                                                                  '';
                                                          if (text == L10n.of(context).refreshing &&
                                                              lastEvent != null &&
                                                              ![
                                                                EventTypes.Message,
                                                                EventTypes.Encrypted,
                                                                EventTypes.Sticker,
                                                              ].contains(lastEvent.type)) {
                                                            text = '';
                                                          }
 
                                                          return Text(
                                                            text,
                                                            style:
                                                                TextStyle(
                                                              color: Color(
                                                                0xFFF3F3F3,
                                                              ),
                                                              fontSize: context.screenWidth * 0.025,
                                                              fontFamily:
                                                                  'Work Sans',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: context.screenWidth * 0.02),
                                          // Trailing container with time and icons
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              // Time at top
                                              if (lastEvent != null &&
                                                  room.membership !=
                                                      Membership.invite)
                                                Text(
                                                  _formatChatTime(
                                                    lastEvent.originServerTs,
                                                  ),
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: context.screenWidth * 0.025,
                                                    fontFamily:
                                                        'Plus Jakarta Sans',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              SizedBox(height: context.screenHeight * 0.005),
                                              // Icons row at bottom
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  if (room.tags.containsKey(
                                                    'm.favourite',
                                                  ))
                                                    Image.asset(
                                                      ImageAssets
                                                          .chatDetailsArchiveTick,
                                                      width: context.screenWidth * 0.035,
                                                      color: Colors.white,
                                                    ),
                                                  if (room.tags.containsKey(
                                                        'm.favourite',
                                                      ) &&
                                                      unread)
                                                    SizedBox(width: context.screenWidth * 0.01),
                                                  // Unread indicator - either count or dot
                                                  if (unread)
                                                    Container(
                                                      constraints:
                                                          BoxConstraints(
                                                        minWidth:
                                                            hasNotifications
                                                                ? context.screenWidth * 0.045
                                                                : context.screenWidth * 0.03,
                                                        minHeight:
                                                            hasNotifications
                                                                ? context.screenWidth * 0.045
                                                                : context.screenWidth * 0.03,
                                                      ),
                                                      padding: hasNotifications
                                                          ? EdgeInsets
                                                              .symmetric(
                                                              horizontal: context.screenWidth * 0.01,
                                                              vertical: context.screenHeight * 0.001,
                                                            )
                                                          : EdgeInsets.zero,
                                                      decoration: BoxDecoration(
                                                        color: hasNotifications
                                                            ? const Color
                                                                .fromARGB(
                                                                255,
                                                                237,
                                                                150,
                                                                250,
                                                              )
                                                            : const Color
                                                                .fromARGB(
                                                                255,
                                                                236,
                                                                145,
                                                                250,
                                                              ),
                                                        shape: hasNotifications
                                                            ? BoxShape.rectangle
                                                            : BoxShape.circle,
                                                        borderRadius:
                                                            hasNotifications
                                                                ? BorderRadius
                                                                    .circular(context.screenWidth * 0.0225)
                                                                : null,
                                                      ),
                                                      child: hasNotifications
                                                          ? Center(
                                                              child: Text(
                                                                room.notificationCount
                                                                    .toString(),
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: context.screenWidth * 0.0225,
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            )
                                                          : null,
                                                    ),
                                                  if (isMuted)
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.only(
                                                        left: context.screenWidth * 0.01,
                                                      ),
                                                      child: Image.asset(
                                                        ImageAssets
                                                            .chatDetailsVolumeSlash,
                                                        width: context.screenWidth * 0.035,
                                                        height: context.screenWidth * 0.035,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scaleController?.dispose();
    _slideController.dispose();
    super.dispose();
  }
}
