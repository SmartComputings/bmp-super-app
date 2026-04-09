import 'dart:ui' as ui;
import 'dart:ui';

import 'package:bmp/core/config/themes.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/Screens/OnBoardingScreen/widgets/message_action_dialog.dart';
import 'package:bmp/features/chat/chat/chat.dart';
import 'package:bmp/features/chat/chat/chat_app_bar_list_tile.dart';
import 'package:bmp/features/chat/chat/chat_event_list.dart';
import 'package:bmp/features/chat/chat/encryption_button.dart';
import 'package:bmp/features/chat/chat/pinned_events.dart';
import 'package:bmp/features/chat/chat/reply_display.dart';
import 'package:bmp/features/chat/chat/widgets/empty_conversation_screen.dart';
import 'package:bmp/shared/utils/account_config.dart';
import 'package:bmp/shared/utils/app_loading_widget.dart';
import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:bmp/shared/utils/localized_exception_extension.dart';
import 'package:bmp/shared/utils/matrix_sdk_extensions/matrix_locals.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/utils/stream_extension.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/bg_gradient_theme.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/constants/position_constants.dart';
import 'package:bmp/shared/widgets/avatar.dart';
import 'package:bmp/shared/widgets/chat_settings_popup_menu.dart';
import 'package:bmp/shared/widgets/future_loading_dialog.dart';
import 'package:bmp/shared/widgets/hide_keyboard.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:bmp/shared/widgets/mxc_image.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matrix/matrix.dart';

import 'chat_emoji_picker.dart';
import 'chat_input_row.dart';

enum _EventContextAction { info, report }

class NewChatView extends StatefulWidget {
  final ChatController controller;

  const NewChatView(this.controller, {super.key});

  @override
  State<NewChatView> createState() => _NewChatViewState();
}

class _NewChatViewState extends State<NewChatView> {
  ChatController get controller => widget.controller;
  String _selectedTab = 'General';
  bool _isDialogOpen = false;
  String _getAvailableText() {
    final locale = Localizations.localeOf(context).languageCode;
    return locale == 'es' ? 'Disponible' : 'Available';
  }

  String _getInfoText() {
    final locale = Localizations.localeOf(context).languageCode;
    return locale == 'es' ? 'Información' : 'Info';
  }

  String _getReportText() {
    final locale = Localizations.localeOf(context).languageCode;
    return locale == 'es' ? 'Reportar' : 'Report';
  }

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
            icon: Icon(
              controller.selectedEvents.every((event) => 
                controller.room.pinnedEventIds.contains(event.eventId)
              ) 
                ? Icons.push_pin 
                : Icons.push_pin_outlined,
            ),
            onPressed: controller.pinEvent,
            tooltip: controller.selectedEvents.every((event) => 
              controller.room.pinnedEventIds.contains(event.eventId)
            )
              ? L10n.of(context).unpin
              : L10n.of(context).pinMessage,
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
        EncryptionButton(controller.room),
        ChatSettingsPopupMenu(controller.room, true),
      ];
    }
    return [];
  }

  bool _hasShownDialog = false;

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
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) return;

        // Check if there's any dialog open in the navigator
        if (Navigator.of(context, rootNavigator: false).canPop()) {
          Navigator.of(context, rootNavigator: false).pop();
          return;
        }

        // If no dialog, proceed with normal back navigation
        Navigator.of(context).pop();
      },
      child: Container(
        // canPop:
        //     controller.selectedEvents.isEmpty && !controller.showEmojiPicker ||
        //         MediaQuery.of(context).viewInsets.bottom > 0,
        // onPopInvokedWithResult: (pop, _) async {
        //   if (pop) return;
        //   if (controller.selectedEvents.isNotEmpty) {
        //     controller.clearSelectedEvents();
        //   } else if (controller.showEmojiPicker) {
        //     controller.emojiPickerAction();
        //   }
        // },
        // canPop: true,
        // onPopInvokedWithResult: (didPop, result) {
        //   debugPrint("=====onPopInvokedWithResult==1===");
        //   if (didPop) return;
        //   if (Navigator.of(context).canPop()) {
        //     debugPrint("=====onPopInvokedWithResult==2===");
        //
        //     Navigator.of(context).pop();
        //   } else {
        //     debugPrint("=====onPopInvokedWithResult==3===");
        //     context.go('/mainMenuScreen');
        //   }
        // },
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
                resizeToAvoidBottomInset: true,
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.miniCenterFloat,
                floatingActionButton: controller.showScrollDownButton &&
                        controller.selectedEvents.isEmpty
                    ? Padding(
                        padding: EdgeInsets.only(
                            bottom: context.screenHeight * 0.07),
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
                      Container(
                        color: const Color(0xFF1B1C30),
                      ),
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
                      BgGradientTheme(
                        position: ShapePosition.center,
                        width: context.percentWidth * 170,
                        height: context.percentHeight * 85,
                        color: const Color(0x994754FF),
                        opacity: 0.6,
                      ),
                      BgGradientTheme(
                        position: ShapePosition.bottomFull,
                        height: context.percentHeight * 27,
                        colors: const [Color(0xFF1B1E43), Color(0xFF1B1E43)],
                        opacity: 1,
                      ),
                      BgGradientTheme(
                        position: ShapePosition.bottomLeft,
                        height: context.percentHeight * 26,
                        color: const ui.Color.fromARGB(122, 27, 30, 67),
                        opacity: 1,
                      ),
                      BgGradientTheme(
                        position: ShapePosition.bottomRight,
                        height: context.percentHeight *35,
                        width: context.percentWidth*50,
                        gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Color(0xFF1B1E43), ui.Color.fromARGB(132, 129, 21, 191)],
                        ),
                        opacity: 1,
                      ),
                      BgGradientTheme(
                        position: ShapePosition.bottomCenter,
                        height: context.percentHeight * 12.5,
                        color: const ui.Color.fromARGB(123, 27, 28, 48),
                        opacity: 0.8,
                      ),
                      BgGradientTheme(
                        position: ShapePosition.topFull,
                        height: context.percentHeight * 12,
                        colors: const [Color(0xFF1B1E43), Color(0xFF1B1E43)],
                        opacity: 1,
                      ),
                      BgGradientTheme(
                        position: ShapePosition.topLeft,
                        height: context.percentHeight * 20,
                        color: const Color(0xFF1B1E43),
                        opacity: 1,
                      ),
                      BgGradientTheme(
                        position: ShapePosition.topRight,
                        height: context.percentHeight * 20,
                        color: const Color(0xFF1B1E43),
                        opacity: 1,
                      ),
                      BgGradientTheme(
                        position: ShapePosition.topCenter,
                        height: context.percentHeight * 12.5,
                        color: const Color(0xFF1B1C30),
                        opacity: 0.8,
                      ),
                      BgGradientTheme(
                        position: ShapePosition.topLeft,
                        width: context.percentWidth * 50,
                        height: context.percentHeight * 15,
                        color: Colors.black,
                        opacity: 0.3,
                      ),
                      BgGradientTheme(
                        position: ShapePosition.topRight,
                        width: context.percentWidth * 50,
                        height: context.percentHeight * 15,
                        color: Colors.black,
                        opacity: 0.3,
                      ),
                     
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 85, sigmaY: 85),
                        child: Container(color: Colors.transparent),
                      ),  Positioned.fill(
                        child: Image.asset(
                          'assets/icons/patron 1.png',
                          fit: BoxFit.cover,
                          color: const ui.Color.fromARGB(255, 10, 6, 68).withOpacity(0.4),
                          colorBlendMode: BlendMode.srcIn,
                        ),
                      ),
                      SafeArea(
                        child: Column(
                          children: <Widget>[
                            _buildHeader(
                              context,
                              appbarBottomHeight,
                              scrollUpBannerEventId,
                              isGroup:
                                  controller.room.directChatMatrixID == null,
                            ),
                            _buildPinnedEventsAndBanner(
                              context,
                              scrollUpBannerEventId,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: controller.clearSingleSelectedEvent,
                                child: _buildChatMessages(context),
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
                              _buildInputField(
                                context,
                                bottomSheetPadding,
                                theme,
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
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    double appbarBottomHeight,
    String? scrollUpBannerEventId, {
    bool isGroup = false,
  }) {
    final room = controller.room;
    final otherUsFer = room.directChatMatrixID != null
        ? room.unsafeGetUserFromMemoryOrFallback(room.directChatMatrixID!)
        : null;
    final displayname = room.getLocalizedDisplayname(
      MatrixLocals(L10n.of(context)),
    );

    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          SizedBox(height: context.screenHeight * 0.012),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: context.screenWidth * 0.027),
            child: Container(
              decoration: BoxDecoration(
                color: (isGroup &&
                        !(controller.selectMode &&
                            controller.selectedEvents.length > 1))
                    ? const Color(0x7FA912BF).withValues(alpha: 0.4)
                    : const Color(0xFF222870),
                border: (isGroup &&
                        !(controller.selectMode &&
                            controller.selectedEvents.length > 1))
                    ? Border.all(
                        color: const Color(0xFFA912BF),
                        width: context.screenWidth * 0.0027)
                    : Border.all(
                        color: const Color(0x7F131EBF),
                        width: context.screenWidth * 0.0027),
                borderRadius: BorderRadius.circular(isGroup
                    ? context.screenWidth * 0.048
                    : context.screenWidth * 0.04),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(isGroup
                    ? context.screenWidth * 0.048
                    : context.screenWidth * 0.04),
                child: (isGroup &&
                        !(controller.selectMode &&
                            controller.selectedEvents.length > 1))
                    ? BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: context.screenWidth * 0.021),
                          child: isGroup
                              ? Column(
                                  children: [
                                    SizedBox(
                                      height: context.screenHeight * 0.08,
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: controller.selectMode
                                                ? controller.clearSelectedEvents
                                                : () =>
                                                    Navigator.of(context).pop(),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: context.screenWidth *
                                                      0.027),
                                              child: Image.asset(
                                                controller.selectMode
                                                    ? "assets/icons/close-circle.png"
                                                    : ImageAssets.arrowLeft,
                                                width:
                                                    context.screenWidth * 0.09,
                                                height:
                                                    context.screenHeight * 0.05,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: context.screenWidth * 0.03,
                                          ),

                                          // Selection count - show when more than one selected
                                          if (controller.selectMode &&
                                              controller.selectedEvents.length >
                                                  1)
                                            Text(
                                              '${controller.selectedEvents.length}',
                                              style: TextStyle(
                                                color: Color(0xff3976F8),
                                                fontSize:
                                                    context.screenWidth * 0.043,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          if (controller.selectMode &&
                                              controller.selectedEvents.length >
                                                  1)
                                            SizedBox(
                                                width: context.screenWidth *
                                                    0.032),

                                          // Profile picture - hide in select mode with multiple selections
                                          if (!(controller.selectMode &&
                                              controller.selectedEvents.length >
                                                  1))
                                            GestureDetector(
                                              onTap: () {
                                                context.go(
                                                    '/mainMenuScreen/rooms/${room.id}/details');
                                              },
                                              child: Container(
                                                width:
                                                    context.screenWidth * 0.08,
                                                height:
                                                    context.screenWidth * 0.08,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: Colors.white
                                                        .withOpacity(0.2),
                                                    width: context.screenWidth *
                                                        0.0027,
                                                  ),
                                                ),
                                                child: ClipOval(
                                                  child: Avatar(
                                                    mxContent: room.avatar,
                                                    size: context.screenWidth *
                                                        0.08,
                                                    name: displayname ??
                                                        room.name,
                                                    isGroup:
                                                        room.directChatMatrixID ==
                                                            null,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          if (!(controller.selectMode &&
                                              controller.selectedEvents.length >
                                                  1))
                                            SizedBox(
                                                width: context.screenWidth *
                                                    0.032),

                                          // Name and status - hide in select mode with multiple selections
                                          if (!(controller.selectMode &&
                                              controller.selectedEvents.length >
                                                  1))
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  context.go(
                                                      '/mainMenuScreen/rooms/${room.id}/details');
                                                },
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      displayname ?? room.name,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: context
                                                                .screenWidth *
                                                            0.0288,
                                                        fontFamily:
                                                            ' Montserrat',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        letterSpacing: 0.2,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: context
                                                                .screenHeight *
                                                            0.0025),
                                                    Text(
                                                      isGroup
                                                          ? L10n.of(context)
                                                              .countMembers(
                                                              (room.summary
                                                                          .mInvitedMemberCount ??
                                                                      0) +
                                                                  (room.summary
                                                                          .mJoinedMemberCount ??
                                                                      0),
                                                            )
                                                          : _getAvailableText(),
                                                      style: TextStyle(
                                                        color: Colors.white70,
                                                        fontSize: context
                                                                .screenWidth *
                                                            0.027,
                                                        fontFamily: 'Neometric',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          else
                                            const Spacer(),

                                          // Action buttons - show select mode actions when multiple messages selected
                                          if (controller.selectMode &&
                                              controller.selectedEvents.length >
                                                  1)
                                            Row(
                                              children: [
                                                IconButton(
                                                  onPressed: controller
                                                      .copyEventsAction,
                                                  icon: Image.asset(
                                                    'assets/images/icons/copy.png',
                                                    height:
                                                        context.screenHeight *
                                                            0.03,
                                                    width: context.screenWidth *
                                                        0.064,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                IconButton(
                                                  onPressed: controller
                                                      .forwardEventsAction,
                                                  icon: Image.asset(
                                                    'assets/images/icons/forward.png',
                                                    height:
                                                        context.screenHeight *
                                                            0.03,
                                                    width: context.screenWidth *
                                                        0.064,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                if (controller
                                                    .canPinSelectedEvents)
                                                  IconButton(
                                                    onPressed:
                                                        controller.pinEvent,
                                                    icon: Image.asset(
                                                      'assets/images/icons/archive-tick.png',
                                                      height:
                                                          context.screenHeight *
                                                              0.03,
                                                      width:
                                                          context.screenWidth *
                                                              0.064,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                if (controller
                                                    .canRedactSelectedEvents)
                                                  IconButton(
                                                    onPressed: controller
                                                        .redactEventsAction,
                                                    icon: Image.asset(
                                                      'assets/images/icons/trash.png',
                                                      height:
                                                          context.screenHeight *
                                                              0.03,
                                                      width:
                                                          context.screenWidth *
                                                              0.064,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                PopupMenuButton(
                                                  icon: Image.asset(
                                                    'assets/images/icons/info-circle.png',
                                                    height:
                                                        context.screenHeight *
                                                            0.03,
                                                    width: context.screenWidth *
                                                        0.064,
                                                    color: Colors.white,
                                                  ),
                                                  itemBuilder: (context) => [
                                                    PopupMenuItem(
                                                      onTap: controller
                                                          .showEventInfo,
                                                      child:
                                                          Text(_getInfoText()),
                                                    ),
                                                    PopupMenuItem(
                                                      onTap: controller
                                                          .reportEventAction,
                                                      child: Text(
                                                          _getReportText()),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          else
                                            Row(
                                              children: [
                                                if (room.isDirectChat) ...[
                                                  _buildActionButton(
                                                    imagePath:
                                                        ImageAssets.videoCall,
                                                    onTap: controller
                                                        .startVideoCall,
                                                  ),
                                                  SizedBox(
                                                      width:
                                                          context.screenWidth *
                                                              0.043),
                                                  _buildActionButton(
                                                    imagePath:
                                                        ImageAssets.voiceCall,
                                                    onTap: controller
                                                        .onPhoneButtonTap,
                                                  ),
                                                  SizedBox(
                                                      width:
                                                          context.screenWidth *
                                                              0.043),
                                                ],
                                                ChatSettingsPopupMenu(
                                                    controller.room, true),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ),
                                    if (!(controller.selectMode &&
                                        controller.selectedEvents.length > 1))
                                      _buildGroupOptionsSection(),
                                  ],
                                )
                              : SizedBox(
                                  height: context.screenHeight * 0.08,
                                  child: Row(
                                    children: [
                                      // Back button or Close button for selection mode
                                      GestureDetector(
                                        onTap: controller.selectMode
                                            ? controller.clearSelectedEvents
                                            : () => Navigator.of(context).pop(),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left:
                                                  context.screenWidth * 0.027),
                                          child: Image.asset(
                                            controller.selectMode
                                                ? "assets/icons/close-circle.png"
                                                : ImageAssets.arrowLeft,
                                            width: context.screenWidth * 0.09,
                                            height: context.screenHeight * 0.05,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          width: context.screenWidth * 0.016),

                                      // Selection count - show when more than one selected
                                      if (controller.selectMode &&
                                          controller.selectedEvents.length > 1)
                                        Text(
                                          '${controller.selectedEvents.length}',
                                          style: TextStyle(
                                            color: Color(0xff3976F8),
                                            fontSize:
                                                context.screenWidth * 0.043,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      if (controller.selectMode &&
                                          controller.selectedEvents.length > 1)
                                        SizedBox(
                                            width: context.screenWidth * 0.032),

                                      // Profile picture - hide in select mode with multiple selections
                                      if (!(controller.selectMode &&
                                          controller.selectedEvents.length > 1))
                                        GestureDetector(
                                          onTap: () {
                                            context.go(
                                                '/mainMenuScreen/rooms/${room.id}/details');
                                          },
                                          child: Container(
                                            width: context.screenWidth * 0.107,
                                            height: context.screenWidth * 0.107,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.white
                                                    .withOpacity(0.2),
                                                width: context.screenWidth *
                                                    0.0027,
                                              ),
                                            ),
                                            child: ClipOval(
                                              child: Avatar(
                                                mxContent: room.avatar,
                                                size:
                                                    context.screenWidth * 0.107,
                                                name: displayname ?? room.name,
                                                isGroup:
                                                    room.directChatMatrixID ==
                                                        null,
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (!(controller.selectMode &&
                                          controller.selectedEvents.length > 1))
                                        SizedBox(
                                            width: context.screenWidth * 0.032),

                                      // Name and status - hide in select mode with multiple selections
                                      if (!(controller.selectMode &&
                                          controller.selectedEvents.length > 1))
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              context.go(
                                                  '/mainMenuScreen/rooms/${room.id}/details');
                                            },
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  displayname ?? room.name,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize:
                                                        context.screenWidth *
                                                            0.0387,
                                                    fontWeight: FontWeight.w700,
                                                    letterSpacing: 0.2,
                                                  ),
                                                ),
                                                SizedBox(
                                                    height:
                                                        context.screenHeight *
                                                            0.0025),
                                                Text(
                                                  _getAvailableText(),
                                                  style: TextStyle(
                                                    color: Colors.white70,
                                                    fontSize:
                                                        context.screenWidth *
                                                            0.027,
                                                    fontFamily: 'Neometric',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      else
                                        const Spacer(),

                                      // Action buttons - show select mode actions when multiple messages selected
                                      if (controller.selectMode &&
                                          controller.selectedEvents.length > 1)
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed:
                                                  controller.copyEventsAction,
                                              icon: Image.asset(
                                                'assets/images/icons/copy.png',
                                                height:
                                                    context.screenHeight * 0.03,
                                                width:
                                                    context.screenWidth * 0.064,
                                                color: Colors.white,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: controller
                                                  .forwardEventsAction,
                                              icon: Image.asset(
                                                'assets/images/icons/forward.png',
                                                height:
                                                    context.screenHeight * 0.03,
                                                width:
                                                    context.screenWidth * 0.064,
                                                color: Colors.white,
                                              ),
                                            ),
                                            if (controller.canPinSelectedEvents)
                                              IconButton(
                                                onPressed: controller.pinEvent,
                                                icon: Image.asset(
                                                  'assets/images/icons/archive-tick.png',
                                                  height: context.screenHeight *
                                                      0.03,
                                                  width: context.screenWidth *
                                                      0.064,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            if (controller
                                                .canRedactSelectedEvents)
                                              IconButton(
                                                onPressed: controller
                                                    .redactEventsAction,
                                                icon: Image.asset(
                                                  'assets/images/icons/trash.png',
                                                  height: context.screenHeight *
                                                      0.03,
                                                  width: context.screenWidth *
                                                      0.064,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            PopupMenuButton(
                                              icon: Image.asset(
                                                'assets/images/icons/info-circle.png',
                                                height:
                                                    context.screenHeight * 0.03,
                                                width:
                                                    context.screenWidth * 0.064,
                                                color: Colors.white,
                                              ),
                                              itemBuilder: (context) => [
                                                PopupMenuItem(
                                                  onTap:
                                                      controller.showEventInfo,
                                                  child: Text(_getInfoText()),
                                                ),
                                                PopupMenuItem(
                                                  onTap: controller
                                                      .reportEventAction,
                                                  child: Text(_getReportText()),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      else
                                        Row(
                                          children: [
                                            if (room.isDirectChat) ...[
                                              _buildActionButton(
                                                imagePath:
                                                    ImageAssets.videoCall,
                                                onTap:
                                                    controller.onPhoneButtonTap,
                                              ),
                                              SizedBox(
                                                  width: context.screenWidth *
                                                      0.043),
                                              _buildActionButton(
                                                imagePath:
                                                    ImageAssets.voiceCall,
                                                onTap:
                                                    controller.onPhoneButtonTap,
                                              ),
                                              SizedBox(
                                                  width: context.screenWidth *
                                                      0.043),
                                            ],
                                            ChatSettingsPopupMenu(
                                                controller.room, true),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                        ),
                      )
                    : Container(
                        child: isGroup
                            ? Column(
                                children: [
                                  SizedBox(
                                    height: context.screenHeight * 0.08,
                                    child: Row(
                                      children: [
                                        // Back button or Close button for selection mode
                                        GestureDetector(
                                          onTap: controller.selectMode
                                              ? controller.clearSelectedEvents
                                              : () =>
                                                  Navigator.of(context).pop(),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: context.screenWidth *
                                                    0.027),
                                            child: Image.asset(
                                              controller.selectMode
                                                  ? "assets/icons/close-circle.png"
                                                  : ImageAssets.arrowLeft,
                                              width: context.screenWidth * 0.09,
                                              height:
                                                  context.screenHeight * 0.05,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: context.screenWidth * 0.03,
                                        ),

                                        // Selection count - show when more than one selected
                                        if (controller.selectMode &&
                                            controller.selectedEvents.length >
                                                1)
                                          Text(
                                            '${controller.selectedEvents.length}',
                                            style: TextStyle(
                                              color: Color(0xff3976F8),
                                              fontSize:
                                                  context.screenWidth * 0.043,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        if (controller.selectMode &&
                                            controller.selectedEvents.length >
                                                1)
                                          SizedBox(
                                              width:
                                                  context.screenWidth * 0.032),

                                        // Profile picture - hide in select mode with multiple selections
                                        if (!(controller.selectMode &&
                                            controller.selectedEvents.length >
                                                1))
                                          GestureDetector(
                                            onTap: () {
                                              context.go(
                                                  '/mainMenuScreen/rooms/${room.id}/details');
                                            },
                                            child: Container(
                                              width:
                                                  context.screenWidth * 0.107,
                                              height:
                                                  context.screenWidth * 0.107,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: Colors.white
                                                      .withOpacity(0.2),
                                                  width: context.screenWidth *
                                                      0.0027,
                                                ),
                                              ),
                                              child: ClipOval(
                                                child: Avatar(
                                                  mxContent: room.avatar,
                                                  size: context.screenWidth *
                                                      0.107,
                                                  name:
                                                      displayname ?? room.name,
                                                  isGroup:
                                                      room.directChatMatrixID ==
                                                          null,
                                                ),
                                              ),
                                            ),
                                          ),
                                        if (!(controller.selectMode &&
                                            controller.selectedEvents.length >
                                                1))
                                          SizedBox(
                                              width:
                                                  context.screenWidth * 0.032),

                                        // Name and status - hide in select mode with multiple selections
                                        if (!(controller.selectMode &&
                                            controller.selectedEvents.length >
                                                1))
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                context.go(
                                                    '/mainMenuScreen/rooms/${room.id}/details');
                                              },
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    displayname ?? room.name,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize:
                                                          context.screenWidth *
                                                              0.043,
                                                      fontFamily: ' Montserrat',
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      letterSpacing: 0.2,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height:
                                                          context.screenHeight *
                                                              0.0025),
                                                  Text(
                                                    isGroup
                                                        ? L10n.of(context)
                                                            .countMembers(
                                                            (room.summary
                                                                        .mInvitedMemberCount ??
                                                                    0) +
                                                                (room.summary
                                                                        .mJoinedMemberCount ??
                                                                    0),
                                                          )
                                                        : _getAvailableText(),
                                                    style: TextStyle(
                                                      color: Colors.white70,
                                                      fontSize:
                                                          context.screenWidth *
                                                              0.027,
                                                      fontFamily: 'Neometric',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        else
                                          const Spacer(),

                                        // Action buttons - show select mode actions when multiple messages selected
                                        if (controller.selectMode &&
                                            controller.selectedEvents.length >
                                                1)
                                          Row(
                                            children: [
                                              IconButton(
                                                onPressed:
                                                    controller.copyEventsAction,
                                                icon: Image.asset(
                                                  'assets/images/icons/copy.png',
                                                  height: context.screenHeight *
                                                      0.03,
                                                  width: context.screenWidth *
                                                      0.064,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: controller
                                                    .forwardEventsAction,
                                                icon: Image.asset(
                                                  'assets/images/icons/forward.png',
                                                  height: context.screenHeight *
                                                      0.03,
                                                  width: context.screenWidth *
                                                      0.064,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              if (controller
                                                  .canPinSelectedEvents)
                                                IconButton(
                                                  onPressed:
                                                      controller.pinEvent,
                                                  icon: Image.asset(
                                                    'assets/images/icons/archive-tick.png',
                                                    height:
                                                        context.screenHeight *
                                                            0.03,
                                                    width: context.screenWidth *
                                                        0.064,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              if (controller
                                                  .canRedactSelectedEvents)
                                                IconButton(
                                                  onPressed: controller
                                                      .redactEventsAction,
                                                  icon: Image.asset(
                                                    'assets/images/icons/trash.png',
                                                    height:
                                                        context.screenHeight *
                                                            0.03,
                                                    width: context.screenWidth *
                                                        0.064,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              PopupMenuButton(
                                                icon: Image.asset(
                                                  'assets/images/icons/info-circle.png',
                                                  height: context.screenHeight *
                                                      0.03,
                                                  width: context.screenWidth *
                                                      0.064,
                                                  color: Colors.white,
                                                ),
                                                itemBuilder: (context) => [
                                                  PopupMenuItem(
                                                    onTap: controller
                                                        .showEventInfo,
                                                    child: Text(_getInfoText()),
                                                  ),
                                                  PopupMenuItem(
                                                    onTap: controller
                                                        .reportEventAction,
                                                    child:
                                                        Text(_getReportText()),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        else
                                          Row(
                                            children: [
                                              if (room.isDirectChat) ...[
                                                _buildActionButton(
                                                  imagePath:
                                                      ImageAssets.videoCall,
                                                  onTap: controller
                                                      .onPhoneButtonTap,
                                                ),
                                                SizedBox(
                                                    width: context.screenWidth *
                                                        0.043),
                                                _buildActionButton(
                                                  imagePath:
                                                      ImageAssets.voiceCall,
                                                  onTap: controller
                                                      .onPhoneButtonTap,
                                                ),
                                                SizedBox(
                                                    width: context.screenWidth *
                                                        0.043),
                                              ],
                                              ChatSettingsPopupMenu(
                                                  controller.room, true),
                                            ],
                                          ),
                                      ],
                                    ),
                                  ),
                                  if (!(controller.selectMode &&
                                      controller.selectedEvents.length > 1))
                                    _buildGroupOptionsSection(),
                                ],
                              )
                            : SizedBox(
                                height: context.screenHeight * 0.08,
                                child: Row(
                                  children: [
                                    // Back button or Close button for selection mode
                                    GestureDetector(
                                      onTap: controller.selectMode
                                          ? controller.clearSelectedEvents
                                          : () => Navigator.of(context).pop(),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: context.screenWidth * 0.027),
                                        child: Image.asset(
                                          controller.selectMode
                                              ? "assets/icons/close-circle.png"
                                              : ImageAssets.arrowLeft,
                                          width: context.screenWidth * 0.09,
                                          height: context.screenHeight * 0.05,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        width: context.screenWidth * 0.016),

                                    // Selection count - show when more than one selected
                                    if (controller.selectMode &&
                                        controller.selectedEvents.length > 1)
                                      Text(
                                        '${controller.selectedEvents.length}',
                                        style: TextStyle(
                                          color: Color(0xff3976F8),
                                          fontSize: context.screenWidth * 0.043,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    if (controller.selectMode &&
                                        controller.selectedEvents.length > 1)
                                      SizedBox(
                                          width: context.screenWidth * 0.032),

                                    // Profile picture - hide in select mode with multiple selections
                                    if (!(controller.selectMode &&
                                        controller.selectedEvents.length > 1))
                                      GestureDetector(
                                        onTap: () {
                                          context.go(
                                              '/mainMenuScreen/rooms/${room.id}/details');
                                        },
                                        child: Container(
                                          width: context.screenWidth * 0.1,
                                          height: context.screenWidth * 0.1,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color:
                                                  Colors.white.withOpacity(0.2),
                                              width:
                                                  context.screenWidth * 0.0027,
                                            ),
                                          ),
                                          child: Center(
                                            child: ClipOval(
                                              child: Avatar(
                                                mxContent: room.avatar,
                                                size:
                                                    context.screenWidth * 0.09,
                                                name: displayname ?? room.name,
                                                isGroup:
                                                    room.directChatMatrixID ==
                                                        null,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (!(controller.selectMode &&
                                        controller.selectedEvents.length > 1))
                                      SizedBox(
                                          width: context.screenWidth * 0.032),

                                    // Name and status - hide in select mode with multiple selections
                                    if (!(controller.selectMode &&
                                        controller.selectedEvents.length > 1))
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            context.go(
                                                '/mainMenuScreen/rooms/${room.id}/details');
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                displayname ?? room.name,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      context.screenWidth *
                                                          0.036,
                                                  fontWeight: FontWeight.w700,
                                                  letterSpacing: 0.2,
                                                ),
                                              ),
                                              const SizedBox(height: 2),
                                              Text(
                                                _getAvailableText(),
                                                style: TextStyle(
                                                  color: Colors.white70,
                                                  fontSize:
                                                      context.screenWidth *
                                                          0.023,
                                                  fontFamily: 'Neometric',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    else
                                      const Spacer(),

                                    // Action buttons - show select mode actions when multiple messages selected
                                    if (controller.selectMode &&
                                        controller.selectedEvents.length > 1)
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed:
                                                controller.copyEventsAction,
                                            icon: Image.asset(
                                              'assets/images/icons/copy.png',
                                              height: 24,
                                              width: 24,
                                              color: Colors.white,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed:
                                                controller.forwardEventsAction,
                                            icon: Image.asset(
                                              'assets/images/icons/forward.png',
                                              height: 24,
                                              width: 24,
                                              color: Colors.white,
                                            ),
                                          ),
                                          if (controller.canPinSelectedEvents)
                                            IconButton(
                                              onPressed: controller.pinEvent,
                                              icon: Image.asset(
                                                'assets/images/icons/archive-tick.png',
                                                height: 24,
                                                width: 24,
                                                color: Colors.white,
                                              ),
                                            ),
                                          if (controller
                                              .canRedactSelectedEvents)
                                            IconButton(
                                              onPressed:
                                                  controller.redactEventsAction,
                                              icon: Image.asset(
                                                'assets/images/icons/trash.png',
                                                height: 24,
                                                width: 24,
                                                color: Colors.white,
                                              ),
                                            ),
                                          PopupMenuButton(
                                            icon: Image.asset(
                                              'assets/images/icons/info-circle.png',
                                              height: 24,
                                              width: 24,
                                              color: Colors.white,
                                            ),
                                            itemBuilder: (context) => [
                                              PopupMenuItem(
                                                onTap: controller.showEventInfo,
                                                child: Text(_getInfoText()),
                                              ),
                                              PopupMenuItem(
                                                onTap: controller
                                                    .reportEventAction,
                                                child: Text(_getReportText()),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    else
                                      Row(
                                        children: [
                                          _buildActionButton(
                                            imagePath: ImageAssets.videoCall,
                                            onTap: controller.onPhoneButtonTap,
                                          ),
                                          SizedBox(
                                              width:
                                                  context.screenWidth * 0.043),
                                          _buildActionButton(
                                            imagePath: ImageAssets.voiceCall,
                                            onTap: controller.onPhoneButtonTap,
                                          ),
                                          ChatSettingsPopupMenu(
                                              controller.room, true),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPinnedEventsAndBanner(
    BuildContext context,
    String? scrollUpBannerEventId,
  ) {
    if (controller.room.pinnedEventIds.isEmpty &&
        scrollUpBannerEventId == null) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.043),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PinnedEvents(controller),
          if (scrollUpBannerEventId != null)
            Center(
              child: Container(
                margin:
                    EdgeInsets.symmetric(vertical: context.screenHeight * 0.01),
                padding: EdgeInsets.symmetric(
                    horizontal: context.screenWidth * 0.027,
                    vertical: context.screenHeight * 0.0075),
                decoration: ShapeDecoration(
                  color: const Color(0x99841CBF),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(context.screenWidth * 2.7),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0xFF2A2F35),
                      blurRadius: context.screenWidth * 0.043,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    controller.scrollToEventId(scrollUpBannerEventId);
                    controller.discardScrollUpBannerEventId();
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        L10n.of(context).jumpToLastReadMessage,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: context.screenWidth * 0.032,
                          fontFamily: 'All Round Gothic',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildGroupOptionsSection() {
    final room = controller.room;
    final client = room.client;

    return StreamBuilder(
      stream: client.onSync.stream,
      builder: (context, snapshot) {
        // Determine the context (Parent Space)
        Room? parentSpace;

        // 1. Check if explicitly passed via navigation (Strongest signal)
        if (controller.widget.parentSpaceId != null) {
          parentSpace = client.getRoomById(controller.widget.parentSpaceId!);
        }

        // 2. If not, check if current room is a Space
        if (parentSpace == null && room.isSpace) {
          parentSpace = room;
        }

        // 3. Fallback: Check room parents (Weakest signal, often missing in child rooms)
        if (parentSpace == null && room.spaceParents.isNotEmpty) {
          final parentId = room.spaceParents.first.roomId;
          if (parentId != null) {
            parentSpace = client.getRoomById(parentId);
          }
        }

        // Build tabs list
        final tabs = <Map<String, dynamic>>[];

        // If we have a parent space, show space-based tabs
        if (parentSpace != null) {
          final spaceChildren = parentSpace.spaceChildren;

          // 1. General Tab (The Space itself)
          tabs.add({
            'title': 'General',
            'id': parentSpace.id,
            'count': parentSpace.notificationCount,
            'isSelected': room.id == parentSpace.id,
          });

          // 2. Children Tabs
          for (final child in spaceChildren) {
            if (child.roomId == null) continue;
            final childRoom = client.getRoomById(child.roomId!);
            if (childRoom != null) {
              tabs.add({
                'title': childRoom.name,
                'id': childRoom.id,
                'count': childRoom.notificationCount,
                'isSelected': room.id == childRoom.id,
              });
            }
          }
        } else {
          // For regular groups (not in a space), show default tabs
          tabs.add({
            'title': 'General',
            'id': room.id,
            'count': room.notificationCount,
            'isSelected': true,
          });
        }

        // Only show tabs section if we have tabs to display
        if (tabs.isEmpty) {
          return const SizedBox.shrink();
        }

        return Container(
          padding: EdgeInsets.fromLTRB(
              context.screenWidth * 0.043,
              context.screenHeight * 0.01,
              context.screenWidth * 0.043,
              context.screenHeight * 0.015),
          child: SizedBox(
            height: context.screenHeight * 0.04,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tabs.length,
              itemBuilder: (context, index) {
                final tab = tabs[index];
                return Padding(
                  padding: EdgeInsets.only(
                      right: index < tabs.length - 1
                          ? context.screenWidth * 0.032
                          : 0),
                  child: buildTabButton(
                    tab['title'] as String,
                    tab['count'] as int,
                    tab['isSelected'] as bool,
                    onTap: () {
                      final targetRoomId = tab['id'] as String;
                      if (targetRoomId != room.id) {
                        // Use context.go to replace the current route, keeping navigation stack clean
                        // Pass the parentSpaceId to persist the group context
                        final parentId = parentSpace!.id;
                        context.go(
                          Uri(
                            path: '/mainMenuScreen/rooms/$targetRoomId',
                            queryParameters: {'parentSpaceId': parentId},
                          ).toString(),
                        );
                      }
                    },
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget buildTabButton(String title, int count, bool isSelected,
      {VoidCallback? onTap}) {
    return MouseRegion(
      onEnter: (_) => setState(() {}),
      onExit: (_) => setState(() {}),
      child: GestureDetector(
        onTap: onTap ??
            () {
              setState(() {
                _selectedTab = title;
              });
            },
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: context.screenWidth * 0.043,
              vertical: context.screenHeight * 0.0075),
          decoration: ShapeDecoration(
            color:
                isSelected ? const Color(0xFF1929FF) : const Color(0xFF1F252D),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(context.screenWidth * 2.7),
            ),
            shadows: isSelected
                ? [
                    BoxShadow(
                      color: Color(0xFF1929FF),
                      blurRadius: context.screenWidth * 0.027,
                      offset: Offset(0, 0),
                      spreadRadius: -1,
                    )
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: context.screenWidth * 0.011,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: context.screenWidth * 0.035,
                  fontFamily: "Work Sans",
                  fontWeight: FontWeight.w400,
                ),
              ),
              if (count > 0)
                Container(
                  constraints:
                      BoxConstraints(minWidth: context.screenWidth * 0.048),
                  height: context.screenHeight * 0.0225,
                  decoration: ShapeDecoration(
                    color: isSelected ? Colors.white : const Color(0xFF3976F8),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(context.screenWidth * 2.7),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      count.toString(),
                      style: TextStyle(
                        color:
                            isSelected ? const Color(0xFF3976F8) : Colors.white,
                        fontSize: context.screenWidth * 0.027,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    IconData? icon,
    String? imagePath,
    required VoidCallback? onTap,
    bool isLoading = false,
  }) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: AbsorbPointer(
        absorbing: isLoading,
        child: Opacity(
          opacity: isLoading ? 0.5 : 1.0,
          child: SizedBox(
            width: context.screenWidth * 0.064,
            height: context.screenHeight * 0.03,
            child: isLoading
                ? const AppLoadingWidget()
                : imagePath != null
                    ? Image.asset(
                        imagePath,
                        width: context.screenWidth * 0.064,
                        height: context.screenHeight * 0.03,
                        color: Colors.white,
                      )
                    : Icon(
                        icon!,
                        color: Colors.white,
                        size: context.screenWidth * 0.064,
                      ),
          ),
        ),
      ),
    );
  }

  Widget _buildChatMessages(BuildContext context) {
    return FutureBuilder(
      future: controller.loadTimelineFuture,
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const AppLoadingWidget();
        }

        // Check if there are no messages to show empty state
        final hasMessages = controller.timeline?.events.isNotEmpty == true &&
            controller.timeline!.events.any(
              (event) =>
                  event.type == EventTypes.Message ||
                  event.type == EventTypes.Encrypted ||
                  event.type == EventTypes.Sticker,
            );
        if (!hasMessages) {
          return const EmptyConversationScreen();
          // return WelcomeCardSection(
          //   height: 376,
          //   topMargin: 10,
          //   bgImage: 'assets/chat_icons/empty-chat-image.png',
          //   heading: L10n.of(context).startAConversation,
          //   subHeading: L10n.of(context).sendMessageToGetStarted,
          // );
        }

        return ChatEventList(
          controller: controller,
        );
      },
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
            left: context.screenWidth * 0.054,
            right: context.screenWidth * 0.054,
            bottom: MediaQuery.of(context).size.height * 0.25,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: context.screenWidth * 0.456,
                  padding: EdgeInsets.all(context.screenWidth * 0.021),
                  decoration: ShapeDecoration(
                    color: const Color(0xFF170328),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(context.screenWidth * 0.048),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(dialogContext);
                          if (controller.selectedEvents.isNotEmpty) {
                            controller.room.sendReaction(
                              controller.selectedEvents.first.eventId,
                              '👍',
                            );
                          }
                        },
                        child: const Text('👍', style: TextStyle(fontSize: 20)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(dialogContext);
                          if (controller.selectedEvents.isNotEmpty) {
                            controller.room.sendReaction(
                              controller.selectedEvents.first.eventId,
                              '❤',
                            );
                          }
                        },
                        child: const Text('❤', style: TextStyle(fontSize: 20)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(dialogContext);
                          if (controller.selectedEvents.isNotEmpty) {
                            controller.room.sendReaction(
                              controller.selectedEvents.first.eventId,
                              '😂',
                            );
                          }
                        },
                        child: const Text('😂', style: TextStyle(fontSize: 20)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(dialogContext);
                          if (controller.selectedEvents.isNotEmpty) {
                            controller.room.sendReaction(
                              controller.selectedEvents.first.eventId,
                              '😮',
                            );
                          }
                        },
                        child: const Text('😮', style: TextStyle(fontSize: 20)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(dialogContext);
                          if (controller.selectedEvents.isNotEmpty) {
                            controller.room.sendReaction(
                              controller.selectedEvents.first.eventId,
                              '😢',
                            );
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
                          width: context.screenWidth * 0.054,
                          height: context.screenHeight * 0.025,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF3F3F3).withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.add,
                            color: Color(0xFFF3F3F3),
                            size: context.screenWidth * 0.037,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: context.screenHeight * 0.005),
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
                      label: L10n.of(context).favorites,
                      onTap: () {
                        Navigator.pop(dialogContext);
                        if (controller.selectedEvents.isNotEmpty) {
                          controller
                              .toggleFavorite(controller.selectedEvents.first);
                        }
                      },
                    ),
                    ActionButton(
                      icon: Icons.info,
                      label: _getInfoText(),
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
                      label: _getReportText(),
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
    ).then((_) {
      _hasShownDialog = false;
    });
  }

  Widget _buildInputField(
    BuildContext context,
    double bottomSheetPadding,
    ThemeData theme,
  ) {
    return Container(
      margin: EdgeInsets.all(bottomSheetPadding),
      constraints: const BoxConstraints(
        maxWidth: FluffyThemes.maxTimelineWidth,
      ),
      alignment: Alignment.center,
      child: Material(
        clipBehavior: Clip.hardEdge,
        color: controller.selectedEvents.isNotEmpty
            ? theme.colorScheme.tertiaryContainer
            : const Color(0xFF262845).withValues(alpha: 0.95),
        borderRadius: const BorderRadius.all(
          Radius.circular(24),
        ),
        child: controller.room.isAbandonedDMRoom == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                      foregroundColor: theme.colorScheme.error,
                    ),
                    icon: const Icon(Icons.archive_outlined),
                    onPressed: controller.leaveChat,
                    label: Text(L10n.of(context).leave),
                  ),
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                    ),
                    icon: const Icon(Icons.forum_outlined),
                    onPressed: controller.recreateChat,
                    label: Text(L10n.of(context).reopenChat),
                  ),
                ],
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ReplyDisplay(controller),
                  ChatInputRow(
                    controller,
                    onDialogStateChanged: (isOpen) {
                      setState(() {
                        _isDialogOpen = isOpen;
                      });
                    },
                  ),
                  ChatEmojiPicker(controller),
                ],
              ),
      ),
    );
  }
  //  Widget _buildGroupOptionsSection() {
  //   final room = controller.room;
  //   final client = room.client;

  //   return StreamBuilder(
  //     stream: client.onSync.stream,
  //     builder: (context, snapshot) {
  //       // Determine the context (Parent Space)
  //       Room? parentSpace;

  //       // 1. Check if explicitly passed via navigation (Strongest signal)
  //       if (controller.widget.parentSpaceId != null) {
  //         parentSpace = client.getRoomById(controller.widget.parentSpaceId!);
  //       }

  //       // 2. If not, check if current room is a Space
  //       if (parentSpace == null && room.isSpace) {
  //         parentSpace = room;
  //       }

  //       // 3. Fallback: Check room parents (Weakest signal, often missing in child rooms)
  //       if (parentSpace == null && room.spaceParents.isNotEmpty) {
  //         final parentId = room.spaceParents.first.roomId;
  //         if (parentId != null) {
  //           parentSpace = client.getRoomById(parentId);
  //         }
  //       }

  //       // If we are not in a Space context, we might want to hide this section or show default
  //       if (parentSpace == null) {
  //          return const SizedBox.shrink();
  //       }

  //       final spaceChildren = parentSpace.spaceChildren;

  //       // Build tabs list
  //       final tabs = <Map<String, dynamic>>[];

  //       // 1. General Tab (The Space itself)
  //       tabs.add({
  //         'title': 'General',
  //         'id': parentSpace.id,
  //         'count': parentSpace.notificationCount,
  //         'isSelected': room.id == parentSpace.id,
  //       });

  //       // 2. Children Tabs
  //       for (final child in spaceChildren) {
  //         if (child.roomId == null) continue;
  //         final childRoom = client.getRoomById(child.roomId!);
  //         if (childRoom != null) {
  //           tabs.add({
  //             'title': childRoom.name,
  //             'id': childRoom.id,
  //             'count': childRoom.notificationCount,
  //             'isSelected': room.id == childRoom.id,
  //           });
  //         }
  //       }

  //       return Container(
  //         padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
  //         child: SizedBox(
  //           height: 32,
  //           child: ListView.builder(
  //             scrollDirection: Axis.horizontal,
  //             itemCount: tabs.length,
  //             itemBuilder: (context, index) {
  //               final tab = tabs[index];
  //               return Padding(
  //                 padding: EdgeInsets.only(right: index < tabs.length - 1 ? 12 : 0),
  //                 child: buildTabButton(
  //                   tab['title'] as String,
  //                   tab['count'] as int,
  //                   tab['isSelected'] as bool,
  //                   onTap: () {
  //                     final targetRoomId = tab['id'] as String;
  //                     if (targetRoomId != room.id) {
  //                       // Use context.go to replace the current route, keeping navigation stack clean
  //                       // Pass the parentSpaceId to persist the group context
  //                       final parentId = parentSpace!.id;
  //                       context.go(
  //                         Uri(
  //                           path: '/mainMenuScreen/rooms/$targetRoomId',
  //                           queryParameters: {'parentSpaceId': parentId},
  //                         ).toString(),
  //                       );
  //                     }
  //                   },
  //                 ),
  //               );
  //             },
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  // Widget buildTabButton(String title, int count, bool isSelected, {VoidCallback? onTap}) {
  //   return MouseRegion(
  //     onEnter: (_) => setState(() {}),
  //     onExit: (_) => setState(() {}),
  //     child: GestureDetector(
  //       onTap: onTap ?? () {
  //         setState(() {
  //           _selectedTab = title;
  //         });
  //       },
  //       child: Container(
  //         padding:  const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
  //         decoration: ShapeDecoration(
  //           gradient: isSelected
  //               ? const LinearGradient(
  //                   begin: Alignment(-0.19, 0.43),
  //                   end: Alignment(0.52, 1.17),
  //                   colors: [Color(0xFF1929FF), Color(0xFF1929FF)],
  //                 )
  //               : null,
  //           color: isSelected
  //               ? null
  //               : const Color(0xFF1F252D),
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(1000),
  //           ),
  //         ),
  //         child: Row(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           mainAxisAlignment:MainAxisAlignment.center,
  //           spacing: 4,
  //           children: [
  //             Text(
  //               title,
  //               style: const TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 14,
  //                 fontFamily: "Work Sans",
  //                 fontWeight: FontWeight.w700,
  //               ),
  //             ),
  //             if (count > 0)
  //               Container(
  //                 constraints: const BoxConstraints(minWidth: 18),
  //                 height: 18,
  //                 decoration: ShapeDecoration(
  //                   color: isSelected
  //                       ? Colors.white
  //                       : const Color(0xFF3976F8),
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(1000),
  //                   ),
  //                 ),
  //                 child: Center(
  //                   child: Text(
  //                     count.toString(),
  //                     style: TextStyle(
  //                       color: isSelected

  //                       ? const Color(0xFF3976F8):
  //                       Colors.white,

  //                       fontSize: 10,
  //                       fontFamily: 'Open Sans',
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
