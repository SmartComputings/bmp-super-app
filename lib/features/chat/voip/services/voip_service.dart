import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:matrix/matrix.dart';
import 'package:webrtc_interface/webrtc_interface.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart' as webrtc_impl;
import 'package:bmp/features/chat/voip/models/call_state_model.dart';
import 'package:bmp/features/chat/voip/services/audio_processing_service.dart';
import 'package:bmp/shared/utils/voip/voip_logger.dart';
import 'package:bmp/shared/utils/voip/turn_credentials.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

/// Core VoIP service - handles Matrix SDK integration
class VoipService implements WebRTCDelegate {
  final Client _client;
  late VoIP _voip;
  
  // Call timeout configuration
  static const Duration callTimeout = Duration(seconds: 60);
  
  final Map<String, CallSession> _activeCalls = {};
  final StreamController<CallSession> _callReceivedController = StreamController.broadcast();
  final StreamController<CallStateModel> _callStateController = StreamController.broadcast();
  final StreamController<String> _callEndedController = StreamController.broadcast();
  final StreamController<CallSession> _missedCallController = StreamController.broadcast();
  final StreamController<String> _callTimeoutController = StreamController.broadcast();
  
  // Parallel hangup protection
  final Set<String> _hangingUpCalls = {};
  
  // Call timeout timers
  final Map<String, Timer> _callTimeoutTimers = {};
  
  // ICE restart tracking
  final Map<RTCPeerConnection, CallSession> _pcToCall = {};
  final Map<String, int> _iceRestartAttempts = {};
  static const int _maxIceRestartAttempts = 3;
  static const Duration _iceRestartDelay = Duration(seconds: 2);
  
  // Network monitoring
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;
  Timer? _networkChangeDebounceTimer;

  VoipService(this._client);

  // Stream getters
  Stream<CallSession> get onCallReceived => _callReceivedController.stream;
  Stream<CallStateModel> get onCallStateChanged => _callStateController.stream;
  Stream<String> get onCallEnded => _callEndedController.stream;
  Stream<CallSession> get onMissedCall => _missedCallController.stream;
  Stream<String> get onCallTimeout => _callTimeoutController.stream;
  
  // Check if there's an active call
  bool get hasActiveCall => _activeCalls.values.any(
    (c) => c.state == CallState.kConnected || 
           c.state == CallState.kConnecting ||
           c.state == CallState.kRinging,
  );

  /// Initialize VoIP service
  Future<void> initialize() async {
    VoipLogger().logInfo('Initializing VoIP service');
    _voip = VoIP(
      _client,
      this,
    );
    _setupNetworkMonitoring();
    VoipLogger().logInfo('VoIP service initialized');
  }

  /// Setup network monitoring for proactive ICE restarts
  void _setupNetworkMonitoring() {
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen(_handleConnectivityChange);
  }

  /// Handle network changes with debouncing
  void _handleConnectivityChange(List<ConnectivityResult> results) {
    if (results.contains(ConnectivityResult.none)) {
       VoipLogger().logInfo('[Network] Network lost (none)');
       return; // Don't try to restart if no network
    }
    
    // Debounce to handle multiple rapid changes during switching
    if (_networkChangeDebounceTimer?.isActive ?? false) {
      _networkChangeDebounceTimer!.cancel();
    }

    // Optimized from 1000ms to 500ms for faster handover (beats WhatsApp)
    // This proactive check prevents the "Black Screen" issue by forcing immediate reconnection
    _networkChangeDebounceTimer = Timer(const Duration(milliseconds: 500), () {
      VoipLogger().logInfo('[Network] Connectivity changed to $results - Triggering ICE checks');
      _triggerProactiveIceRestart();
    });
  }

  /// Proactively trigger ICE restart for all active calls
  void _triggerProactiveIceRestart() async {
    if (_activeCalls.isEmpty) return;

    VoipLogger().logInfo('[Network] Proactively restarting ICE for ${_activeCalls.length} active calls');

    for (final call in _activeCalls.values) {
      final pc = call.pc;
      if (pc == null) continue;
      
      // Skip if call is ending
      if (call.state == CallState.kEnded || call.state == CallState.kEnding) continue;

      try {
        // Robust check before accessing PeerConnection
        if (pc.signalingState == webrtc_impl.RTCSignalingState.RTCSignalingStateClosed) {
           VoipLogger().logWarning('[Network] PeerConnection closed, skipping restart');
           continue;
        }

        VoipLogger().logInfo('[Network] Force restarting ICE for call ${call.callId} due to network switch');
        await pc.restartIce();
        
      } catch (e) {
        VoipLogger().logError('[Network] Failed to restart ICE during network switch: $e');
        // Don't crash app, just log error
      }
    }
  }

  /// Start outgoing call - optimized for speed
  Future<CallSession> startCall(Room room, CallType type) async {
    final stopwatch = Stopwatch()..start();
    VoipLogger().logInfo('Starting ${type.name} call in room ${room.id}');
    
    // Request media permissions before starting call
    try {
      // Use AudioProcessingService for optimized audio constraints
      // with advanced echo cancellation and noise suppression
      final audioConstraints = AudioProcessingService.getOptimalAudioConstraints(
        isSpeakerMode: false, // Will be updated when speaker is toggled
      );
      
      final constraints = {
        ...audioConstraints,
      };
      
      VoipLogger().logInfo('Requesting media permissions...');
      final mediaStopwatch = Stopwatch()..start();
      final stream = await mediaDevices.getUserMedia(constraints);
      VoipLogger().logInfo('Media permissions granted in ${mediaStopwatch.elapsedMilliseconds}ms');
      
      // Stop the test stream immediately - Matrix SDK will create its own
      stream.getTracks().forEach((track) => track.stop());
      await stream.dispose();
    } catch (e) {
      VoipLogger().logError('Failed to get media permissions', e);
      rethrow;
    }
    
    VoipLogger().logInfo('Sending call invitation...');
    final inviteStopwatch = Stopwatch()..start();
    final call = await _voip.inviteToCall(room, type);
    VoipLogger().logInfo('Call invitation sent in ${inviteStopwatch.elapsedMilliseconds}ms');
    
    _activeCalls[call.callId] = call;
    _setupCallListeners(call);
    
    // Start call timeout for outgoing calls
    _startCallTimeout(call.callId);
    
    VoipLogger().logInfo('Total call setup time: ${stopwatch.elapsedMilliseconds}ms');
    return call;
  }
  
  /// Start timeout timer for outgoing call
  void _startCallTimeout(String callId) {
    _cancelCallTimeout(callId);
    VoipLogger().logInfo('Starting call timeout for $callId (${callTimeout.inSeconds}s)');
    
    _callTimeoutTimers[callId] = Timer(callTimeout, () {
      final call = _activeCalls[callId];
      if (call != null && call.state != CallState.kConnected) {
        VoipLogger().logInfo('Call $callId timed out - no answer after ${callTimeout.inSeconds}s');
        _callTimeoutController.add(callId);
        endCall(callId, reason: CallErrorCode.userHangup);
      }
    });
  }
  
  /// Cancel timeout timer
  void _cancelCallTimeout(String callId) {
    _callTimeoutTimers[callId]?.cancel();
    _callTimeoutTimers.remove(callId);
  }

  /// Answer incoming call
  Future<void> answerCall(String callId) async {
    final call = _activeCalls[callId];
    if (call != null) {
      VoipLogger().logInfo('Answering call $callId');
      await call.answer();
    } else {
      VoipLogger().logWarning('Cannot answer: Call $callId not found in active calls');
    }
  }

  /// Reject incoming call
  Future<void> rejectCall(String callId) async {
    final call = _activeCalls[callId];
    if (call != null) {
      VoipLogger().logInfo('Rejecting call $callId');
      await call.reject();
    } else {
      VoipLogger().logWarning('Cannot reject: Call $callId not found in active calls');
    }
  }

  /// End active call with optional reason
  Future<void> endCall(String callId, {CallErrorCode reason = CallErrorCode.userHangup}) async {
    // Prevent parallel hangup calls for the same call
    if (_hangingUpCalls.contains(callId)) {
      VoipLogger().logWarning('Already hanging up call $callId, ignoring duplicate request');
      return;
    }
    _hangingUpCalls.add(callId);
    
    try {
      final call = _activeCalls[callId];
      if (call != null) {
        VoipLogger().logInfo('Ending call $callId with reason: ${reason.name}');
        await call.hangup(reason: reason);
      } else {
        VoipLogger().logWarning('Cannot end: Call $callId not found in active calls');
      }
    } finally {
      _hangingUpCalls.remove(callId);
    }
  }

  /// Setup listeners for call events
  void _setupCallListeners(CallSession call) {
    // Register peer connection for ICE restart tracking
    if (call.pc != null) {
      registerPeerConnection(call.pc!, call);
    }
    
    call.onCallStateChanged.stream.listen((state) {
      final callState = CallStateModel.fromCallSession(call);
      _callStateController.add(callState);
      
      // Register peer connection when it becomes available (after connection)
      if (state == CallState.kConnected && call.pc != null) {
        registerPeerConnection(call.pc!, call);
        _cancelCallTimeout(call.callId);
      }
      
      if (state == CallState.kEnded) {
        _cancelCallTimeout(call.callId);
        _activeCalls.remove(call.callId);
        _callEndedController.add(call.callId);
        
        // Clean up ICE restart tracking
        if (call.pc != null) {
          unregisterPeerConnection(call.pc!, call.callId);
        }
      }
    });
  }

  // WebRTCDelegate implementation
  @override
  MediaDevices get mediaDevices => webrtc_impl.navigator.mediaDevices;

  @override
  bool get isWeb => kIsWeb;

  @override
  Future<RTCPeerConnection> createPeerConnection(
    Map<String, dynamic> configuration, [
    Map<String, dynamic> constraints = const {},
  ]) async {
    // Use optimized TURN configuration
    final config = _optimizeIceConfiguration(configuration);
    final pc = await webrtc_impl.createPeerConnection(config, constraints);
    
    // Add ICE connection state monitoring for automatic restart
    _setupIceConnectionMonitoring(pc);
    
    return pc;
  }
  
  /// Setup ICE connection monitoring for automatic restart on network changes
  void _setupIceConnectionMonitoring(RTCPeerConnection pc) {
    pc.onIceConnectionState = (webrtc_impl.RTCIceConnectionState state) {
      VoipLogger().logInfo('[ICE] Connection state changed: $state');
      
      // Get the associated call for this peer connection
      final call = _pcToCall[pc];
      if (call == null) {
        VoipLogger().logWarning('[ICE] No call found for peer connection');
        return;
      }
      
      final callId = call.callId;
      
      switch (state) {
        case webrtc_impl.RTCIceConnectionState.RTCIceConnectionStateDisconnected:
          VoipLogger().logWarning('[ICE] Connection disconnected - scheduling restart for $callId');
          _scheduleIceRestart(pc, call);
          break;
          
        case webrtc_impl.RTCIceConnectionState.RTCIceConnectionStateFailed:
          VoipLogger().logError('[ICE] Connection failed - attempting restart for $callId');
          _performIceRestart(pc, call);
          break;
          
        case webrtc_impl.RTCIceConnectionState.RTCIceConnectionStateConnected:
        case webrtc_impl.RTCIceConnectionState.RTCIceConnectionStateCompleted:
          // Reset restart attempts on successful connection
          _iceRestartAttempts[callId] = 0;
          VoipLogger().logInfo('[ICE] Connection restored for $callId');
          break;
          
        default:
          break;
      }
    };
  }
  
  /// Schedule ICE restart with delay (for disconnected state - may recover)
  void _scheduleIceRestart(RTCPeerConnection pc, CallSession call) {
    final callId = call.callId;
    
    // Wait a moment to see if connection recovers on its own
    Future.delayed(_iceRestartDelay, () {
      // Check if still disconnected
      if (pc.iceConnectionState == webrtc_impl.RTCIceConnectionState.RTCIceConnectionStateDisconnected ||
          pc.iceConnectionState == webrtc_impl.RTCIceConnectionState.RTCIceConnectionStateFailed) {
        VoipLogger().logInfo('[ICE] Still disconnected after delay, performing restart for $callId');
        _performIceRestart(pc, call);
      } else {
        VoipLogger().logInfo('[ICE] Connection recovered on its own for $callId');
      }
    });
  }
  
  /// Perform ICE restart
  void _performIceRestart(RTCPeerConnection pc, CallSession call) async {
    final callId = call.callId;
    final attempts = _iceRestartAttempts[callId] ?? 0;
    
    if (attempts >= _maxIceRestartAttempts) {
      VoipLogger().logError('[ICE] Max restart attempts ($attempts) reached for $callId, giving up');
      return;
    }
    
    _iceRestartAttempts[callId] = attempts + 1;
    VoipLogger().logInfo('[ICE] Performing ICE restart attempt ${attempts + 1} for $callId');
    
    try {
      // Trigger ICE restart
      await pc.restartIce();
      VoipLogger().logInfo('[ICE] restartIce() called successfully for $callId');
      
      // Note: The Matrix SDK should handle the renegotiation after restartIce()
      // The next createOffer will automatically include ice restart
    } catch (e, s) {
      VoipLogger().logError('[ICE] Failed to restart ICE for $callId', e, s);
    }
  }
  
  /// Register peer connection to call mapping (called when call starts)
  void registerPeerConnection(RTCPeerConnection pc, CallSession call) {
    _pcToCall[pc] = call;
    VoipLogger().logInfo('[ICE] Registered peer connection for call ${call.callId}');
  }
  
  /// Unregister peer connection mapping (called when call ends)
  void unregisterPeerConnection(RTCPeerConnection pc, String callId) {
    _pcToCall.remove(pc);
    _iceRestartAttempts.remove(callId);
    VoipLogger().logInfo('[ICE] Unregistered peer connection for call $callId');
  }

  @override
  Future<void> playRingtone() async {
    // Handled by CallAudioProvider
  }

  @override
  Future<void> stopRingtone() async {
    // Handled by CallAudioProvider
  }

  @override
  Future<void> handleNewCall(CallSession call) async {
    VoipLogger().logInfo('New call received: ${call.callId}');
    
    // Check if already in active call - reject with busy signal
    if (hasActiveCall) {
      VoipLogger().logInfo('Rejecting call ${call.callId} - busy with another call');
      try {
        await call.reject(reason: CallErrorCode.userBusy);
      } catch (e) {
        VoipLogger().logError('Error rejecting busy call', e);
      }
      // Emit missed call event for notification
      _missedCallController.add(call);
      return;
    }
    
    _activeCalls[call.callId] = call;
    _setupCallListeners(call);
    _callReceivedController.add(call);
  }

  @override
  Future<void> handleCallEnded(CallSession session) async {
    VoipLogger().logInfo('Call ended: ${session.callId}');
    _activeCalls.remove(session.callId);
    _callEndedController.add(session.callId);
  }

  @override
  Future<void> handleNewGroupCall(GroupCallSession groupCall) async {
    // TODO: Implement group calls
  }

  @override
  Future<void> handleGroupCallEnded(GroupCallSession groupCall) async {
    // TODO: Implement group calls
  }

  @override
  bool get canHandleNewCall => true;

  @override
  Future<void> handleMissedCall(CallSession session) async {
    VoipLogger().logInfo('Missed call: ${session.callId}');
  }

  @override
  EncryptionKeyProvider? get keyProvider => null;

  @override
  Future<void> registerListeners(CallSession session) async {
    _setupCallListeners(session);
  }

  /// Optimize ICE configuration for better connectivity and low latency
  Map<String, dynamic> _optimizeIceConfiguration(Map<String, dynamic> config) {
    final optimized = Map<String, dynamic>.from(config);
    
    // Add custom TURN servers
    optimized['iceServers'] = TurnCredentials.getIceServers(userId: _client.userID);
    
    // Optimize for faster connection and lower latency
    optimized['iceCandidatePoolSize'] = 16;  // Larger pool for faster gathering
    optimized['bundlePolicy'] = 'max-bundle';
    optimized['rtcpMuxPolicy'] = 'require';
    optimized['sdpSemantics'] = 'unified-plan';
    optimized['iceTransportPolicy'] = 'all';  // Use fastest available path (direct/STUN before TURN)
    
    return optimized;
  }

  void dispose() {
    VoipLogger().logInfo('Disposing VoIP service');
    
    _connectivitySubscription?.cancel();
    _networkChangeDebounceTimer?.cancel();
    
    // Cancel all timeout timers
    for (final timer in _callTimeoutTimers.values) {
      timer.cancel();
    }
    _callTimeoutTimers.clear();
    
    _callReceivedController.close();
    _callStateController.close();
    _callEndedController.close();
    _missedCallController.close();
    _callTimeoutController.close();
    _activeCalls.clear();
  }
}