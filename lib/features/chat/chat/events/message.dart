import 'dart:ui' as ui;

import 'package:bmp/core/config/themes.dart';
import 'package:bmp/features/chat/chat/events/room_creation_state_event.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/adaptive_loader_widget.dart';
import 'package:bmp/shared/utils/date_time_extension.dart';
import 'package:bmp/shared/utils/file_description.dart';
import 'package:bmp/shared/utils/string_color.dart';
import 'package:bmp/shared/widgets/avatar.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:bmp/shared/widgets/member_actions_popup_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matrix/matrix.dart';
import 'package:swipe_to_action/swipe_to_action.dart';

import '../../../../core/config/app_config.dart';
import 'message_content.dart';
import 'message_reactions.dart';
import 'reply_content.dart';
import 'message_delivery_status.dart';
import 'state_message.dart';

class Message extends StatelessWidget {
  final Event event;
  final Event? nextEvent;
  final Event? previousEvent;
  final bool displayReadMarker;
  final void Function(Event) onSelect;
  final void Function(Event) onInfoTab;
  final void Function(String) scrollToEventId;
  final void Function() onSwipe;
  final void Function() onMention;
  final void Function() onEdit;
  final void Function()? onLongPressAction;
  final bool longPressSelect;
  final bool selected;
  final bool singleSelected;
  final Timeline timeline;
  final bool highlightMarker;
  final bool animateIn;
  final void Function()? resetAnimateIn;
  final bool wallpaperMode;
  final ScrollController scrollController;
  final List<Color> colors;

  const Message(
    this.event, {
    this.nextEvent,
    this.previousEvent,
    this.displayReadMarker = false,
    this.longPressSelect = false,
    required this.onSelect,
    required this.onInfoTab,
    required this.scrollToEventId,
    required this.onSwipe,
    this.selected = false,
    required this.onEdit,
    this.onLongPressAction,
    required this.singleSelected,
    required this.timeline,
    this.highlightMarker = false,
    this.animateIn = false,
    this.resetAnimateIn,
    this.wallpaperMode = false,
    required this.onMention,
    required this.scrollController,
    required this.colors,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (!{
      EventTypes.Message,
      EventTypes.Sticker,
      EventTypes.Encrypted,
      EventTypes.CallInvite,
    }.contains(event.type)) {
      if (event.type.startsWith('m.call.')) {
        return const SizedBox.shrink();
      }
      if (event.type == EventTypes.RoomCreate) {
        return RoomCreationStateEvent(event: event);
      }
      return StateMessage(event);
    }

    if (event.type == EventTypes.Message &&
        event.messageType == EventTypes.KeyVerificationRequest) {
      return StateMessage(event);
    }

    final client = Matrix.of(context).client;
    final ownMessage = event.senderId == client.userID;
    final alignment = ownMessage ? Alignment.topRight : Alignment.topLeft;

    var color = theme.colorScheme.surfaceContainerHigh;
    final displayTime = AppConfig.alwaysShowMessageTimestamps ||
        event.type == EventTypes.RoomCreate ||
        nextEvent == null ||
        !event.originServerTs.sameEnvironment(nextEvent!.originServerTs);
    final nextEventSameSender = nextEvent != null &&
        {
          EventTypes.Message,
          EventTypes.Sticker,
          EventTypes.Encrypted,
        }.contains(nextEvent!.type) &&
        nextEvent!.senderId == event.senderId &&
        !displayTime;

    final previousEventSameSender = previousEvent != null &&
        {
          EventTypes.Message,
          EventTypes.Sticker,
          EventTypes.Encrypted,
        }.contains(previousEvent!.type) &&
        previousEvent!.senderId == event.senderId &&
        previousEvent!.originServerTs.sameEnvironment(event.originServerTs);

    final textColor =
        ownMessage ? theme.onBubbleColor : theme.colorScheme.onSurface;

    final linkColor = ownMessage
        ? theme.brightness == Brightness.light
            ? theme.colorScheme.primaryFixed
            : theme.colorScheme.onTertiaryContainer
        : theme.colorScheme.primary;

    final rowMainAxisAlignment =
        ownMessage ? MainAxisAlignment.end : MainAxisAlignment.start;

    final displayEvent = event.getDisplayEvent(timeline);
    const hardCorner = Radius.circular(4);
    const roundedCorner = Radius.circular(AppConfig.borderRadius);
    final borderRadius = BorderRadius.only(
      topLeft: !ownMessage && nextEventSameSender ? hardCorner : roundedCorner,
      topRight: ownMessage && nextEventSameSender ? hardCorner : roundedCorner,
      bottomLeft:
          !ownMessage && previousEventSameSender ? hardCorner : roundedCorner,
      bottomRight:
          ownMessage && previousEventSameSender ? hardCorner : roundedCorner,
    );
    final noBubble = ({
              MessageTypes.Image,
              MessageTypes.Sticker,
            }.contains(event.messageType) &&
            event.fileDescription == null &&
            !event.redacted) ||
        (event.messageType == MessageTypes.Text &&
            event.relationshipType == null &&
            event.onlyEmotes &&
            event.numberEmotes > 0 &&
            event.numberEmotes <= 3);

    if (ownMessage) {
      color =
          displayEvent.status.isError ? Colors.redAccent : theme.bubbleColor;
    }

    final resetAnimateIn = this.resetAnimateIn;
    var animateIn = this.animateIn;

    // Check if this message is pinned
    final isPinned = event.room.pinnedEventIds.contains(event.eventId);

    final sentReactions = <String>{};
    if (singleSelected) {
      sentReactions.addAll(
        event
            .aggregatedEvents(
              timeline,
              RelationshipTypes.reaction,
            )
            .where(
              (event) =>
                  event.senderId == event.room.client.userID &&
                  event.type == 'm.reaction',
            )
            .map(
              (event) => event.content
                  .tryGetMap<String, Object?>('m.relates_to')
                  ?.tryGet<String>('key'),
            )
            .whereType<String>(),
      );
    }

    final showReceiptsRow =
        event.hasAggregatedEvents(timeline, RelationshipTypes.reaction);

    final showReactionPicker =
        singleSelected && event.room.canSendDefaultMessages;

    return Center(
      child: Swipeable(
        key: ValueKey(event.eventId),
        background: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Center(
            child: Icon(Icons.check_outlined),
          ),
        ),
        direction: AppConfig.swipeRightToLeftToReply
            ? SwipeDirection.endToStart
            : SwipeDirection.startToEnd,
        onSwipe: (_) => onSwipe(),
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: FluffyThemes.maxTimelineWidth,
          ),
          padding: EdgeInsets.only(
            left: 8.0,
            right: 8.0,
            top: nextEventSameSender ? 1.0 : 4.0,
            bottom: previousEventSameSender ? 1.0 : 4.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment:
                ownMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: <Widget>[
              StatefulBuilder(
                builder: (context, setState) {
                  if (animateIn && resetAnimateIn != null) {
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      animateIn = false;
                      setState(resetAnimateIn);
                    });
                  }
                  return AnimatedSize(
                    duration: FluffyThemes.animationDuration,
                    curve: FluffyThemes.animationCurve,
                    clipBehavior: Clip.none,
                    alignment: ownMessage
                        ? Alignment.bottomRight
                        : Alignment.bottomLeft,
                    child: animateIn
                        ? const SizedBox(height: 0, width: double.infinity)
                        : Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                top: 0,
                                bottom: -6,
                                left: 0,
                                right: -4,
                                child: InkWell(
                                  hoverColor: longPressSelect
                                      ? Colors.transparent
                                      : null,
                                  enableFeedback: !selected,
                                  onTap: longPressSelect ? () => onSelect(event) : null,
                                  borderRadius: BorderRadius.circular(
                                    AppConfig.borderRadius / 2,
                                  ),
                                  child: Material(
                                    borderRadius: BorderRadius.circular(
                                      AppConfig.borderRadius / 2,
                                    ),
                                    color: selected || highlightMarker
                                        ? theme.colorScheme.secondaryContainer
                                            .withAlpha(128)
                                        : isPinned
                                            ? const ui.Color.fromARGB(255, 20, 20, 16).withAlpha(60) // Golden overlay for pinned
                                            : Colors.transparent,
                                  ),
                                ),
                              ),
                              // Pinned indicator icon
                              if (isPinned)
                                Positioned(
                                  top: 0,
                                  right: ownMessage ? null : 0,
                                  left: ownMessage ? 0 : null,
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                     // color: const Color(0xFFFFD700).withOpacity(0.9),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        // BoxShadow(
                                        //   color: Colors.black.withOpacity(0.2),
                                        //   blurRadius: 4,
                                        //   offset: const Offset(0, 2),
                                        // ),
                                      ],
                                    ),
                                    child: const Icon(
                                      Icons.push_pin,
                                      size: 14,
                                      color: ui.Color.fromARGB(178, 255, 255, 255),
                                    ),
                                  ),
                                ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: rowMainAxisAlignment,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (longPressSelect && !event.redacted)
                                    SizedBox(
                                      height: 32,
                                      width: Avatar.defaultSize,
                                      child: InkWell(
                                        onTap: () => onSelect(event),
                                        child: Container(
                                          width: Avatar.defaultSize,
                                          height: 32,
                                          color: Colors.transparent,
                                        ),
                                      ),
                                    )
                                  else if (nextEventSameSender || ownMessage)
                                    SizedBox(
                                      width: Avatar.defaultSize,
                                      child: Center(
                                        child: SizedBox(
                                          width: 16,
                                          height: 16,
                                          child: event.status ==
                                                  EventStatus.error
                                              ? const Icon(
                                                  Icons.error,
                                                  color: Colors.red,
                                                )
                                              : event.fileSendingStatus != null
                                                  ? const  AdaptiveLoaderWidget()
                                                  : null,
                                        ),
                                      ),
                                    )
                                  else if (!event.room.isDirectChat)
                                    FutureBuilder<User?>(
                                      future: event.fetchSenderUser(),
                                      builder: (context, snapshot) {
                                        final user = snapshot.data ??
                                            event.senderFromMemoryOrFallback;
                                        return Avatar(
                                          mxContent: user.avatarUrl,
                                          name: user.calcDisplayname(),
                                          onTap: () =>
                                              showMemberActionsPopupMenu(
                                            context: context,
                                            user: user,
                                            onMention: onMention,
                                          ),
                                          presenceUserId: user.stateKey,
                                          presenceBackgroundColor: wallpaperMode
                                              ? Colors.transparent
                                              : null,
                                        );
                                      },
                                    ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Align(
                                          alignment: alignment,
                                          child: IntrinsicWidth(
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.only(left: 8),
                                          child: GestureDetector(
                                            onTap: longPressSelect ? () => onSelect(event) : null,
                                            onLongPress: longPressSelect
                                                ? null
                                                : () {
                                                    HapticFeedback
                                                        .heavyImpact();
                                                    onSelect(event);
                                                    if (onLongPressAction != null) {
                                                      onLongPressAction!();
                                                    }
                                                  },
                                            child: AnimatedOpacity(
                                              opacity: animateIn
                                                  ? 0
                                                  : event.messageType ==
                                                              MessageTypes
                                                                  .BadEncrypted ||
                                                          event.status.isSending
                                                      ? 0.5
                                                      : 1,
                                              duration: FluffyThemes
                                                  .animationDuration,
                                              curve:
                                                  FluffyThemes.animationCurve,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: noBubble
                                                      ? Colors.transparent
                                                      : !ownMessage
                                                          ? const ui.Color.fromARGB(137, 5, 9, 38)
                                                          : const ui.Color.fromARGB(134, 129, 21, 191),
                                                  borderRadius: !ownMessage && !noBubble
                                                      ? const BorderRadius.only(
                                                          topLeft: Radius.circular(25),
                                                          topRight: Radius.circular(25),
                                                          bottomLeft: Radius.circular(10),
                                                          bottomRight: Radius.circular(25),
                                                        )
                                                      : ownMessage && !noBubble
                                                          ? const BorderRadius.only(
                                                              topLeft: Radius.circular(25),
                                                              topRight: Radius.circular(25),
                                                              bottomLeft: Radius.circular(25),
                                                              bottomRight: Radius.circular(10),
                                                            )
                                                          : borderRadius,
                                                  border: !ownMessage && !noBubble
                                                      ? Border.all(
                                                          color: const Color(0xFF131EBF),
                                                          width: 1.0,
                                                        )
                                                      : ownMessage && !noBubble
                                                          ? Border.all(
                                                              color:const Color(0xFFA912BF),
                                                              width: 1.0,
                                                            )
                                                          : null,
                                                ),
                                                clipBehavior: Clip.antiAlias,
                                                child: BubbleBackground(
                                                  colors: colors,
                                                  ignore: true,
                                                  scrollController:
                                                      scrollController,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        AppConfig.borderRadius,
                                                      ),
                                                    ),
                                                    constraints:
                                                        const BoxConstraints(
                                                      maxWidth: 320,
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        // Username inside bubble for group chats
                                                        if (!ownMessage && !event.room.isDirectChat && !nextEventSameSender)
                                                          Padding(
                                                            padding: EdgeInsets.only(
                                                              left:10,
                                                              right:10,
                                                              top:10,
                                                              bottom: 0,
                                                     
                                                            ),
                                                            child: FutureBuilder<User?>(
                                                              future: event.fetchSenderUser(),
                                                              builder: (context, snapshot) {
                                                                final displayname = snapshot.data
                                                                        ?.calcDisplayname() ??
                                                                    event.senderFromMemoryOrFallback
                                                                        .calcDisplayname();
                                                                return Text(
                                                                  displayname,
                                                                  textAlign: TextAlign.left,
                                                                  style:  TextStyle(
                                                                    fontSize: 11,
                                                                    fontWeight: FontWeight.bold,
                                                                    color: Colors.white70,
                                                                  ),
                                                                  maxLines: 1,
                                                                  overflow: TextOverflow.ellipsis,
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        if ({
                                                          RelationshipTypes
                                                              .reply,
                                                          RelationshipTypes
                                                              .thread,
                                                        }.contains(
                                                          event
                                                              .relationshipType,
                                                        ))
                                                          FutureBuilder<Event?>(
                                                            future: event
                                                                .getReplyEvent(
                                                              timeline,
                                                            ),
                                                            builder: (
                                                              BuildContext
                                                                  context,
                                                              snapshot,
                                                            ) {
                                                              final replyEvent =
                                                                  snapshot
                                                                          .hasData
                                                                      ? snapshot
                                                                          .data!
                                                                      : Event(
                                                                          eventId:
                                                                              event.relationshipEventId!,
                                                                          content: {
                                                                            'msgtype':
                                                                                'm.text',
                                                                            'body':
                                                                                '...',
                                                                          },
                                                                          senderId:
                                                                              event.senderId,
                                                                          type:
                                                                              'm.room.message',
                                                                          room:
                                                                              event.room,
                                                                          status:
                                                                              EventStatus.sent,
                                                                          originServerTs:
                                                                              DateTime.now(),
                                                                        );
                                                              return Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  left: 10,
                                                                  right: 10,
                                                                  top: 10,
                                                                  bottom: 4,
                                                                ),
                                                                child: Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  borderRadius:
                                                                      ReplyContent
                                                                          .borderRadius,
                                                                  child:
                                                                      InkWell(
                                                                    borderRadius:
                                                                        ReplyContent
                                                                            .borderRadius,
                                                                    onTap: () =>
                                                                        scrollToEventId(
                                                                      replyEvent
                                                                          .eventId,
                                                                    ),
                                                                    child:
                                                                        AbsorbPointer(
                                                                      child:
                                                                          ReplyContent(
                                                                        replyEvent,
                                                                        ownMessage:
                                                                            ownMessage,
                                                                        timeline:
                                                                            timeline,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 10,right: 10,top: 4,bottom: 4),
                                                          child: MessageContent(
                                                            displayEvent,
                                                            textColor: textColor,
                                                            linkColor: linkColor,
                                                            onInfoTab: onInfoTab,
                                                            borderRadius:
                                                                borderRadius,
                                                            timeline: timeline,
                                                            selected: selected,
                                                            longPressSelect: longPressSelect,
                                                          ),
                                                        ),
                                                        if ((displayTime || selected || event.hasAggregatedEvents(timeline, RelationshipTypes.reaction)) &&
                                                            !{MessageTypes.Image, MessageTypes.Sticker}.contains(displayEvent.messageType))
                                                          Padding(
                                                            padding: const EdgeInsets.only(
                                                              top: 0.0,
                                                              left: 10.0,
                                                              right: 10.0,
                                                              bottom: 8,
                                                            ),
                                                            child: Row(
                                                              children: [
                                                                if (event.hasAggregatedEvents(timeline, RelationshipTypes.reaction))
                                                                  MessageReactions(event, timeline),
                                                                const Spacer(),
                                                                SizedBox(
                                                                  width: 8,
                                                                ),


                                                                if (displayTime || selected)
                                                                  Text(
                                                                    event.originServerTs.localizedTimeShort(context),
                                                                    style: TextStyle(
                                                                      fontSize: 9 * AppConfig.fontSizeFactor,
                                                                      color: textColor.withAlpha(164),
                                                                    ),
                                                                  ),
                                                                if (ownMessage)
                                                                  Padding(
                                                                    padding: const EdgeInsets.only(left: 3),
                                                                    child: MessageDeliveryStatus(
                                                                      event: event,
                                                                      timeline: timeline,
                                                                      size: 13,
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        if (event
                                                            .hasAggregatedEvents(
                                                          timeline,
                                                          RelationshipTypes
                                                              .edit,
                                                        ))
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              bottom: 8.0,
                                                              left: 16.0,
                                                              right: 16.0,
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              spacing: 4.0,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .edit_outlined,
                                                                  color: textColor
                                                                      .withAlpha(
                                                                    164,
                                                                  ),
                                                                  size: 14,
                                                                ),
                                                                Text(
                                                                  L10n.of(context).edit.toLowerCase(),
                                                                  style:
                                                                      TextStyle(
                                                                    color: textColor
                                                                        .withAlpha(
                                                                      164,
                                                                    ),
                                                                    fontSize:
                                                                        11,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          ),
                                          ),
                                        ),
                                        Align(
                                          alignment: ownMessage
                                              ? Alignment.bottomRight
                                              : Alignment.bottomLeft,
                                          child: AnimatedSize(
                                            duration:
                                                FluffyThemes.animationDuration,
                                            curve: FluffyThemes.animationCurve,
                                            child: 
                                            
                                            
                                            showReactionPicker
                                                ? const SizedBox.shrink()
                                                // Padding(
                                                //     padding:
                                                //         const EdgeInsets.all(
                                                //       4.0,
                                                //     ),
                                                //     child: Material(
                                                //       elevation: 4,
                                                //       borderRadius:
                                                //           BorderRadius.circular(
                                                //         AppConfig.borderRadius,
                                                //       ),
                                                //       shadowColor: theme
                                                //           .colorScheme.surface
                                                //           .withAlpha(128),
                                                //       child:
                                                //           SingleChildScrollView(
                                                //         scrollDirection:
                                                //             Axis.horizontal,
                                                //         child: Row(
                                                //           mainAxisSize:
                                                //               MainAxisSize.min,
                                                //           children: [
                                                //             ...AppConfig
                                                //                 .defaultReactions
                                                //                 .map(
                                                //               (emoji) =>
                                                //                   IconButton(
                                                //                 padding:
                                                //                     EdgeInsets
                                                //                         .zero,
                                                //                 icon: Center(
                                                //                   child:
                                                //                       Opacity(
                                                //                     opacity: sentReactions
                                                //                             .contains(
                                                //                       emoji,
                                                //                     )
                                                //                         ? 0.33
                                                //                         : 1,
                                                //                     child: Text(
                                                //                       emoji,
                                                //                       style:
                                                //                           const TextStyle(
                                                //                         fontSize:
                                                //                             20,
                                                //                       ),
                                                //                       textAlign:
                                                //                           TextAlign
                                                //                               .center,
                                                //                     ),
                                                //                   ),
                                                //                 ),
                                                //                 onPressed:
                                                //                     sentReactions
                                                //                             .contains(
                                                //                   emoji,
                                                //                 )
                                                //                         ? null
                                                //                         : () {
                                                //                             onSelect(
                                                //                               event,
                                                //                             );
                                                //                             event.room.sendReaction(
                                                //                               event.eventId,
                                                //                               emoji,
                                                //                             );
                                                //                           },
                                                //               ),
                                                //             ),
                                                //             IconButton(
                                                //               icon: const Icon(
                                                //                 Icons
                                                //                     .add_reaction_outlined,
                                                //               ),
                                                //               tooltip: L10n.of(
                                                //                 context,
                                                //               ).customReaction,
                                                //               onPressed:
                                                //                   () async {
                                                //                 final emoji =
                                                //                     await showAdaptiveBottomSheet<
                                                //                         String>(
                                                //                   context:
                                                //                       context,
                                                //                   builder:
                                                //                       (context) =>
                                                //                           Scaffold(
                                                //                     appBar:
                                                //                         AppBar(
                                                //                       title:
                                                //                           Text(
                                                //                         L10n.of(context)
                                                //                             .customReaction,
                                                //                       ),
                                                //                       leading:
                                                //                           CloseButton(
                                                //                         onPressed:
                                                //                             () =>
                                                //                                 Navigator.of(
                                                //                           context,
                                                //                         ).pop(
                                                //                           null,
                                                //                         ),
                                                //                       ),
                                                //                     ),
                                                //                     body:
                                                //                         SizedBox(
                                                //                       height: double
                                                //                           .infinity,
                                                //                       child:
                                                //                           EmojiPicker(
                                                //                         onEmojiSelected: (
                                                //                           _,
                                                //                           emoji,
                                                //                         ) =>
                                                //                             Navigator.of(
                                                //                           context,
                                                //                         ).pop(
                                                //                           emoji
                                                //                               .emoji,
                                                //                         ),
                                                //                         config:
                                                //                             Config(
                                                //                           emojiViewConfig:
                                                //                               const EmojiViewConfig(
                                                //                             backgroundColor:
                                                //                                 Colors.transparent,
                                                //                           ),
                                                //                           bottomActionBarConfig:
                                                //                               const BottomActionBarConfig(
                                                //                             enabled:
                                                //                                 false,
                                                //                           ),
                                                //                           categoryViewConfig:
                                                //                               CategoryViewConfig(
                                                //                             initCategory:
                                                //                                 Category.SMILEYS,
                                                //                             backspaceColor:
                                                //                                 theme.colorScheme.primary,
                                                //                             iconColor:
                                                //                                 theme.colorScheme.primary.withAlpha(
                                                //                               128,
                                                //                             ),
                                                //                             iconColorSelected:
                                                //                                 theme.colorScheme.primary,
                                                //                             indicatorColor:
                                                //                                 theme.colorScheme.primary,
                                                //                             backgroundColor:
                                                //                                 theme.colorScheme.surface,
                                                //                           ),
                                                //                           skinToneConfig:
                                                //                               SkinToneConfig(
                                                //                             dialogBackgroundColor:
                                                //                                 Color.lerp(
                                                //                               theme.colorScheme.surface,
                                                //                               theme.colorScheme.primaryContainer,
                                                //                               0.75,
                                                //                             )!,
                                                //                             indicatorColor:
                                                //                                 theme.colorScheme.onSurface,
                                                //                           ),
                                                //                         ),
                                                //                       ),
                                                //                     ),
                                                //                   ),
                                                //                 );
                                                //                 if (emoji ==
                                                //                     null) {
                                                //                   return;
                                                //                 }
                                                //                 if (sentReactions
                                                //                     .contains(
                                                //                   emoji,
                                                //                 )) {
                                                //                   return;
                                                //                 }
                                                //                 onSelect(event);

                                                //                 await event.room
                                                //                     .sendReaction(
                                                //                   event.eventId,
                                                //                   emoji,
                                                //                 );
                                                //               },
                                                //             ),
                                                //           ],
                                                //         ),
                                                //       ),
                                                //     ),
                                                //   )
                                                : const SizedBox.shrink(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                  );
                },
              ),

              if (displayReadMarker)
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: theme.colorScheme.surfaceContainerHighest,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 16.0,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppConfig.borderRadius / 3),
                        color: theme.colorScheme.surface.withAlpha(128),
                      ),
                      child: Text(
                        L10n.of(context).readUpToHere,
                        style: TextStyle(
                          fontSize: 12 * AppConfig.fontSizeFactor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: theme.colorScheme.surfaceContainerHighest,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class BubbleBackground extends StatelessWidget {
  const BubbleBackground({
    super.key,
    required this.scrollController,
    required this.colors,
    required this.ignore,
    required this.child,
  });

  final ScrollController scrollController;
  final List<Color> colors;
  final bool ignore;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (ignore) return child;
    return CustomPaint(
      painter: BubblePainter(
        repaint: scrollController,
        colors: colors,
        context: context,
      ),
      child: child,
    );
  }
}

class BubblePainter extends CustomPainter {
  BubblePainter({
    required this.context,
    required this.colors,
    required super.repaint,
  });

  final BuildContext context;
  final List<Color> colors;
  ScrollableState? _scrollable;

  @override
  void paint(Canvas canvas, Size size) {
    final scrollable = _scrollable ??= Scrollable.of(context);
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final scrollableRect = Offset.zero & scrollableBox.size;
    final bubbleBox = context.findRenderObject() as RenderBox;

    final origin =
        bubbleBox.localToGlobal(Offset.zero, ancestor: scrollableBox);
    final paint = Paint()
      ..shader = ui.Gradient.linear(
        scrollableRect.topCenter,
        scrollableRect.bottomCenter,
        colors,
        [0.0, 1.0],
        TileMode.clamp,
        Matrix4.translationValues(-origin.dx, -origin.dy, 0.0).storage,
      );
    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(BubblePainter oldDelegate) {
    final scrollable = Scrollable.of(context);
    final oldScrollable = _scrollable;
    _scrollable = scrollable;
    return scrollable.position != oldScrollable?.position;
  }
}
