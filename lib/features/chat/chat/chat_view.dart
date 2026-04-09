
import 'dart:ui' as ui;

import 'package:badges/badges.dart';
import 'package:bmp/core/config/themes.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/chat/chat/chat.dart';
import 'package:bmp/features/chat/chat/chat_app_bar_list_tile.dart';
import 'package:bmp/features/chat/chat/chat_app_bar_title.dart';
import 'package:bmp/features/chat/chat/chat_event_list.dart';
import 'package:bmp/features/chat/chat/pinned_events.dart';
import 'package:bmp/features/chat/chat/reply_display.dart';
import 'package:bmp/shared/utils/account_config.dart';
import 'package:bmp/shared/utils/localized_exception_extension.dart';
import 'package:bmp/shared/widgets/chat_settings_popup_menu.dart';
import 'package:bmp/shared/widgets/future_loading_dialog.dart';
import 'package:bmp/shared/widgets/hide_keyboard.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:bmp/shared/widgets/message_action_dialog.dart';
import 'package:bmp/shared/widgets/mxc_image.dart';
import 'package:bmp/shared/widgets/unread_rooms_badge.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';

import 'package:bmp/shared/utils/stream_extension.dart';
import 'chat_emoji_picker.dart';
import 'chat_input_row.dart';

enum _EventContextAction { info, report }

class ChatView extends StatefulWidget {
  final ChatController controller;

  const ChatView(this.controller, {super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  ChatController get controller => widget.controller;

  List<Widget> _appBarActions(BuildContext context) {
    if (controller.selectMode) {
      return [
        if (controller.canEditSelectedEvents)
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            tooltip: L10n.of(context).edit,
            onPressed: controller.editSelectedEventAction,
          ),
        IconButton(
          icon: const Icon(Icons.copy_outlined),
          tooltip: L10n.of(context).copy,
          onPressed: controller.copyEventsAction,
        ),
        if (controller.canPinSelectedEvents)
          IconButton(
            icon: const Icon(Icons.push_pin_outlined),
            onPressed: controller.pinEvent,
            tooltip: L10n.of(context).pinMessage,
          ),
        if (controller.canRedactSelectedEvents)
          IconButton(
            icon: const Icon(Icons.delete_outlined),
            tooltip: L10n.of(context).redactMessage,
            onPressed: controller.redactEventsAction,
          ),
        if (controller.selectedEvents.length == 1)
          PopupMenuButton<_EventContextAction>(
            useRootNavigator: true,
            onSelected: (action) {
              switch (action) {
                case _EventContextAction.info:
                  controller.showEventInfo();
                  controller.clearSelectedEvents();
                  break;
                case _EventContextAction.report:
                  controller.reportEventAction();
                  break;
              }
            },
            itemBuilder: (context) => [
              if (controller.canSaveSelectedEvent)
                PopupMenuItem(
                  onTap: () => controller.saveSelectedEvent(context),
                  value: null,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.download_outlined),
                      const SizedBox(width: 12),
                      Text(L10n.of(context).downloadFile),
                    ],
                  ),
                ),
              PopupMenuItem(
                value: _EventContextAction.info,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.info_outlined),
                    const SizedBox(width: 12),
                    Text(L10n.of(context).messageInfo),
                  ],
                ),
              ),
              if (controller.selectedEvents.single.status.isSent)
                PopupMenuItem(
                  value: _EventContextAction.report,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.shield_outlined,
                        color: Colors.red,
                      ),
                      const SizedBox(width: 12),
                      Text(L10n.of(context).reportMessage),
                    ],
                  ),
                ),
            ],
          ),
      ];
    } else if (!controller.room.isArchived) {
      return [
      
        ChatSettingsPopupMenu(controller.room, true),
      ];
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (controller.room.membership == Membership.invite) {
      showFutureLoadingDialog(
        context: context,
        future: () => controller.room.join(),
        exceptionContext: ExceptionContext.joinRoom,
      );
    }
    final bottomSheetPadding = FluffyThemes.isColumnMode(context) ? 16.0 : 8.0;
    final scrollUpBannerEventId = controller.scrollUpBannerEventId;

    final accountConfig = Matrix.of(context).client.applicationAccountConfig;

    return PopScope(
      canPop: controller.selectedEvents.isEmpty && !controller.showEmojiPicker || MediaQuery.of(context).viewInsets.bottom > 0,
      onPopInvokedWithResult: (pop, _) async {
        if (pop) return;
        if (controller.selectedEvents.isNotEmpty) {
          controller.clearSelectedEvents();
        } else if (controller.showEmojiPicker) {
          controller.emojiPickerAction();
        }
      },
      child: StreamBuilder(
        stream: controller.room.client.onRoomState.stream
            .where((update) => update.roomId == controller.room.id)
            .rateLimit(const Duration(seconds: 1)),
        builder: (context, snapshot) {
          var appbarBottomHeight = 0.0;
          if (controller.room.pinnedEventIds.isNotEmpty) {
            appbarBottomHeight += ChatAppBarListTile.fixedHeight;
          }
          if (scrollUpBannerEventId != null) {
            appbarBottomHeight += ChatAppBarListTile.fixedHeight;
          }
          return HideKeyboardOnOutsideTap(
            child: Scaffold(
              appBar: AppBar(
                actionsIconTheme: IconThemeData(
                  color: controller.selectedEvents.isEmpty
                      ? null
                      : theme.colorScheme.onTertiaryContainer,
                ),
                backgroundColor: controller.selectedEvents.isEmpty
                    ? null
                    : theme.colorScheme.tertiaryContainer,
                automaticallyImplyLeading: false,
                leading: controller.selectMode
                    ? IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: controller.clearSelectedEvents,
                        tooltip: L10n.of(context).close,
                        color: theme.colorScheme.onTertiaryContainer,
                      )
                    : FluffyThemes.isColumnMode(context)
                        ? null
                        : StreamBuilder<Object>(
                            stream:
                                Matrix.of(context).client.onSync.stream.where(
                                      (syncUpdate) => syncUpdate.hasRoomUpdate,
                                    ),
                            builder: (context, _) => UnreadRoomsBadge(
                              filter: (r) => r.id != controller.roomId,
                              badgePosition:
                                  BadgePosition.topEnd(end: 8, top: 4),
                              child: Center(
                                child: IconButton(
                                  icon: const Icon(Icons.arrow_back),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                              ),
                            ),
                          ),
                titleSpacing: FluffyThemes.isColumnMode(context) ? 24 : 0,
                title: ChatAppBarTitle(controller),
                actions: _appBarActions(context),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(appbarBottomHeight),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PinnedEvents(controller),
                      if (scrollUpBannerEventId != null)
                        ChatAppBarListTile(
                          leading: IconButton(
                            color: theme.colorScheme.onSurfaceVariant,
                            icon: const Icon(Icons.close),
                            tooltip: L10n.of(context).close,
                            onPressed: () {
                              controller.discardScrollUpBannerEventId();
                              controller.setReadMarker();
                            },
                          ),
                          title: L10n.of(context).jumpToLastReadMessage,
                          trailing: TextButton(
                            onPressed: () {
                              controller.scrollToEventId(
                                scrollUpBannerEventId,
                              );
                              controller.discardScrollUpBannerEventId();
                            },
                            child: Text(L10n.of(context).jump),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.miniCenterFloat,
              floatingActionButton: controller.showScrollDownButton &&
                      controller.selectedEvents.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 56.0),
                      child: FloatingActionButton(
                        onPressed: controller.scrollDown,
                        heroTag: null,
                        mini: true,
                        backgroundColor: theme.colorScheme.surface,
                        foregroundColor: theme.colorScheme.onSurface,
                        child: const Icon(Icons.arrow_downward_outlined),
                      ),
                    )
                  : null,
              body: DropTarget(
                onDragDone: controller.onDragDone,
                onDragEntered: controller.onDragEntered,
                onDragExited: controller.onDragExited,
                child: Stack(
                  children: <Widget>[
                    if (accountConfig.wallpaperUrl != null)
                      Opacity(
                        opacity: accountConfig.wallpaperOpacity ?? 0.5,
                        child: ImageFiltered(
                          imageFilter: ui.ImageFilter.blur(
                            sigmaX: accountConfig.wallpaperBlur ?? 0.0,
                            sigmaY: accountConfig.wallpaperBlur ?? 0.0,
                          ),
                          child: MxcImage(
                            cacheKey: accountConfig.wallpaperUrl.toString(),
                            uri: accountConfig.wallpaperUrl,
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            isThumbnail: false,
                            placeholder: (_) => Container(),
                          ),
                        ),
                      ),
                    SafeArea(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                              onTap: controller.clearSingleSelectedEvent,
                              child: ChatEventList(
                                controller: controller,
                              ),
                            ),
                          ),
                          if (controller.showScrollDownButton)
                            Divider(
                              height: 1,
                              color: theme.dividerColor,
                            ),
                          if (controller.room.isExtinct)
                            Container(
                              margin: EdgeInsets.all(bottomSheetPadding),
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                icon: const Icon(Icons.chevron_right),
                                label: Text(L10n.of(context).enterNewChat),
                                onPressed: controller.goToNewRoomAction,
                              ),
                            )
                          else if (controller.room.canSendDefaultMessages &&
                              controller.room.membership == Membership.join)
                            Container(
                              margin: EdgeInsets.all(bottomSheetPadding),
                              constraints: const BoxConstraints(
                                maxWidth: FluffyThemes.maxTimelineWidth,
                              ),
                              alignment: Alignment.center,
                              child: Material(
                                clipBehavior: Clip.hardEdge,
                                color: controller.selectedEvents.isNotEmpty
                                    ? theme.colorScheme.tertiaryContainer
                                    : theme.colorScheme.surfaceContainerHigh,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(24),
                                ),
                                child: controller.room.isAbandonedDMRoom == true
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          TextButton.icon(
                                            style: TextButton.styleFrom(
                                              padding: const EdgeInsets.all(
                                                16,
                                              ),
                                              foregroundColor:
                                                  theme.colorScheme.error,
                                            ),
                                            icon: const Icon(
                                              Icons.archive_outlined,
                                            ),
                                            onPressed: controller.leaveChat,
                                            label: Text(
                                              L10n.of(context).leave,
                                            ),
                                          ),
                                          TextButton.icon(
                                            style: TextButton.styleFrom(
                                              padding: const EdgeInsets.all(
                                                16,
                                              ),
                                            ),
                                            icon: const Icon(
                                              Icons.forum_outlined,
                                            ),
                                            onPressed: controller.recreateChat,
                                            label: Text(
                                              L10n.of(context).reopenChat,
                                            ),
                                          ),
                                        ],
                                      )
                                    : Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ReplyDisplay(controller),
                                          ChatInputRow(controller),
                                          ChatEmojiPicker(controller),
                                        ],
                                      ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (controller.dragging)
                      Container(
                        color: theme.scaffoldBackgroundColor.withAlpha(230),
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.upload_outlined,
                          size: 100,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void showMessageContextMenu(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      builder: (dialogContext) => Stack(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(dialogContext),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.transparent,
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).size.height * 0.25,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 170,
                  padding: const EdgeInsets.all(8),
                  decoration: ShapeDecoration(
                    color: const Color(0xFF170328),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(dialogContext);
                          if (controller.selectedEvents.isNotEmpty) {
                            controller.room.sendReaction(controller.selectedEvents.first.eventId, '👍');
                          }
                        },
                        child: const Text('👍', style: TextStyle(fontSize: 20)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(dialogContext);
                          if (controller.selectedEvents.isNotEmpty) {
                            controller.room.sendReaction(controller.selectedEvents.first.eventId, '❤');
                          }
                        },
                        child: const Text('❤', style: TextStyle(fontSize: 20)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(dialogContext);
                          if (controller.selectedEvents.isNotEmpty) {
                            controller.room.sendReaction(controller.selectedEvents.first.eventId, '😂');
                          }
                        },
                        child: const Text('😂', style: TextStyle(fontSize: 20)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(dialogContext);
                          if (controller.selectedEvents.isNotEmpty) {
                            controller.room.sendReaction(controller.selectedEvents.first.eventId, '😮');
                          }
                        },
                        child: const Text('😮', style: TextStyle(fontSize: 20)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(dialogContext);
                          if (controller.selectedEvents.isNotEmpty) {
                            controller.room.sendReaction(controller.selectedEvents.first.eventId, '😢');
                          }
                        },
                        child: const Text('😢', style: TextStyle(fontSize: 20)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(dialogContext);
                          controller.emojiPickerAction();
                        },
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF3F3F3).withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Color(0xFFF3F3F3),
                            size: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                MessageActionDialog(
                  actionButtons: [
                    ActionButton(
                      icon: Icons.reply,
                      label: L10n.of(context).reply,
                      onTap: () {
                        Navigator.pop(dialogContext);
                        controller.replyAction();
                      },
                    ),
                    ActionButton(
                      icon: Icons.copy,
                      label: L10n.of(context).copy,
                      onTap: () {
                        Navigator.pop(dialogContext);
                        controller.copyEventsAction();
                      },
                    ),
                    ActionButton(
                      icon: Icons.forward,
                      label: L10n.of(context).forward,
                      onTap: () {
                        Navigator.pop(dialogContext);
                        controller.forwardEventsAction();
                      },
                    ),
                    ActionButton(
                      icon: Icons.star,
                      label: L10n.of(context).favorite,
//                    label:'favourite',
                      onTap: () {
                        Navigator.pop(dialogContext);
                        if (controller.selectedEvents.isNotEmpty) {
                          controller.toggleFavorite(controller.selectedEvents.first);
                        }
                      },
                    ),
                    ActionButton(
                      icon: Icons.info,
                      label: L10n.of(context).messageInfo,
                      onTap: () {
                        Navigator.pop(dialogContext);
                        controller.showEventInfo();
                      },
                    ),
                    if (controller.canPinSelectedEvents)
                      ActionButton(
                        icon: Icons.push_pin,
                        label: L10n.of(context).pin,
                        onTap: () {
                          Navigator.pop(dialogContext);
                          controller.pinEvent();
                        },
                      ),
                    if (controller.canEditSelectedEvents)
                      ActionButton(
                        icon: Icons.edit,
                        label: L10n.of(context).edit,
                        onTap: () {
                          Navigator.pop(dialogContext);
                          controller.editSelectedEventAction();
                        },
                      ),
                    if (controller.canRedactSelectedEvents)
                      ActionButton(
                        icon: Icons.delete,
                        label: L10n.of(context).delete,
                        onTap: () {
                          Navigator.pop(dialogContext);
                          controller.redactEventsAction();
                        },
                      ),
                    ActionButton(
                      icon: Icons.report,
                      label: L10n.of(context).reportMessage,
                      onTap: () {
                        Navigator.pop(dialogContext);
                        controller.reportEventAction();
                      },
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
