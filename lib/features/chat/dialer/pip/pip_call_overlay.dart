import 'dart:async';

import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/chat/dialer/providers/pip_overlay_provider.dart';
import 'package:bmp/features/chat/dialer/widgets/call_stream_view.dart';
import 'package:bmp/shared/utils/matrix_sdk_extensions/matrix_locals.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/utils/voip/user_media_manager.dart';
import 'package:bmp/shared/widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';
import 'package:provider/provider.dart';

/// Floating PiP overlay for active calls
/// Shows video stream for video calls, avatar for voice calls
/// Draggable and tappable to return to full screen
/// Refactored to use PipOverlayProvider - no setState
class PipCallOverlay extends StatefulWidget {
  const PipCallOverlay({
    super.key,
    required this.call,
    required this.onTap,
    required this.onHangup,
    this.onAnswer,
  });

  final CallSession call;
  final VoidCallback onTap;
  final VoidCallback onHangup;
  final VoidCallback? onAnswer;

  @override
  State<PipCallOverlay> createState() => _PipCallOverlayState();
}

class _PipCallOverlayState extends State<PipCallOverlay> {
  late PipOverlayProvider _provider;
  StreamSubscription? _streamSubscription;
  StreamSubscription? _stateSubscription;
  bool _disposed = false;

  @override
  void initState() {
    super.initState();
    _provider = PipOverlayProvider();
    _provider.startTimer();
    _listenToStreams();
    _listenToStateChanges();
  }

  void _listenToStreams() {
    _streamSubscription = widget.call.onCallStreamsChanged.stream.listen((_) {
      if (mounted && !_disposed) {
        _provider.notifyChange();
      }
    });
  }

  void _listenToStateChanges() {
    _stateSubscription = widget.call.onCallStateChanged.stream.listen((state) {
      if (!mounted || _disposed) return;
      
      _provider.notifyChange();

      if (state == CallState.kConnected) {
        UserMediaManager().stopRingingTone();
      } else if (state == CallState.kEnded || state == CallState.kEnding) {
        _provider.stopTimer();
        widget.onHangup();
      }
    });
  }

  @override
  void dispose() {
    _disposed = true;
    _streamSubscription?.cancel();
    _stateSubscription?.cancel();
    _provider.dispose();
    super.dispose();
  }

  bool get _isVideoCall => widget.call.type == CallType.kVideo;

  WrappedMediaStream? get _displayStream {
    return widget.call.remoteUserMediaStream ??
        widget.call.remoteScreenSharingStream ??
        widget.call.localUserMediaStream;
  }

  @override
  Widget build(BuildContext context) {
    final width = context.percentWidth * 35;
    final height = context.percentHeight * 25;
    
    // Initialize position if not done
    if (!_provider.isPositionInitialized) {
      _provider.initializePosition(
        context.percentWidth * 4,
        context.percentHeight * 12,
      );
    }
    
    return ChangeNotifierProvider.value(
      value: _provider,
      child: Consumer<PipOverlayProvider>(
        builder: (context, provider, child) {
          return Material(
            type: MaterialType.transparency,
            child: SizedBox(
              width: context.screenWidth,
              height: context.screenHeight,
              child: Stack(
                children: [
                  Positioned(
                    left: provider.position.dx.clamp(
                      context.percentWidth * 4,
                      context.screenWidth - width - context.percentWidth * 4,
                    ),
                    top: provider.position.dy.clamp(
                      context.screenPadding.top + context.percentHeight * 2,
                      context.screenHeight - height - context.percentHeight * 12,
                    ),
                    child: GestureDetector(
                      onPanStart: (_) => provider.setDragging(true),
                      onPanUpdate: (details) => provider.updatePosition(details.delta),
                      onPanEnd: (_) => provider.setDragging(false),
                      onTap: provider.isDragging ? null : widget.onTap,
                      child: Container(
                        width: width,
                        height: height,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1B1C30),
                          borderRadius: BorderRadius.circular(context.percentWidth * 4),
                          border: Border.all(
                            color: const Color(0xFF131EBF),
                            width: context.percentWidth * 0.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.4),
                              blurRadius: context.percentWidth * 4,
                              offset: Offset(0, context.percentHeight * 0.7),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(context.percentWidth * 3.5),
                                child: _isVideoCall && _displayStream != null
                                    ? CallStreamView(
                                        wrappedStream: _displayStream!,
                                        matrixClient: widget.call.room.client,
                                      )
                                    : _buildVoiceContent(),
                              ),
                            ),
                            
                            Positioned(
                              top: context.percentHeight * 1,
                              left: 0,
                              right: 0,
                              child: Center(child: _buildDurationBadge(provider)),
                            ),
                            
                            Positioned(
                              bottom: context.percentHeight * 1,
                              left: 0,
                              right: 0,
                              child: IgnorePointer(
                                ignoring: false,
                                child: Center(child: _buildControls()),
                              ),
                            ),
                            
                            Positioned(
                              top: context.percentHeight * 1,
                              right: context.percentWidth * 2,
                              child: Container(
                                padding: EdgeInsets.all(context.percentWidth * 1),
                                decoration: BoxDecoration(
                                  color: Colors.black38,
                                  borderRadius: BorderRadius.circular(context.percentWidth * 1),
                                ),
                                child: Icon(
                                  Icons.open_in_full,
                                  color: Colors.white70,
                                  size: context.percentWidth * 3.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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

  Widget _buildVoiceContent() {
    var statusText = widget.call.room.getLocalizedDisplayname(
        MatrixLocals(L10n.of(context)),
    );
    var statusColor = Colors.white;

    if (widget.call.state == CallState.kRinging && !widget.call.isOutgoing) {
      statusText = L10n.of(context).dialerIncomingCall;
      statusColor = const Color(0xFF4754FF);
    } else if (widget.call.state == CallState.kInviteSent || 
               widget.call.state == CallState.kConnecting ||
               widget.call.state == CallState.kCreateOffer) {
      statusText = L10n.of(context).dialerCalling;
      statusColor = Colors.white70;
    }

    return Container(
      color: const Color(0xFF1B1C30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Avatar(
            mxContent: widget.call.room.avatar,
            name: widget.call.room.getLocalizedDisplayname(
              MatrixLocals(L10n.of(context)),
            ),
            size: context.percentWidth * 15,
            client: widget.call.room.client,
          ),
          SizedBox(height: context.percentHeight * 1),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.percentWidth * 2),
            child: Text(
              statusText,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: statusColor,
                fontSize: context.percentWidth * 3,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDurationBadge(PipOverlayProvider provider) {
    if (widget.call.state != CallState.kConnected) {
       return const SizedBox.shrink();
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.percentWidth * 2,
        vertical: context.percentHeight * 0.5,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF2F2),
        borderRadius: BorderRadius.circular(context.percentWidth * 3),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: context.percentWidth * 1.5,
            height: context.percentWidth * 1.5,
            decoration: const BoxDecoration(
              color: Color(0xFFF63D3D),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: context.percentWidth * 1),
          Text(
            provider.formattedDuration,
            style: TextStyle(
              color: const Color(0xFFF63D3D),
              fontSize: context.percentWidth * 2.5,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControls() {
    if (widget.call.state == CallState.kRinging && !widget.call.isOutgoing) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () async {
              widget.onHangup();
            },
            child: Container(
              width: context.percentWidth * 9,
              height: context.percentWidth * 9,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.call_end, color: Colors.white, size: context.percentWidth * 4.5),
            ),
          ),
          InkWell(
            onTap: () async {
              await UserMediaManager().stopRingingTone();
              widget.onAnswer?.call();
            },
            child: Container(
              width: context.percentWidth * 9,
              height: context.percentWidth * 9,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.call, color: Colors.white, size: context.percentWidth * 4.5),
            ),
          ),
        ],
      );
    }
    
    return InkWell(
      onTap: () async {
        widget.onHangup();
      },
      child: Container(
        width: context.percentWidth * 10,
        height: context.percentWidth * 10,
        decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.call_end,
          color: Colors.white,
          size: context.percentWidth * 5,
        ),
      ),
    );
  }
}
