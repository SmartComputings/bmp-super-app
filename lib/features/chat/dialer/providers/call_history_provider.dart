import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';
import 'package:bmp/features/chat/dialer/widgets/call_history/calls_history_screen.dart' show CallFilter;

/// Model for a call history entry
class CallHistoryEntry {
  final String callId;
  final String roomId;
  final String displayName;
  final Uri? avatarUrl;
  final DateTime timestamp;
  final Duration? duration;
  final CallHistoryStatus status;
  final bool isOutgoing;
  final bool isVideo;
  final String senderId;

  CallHistoryEntry({
    required this.callId,
    required this.roomId,
    required this.displayName,
    this.avatarUrl,
    required this.timestamp,
    this.duration,
    required this.status,
    required this.isOutgoing,
    required this.isVideo,
    required this.senderId,
  });
}

enum CallHistoryStatus {
  answered,
  missed,
  rejected,
  outgoing,
}

/// Provider for managing call history
class CallHistoryProvider extends ChangeNotifier {
  final Client client;
  List<CallHistoryEntry> _callHistory = [];
  bool _isLoading = false;
  String? _error;

  CallHistoryProvider({required this.client});

  List<CallHistoryEntry> get callHistory => _callHistory;
  bool get isLoading => _isLoading;
  String? get error => _error;
  
  // Filter state - moved from screen widget
  CallFilter _selectedFilter = CallFilter.allCalls;
  CallFilter get selectedFilter => _selectedFilter;
  
  void setFilter(CallFilter filter) {
    if (_selectedFilter != filter) {
      _selectedFilter = filter;
      notifyListeners();
    }
  }

  /// Load call history from all rooms
  Future<void> loadCallHistory() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final List<CallHistoryEntry> allCalls = [];
      
      // Get all joined rooms
      for (final room in client.rooms) {
        if (room.membership == Membership.join) {
          final roomCalls = await _getCallsFromRoom(room);
          allCalls.addAll(roomCalls);
        }
      }
      
      // Sort by timestamp (newest first)
      allCalls.sort((a, b) => b.timestamp.compareTo(a.timestamp));
      
      _callHistory = allCalls;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      Logs().e('[CallHistoryProvider] Error loading call history: $e');
    }
  }

  /// Get call events from a specific room
  Future<List<CallHistoryEntry>> _getCallsFromRoom(Room room) async {
    final List<CallHistoryEntry> calls = [];
    final Map<String, _CallSessionBuilder> sessions = {};
    
    try {
      // Get room timeline
      final timeline = await room.getTimeline();
      
      // Request history if needed
      if (timeline.events.length < 100) {
        await timeline.requestHistory(historyCount: 100);
      }
      
      // Filter call events
      for (final event in timeline.events) {
        if (!event.type.startsWith('m.call.')) continue;
        
        final callId = event.content['call_id'] as String?;
        if (callId == null) continue;
        
        // Initialize session if not exists
        sessions.putIfAbsent(callId, () => _CallSessionBuilder(
          callId: callId,
          roomId: room.id,
          room: room,
        ));
        
        final session = sessions[callId]!;
        
        // Process event based on type
        switch (event.type) {
          case 'm.call.invite':
            session.inviteEvent = event;
            final offer = event.content['offer'];
            if (offer is Map) {
              session.isVideo = offer['sdp']?.toString().contains('m=video') ?? false;
            }
            break;
          case 'm.call.answer':
            session.answerEvent = event;
            break;
          case 'm.call.hangup':
            session.hangupEvent = event;
            break;
          case 'm.call.reject':
            session.rejectEvent = event;
            break;
        }
      }
      
      // Convert sessions to entries
      for (final session in sessions.values) {
        final entry = session.toEntry(client.userID ?? '');
        if (entry != null) {
          calls.add(entry);
        }
      }
      
      timeline.cancelSubscriptions();
    } catch (e) {
      Logs().e('[CallHistoryProvider] Error getting calls from room ${room.id}: $e');
    }
    
    return calls;
  }

  /// Refresh call history
  Future<void> refresh() async {
    await loadCallHistory();
  }

  /// Get filtered calls
  List<CallHistoryEntry> getFilteredCalls({
    bool? missedOnly,
    bool? outgoingOnly,
    String? searchQuery,
  }) {
    var filtered = _callHistory;
    
    if (missedOnly == true) {
      filtered = filtered.where((c) => c.status == CallHistoryStatus.missed).toList();
    }
    
    if (outgoingOnly == true) {
      filtered = filtered.where((c) => c.isOutgoing).toList();
    }
    
    if (searchQuery != null && searchQuery.isNotEmpty) {
      final query = searchQuery.toLowerCase();
      filtered = filtered.where((c) => 
        c.displayName.toLowerCase().contains(query)
      ).toList();
    }
    
    return filtered;
  }
}

/// Helper class to build call session from events
class _CallSessionBuilder {
  final String callId;
  final String roomId;
  final Room room;
  
  Event? inviteEvent;
  Event? answerEvent;
  Event? hangupEvent;
  Event? rejectEvent;
  bool isVideo = false;

  _CallSessionBuilder({
    required this.callId,
    required this.roomId,
    required this.room,
  });

  CallHistoryEntry? toEntry(String myUserId) {
    // Must have at least an invite event
    if (inviteEvent == null) return null;
    
    final isOutgoing = inviteEvent!.senderId == myUserId;
    
    // Determine status
    CallHistoryStatus status;
    Duration? duration;
    
    if (answerEvent != null) {
      status = CallHistoryStatus.answered;
      
      // Calculate duration if hangup exists
      if (hangupEvent != null) {
        duration = hangupEvent!.originServerTs.difference(answerEvent!.originServerTs);
      }
    } else if (rejectEvent != null) {
      status = CallHistoryStatus.rejected;
    } else if (hangupEvent != null && !isOutgoing) {
      // Hangup without answer from incoming call = missed
      status = CallHistoryStatus.missed;
    } else if (isOutgoing) {
      status = CallHistoryStatus.outgoing;
    } else {
      status = CallHistoryStatus.missed;
    }
    
    // Get display name (other party)
    String displayName;
    Uri? avatarUrl;
    String senderId;
    
    if (isOutgoing) {
      // For outgoing calls, get the room's display name
      displayName = room.getLocalizedDisplayname();
      avatarUrl = room.avatar;
      senderId = room.directChatMatrixID ?? '';
    } else {
      // For incoming calls, get the caller's info
      displayName = inviteEvent!.senderFromMemoryOrFallback.displayName ?? 
                    inviteEvent!.senderId;
      avatarUrl = inviteEvent!.senderFromMemoryOrFallback.avatarUrl;
      senderId = inviteEvent!.senderId;
    }
    
    return CallHistoryEntry(
      callId: callId,
      roomId: roomId,
      displayName: displayName,
      avatarUrl: avatarUrl,
      timestamp: inviteEvent!.originServerTs,
      duration: duration,
      status: status,
      isOutgoing: isOutgoing,
      isVideo: isVideo,
      senderId: senderId,
    );
  }
}
