import 'dart:async';

import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:bmp/shared/utils/matrix_sdk_extensions/matrix_locals.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/utils/snackbar.dart';
import 'package:bmp/shared/widgets/adaptive_dialogs/show_ok_cancel_alert_dialog.dart';
import 'package:bmp/shared/widgets/create_channel_bottom_sheet.dart';
import 'package:bmp/shared/widgets/future_loading_dialog.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:bmp/shared/widgets/rename_channel_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:matrix/matrix.dart' as matrix_sdk;
import 'package:matrix/matrix.dart' hide Visibility;

enum ChatPopupMenuActions {
  details,
  mute,
  unmute,
  leave,
  search,
  encryption,
  renameChannel,
  createChannel
}

class ChatSettingsPopupMenu extends StatefulWidget {
  final Room room;
  final bool displayChatDetails;

  const ChatSettingsPopupMenu(this.room, this.displayChatDetails, {super.key});

  @override
  ChatSettingsPopupMenuState createState() => ChatSettingsPopupMenuState();
}

class ChatSettingsPopupMenuState extends State<ChatSettingsPopupMenu> {
  StreamSubscription? notificationChangeSub;

  @override
  void dispose() {
    notificationChangeSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    notificationChangeSub ??= Matrix.of(context)
        .client
        .onSync
        .stream
        .where(
          (syncUpdate) =>
              syncUpdate.accountData?.any(
                (accountData) => accountData.type == 'm.push_rules',
              ) ??
              false,
        )
        .listen(
          (u) => setState(() {}),
        );
    return Stack(
      alignment: Alignment.center,
      children: [
        const SizedBox.shrink(),
        PopupMenuButton<ChatPopupMenuActions>(
          useRootNavigator: true,
          offset: Offset(0, context.screenHeight * 0.06),
          color: const Color(0xCC1B1C30),
          constraints: const BoxConstraints(
            minWidth: 0,
            maxWidth: double.infinity,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(context.screenWidth * 0.043),
          ),
          icon: Image.asset(
            ImageAssets.icMore,
            width: context.screenWidth * 0.064,
            height: context.screenHeight * 0.03,
          ),
          onSelected: (choice) async {
            if (!mounted) return;
            switch (choice) {
              case ChatPopupMenuActions.leave:
                final router = GoRouter.of(context);
                final confirmed = await showOkCancelAlertDialog(
                  context: context,
                  title: L10n.of(context).areYouSure,
                  message: L10n.of(context).archiveRoomDescription,
                  okLabel: L10n.of(context).leave,
                  cancelLabel: L10n.of(context).cancel,
                  dialogType: DialogType.warning,
                );
                if (confirmed != OkCancelResult.ok || !mounted) return;
                final result = await showFutureLoadingDialog(
                  context: context,
                  future: () => widget.room.leave(),
                );
                if (result.error == null && mounted) {
                  router.go('/mainMenuScreen/rooms');
                }

                break;
              case ChatPopupMenuActions.mute:
                if (!mounted) return;
                await showFutureLoadingDialog(
                  context: context,
                  future: () =>
                      widget.room.setPushRuleState(PushRuleState.mentionsOnly),
                );
                break;
              case ChatPopupMenuActions.unmute:
                if (!mounted) return;
                await showFutureLoadingDialog(
                  context: context,
                  future: () =>
                      widget.room.setPushRuleState(PushRuleState.notify),
                );
                break;
              case ChatPopupMenuActions.details:
                _showChatDetails();
                break;
              case ChatPopupMenuActions.search:
                context.go('/mainMenuScreen/rooms/${widget.room.id}/search');
                break;
              case ChatPopupMenuActions.encryption:
                context
                    .go('/mainMenuScreen/rooms/${widget.room.id}/encryption');
                break;
              case ChatPopupMenuActions.renameChannel:
                _showRenameChannelBottomSheet();
                break;
              case ChatPopupMenuActions.createChannel:
                _showCreateChannelBottomSheet();
                break;
            }
          },
          itemBuilder: (BuildContext context) => [
            if (widget.displayChatDetails)
              PopupMenuItem<ChatPopupMenuActions>(
                padding: EdgeInsets.symmetric(
                  horizontal: context.screenWidth * 0.043,
                  vertical: context.screenHeight * 0.012,
                ),
                value: ChatPopupMenuActions.details,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  Image.asset(
                      "assets/chat_icons/people.png",
                      height: context.screenHeight * 0.026,
                      width: context.screenWidth * 0.055,
                      color: Colors.white,
                    ),
                    SizedBox(width: context.screenWidth * 0.032),
                    Text(
                      L10n.of(context).chatDetails,
                      style: TextStyle(
                          fontFamily: 'Work Sans',
                          color: const Color(0xFFF3F7F8),
                          fontSize: context.screenWidth * 0.035),
                    ),
                  ],
                ),
              ),
            if (widget.room.pushRuleState == PushRuleState.notify)
              PopupMenuItem<ChatPopupMenuActions>(
                padding: EdgeInsets.symmetric(
                  horizontal: context.screenWidth * 0.043,
                  vertical: context.screenHeight * 0.012,
                ),
                value: ChatPopupMenuActions.mute,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      ImageAssets.chatDetailsVolumeSlash,
                      height: context.screenHeight * 0.026,
                      width: context.screenWidth * 0.055,
                      color: Colors.white,
                    ),
                    SizedBox(width: context.screenWidth * 0.032),
                    Text(
                      L10n.of(context).muteChat,
                      style: TextStyle(
                          fontFamily: 'Work Sans',
                          color: const Color(0xFFF3F7F8),
                          fontSize: context.screenWidth * 0.035),
                    ),
                  ],
                ),
              )
            else
              PopupMenuItem<ChatPopupMenuActions>(
                padding: EdgeInsets.symmetric(
                  horizontal: context.screenWidth * 0.043,
                  vertical: context.screenHeight * 0.012,
                ),
                value: ChatPopupMenuActions.unmute,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
            Image.asset(
                      ImageAssets.volumeOnimage,
                      height: context.screenHeight * 0.026,
                      width: context.screenWidth * 0.055,
                      color: Colors.white,
                    ),
                    SizedBox(width: context.screenWidth * 0.032),
                    Text(
                      L10n.of(context).unmuteChat,
                      style: TextStyle(
                          fontFamily: 'Work Sans',
                          color: const Color(0xFFF3F7F8),
                          fontSize: context.screenWidth * 0.035),
                    ),
                  ],
                ),
              ),
            PopupMenuItem<ChatPopupMenuActions>(
              padding: EdgeInsets.symmetric(
                horizontal: context.screenWidth * 0.043,
                vertical: context.screenHeight * 0.012,
              ),
              value: ChatPopupMenuActions.search,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.search_outlined,
                    size: context.screenWidth * 0.055,
                  ),
                  SizedBox(width: context.screenWidth * 0.032),
                  Text(
                    L10n.of(context).search,
                    style: TextStyle(
                          fontFamily: 'Work Sans',
                          color: const Color(0xFFF3F7F8),
                          fontSize: context.screenWidth * 0.035),
                  ),
                ],
              ),
            ),
            if (!widget.room.isDirectChat)
              PopupMenuItem<ChatPopupMenuActions>(
                padding: EdgeInsets.symmetric(
                  horizontal: context.screenWidth * 0.043,
                  vertical: context.screenHeight * 0.012,
                ),
                value: ChatPopupMenuActions.renameChannel,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/icons/rename_channel.png",
                      height: context.screenHeight * 0.026,
                      width: context.screenWidth * 0.055,
                      color: Colors.white,
                    ),
                    SizedBox(width: context.screenWidth * 0.032),
                    Text(
                      L10n.of(context).renameChannel,
                      style: TextStyle(
                          fontFamily: 'Work Sans',
                          color: const Color(0xFFF3F7F8),
                          fontSize: context.screenWidth * 0.035),
                    ),
                  ],
                ),
              ),
            if (!widget.room.isDirectChat &&
                widget.room.canSendDefaultMessages &&
                widget.room.isSpace)
              PopupMenuItem<ChatPopupMenuActions>(
                padding: EdgeInsets.symmetric(
                  horizontal: context.screenWidth * 0.043,
                  vertical: context.screenHeight * 0.012,
                ),
                value: ChatPopupMenuActions.createChannel,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/icons/create_channel.png",
                      height: context.screenHeight * 0.026,
                      width: context.screenWidth * 0.055,
                      color: Colors.white,
                    ),
                    SizedBox(width: context.screenWidth * 0.032),
                    Text(
                      L10n.of(context).createChannel,
                      style: TextStyle(
                          fontFamily: 'Work Sans',
                          color: const Color(0xFFF3F7F8),
                          fontSize: context.screenWidth * 0.035),
                    ),
                  ],
                ),
              ),
            PopupMenuItem<ChatPopupMenuActions>(
              padding: EdgeInsets.symmetric(
                horizontal: context.screenWidth * 0.043,
                vertical: context.screenHeight * 0.012,
              ),
              value: ChatPopupMenuActions.encryption,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    widget.room.encrypted
                        ? Icons.lock_outlined
                        : Icons.lock_open_outlined,
                        size: context.screenWidth * 0.055,
                  ),
                  SizedBox(width: context.screenWidth * 0.032),
                  Text(
                    widget.room.encrypted
                        ? L10n.of(context).encrypted
                        : L10n.of(context).encryptionNotEnabled,
                    style: TextStyle(
                          fontFamily: 'Work Sans',
                          color: const Color(0xFFF3F7F8),
                          fontSize: context.screenWidth * 0.035),
                  ),
                ],
              ),
            ),
            PopupMenuItem<ChatPopupMenuActions>(
              padding: EdgeInsets.symmetric(
                horizontal: context.screenWidth * 0.043,
                vertical: context.screenHeight * 0.012,
              ),
              value: ChatPopupMenuActions.leave,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                 SvgPicture.asset(
                  ImageAssets.leave,
                  height: context.screenHeight * 0.026,
                  width: context.screenWidth * 0.055,
                 ),
                  SizedBox(width: context.screenWidth * 0.032),
                  Text(
                    L10n.of(context).leave,
                    style: TextStyle(
                          fontFamily: 'Work Sans',
                          color: const Color(0xFFF3F7F8),
                          fontSize: context.screenWidth * 0.035),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _showChatDetails() {
    if (GoRouterState.of(context).uri.path.endsWith('/details')) {
      context.go('/mainMenuScreen/rooms/${widget.room.id}');
    } else {
      context.go('/mainMenuScreen/rooms/${widget.room.id}/details');
    }
  }

  void _showRenameChannelBottomSheet() {
    final actualMembersCount = (widget.room.summary.mInvitedMemberCount ?? 0) +
        (widget.room.summary.mJoinedMemberCount ?? 0);

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: RenameChannelBottomSheet(
          channelName: widget.room
              .getLocalizedDisplayname(MatrixLocals(L10n.of(context))),
          channelAvatar: widget.room.avatar,
          memberCount: '$actualMembersCount Members',
          channelRoom: widget.room,
          onRename: (newName) async {
            if (!mounted) return;
            await showFutureLoadingDialog(
              context: context,
              future: () => widget.room.setName(newName),
            );
          },
        ),
      ),
    );
  }

  void _showCreateChannelBottomSheet() {
    final actualMembersCount = (widget.room.summary.mInvitedMemberCount ?? 0) +
        (widget.room.summary.mJoinedMemberCount ?? 0);

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: CreateChannelBottomSheet(
          groupName: widget.room
              .getLocalizedDisplayname(MatrixLocals(L10n.of(context))),
          groupAvatar: widget.room.avatar,
          memberCount: '$actualMembersCount Members',
          room: widget.room,
          onCreate: (channelName) async {
            if (!mounted) return;
            final client = Matrix.of(context).client;

            // Find the parent space (General) instead of current room
            var parentSpace = widget.room;

            // If current room is a channel, find its parent space
            final parentEvents = widget.room.states['m.space.parent'];
            if (parentEvents != null && parentEvents.isNotEmpty) {
              final parentId = parentEvents.keys.first;
              final parentRoom = client.getRoomById(parentId);
              if (parentRoom != null) {
                parentSpace = parentRoom;
              }
            }

            // final result = await showFutureLoadingDialog(
            //   context: context,
            //   future: () async {
            // 1. Create the channel (room)
            final newRoomId = await client.createRoom(
              name: channelName,
              preset: parentSpace.joinRules == JoinRules.public
                  ? matrix_sdk.CreateRoomPreset.publicChat
                  : matrix_sdk.CreateRoomPreset.privateChat,
              visibility: parentSpace.joinRules == JoinRules.public
                  ? matrix_sdk.Visibility.public
                  : matrix_sdk.Visibility.private,
            );

            // 2. Link Parent -> Child (m.space.child in Parent)
            await parentSpace.setSpaceChild(newRoomId);

            // 3. Link Child -> Parent (m.space.parent in Child)
            final domain = client.userID?.split(':').last ?? '';

            await client.setRoomStateWithKey(
              newRoomId,
              'm.space.parent',
              parentSpace.id,
              {
                'via': [domain],
                'canonical': true
              },
            );

            // return newRoomId;
            //   },
            // );

            if (mounted) {
              CustomSnackbar.show(
                context,
                message: L10n.of(context).channelCreatedSuccess,
                type: SnackbarType.success,
              );
            }
          },
        ),
      ),
    );
  }
}
