import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/chat/dialer/providers/call_audio_provider.dart';
import 'package:bmp/features/chat/dialer/providers/call_controls_provider.dart';
import 'package:bmp/features/chat/dialer/providers/call_state_provider.dart';
import 'package:bmp/features/chat/dialer/providers/network_quality_provider.dart';
import 'package:bmp/features/chat/voip/services/network_quality_service.dart';
import 'package:bmp/features/chat/dialer/widgets/call_action_buttons.dart';
import 'package:bmp/features/chat/dialer/widgets/call_hold_view.dart';
import 'package:bmp/features/chat/dialer/widgets/call_video_layout.dart';
import 'package:bmp/features/chat/dialer/widgets/call_waiting_view.dart';
import 'package:bmp/features/chat/dialer/widgets/network_quality_indicator.dart';
import 'package:bmp/shared/utils/matrix_sdk_extensions/matrix_locals.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';
import 'package:provider/provider.dart';

/// Modern call screen using providers and reusable widgets
/// Clean architecture with separated concerns
class CallScreen extends StatefulWidget {
  const CallScreen({
    required this.call,
    required this.client,
    this.onClear,
    super.key,
  });

  final CallSession call;
  final Client client;
  final VoidCallback? onClear;

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  late CallStateProvider _callStateProvider;
  late CallAudioProvider _audioProvider;
  late CallControlsProvider _controlsProvider;
  late NetworkQualityProvider _networkQualityProvider;

  @override
  void initState() {
    super.initState();
    _initializeProviders();
  }

  void _initializeProviders() {
    _callStateProvider = CallStateProvider();
    _audioProvider = CallAudioProvider();
    _controlsProvider = CallControlsProvider();
    _networkQualityProvider = NetworkQualityProvider();

    _callStateProvider.initializeCall(widget.call);
    _controlsProvider.initializeCall(widget.call);
    
    // Set up error callback for controls (e.g., speaker toggle failure)
    _controlsProvider.setErrorCallback((message) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    });

    // Start ringtone for incoming calls
    if (widget.call.direction == CallDirection.kIncoming &&
        widget.call.state == CallState.kRinging) {
      _audioProvider.startRingtone();
    }

    // Listen to state changes
    _callStateProvider.addListener(_onCallStateChanged);
  }

  void _onCallStateChanged() {
    if (!mounted) return;
    
    final state = _callStateProvider.state;

    // Stop ringtone for any state change after ringing
    if (state != CallState.kRinging) {
      _audioProvider.stopRingtone();
    }
    
    // Start network monitoring when connected
    if (state == CallState.kConnected) {
      try {
        _networkQualityProvider.startMonitoring(_callStateProvider.peerConnection);
      } catch (e) {
        // Ignore if peer connection not available
      }
    }

    // Clean up when call ends
    if (state == CallState.kEnded) {
      _audioProvider.stopRingtone();
      _callStateProvider.cleanUp();
      
      // Use post frame callback to avoid calling during build
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && context.mounted) {
          widget.onClear?.call();
        }
      });
    }
  }

  @override
  void dispose() {
    // Ensure ringtone is stopped in all exit paths
    _audioProvider.stopRingtone();
    
    _callStateProvider.removeListener(_onCallStateChanged);
    _callStateProvider.dispose();
    _audioProvider.dispose();
    _controlsProvider.dispose();
    _networkQualityProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _callStateProvider),
        ChangeNotifierProvider.value(value: _audioProvider),
        ChangeNotifierProvider.value(value: _controlsProvider),
        ChangeNotifierProvider.value(value: _networkQualityProvider),
      ],
      child: Scaffold(
        backgroundColor: const Color(0xFF1B1C30),
        body: OrientationBuilder(
          builder: (context, orientation) {
            return _buildCallContent(context, orientation);
          },
        ),
      ),
    );
  }

  Widget _buildCallContent(BuildContext context, Orientation orientation) {
    return Consumer4<CallStateProvider, CallAudioProvider, CallControlsProvider, NetworkQualityProvider>(
      builder: (context, callState, audio, controls, networkQuality, child) {
        // Call ended
        if (callState.callHasEnded) {
          return const SizedBox.shrink();
        }

        return Stack(
          children: [
            // Main content area - shows hold view OR video/waiting content
            if (callState.isLocalHold || callState.isRemoteHold)
              // On hold - show hold view in the content area
              Positioned(
                top: MediaQuery.of(context).padding.top + 10,
                left: 10,
                right: 10,
                bottom: 100 + MediaQuery.of(context).padding.bottom,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0x7F131EBF),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: const Color(0xFF131EBF), width: 1),
                  ),
                  child: CallHoldView(
                    title: _getHoldTitle(context, callState),
                  ),
                ),
              )
            else
              // Normal - show video/waiting content
              _buildMainContent(context, callState, networkQuality, Orientation.portrait),
            
            // Network quality indicator (top left)
            if (callState.isConnected)
              Positioned(
                top: MediaQuery.of(context).padding.top + 10,
                left: 10,
                child: NetworkQualityIndicator(
                  quality: networkQuality.quality,
                ),
              ),
            
            // Action buttons
            Positioned(
                bottom: MediaQuery.of(context).viewPadding.bottom > 0 
                    ? MediaQuery.of(context).viewPadding.bottom + 10
                    : 40,
                left: 0,
                right: 0,
                child: _buildActionButtons(context, callState, controls),
              ),
          ],
        );
      },
    );
  }

  Widget _buildMainContent(
    BuildContext context,
    CallStateProvider callState,
    NetworkQualityProvider networkQuality,
    Orientation orientation,
  ) {
    // Show video/audio layout if connected OR if answering/connecting (optimization)
    // This shows the call UI immediately after swipe, without delay
    final showCallLayout = callState.isConnected || 
                           callState.isAnswering ||
                           callState.state == CallState.kConnecting ||
                           callState.state == CallState.kCreateAnswer;
    
    // Check if network is disconnected for reconnecting overlay
    final isReconnecting = networkQuality.quality == NetworkQuality.disconnected;
    
    if (showCallLayout) {
      return CallVideoLayout(
        call: widget.call,
        client: widget.client,
        isConnected: callState.isConnected,
        orientation: orientation,
        displayName: widget.call.room.getLocalizedDisplayname(
          MatrixLocals(L10n.of(context)),
        ),
        isMicMuted: callState.isMicMuted,
        isRemoteMicMuted: callState.isRemoteMicMuted,
        isReconnecting: isReconnecting,
      );
    }

    // Show waiting view for incoming/outgoing calls (before answer)
    return CallWaitingView(
      room: widget.call.room,
      displayName: widget.call.room.getLocalizedDisplayname(
        MatrixLocals(L10n.of(context)),
      ),
      client: widget.client,
      isOutgoing: callState.isOutgoing,
      isVoiceOnly: callState.voiceOnly,
      callState: callState.state,
    );
  }

  Widget _buildActionButtons(
    BuildContext context,
    CallStateProvider callState,
    CallControlsProvider controls,
  ) {
    return CallActionButtons(
      state: callState.state,
      isAnswering: callState.isAnswering,
      isOutgoing: callState.isOutgoing,
      isVoiceOnly: callState.voiceOnly,
      isMicMuted: callState.isMicMuted,
      isVideoMuted: callState.isVideoMuted,
      isScreenSharing: callState.isScreenSharing,
      isRemoteHold: callState.isRemoteHold,
      isSpeakerOn: controls.isSpeakerOn,
      onAnswer: () => _handleAnswer(context, callState),
      onHangup: () => _handleHangup(callState),
      onMuteMic: controls.toggleMic,
      onMuteCamera: controls.toggleCamera,
      onSwitchCamera: controls.switchCamera,
      onScreenSharing: () => controls.toggleScreenSharing(context),
      onHold: controls.toggleHold,
      onToggleSpeaker: controls.toggleSpeaker,
    );
  }

  Future<void> _handleAnswer(BuildContext context, CallStateProvider callState) async {
    // Stop ringtone immediately when answer button is pressed
    _audioProvider.stopRingtone();
    
    try {
      await callState.answerCall();
    } catch (e) {
      if (mounted && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to answer: ${e.toString().split('\n').first}'),
          ),
        );
      }
    }
  }

  Future<void> _handleHangup(CallStateProvider callState) async {
    // Stop ringtone immediately when hangup button is pressed
    _audioProvider.stopRingtone();
    await callState.hangupCall();
  }

  String _getHoldTitle(BuildContext context, CallStateProvider callState) {
    if (callState.isLocalHold) {
      return L10n.of(context).heldTheCall(
        widget.call.room.getLocalizedDisplayname(
          MatrixLocals(L10n.of(context)),
        ),
      );
    } else {
      return L10n.of(context).youHeldTheCall;
    }
  }
}
