import 'dart:async';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';
import 'package:bmp/features/chat/voip/services/voip_service.dart';
import 'package:bmp/features/chat/voip/services/call_ui_service.dart';
import 'package:bmp/features/chat/voip/models/call_state_model.dart';

/// Main VoIP Manager Provider - Orchestrates all VoIP functionality
/// Clean architecture with proper separation of concerns
class VoipManagerProvider extends ChangeNotifier {
  final VoipService _voipService;
  final CallUiService _callUiService;
  
  // Current call state
  CallStateModel? _currentCall;
  bool _isInitialized = false;
  bool _disposed = false;
  CallType? _initiatingCallType;
  StreamSubscription? _callReceivedSub;
  StreamSubscription? _callStateSub;
  StreamSubscription? _callEndedSub;
  StreamSubscription? _missedCallSub;
  StreamSubscription? _callTimeoutSub;

  VoipManagerProvider({
    required VoipService voipService,
    required CallUiService callUiService,
  }) : _voipService = voipService,
       _callUiService = callUiService {
    _initialize();
  }

  // Getters
  CallStateModel? get currentCall => _currentCall;
  bool get isInitialized => _isInitialized;
  bool get hasActiveCall => _currentCall != null;
  bool get isInCall => _currentCall?.isActive ?? false;
  bool get isInitiatingCall => _initiatingCallType != null;
  CallType? get initiatingCallType => _initiatingCallType;
  bool get isInitiatingVideoCall => _initiatingCallType == CallType.kVideo;
  bool get isInitiatingVoiceCall => _initiatingCallType == CallType.kVoice;

  /// Initialize VoIP manager
  Future<void> _initialize() async {
    try {
      await _voipService.initialize();
      _setupListeners();
      _isInitialized = true;
      if (!_disposed) notifyListeners();
    } catch (e) {
      debugPrint('[VoipManager] Initialization failed: $e');
    }
  }

  /// Setup event listeners
  void _setupListeners() {
    _callReceivedSub = _voipService.onCallReceived.listen(_handleIncomingCall);
    _callStateSub = _voipService.onCallStateChanged.listen(_handleCallStateChange);
    _callEndedSub = _voipService.onCallEnded.listen(_handleCallEnded);
    _missedCallSub = _voipService.onMissedCall.listen(_handleMissedCall);
    _callTimeoutSub = _voipService.onCallTimeout.listen(_handleCallTimeout);
  }

  /// Handle missed call (e.g., due to busy)
  void _handleMissedCall(CallSession call) {
    if (_disposed) return;
    debugPrint('[VoipManager] Missed call from ${call.room.name} (busy)');
    // TODO: Show local notification for missed call
  }

  /// Handle call timeout
  void _handleCallTimeout(String callId) {
    if (_disposed) return;
    debugPrint('[VoipManager] Call $callId timed out - no answer');
    
    if (_currentCall?.callId == callId) {
      _currentCall = null;
      _callUiService.hideCallScreen();
      if (!_disposed) notifyListeners();
    }
  }

  /// Handle incoming call
  void _handleIncomingCall(CallSession call) {
    if (_disposed) return;
    
    _currentCall = CallStateModel.fromCallSession(call);
    _callUiService.showIncomingCallScreen(call);
    if (!_disposed) notifyListeners();
  }

  /// Handle call state changes
  void _handleCallStateChange(CallStateModel callState) {
    if (_disposed) return;
    
    _currentCall = callState;
    if (!_disposed) notifyListeners();
  }

  /// Handle call ended
  void _handleCallEnded(String callId) {
    if (_disposed) return;
    
    if (_currentCall?.callId == callId) {
      _currentCall = null;
      _callUiService.hideCallScreen();
      if (!_disposed) notifyListeners();
    }
  }

  /// Start outgoing call - optimized for instant screen display
  Future<void> startCall(Room room, CallType type) async {
    // Prevent duplicate calls
    if (_initiatingCallType != null) {
      debugPrint('[VoipManager] Already initiating a call, ignoring duplicate request');
      return;
    }
    
    _initiatingCallType = type;
    if (!_disposed) notifyListeners();
    
    try {
      // Start the call and show screen immediately when call object is ready
      final call = await _voipService.startCall(room, type);
      _currentCall = CallStateModel.fromCallSession(call);
      
      // Show call screen IMMEDIATELY - don't wait for connection
      _callUiService.showOutgoingCallScreen(call);
      if (!_disposed) notifyListeners();
    } catch (e) {
      debugPrint('[VoipManager] Failed to start call: $e');
      _initiatingCallType = null;
      if (!_disposed) notifyListeners();
      rethrow;
    } finally {
      _initiatingCallType = null;
      if (!_disposed) notifyListeners();
    }
  }

  /// Answer incoming call
  Future<void> answerCall() async {
    if (_currentCall == null) return;
    
    try {
      await _voipService.answerCall(_currentCall!.callId);
    } catch (e) {
      debugPrint('[VoipManager] Failed to answer call: $e');
      rethrow;
    }
  }

  /// Reject incoming call
  Future<void> rejectCall() async {
    if (_currentCall == null) return;
    
    try {
      await _voipService.rejectCall(_currentCall!.callId);
    } catch (e) {
      debugPrint('[VoipManager] Failed to reject call: $e');
      rethrow;
    }
  }

  /// End active call
  Future<void> endCall() async {
    if (_currentCall == null) return;
    
    try {
      await _voipService.endCall(_currentCall!.callId);
    } catch (e) {
      debugPrint('[VoipManager] Failed to end call: $e');
      rethrow;
    }
  }

  @override
  void dispose() {
    _disposed = true;
    _callReceivedSub?.cancel();
    _callStateSub?.cancel();
    _callEndedSub?.cancel();
    _missedCallSub?.cancel();
    _callTimeoutSub?.cancel();
    _voipService.dispose();
    _callUiService.dispose();
    super.dispose();
  }
}