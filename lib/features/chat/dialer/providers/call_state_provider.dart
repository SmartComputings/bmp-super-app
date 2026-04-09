import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:matrix/matrix.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

/// Manages VoIP call state and lifecycle
/// Handles state changes, streams, and call actions
class CallStateProvider extends ChangeNotifier {
  CallSession? _call;
  CallState? _state;
  bool _isAnswering = false;
  bool _disposed = false;
  StreamSubscription? _stateSubscription;
  StreamSubscription? _eventSubscription;
  StreamSubscription? _presenceSubscription;
  bool _isRingingDetected = false;

  // Getters
  CallSession? get call => _call;
  CallState? get state => _isRingingDetected && _state == CallState.kInviteSent ? CallState.kRinging : _state;
  bool get isAnswering => _isAnswering;
  bool get isConnected => _state == CallState.kConnected;
  bool get isConnecting => _state == CallState.kConnecting;
  bool get isRinging => _isRingingDetected || _state == CallState.kRinging;
  bool get isEnded => _state == CallState.kEnded;
  bool get voiceOnly => _call?.type == CallType.kVoice;
  bool get isOutgoing => _call?.isOutgoing ?? false;
  bool get isIncoming => _call?.direction == CallDirection.kIncoming;

  // Stream getters
  MediaStream? get localStream => _call?.localUserMediaStream?.stream;
  MediaStream? get remoteStream => 
      _call?.getRemoteStreams.isNotEmpty == true 
          ? _call!.getRemoteStreams[0].stream 
          : null;
  
  WrappedMediaStream? get localUserMediaStream => _call?.localUserMediaStream;
  WrappedMediaStream? get remoteUserMediaStream => _call?.remoteUserMediaStream;
  WrappedMediaStream? get localScreenSharingStream => _call?.localScreenSharingStream;
  WrappedMediaStream? get remoteScreenSharingStream => _call?.remoteScreenSharingStream;
  List<WrappedMediaStream> get remoteStreams => _call?.getRemoteStreams ?? [];

  // Control states
  bool get isMicMuted => _call?.isMicrophoneMuted ?? false;
  bool get isRemoteMicMuted {
    final remoteStream = _call?.remoteUserMediaStream;
    return remoteStream?.audioMuted ?? false;
  }
  bool get isVideoMuted => _call?.isLocalVideoMuted ?? false;
  bool get isScreenSharing => _call?.screensharingEnabled ?? false;
  bool get isLocalHold => _call?.localHold ?? false;
  bool get isRemoteHold => _call?.remoteOnHold ?? false;
  bool get callHasEnded => _call?.callHasEnded ?? true;
  
  // Expose peer connection for network stats
  RTCPeerConnection? get peerConnection => _call?.pc;

  /// Initialize call provider with a call session
  void initializeCall(CallSession call) {
    _call = call;
    _state = call.state;
    
    Logs().i('[CallStateProvider] Initializing call: ${call.callId}');
    Logs().i('[CallStateProvider] State: ${call.state}, Direction: ${call.direction}');

    // Listen to state changes
    _stateSubscription = call.onCallStateChanged.stream.listen(_handleStateChange);

    // Listen to call events
    _eventSubscription = call.onCallEventChanged.stream.listen(_handleCallEvent);

    // Check presence and listen to answer event for outgoing calls
    if (call.isOutgoing) {
      _checkPresence();
      _presenceSubscription = call.room.client.onEvent.stream.listen((event) {
        if (event.type == EventUpdateType.timeline &&
            event.content['type'] == 'm.call.answer' &&
            event.content['content']?['call_id'] == call.callId &&
            !_isRingingDetected) {
          Logs().i('[CallStateProvider] ✅ Ringing - receiver answered');
          _isRingingDetected = true;
          if (!_disposed) notifyListeners();
        }
      });
    }

    // Enable wakelock for video calls
    if (call.type == CallType.kVideo) {
      try {
        unawaited(WakelockPlus.enable());
      } catch (e) {
        Logs().w('[CallStateProvider] Failed to enable wakelock: $e');
      }
    }

    notifyListeners();
  }

  void _checkPresence() async {
    if (_call == null || _disposed) return;
    
    final receiverId = _call!.room.directChatMatrixID;
    if (receiverId == null) return;

    try {
      final presence = await _call!.room.client.fetchCurrentPresence(receiverId);
      
      if (presence?.presence.isOnline == true && !_isRingingDetected) {
        Logs().i('[CallStateProvider] ✅ Receiver online - Ringing');
        _isRingingDetected = true;
        if (!_disposed) notifyListeners();
      }
    } catch (e) {
      Logs().w('[CallStateProvider] Presence check failed: $e');
    }

    _presenceSubscription = _call!.room.client.onPresenceChanged.stream
        .where((p) => p.userid == receiverId)
        .listen((presence) {
      if (presence.presence.isOnline && !_isRingingDetected) {
        Logs().i('[CallStateProvider] ✅ Receiver online - Ringing');
        _isRingingDetected = true;
        if (!_disposed) notifyListeners();
      }
    });
  }

  /// Handle call state changes
  void _handleStateChange(CallState newState) {
    if (_disposed) return;
    
    Logs().i('[CallStateProvider] State changed: $_state → $newState');

    if ({CallState.kConnected, CallState.kEnded}.contains(newState)) {
      HapticFeedback.heavyImpact();
    }

    _state = newState;
    if (!_disposed) notifyListeners();
  }

  /// Handle call events (feeds, hold, etc.)
  void _handleCallEvent(CallStateChange event) {
    if (_disposed) return;
    
    if (event == CallStateChange.kFeedsChanged) {
      _call?.tryRemoveStopedStreams();
    }
    
    if (!_disposed) notifyListeners();
  }

  /// Answer incoming call with retry logic
  /// Maximum 3 attempts with progressive delays to handle race conditions
  static const int _maxAnswerAttempts = 3;
  
  Future<void> answerCall() async {
    if (_isAnswering || _call == null) return;
    if (_disposed) {
      Logs().w('[CallStateProvider] Cannot answer - provider disposed');
      return;
    }

    try {
      // Check if call already ended or ending
      if (_call!.state == CallState.kEnded || _call!.state == CallState.kEnding) {
        return;
      }

      // Check if already connected
      if (_call!.state == CallState.kConnecting || _call!.state == CallState.kConnected) {
        return;
      }

      _isAnswering = true;
      if (!_disposed) notifyListeners();

      Logs().i('[CallStateProvider] Answering call...');

      int attempts = 0;
      Exception? lastError;
      
      while (attempts < _maxAnswerAttempts) {
        // Check disposal and call state before each attempt
        if (_disposed || _call == null) break;
        if (_call!.state == CallState.kEnded || _call!.state == CallState.kEnding) break;
        if (_call!.state == CallState.kConnected) {
          Logs().i('[CallStateProvider] Call already connected');
          return;
        }
        
        try {
          await _call!.answer();
          Logs().i('[CallStateProvider] Call answered on attempt ${attempts + 1}');
          return;
        } catch (e) {
          lastError = e is Exception ? e : Exception(e.toString());
          attempts++;
          Logs().w('[CallStateProvider] Answer attempt $attempts failed: $e');
          
          if (attempts < _maxAnswerAttempts) {
            // Progressive delay: 1s, 2s for retry attempts
            await Future.delayed(Duration(seconds: attempts));
          }
        }
      }
      
      if (lastError != null && !_disposed) {
        throw lastError;
      }
    } catch (e, s) {
      Logs().e('[CallStateProvider] Error answering call after $_maxAnswerAttempts attempts', e, s);
      rethrow;
    } finally {
      _isAnswering = false;
      if (!_disposed) notifyListeners();
    }
  }

  /// Reject incoming call
  Future<void> rejectCall() async {
    if (_call == null) return;
    
    Logs().i('[CallStateProvider] Rejecting call');
    await _call!.reject();
  }

  /// Hangup active call
  Future<void> hangupCall() async {
    if (_call == null) return;

    Logs().i('[CallStateProvider] Hanging up call');
    
    if (_call!.isRinging) {
      await _call!.reject();
    } else {
      await _call!.hangup(reason: CallErrorCode.userHangup);
    }
  }

  /// Clean up resources
  void cleanUp() {
    if (_call == null) return; // Already cleaned up
    
    Logs().i('[CallStateProvider] Cleaning up');
    
    if (_call?.type == CallType.kVideo) {
      try {
        unawaited(WakelockPlus.disable());
      } catch (e) {
        Logs().w('[CallStateProvider] Failed to disable wakelock: $e');
      }
    }
    
    _call = null; // Mark as cleaned up
  }

  @override
  void dispose() {
    _disposed = true;
    
    Logs().i('[CallStateProvider] Disposing');
    
    _stateSubscription?.cancel();
    _eventSubscription?.cancel();
    _presenceSubscription?.cancel();
    _stateSubscription = null;
    _eventSubscription = null;
    _presenceSubscription = null;
    
    cleanUp();
    
    super.dispose();
  }
}
