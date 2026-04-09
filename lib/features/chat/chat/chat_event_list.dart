import 'package:bmp/core/config/themes.dart';
import 'package:bmp/features/chat/chat/chat.dart';
import 'package:bmp/features/chat/chat/events/message.dart';
import 'package:bmp/features/chat/chat/seen_by_row.dart';
import 'package:bmp/features/chat/chat/typing_indicators.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/account_config.dart';
import 'package:bmp/shared/utils/adaptive_loader_widget.dart';
import 'package:bmp/shared/utils/matrix_sdk_extensions/filtered_timeline_extension.dart';
import 'package:bmp/shared/utils/platform_infos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ChatEventList extends StatefulWidget {
  final ChatController controller;

  const ChatEventList({
    super.key,
    required this.controller,
  });

  @override
  State<ChatEventList> createState() => _ChatEventListState();
}

class _ChatEventListState extends State<ChatEventList> {
  String? _currentStickyDate;
  bool _isScrolling = false;

  String _getWhatsAppDateFormat(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final messageDate = DateTime(date.year, date.month, date.day);

    if (messageDate == today) {
      return L10n.of(context).today;
    } else if (messageDate == yesterday) {
      return L10n.of(context).yesterday;
    } else if (now.difference(messageDate).inDays < 7) {
      return DateFormat('EEEE', Localizations.localeOf(context).toString()).format(date);
    } else {
      return DateFormat('M/d/yyyy').format(date);
    }
  }

  void _updateStickyDate() {
    final timeline = widget.controller.timeline;
    if (timeline == null || timeline.events.isEmpty) return;

    final scrollController = widget.controller.scrollController;
    if (!scrollController.hasClients) return;

    final events = timeline.events.filterByVisibleInGui();
    if (events.isEmpty) return;

    final isAtEnd = scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 10;

    if (isAtEnd) {
      return;
    }

    final scrollOffset = scrollController.offset;
    final maxScrollExtent = scrollController.position.maxScrollExtent;

    // Calculate visible event index (reverse list adjustment)
    final visibleRatio = scrollOffset / maxScrollExtent;
    final visibleIndex =
        (events.length * visibleRatio).floor().clamp(0, events.length - 1);

    final visibleEvent = events[visibleIndex];
    final newDate = _getWhatsAppDateFormat(visibleEvent.originServerTs);

    if (_currentStickyDate != newDate) {
      setState(() {
        _currentStickyDate = newDate;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Don't show sticky date immediately on chat open
  }

  @override
  Widget build(BuildContext context) {
    final timeline = widget.controller.timeline;

    if (timeline == null) {
      return const Center(child: CupertinoActivityIndicator());
    }
    final theme = Theme.of(context);

    final colors = [
      theme.secondaryBubbleColor,
      theme.bubbleColor,
    ];

    final horizontalPadding = FluffyThemes.isColumnMode(context) ? 8.0 : 0.0;

    // Get events and maintain chronological order for failed messages
    var events = timeline.events.filterByVisibleInGui();
    
    // FIX: Maintain position of unsent messages (images, etc.) according to timestamp
    // instead of moving them to the end when new messages arrive
    // Create a stable sort that maintains position of unsent messages
    final indexedEvents = events.asMap().entries.map((entry) => 
        MapEntry(entry.key, entry.value),).toList();
    
    // Sort while preserving the relative order of unsent messages based on timestamp
    indexedEvents.sort((a, b) {
      final eventA = a.value;
      final eventB = b.value;
      
      // Always sort by timestamp to maintain chronological order
      final timeA = eventA.originServerTs;
      final timeB = eventB.originServerTs;
      
      // For messages with the same timestamp, maintain original order
      final timeComparison = timeB.compareTo(timeA);
      if (timeComparison == 0) {
        return a.key.compareTo(b.key);
      }
      
      return timeComparison; // Reverse chronological order (newest first)
    });
    
    events = indexedEvents.map((entry) => entry.value).toList();
    
    final animateInEventIndex = widget.controller.animateInEventIndex;

    final thisEventsKeyMap = <String, int>{};
    for (var i = 0; i < events.length; i++) {
      thisEventsKeyMap[events[i].eventId] = i;
    }

    final hasWallpaper =
        widget.controller.room.client.applicationAccountConfig.wallpaperUrl !=
            null;

    return Stack(
      children: [
        SelectionArea(
          child: NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollUpdateNotification) {
                // Only show sticky date if user is actively scrolling
                if (!_isScrolling) {
                  setState(() {
                    _isScrolling = true;
                  });
                }
                _updateStickyDate();
              } else if (scrollNotification is ScrollEndNotification) {
                Future.delayed(const Duration(milliseconds: 500), () {
                  if (mounted) {
                    setState(() {
                      _isScrolling = false;
                    });
                  }
                });
              }
              return false;
            },
            child: ListView.custom(
              padding: EdgeInsets.only(
                top: 0,
                bottom: 8,
                left: horizontalPadding,
                right: horizontalPadding,
              ),
              reverse: true,
              controller: widget.controller.scrollController,
              keyboardDismissBehavior: PlatformInfos.isIOS
                  ? ScrollViewKeyboardDismissBehavior.onDrag
                  : ScrollViewKeyboardDismissBehavior.manual,
              childrenDelegate: SliverChildBuilderDelegate(
                (BuildContext context, int i) {
                  if (i == 0) {
                    if (timeline.isRequestingFuture) {
                      return const Center(
                        child:
                            AdaptiveLoaderWidget(),
                      );
                    }
                    if (timeline.canRequestFuture) {
                      return Center(
                        child: IconButton(
                          onPressed: widget.controller.requestFuture,
                          icon: const Icon(Icons.refresh_outlined),
                        ),
                      );
                    }
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SeenByRow(widget.controller),
                        TypingIndicators(widget.controller),
                      ],
                    );
                  }

                  if (i == events.length + 1) {
                    if (timeline.isRequestingHistory) {
                      return const Center(
                        child:
                            AdaptiveLoaderWidget(),
                      );
                    }
                    if (timeline.canRequestHistory) {
                      return Builder(
                        builder: (context) {
                          return Center(
                            child: IconButton(
                              onPressed: widget.controller.requestHistory,
                              icon: const Icon(Icons.refresh_outlined),
                            ),
                          );
                        },
                      );
                    }
                    return const SizedBox.shrink();
                  }
                  i--;

                  final event = events[i];
                  final nextEvent =
                      i + 1 < events.length ? events[i + 1] : null;
                  final animateIn = animateInEventIndex != null &&
                      timeline.events.length > animateInEventIndex &&
                      event == timeline.events[animateInEventIndex];

                  // Show date separator when date changes between messages
                  var showDateSeparator = false;
                  if (nextEvent != null) {
                    final currentDate = DateTime(
                      event.originServerTs.year,
                      event.originServerTs.month,
                      event.originServerTs.day,
                    );
                    final nextDate = DateTime(
                      nextEvent.originServerTs.year,
                      nextEvent.originServerTs.month,
                      nextEvent.originServerTs.day,
                    );
                    showDateSeparator = currentDate != nextDate;
                  } else if (i == events.length - 1) {
                    // Always show date separator for the oldest message
                    showDateSeparator = true;
                  }

                  return Column(
                    children: [
                      if (showDateSeparator)
                        Padding(
                          padding: const EdgeInsets.only(top: 0, bottom: 10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: ShapeDecoration(
                              color: const Color(0xff1B1C30).withOpacity(0.5),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  width: 1,
                                  color: Color(0xFF1B1C30),
                                ),
                                borderRadius: BorderRadius.circular(1000),
                              ),
                              shadows: const [
                                BoxShadow(
                                  color: Color(0xFF2A2F35),
                                  blurRadius: 16,
                                  offset: Offset(0, 0),
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Text(
                              _getWhatsAppDateFormat(event.originServerTs),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      AutoScrollTag(
                        key: ValueKey(event.eventId),
                        index: i,
                        controller: widget.controller.scrollController,
                        child: Message(
                          event,
                          animateIn: animateIn,
                          resetAnimateIn: () {
                            widget.controller.animateInEventIndex = null;
                          },
                          onSwipe: () =>
                              widget.controller.replyAction(replyTo: event),
                          onInfoTab: widget.controller.showEventInfo,
                          onMention: () => widget
                                  .controller.sendController.text +=
                              '${event.senderFromMemoryOrFallback.mention} ',
                          highlightMarker:
                              widget.controller.scrollToEventIdMarker ==
                                  event.eventId,
                          onSelect: widget.controller.onSelectMessage,
                          scrollToEventId: (String eventId) =>
                              widget.controller.scrollToEventId(eventId),
                          longPressSelect:
                              widget.controller.selectedEvents.isNotEmpty,
                          selected: widget.controller.selectedEvents
                              .any((e) => e.eventId == event.eventId),
                          singleSelected: widget.controller.selectedEvents
                                  .singleOrNull?.eventId ==
                              event.eventId,
                          onEdit: () =>
                              widget.controller.editSelectedEventAction(),
                          onLongPressAction:
                              widget.controller.showMessageActionDialog,
                          timeline: timeline,
                          displayReadMarker: i > 0 &&
                              widget.controller.readMarkerEventId ==
                                  event.eventId,
                          nextEvent:
                              i + 1 < events.length ? events[i + 1] : null,
                          previousEvent: i > 0 ? events[i - 1] : null,
                          wallpaperMode: hasWallpaper,
                          scrollController: widget.controller.scrollController,
                          colors: colors,
                        ),
                      ),
                    ],
                  );
                },
                childCount: events.length + 2,
                findChildIndexCallback: (key) => widget.controller
                    .findChildIndexCallback(key, thisEventsKeyMap),
              ),
            ),
          ),
        ),
        if (_currentStickyDate != null && _isScrolling)
          Positioned(
            top: 8,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: ShapeDecoration(
                  color: const Color(0xff1B1C30).withOpacity(0.9),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 1,
                      color: Color(0xFF1B1C30),
                    ),
                    borderRadius: BorderRadius.circular(1000),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0xFF2A2F35),
                      blurRadius: 16,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Text(
                  _currentStickyDate!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
