import 'dart:math';
import 'package:bmp/shared/utils/adaptive_loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';
import 'package:provider/provider.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/widgets/avatar.dart';
import 'package:bmp/features/chat/dialer/providers/call_timer_provider.dart';
import 'call_stream_view.dart';

/// Manages video/voice layout for connected calls
/// Voice call: Shows avatar with wave animation
/// Video call: Shows video streams with PIP
class CallVideoLayout extends StatefulWidget {
  const CallVideoLayout({
    required this.call,
    required this.client,
    required this.isConnected,
    required this.orientation,
    required this.isMicMuted,
    required this.isRemoteMicMuted,
    this.displayName,
    this.room,
    this.isReconnecting = false,
    super.key,
  });

  final CallSession call;
  final Client client;
  final bool isConnected;
  final Orientation orientation;
  final bool isMicMuted;
  final bool isRemoteMicMuted;
  final String? displayName;
  final Room? room;
  final bool isReconnecting;

  @override
  State<CallVideoLayout> createState() => _CallVideoLayoutState();
}

class _CallVideoLayoutState extends State<CallVideoLayout> 
    with TickerProviderStateMixin {
  // Wave animation
  late AnimationController _waveController;

  // Figma colors
  static const Color _backgroundColor = Color(0xFF1B1C30);
  static const Color _overlayColor = Color(0x7F131EBF); // 50% opacity
  static const Color _borderColor = Color(0xFF131EBF);
  static const Color _surfaceColor = Color(0xFF1F252D);
  static const Color _timerBgColor = Color(0xFFFEF2F2);
  static const Color _timerTextColor = Color(0xFFF63D3D);
  static const Color _primaryTextColor = Colors.white;
  
  // Timer provider
  late CallTimerProvider _timerProvider;

  @override
  void initState() {
    super.initState();
    // Faster animation for smoother look
    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();
    
    _timerProvider = CallTimerProvider();
    
    if (widget.isConnected) {
      _timerProvider.start();
    }
  }

  @override
  void didUpdateWidget(CallVideoLayout oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isConnected && !oldWidget.isConnected) {
      _timerProvider.start();
    }
  }

  @override
  void dispose() {
    _timerProvider.dispose();
    _waveController.dispose();
    super.dispose();
  }





  // Helper to check if we have any local stream to show
  bool _hasLocalStream() {
    return widget.call.localUserMediaStream != null || 
           widget.call.localScreenSharingStream != null;
  }

  // Helper to get primary video stream (Remote share > Remote camera > Local camera)
  WrappedMediaStream? _getPrimaryStream() {
    final hasRemoteStream = widget.call.remoteScreenSharingStream != null ||
        widget.call.remoteUserMediaStream != null ||
        widget.call.getRemoteStreams.isNotEmpty;

    if (hasRemoteStream) {
      return widget.call.remoteScreenSharingStream ??
          widget.call.remoteUserMediaStream ??
          (widget.call.getRemoteStreams.isNotEmpty 
              ? widget.call.getRemoteStreams.first 
              : null);
    }
    
    // No remote stream available - show local stream (for outgoing calls before connection)
    return widget.call.localScreenSharingStream ?? 
           widget.call.localUserMediaStream;
  }

  bool get _isVoiceCall {
    // Check if it's a voice-only call using call type
    return widget.call.type == CallType.kVoice;
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    
    return Container(
      color: _backgroundColor,
      child: Stack(
        children: [
          // Main content area
          Positioned(
            top: MediaQuery.of(context).padding.top + context.percentHeight * 1.2,
            left: context.percentWidth * 2.5,
            right: context.percentWidth * 2.5,
            bottom: context.percentHeight * 12 + bottomPadding,
            child: _isVoiceCall 
                ? _buildVoiceCallLayout() 
                : _buildVideoCallLayout(),
          ),
          
          // Call timer (top center)
          if (widget.isConnected)
            Positioned(
              top: MediaQuery.of(context).padding.top,
              left: 0,
              right: 0,
              child: Center(child: _buildCallTimer()),
            ),
            
          // // Back button (top left inside card)
          // Positioned(
          //   top: MediaQuery.of(context).padding.top + context.percentHeight * 2.5,
          //   left: context.percentWidth * 5,
          //   child: GestureDetector(
          //     onTap: () => Navigator.of(context).pop(),
          //     child: Container(
          //       width: context.percentWidth * 10,
          //       height: context.percentWidth * 10,
          //       decoration: BoxDecoration(
          //         color: Colors.white.withAlpha(25),
          //         shape: BoxShape.circle,
          //       ),
          //       child: Icon(
          //         Icons.arrow_back,
          //         color: Colors.white,
          //         size: context.percentWidth * 5,
          //       ),
          //     ),
          //   ),
          // ),
          
          // PIP view for video calls (top right)
          if (!_isVoiceCall && widget.isConnected && _hasLocalStream())
            Positioned(
              top: MediaQuery.of(context).padding.top + context.percentHeight * 2.5,
              right: context.percentWidth * 5,
              child: _buildPIPView(),
            ),
            
          // Reconnecting overlay
          if (widget.isReconnecting)
            Positioned.fill(
              child: _buildReconnectingOverlay(),
            ),
        ],
      ),
    );
  }

  // Voice call layout - Figma design with wave animation
  Widget _buildVoiceCallLayout() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.percentWidth * 4),
      decoration: BoxDecoration(
        color: _overlayColor,
        borderRadius: BorderRadius.circular(context.percentWidth * 4.5),
        border: Border.all(color: _borderColor, width: context.percentWidth * 0.25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Avatar - 148x148
          _buildAvatar(),
          
          SizedBox(height: context.percentHeight * 2),
          
          // Caller name
          Text(
            widget.displayName ?? L10n.of(context).dialerUnknown,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: _primaryTextColor,
              fontSize: context.percentWidth * 4,
              fontWeight: FontWeight.w600,
            ),
          ),
          
          SizedBox(height: context.percentHeight * 2),
          
          // Voice wave animation
          _buildVoiceWave(),
          
          // Remote mute indicator
          if (widget.isRemoteMicMuted) ...[
            SizedBox(height: context.percentHeight * 2),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: context.percentWidth * 3,
                vertical: context.percentHeight * 0.8,
              ),
              decoration: BoxDecoration(
                color: Colors.red.withAlpha(200),
                borderRadius: BorderRadius.circular(context.percentWidth * 5),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.mic_off,
                    color: Colors.white,
                    size: context.percentWidth * 4,
                  ),
                  SizedBox(width: context.percentWidth * 1.5),
                  Text(
                    L10n.of(context).dialerMuted,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: context.percentWidth * 3,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    final room = widget.room ?? widget.call.room;
    final hasAvatar = room.avatar != null && 
                       room.avatar.toString().isNotEmpty &&
                       room.avatar.toString() != 'null';
    
    return Container(
      width: context.percentWidth * 37,
      height: context.percentWidth * 37,
      decoration: BoxDecoration(
        color: _surfaceColor,
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: hasAvatar
            ? Avatar(
                mxContent: room.avatar,
                name: widget.displayName ?? 'Unknown',
                size: context.percentWidth * 37,
                client: widget.client,
              )
            : Center(
                child: Icon(
                  Icons.person_outline,
                  color: Color(0xFF3976F8),
                  size: context.percentWidth * 20,
                ),
              ),
      ),
    );
  }

  // Simulated audio-reactive voice wave
  // Random varying heights that look like real voice input
  Widget _buildVoiceWave() {
    return AnimatedBuilder(
      animation: _waveController,
      builder: (context, child) {
        // Generate random-ish but smooth varying heights
        final random = Random(_timerProvider.durationSeconds); // Seed changes every second
        
        return Container(
          width: context.percentWidth * 10,
          height: context.percentHeight * 4,
          decoration: BoxDecoration(
            color:const Color(0x776F8DA1),
            shape:BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(5, (index) {
                  // Create varying amplitudes using combination of animation and randomness
                  final baseRandom = random.nextDouble();
                  final animPhase = _waveController.value * 2 * pi;
                  final indexOffset = index * 0.8;
                  
                  // Combine sine wave with random factor for realistic voice pattern
                  final sineValue = sin(animPhase + indexOffset);
                  final randomFactor = 0.3 + (baseRandom * 0.7);
                  final combinedValue = (sineValue.abs() * randomFactor);
                  
                  // Height varies between 6 and 28 pixels
                  final height = 6.0 + (combinedValue * 15);
                  
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    margin: EdgeInsets.symmetric(horizontal: context.percentWidth * 0.3),
                    width: context.percentWidth * 0.5,
                    height: height,
                    decoration: BoxDecoration(
                      color: const Color(0xFF6F8DA1),
                      borderRadius: BorderRadius.circular(context.percentWidth * 0.75),
                    ),
                  );
                }),
              ),
            ),
          ),
        );
      },
    );
  }

  // Video call layout
  Widget _buildVideoCallLayout() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(context.percentWidth * 4.5),
      child: _buildMainVideoArea(),
    );
  }

  Widget _buildMainVideoArea() {
    final primaryStream = _getPrimaryStream();
    
    return Container(
      color: _surfaceColor,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Primary video stream
          if (primaryStream != null)
            Positioned.fill(
              child: CallStreamView(
                wrappedStream: primaryStream,
                mainView: true,
                matrixClient: widget.client,
              ),
            ),
          
          // Name overlay at bottom with gradient
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _buildNameOverlay(),
          ),
        ],
      ),
    );
  }

  Widget _buildNameOverlay() {
    return Container(
      height: context.percentHeight * 8,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0x001F252D), Color(0xFF1F252D)],
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: context.percentWidth * 4, vertical: context.percentHeight * 1.5),
      child: Row(
        children: [
          Text(
            widget.displayName ?? L10n.of(context).dialerUnknown,
            style: TextStyle(
              color: Colors.white,
              fontSize: context.percentWidth * 3.5,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          if (widget.isRemoteMicMuted)
            Container(
              width: context.percentWidth * 8,
              height: context.percentWidth * 8,
              decoration: BoxDecoration(
                color: Colors.red.withAlpha(200),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.mic_off,
                color: Colors.white,
                size: context.percentWidth * 4.5,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCallTimer() {
    return ChangeNotifierProvider.value(
      value: _timerProvider,
      child: Consumer<CallTimerProvider>(
        builder: (context, timer, child) {
          return Container(
            padding: EdgeInsets.all(context.percentWidth * 1),
            decoration: BoxDecoration(
              color: _surfaceColor,
              borderRadius: BorderRadius.circular(1000),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: context.percentWidth * 2.5, vertical: context.percentHeight * 0.75),
              decoration: BoxDecoration(
                color: _timerBgColor,
                borderRadius: BorderRadius.circular(1000),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Recording dot
                  Container(
                    width: context.percentWidth * 2,
                    height: context.percentWidth * 2,
                    decoration: const BoxDecoration(
                      color: _timerTextColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: context.percentWidth * 1.5),
                  // Timer text
                  Text(
                    timer.formatted,
                    style: TextStyle(
                      color: _timerTextColor,
                      fontSize: context.percentWidth * 3,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPIPView() {
    final localStream = widget.call.localUserMediaStream ?? 
                        widget.call.localScreenSharingStream;
    
    if (localStream == null) return const SizedBox.shrink();
    
    return Container(
      width: context.percentWidth * 30,
      height: context.percentHeight * 22,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.percentWidth * 3.5),
        border: Border.all(color: _backgroundColor, width: context.percentWidth * 0.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(80),
            blurRadius: context.percentWidth * 2.5,
            offset: Offset(0, context.percentHeight * 0.5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(context.percentWidth * 3),
        child: Stack(
          fit: StackFit.expand,
          children: [
            CallStreamView(
              wrappedStream: localStream,
              matrixClient: widget.client,
            ),
            
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: context.percentHeight * 6,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0x001F252D), Color(0xFF1F252D)],
                  ),
                ),
                padding: EdgeInsets.all(context.percentWidth * 2.5),
                alignment: Alignment.bottomLeft,
                child: Container(
                  width: context.percentWidth * 6.5,
                  height: context.percentWidth * 6.5,
                  decoration: BoxDecoration(
                    color: widget.isMicMuted 
                        ? Colors.red.withAlpha(200) 
                        : Colors.white.withAlpha(30),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    widget.isMicMuted ? Icons.mic_off : Icons.mic,
                    color: Colors.white,
                    size: context.percentWidth * 3.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReconnectingOverlay() {
    return Container(
      color: Colors.black.withOpacity(0.7),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AdaptiveLoaderWidget(),
            SizedBox(height: context.percentHeight * 2.5),
            Text(
              L10n.of(context).dialerReconnecting,
              style: TextStyle(
                color: Colors.white,
                fontSize: context.percentWidth * 4,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: context.percentHeight * 1),
            Text(
              L10n.of(context).dialerReconnectingMessage,
              style: TextStyle(
                color: Colors.white70,
                fontSize: context.percentWidth * 3,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
