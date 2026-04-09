import 'dart:async';

import 'package:bmp/features/chat/chat/chat.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/matrix_sdk_extensions/matrix_locals.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/widgets/adaptive_dialogs/show_modal_action_popup.dart';
import 'package:bmp/shared/widgets/future_loading_dialog.dart';
import 'package:flutter/material.dart';

import 'package:matrix/matrix.dart';

class PinnedEvents extends StatefulWidget {
  final ChatController controller;

  const PinnedEvents(this.controller, {super.key});

  @override
  State<PinnedEvents> createState() => _PinnedEventsState();
}

class _PinnedEventsState extends State<PinnedEvents> {
  late PageController _pageController;
  int _currentIndex = 0;
  List<Event?> _pinnedEvents = [];
  static const int maxPinnedMessages = 5;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _loadPinnedEvents();
    
    // Listen to room updates for real-time pinned events changes
    widget.controller.room.onUpdate.stream.listen((_) {
      if (mounted) {
        final currentPinnedIds = widget.controller.room.pinnedEventIds;
        if (currentPinnedIds.length != _pinnedEvents.length) {
          _loadPinnedEvents();
          // Reset current index if it's out of bounds
          if (_currentIndex >= currentPinnedIds.length && currentPinnedIds.isNotEmpty) {
            setState(() {
              _currentIndex = 0;
            });
          }
        }
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _loadPinnedEvents() async {
    final events = await Future.wait(
      widget.controller.room.pinnedEventIds.map(
        (eventId) => widget.controller.room.getEventById(eventId),
      ),
    );
    if (mounted) {
      setState(() {
        _pinnedEvents = events;
      });
    }
  }
Future<void> _showPinLimitDialog() async {
  await showModalActionPopup(
    context: context,
    title: L10n.of(context).replaceOldestPin,
    message: L10n.of(context).yourNewPinWillReplace,
    actions: [
      AdaptiveModalAction(
        label: L10n.of(context).continueText,
        value: true,
      ),
    ],
    cancelLabel: L10n.of(context).cancel,
  );
}

  

  bool canPinMoreMessages() {
    return widget.controller.room.pinnedEventIds.length < maxPinnedMessages;
  }

  void _onPinnedMessageTap() {
    if (_pinnedEvents.isEmpty) return;
    
    final currentEvent = _pinnedEvents[_currentIndex];
    if (currentEvent?.eventId != null) {
      widget.controller.scrollToEventId(currentEvent!.eventId);
    }
  }

  void _nextPinnedMessage() {
    if (_pinnedEvents.length <= 1) return;
    
    final nextIndex = (_currentIndex + 1) % _pinnedEvents.length;
    _pageController.animateToPage(
      nextIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _previousPinnedMessage() {
    if (_pinnedEvents.length <= 1) return;
    
    final prevIndex = (_currentIndex - 1 + _pinnedEvents.length) % _pinnedEvents.length;
    _pageController.animateToPage(
      prevIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final pinnedEventIds = widget.controller.room.pinnedEventIds;

    if (pinnedEventIds.isEmpty) {
      return const SizedBox.shrink();
    }

    // Reload events if the pinned event IDs changed
    if (pinnedEventIds.length != _pinnedEvents.length) {
      _loadPinnedEvents();
      // Reset current index if it's out of bounds
      if (_currentIndex >= pinnedEventIds.length) {
        _currentIndex = 0;
      }
    }

    if (_pinnedEvents.isEmpty) {
      return const SizedBox.shrink();
    }

    // Hide pinned messages if any are encrypted
    if (_pinnedEvents.any((event) => 
        event?.type == EventTypes.Encrypted || 
        event?.messageType == MessageTypes.BadEncrypted,)) {
      return const SizedBox.shrink();
    }

    return GestureDetector(
      onTap: _onPinnedMessageTap,
      child: ClipRect(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 3),
          child: Container(
            width: double.infinity,
            height: context.percentHeight * 7,
            padding: EdgeInsets.symmetric(
              horizontal: context.percentWidth * 4,
              vertical: context.percentHeight * 1,
            ),
            decoration: ShapeDecoration(
              color:const Color(0xFF1F252D),
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  width: 1,
                  color: Color(0xFF4E19BF),
                ),
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            child: Row(
              children: [
                Container(
                  height: double.infinity,
                  padding: const EdgeInsets.all(4),
                  decoration: ShapeDecoration(
                    color: const Color(0xFF282130),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1000),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          width: 4,
                          decoration: ShapeDecoration(
                            color:const Color(0xFF3976F8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1000),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Expanded(
                        child: Container(
                          width: 4,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF8B8988),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1000),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                // Scrollable content area
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                           Text(
                            L10n.of(context).pinnMessage,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'All Round Gothic',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 2),
                          Text(
                            '(${_currentIndex + 1}/${_pinnedEvents.length})',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'All Round Gothic',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Expanded(
                        child: PageView.builder(
                          controller: _pageController,
                          onPageChanged: (index) {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                          itemCount: _pinnedEvents.length,
                          itemBuilder: (context, index) {
                            final event = _pinnedEvents[index];
                            final eventText = event?.calcLocalizedBodyFallback(
                                  MatrixLocals(L10n.of(context)),
                                  withSenderNamePrefix: true,
                                  hideReply: true,
                                ) ??
                                L10n.of(context).loadingPleaseWait;
          
                            return Row(
                              children: [
                                const SizedBox(width: 14, height: 14, child: Stack()),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    eventText,
                                    style: const TextStyle(
                                      color: Color(0xFFF3F3F3),
                                      fontSize: 12,
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w400,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      // Horizontal dots row
                      if (_pinnedEvents.length > 1)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            _pinnedEvents.length,
                            (index) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 2),
                              child: GestureDetector(
                                onTap: () {
                                  _pageController.animateToPage(
                                    index,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                child: Container(
                                  width: 6,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: index == _currentIndex
                                        ? const Color(0xFFE91E63) // Pink color for active
                                        : Colors.white, // White for inactive
                                  ),
                                ),
                              ),
                            ),
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
    );
  }
}