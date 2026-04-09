import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/physics.dart';
import 'package:matrix/matrix.dart' hide Visibility;
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/utils/platform_infos.dart';

/// Call action buttons (answer, hangup, mute, camera, etc.)
/// Updated with Figma design - swipe-to-answer for incoming calls
class CallActionButtons extends StatefulWidget {
  const CallActionButtons({
    required this.state,
    required this.isAnswering,
    required this.isOutgoing,
    required this.isVoiceOnly,
    required this.isMicMuted,
    required this.isVideoMuted,
    required this.isScreenSharing,
    required this.isRemoteHold,
    required this.isSpeakerOn,
    required this.onAnswer,
    required this.onHangup,
    required this.onMuteMic,
    required this.onMuteCamera,
    required this.onSwitchCamera,
    required this.onScreenSharing,
    required this.onHold,
    required this.onToggleSpeaker,
    super.key,
  });

  final CallState? state;
  final bool isAnswering;
  final bool isOutgoing;
  final bool isVoiceOnly;
  final bool isMicMuted;
  final bool isVideoMuted;
  final bool isScreenSharing;
  final bool isRemoteHold;
  final bool isSpeakerOn;
  final VoidCallback onAnswer;
  final VoidCallback onHangup;
  final VoidCallback onMuteMic;
  final VoidCallback onMuteCamera;
  final VoidCallback onSwitchCamera;
  final VoidCallback onScreenSharing;
  final VoidCallback onHold;
  final VoidCallback onToggleSpeaker;

  @override
  State<CallActionButtons> createState() => _CallActionButtonsState();
}

class _CallActionButtonsState extends State<CallActionButtons>
    with TickerProviderStateMixin {
  // Swipe animation state for answer button
  double _dragOffset = 0.0;
  bool _isDragging = false;
  late AnimationController _springController;
  
  // Swipe animation state for decline button
  double _declineDragOffset = 0.0;
  bool _isDeclineDragging = false;
  late AnimationController _declineSpringController;

  // Figma colors
  static const Color _answerButtonColor = Color(0x994754FF);
  static const Color _declineButtonColor = Color(0xFFF63D3D);
  static const Color _trackColor = Color(0x994754FF);

  @override
  void initState() {
    super.initState();
    _springController = AnimationController.unbounded(vsync: this);
    _springController.addListener(() {
      setState(() {
        _dragOffset = _springController.value;
      });
    });
    
    _declineSpringController = AnimationController.unbounded(vsync: this);
    _declineSpringController.addListener(() {
      setState(() {
        _declineDragOffset = _declineSpringController.value;
      });
    });
  }

  @override
  void dispose() {
    _springController.dispose();
    _declineSpringController.dispose();
    super.dispose();
  }

  double get _maxDragDistance {
    return context.screenWidth - context.percentWidth * 35;
  }

  void _onDragStart(DragStartDetails details) {
    _springController.stop();
    setState(() => _isDragging = true);
    HapticFeedback.selectionClick();
  }

  void _onDragUpdate(DragUpdateDetails details) {
    setState(() {
      final delta = details.delta.dx;
      _dragOffset = (_dragOffset - delta).clamp(0.0, _maxDragDistance);
    });
  }

  void _onDragEnd(DragEndDetails details) {
    setState(() => _isDragging = false);
    
    final velocity = details.primaryVelocity ?? 0;
    
    if (_dragOffset >= _maxDragDistance * 0.25 || velocity < -1000) {
      HapticFeedback.heavyImpact();
      
      final spring = SpringDescription(
        mass: 0.8,
        stiffness: 120,
        damping: 18,
      );
      final simulation = SpringSimulation(spring, _dragOffset, _maxDragDistance, velocity / 800);
      _springController.animateWith(simulation).then((_) {
        widget.onAnswer();
      });
    } else {
      final spring = SpringDescription(
        mass: 0.6,
        stiffness: 180,
        damping: 16,
      );
      final simulation = SpringSimulation(spring, _dragOffset, 0, velocity / 800);
      _springController.animateWith(simulation);
    }
  }

  // Decline button drag handlers
  void _onDeclineDragStart(DragStartDetails details) {
    _declineSpringController.stop();
    setState(() => _isDeclineDragging = true);
    HapticFeedback.selectionClick();
  }

  void _onDeclineDragUpdate(DragUpdateDetails details) {
    setState(() {
      final delta = details.delta.dx;
      // Positive delta means dragging right (towards decline action)
      _declineDragOffset = (_declineDragOffset + delta).clamp(0.0, _maxDragDistance);
    });
  }

  void _onDeclineDragEnd(DragEndDetails details) {
    setState(() => _isDeclineDragging = false);
    
    final velocity = details.primaryVelocity ?? 0;
    
    if (_declineDragOffset >= _maxDragDistance * 0.25 || velocity > 1000) {
      HapticFeedback.heavyImpact();
      
      final spring = SpringDescription(
        mass: 0.8,
        stiffness: 120,
        damping: 18,
      );
      final simulation = SpringSimulation(spring, _declineDragOffset, _maxDragDistance, velocity / 800);
      _declineSpringController.animateWith(simulation).then((_) {
        widget.onHangup();
      });
    } else {
      final spring = SpringDescription(
        mass: 0.6,
        stiffness: 180,
        damping: 16,
      );
      final simulation = SpringSimulation(spring, _declineDragOffset, 0, velocity / 800);
      _declineSpringController.animateWith(simulation);
    }
  }

  void _animateDeclineAndHangup() {
    HapticFeedback.heavyImpact();
    final spring = SpringDescription(
      mass: 0.8,
      stiffness: 120,
      damping: 18,
    );
    final simulation = SpringSimulation(spring, _declineDragOffset, _maxDragDistance, 0);
    _declineSpringController.animateWith(simulation).then((_) {
      widget.onHangup();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_shouldShowSwipeToAnswer()) {
      return _buildSwipeToAnswerButtons();
    }
    
    if (widget.state == CallState.kConnected) {
      return _buildConnectedNavbar();
    }
    
    if (_shouldShowOutgoingHangup()) {
      return _buildOutgoingHangupButton();
    }
    
    if (_shouldShowConnectingHangup()) {
      return _buildConnectingButton();
    }
    
    final buttons = _buildButtons(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buttons,
    );
  }

  bool _shouldShowConnectingHangup() {
    return widget.isAnswering ||
           widget.state == CallState.kCreateAnswer ||
           widget.state == CallState.kConnecting;
  }

  Widget _buildConnectingButton() {
    const hangupColor = Color(0xFFF63D3D);
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    
    return Padding(
      padding: EdgeInsets.only(left: context.percentWidth * 5, right: context.percentWidth * 5, bottom: bottomPadding > 0 ? context.percentHeight * 1.2 : context.percentHeight * 2.5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            L10n.of(context).dialerConnecting,
            style: TextStyle(
              color: Colors.white70,
              fontSize: context.percentWidth * 3.5,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: context.percentHeight * 2),
          SizedBox(
            height: context.percentHeight * 10,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: context.percentWidth * 20,
                    height: context.percentWidth * 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: hangupColor.withAlpha(100),
                          blurRadius: context.percentWidth * 7.5,
                          spreadRadius: context.percentWidth * 1.25,
                          offset: Offset(0, context.percentHeight * 1.2),
                        ),
                      ],
                    ),
                  ),
                ),
                
                GestureDetector(
                  onTap: () {
                    HapticFeedback.heavyImpact();
                    widget.onHangup();
                  },
                  child: Container(
                    width: context.percentWidth * 18,
                    height: context.percentWidth * 18,
                    decoration: BoxDecoration(
                      color: hangupColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: hangupColor.withAlpha(150),
                          blurRadius: context.percentWidth * 3.75,
                          spreadRadius: context.percentWidth * 0.5,
                          offset: Offset(0, context.percentHeight * 0.75),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.call_end,
                      color: Colors.white,
                      size: context.percentWidth * 8,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool _shouldShowOutgoingHangup() {
    return widget.isOutgoing && 
           (widget.state == CallState.kRinging ||
            widget.state == CallState.kFledgling ||
            widget.state == CallState.kWaitLocalMedia ||
            widget.state == CallState.kCreateOffer ||
            widget.state == CallState.kInviteSent ||
            widget.state == CallState.kCreateAnswer ||
            widget.state == CallState.kConnecting);
  }

  Widget _buildOutgoingHangupButton() {
    const hangupColor = Color(0xFFF63D3D);
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    
    return Padding(
      padding: EdgeInsets.only(left: context.percentWidth * 5, right: context.percentWidth * 5, bottom: bottomPadding > 0 ? context.percentHeight * 1.2 : context.percentHeight * 2.5),
      child: SizedBox(
        height: context.percentHeight * 10,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                width: context.percentWidth * 20,
                height: context.percentWidth * 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: hangupColor.withAlpha(100),
                      blurRadius: context.percentWidth * 7.5,
                      spreadRadius: context.percentWidth * 1.25,
                      offset: Offset(0, context.percentHeight * 1.2),
                    ),
                  ],
                ),
              ),
            ),
            
            GestureDetector(
              onTap: () {
                HapticFeedback.heavyImpact();
                widget.onHangup();
              },
              child: Container(
                width: context.percentWidth * 18,
                height: context.percentWidth * 18,
                decoration: BoxDecoration(
                  color: hangupColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: hangupColor.withAlpha(150),
                      blurRadius: context.percentWidth * 3.75,
                      spreadRadius: context.percentWidth * 0.5,
                      offset: Offset(0, context.percentHeight * 0.75),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.call_end,
                  color: Colors.white,
                  size: context.percentWidth * 8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _shouldShowSwipeToAnswer() {
    return !widget.isOutgoing && 
           !widget.isAnswering &&
           (widget.state == CallState.kRinging ||
            widget.state == CallState.kFledgling ||
            widget.state == CallState.kWaitLocalMedia ||
            widget.state == CallState.kCreateOffer);
  }

  Widget _buildSwipeToAnswerButtons() {
    final answerProgress = (_dragOffset / _maxDragDistance).clamp(0.0, 1.0);
    final declineProgress = (_declineDragOffset / _maxDragDistance).clamp(0.0, 1.0);
    // Combined progress for chevron animation - either direction should animate
    final combinedProgress = (answerProgress - declineProgress).clamp(-1.0, 1.0);
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.percentWidth * 5),
      child: Container(
        height: context.percentHeight * 9,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: context.percentHeight * 6.5,
              margin: EdgeInsets.symmetric(horizontal: context.percentWidth * 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1000),
                color: _trackColor,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: context.percentWidth * 7.5,
                    offset: Offset(0, context.percentHeight * 2.7),
                  ),
                ],
              ),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildChevrons(pointingRight: true, progress: combinedProgress),
                SizedBox(width: context.percentWidth * 7.5),
                _buildChevrons(pointingRight: false, progress: combinedProgress),
              ],
            ),
            
            // Decline button (left side, now draggable)
            Positioned(
              left: _declineDragOffset,
              child: _buildDeclineButton(declineProgress),
            ),
            
            // Answer button (right side, draggable)
            Positioned(
              right: _dragOffset,
              child: _buildDraggableAnswerButton(answerProgress),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeclineButton(double progress) {
    return GestureDetector(
      onHorizontalDragStart: _onDeclineDragStart,
      onHorizontalDragUpdate: _onDeclineDragUpdate,
      onHorizontalDragEnd: _onDeclineDragEnd,
      onTap: _animateDeclineAndHangup,
      child: Container(
        width: context.percentWidth * 15,
        height: context.percentWidth * 15,
        decoration: BoxDecoration(
          color: _declineButtonColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color(0x66F63D3D),
              blurRadius: context.percentWidth * 2.5 + (progress * context.percentWidth * 3.75),
              offset: Offset(0, context.percentHeight * 0.5),
            ),
          ],
        ),
        child: Icon(
          Icons.call_end,
          color: Colors.white,
          size: context.percentWidth * 7,
        ),
      ),
    );
  }

  Widget _buildDraggableAnswerButton(double progress) {
    return GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      child: Container(
        width: context.percentWidth * 15,
        height: context.percentWidth * 15,
        decoration: BoxDecoration(
          color: _answerButtonColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: const Color(0xCC841CBF),
              blurRadius: context.percentWidth * 2.5 + (progress * context.percentWidth * 3.75),
              offset: Offset(0, context.percentHeight * 0.5),
            ),
          ],
        ),
        child: Icon(
          Icons.call,
          color: Colors.white,
          size: context.percentWidth * 7,
        ),
      ),
    );
  }

  Widget _buildChevrons({required bool pointingRight, required double progress}) {
    // progress is now -1 to 1: negative = decline dragging, positive = answer dragging
    final opacity = pointingRight 
        ? (0.7 + progress * 0.3).clamp(0.4, 1.0)  // Right chevrons: brighter when answer dragging
        : (0.7 - progress * 0.3).clamp(0.4, 1.0); // Left chevrons: brighter when decline dragging
    
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 100),
      opacity: opacity,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            pointingRight ? Icons.chevron_right : Icons.chevron_left,
            color: Colors.white,
            size: context.percentWidth * 7,
          ),
          Transform.translate(
            offset: Offset(-context.percentWidth * 2, 0),
            child: Icon(
              pointingRight ? Icons.chevron_right : Icons.chevron_left,
              color: Colors.white,
              size: context.percentWidth * 7,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConnectedNavbar() {
    const buttonBgColor = Color(0xE61B1C30);
    const hangupColor = Color(0xFFF63D3D);
    const trackColor = Color(0xFF7B83FF);
    
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    
    return Padding(
      padding: EdgeInsets.only(left: context.percentWidth * 2.5, right: context.percentWidth * 2.5, bottom: bottomPadding > 0 ? context.percentHeight * 1.2 : context.percentHeight * 2.5),
      child: SizedBox(
        height: context.percentHeight * 10,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              bottom: -context.percentHeight * 1.2,
              left: context.percentWidth * 7.5,
              right: context.percentWidth * 7.5,
              child: Container(
                height: context.percentHeight * 7.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1000),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x80A912BF),
                      blurRadius: context.percentWidth * 10,
                      spreadRadius: context.percentWidth * 1.25,
                      offset: Offset(0, context.percentHeight * 1.2),
                    ),
                    BoxShadow(
                      color: Color(0x604754FF),
                      blurRadius: context.percentWidth * 7.5,
                      spreadRadius: 0,
                      offset: Offset(0, context.percentHeight * 1.8),
                    ),
                  ],
                ),
              ),
            ),
            
            Positioned(
              bottom: 0,
              left: context.percentWidth * 4,
              right: context.percentWidth * 4,
              child: Container(
                height: context.percentHeight * 6.5,
                decoration: BoxDecoration(
                  color: trackColor,
                  borderRadius: BorderRadius.circular(1000),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x40FFFFFF),
                      blurRadius: context.percentWidth * 0.5,
                      spreadRadius: 0,
                      offset: Offset(0, -context.percentHeight * 0.12),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.isVoiceOnly
                      ? _buildAudioButtons(buttonBgColor)
                      : _buildVideoButtons(buttonBgColor),
                ),
              ),
            ),
            
            Positioned(
              bottom: context.percentHeight * 1.2,
              child: GestureDetector(
                onTap: () {
                  HapticFeedback.heavyImpact();
                  widget.onHangup();
                },
                child: Container(
                  width: context.percentWidth * 16,
                  height: context.percentWidth * 16,
                  decoration: BoxDecoration(
                    color: hangupColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: hangupColor.withAlpha(120),
                        blurRadius: context.percentWidth * 3.75,
                        spreadRadius: context.percentWidth * 0.5,
                        offset: Offset(0, context.percentHeight * 0.75),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.call_end,
                    color: Colors.white,
                    size: context.percentWidth * 7.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildAudioButtons(Color buttonBgColor) {
    return [
      // Left side - Mute button
      _buildNavButton(
        icon: widget.isMicMuted ? Icons.mic_off : Icons.mic,
        bgColor: buttonBgColor,
        onTap: widget.onMuteMic,
        isActive: !widget.isMicMuted,
        showSlash: widget.isMicMuted,
      ),
      
      // Center gap for hangup button
      SizedBox(width: context.percentWidth * 22), 
      
      // Right side - Speaker button
      _buildNavButton(
        icon: widget.isSpeakerOn ? Icons.volume_up : Icons.volume_off,
        bgColor: buttonBgColor,
        onTap: widget.onToggleSpeaker,
        isActive: widget.isSpeakerOn,
      ),
    ];
  }

  List<Widget> _buildVideoButtons(Color buttonBgColor) {
    return [
      _buildNavButton(
        icon: widget.isVideoMuted ? Icons.videocam_off : Icons.videocam,
        bgColor: buttonBgColor,
        onTap: widget.onMuteCamera,
        isActive: !widget.isVideoMuted,
      ),
      SizedBox(width: context.percentWidth * 5),
      
      _buildNavButton(
        icon: Icons.switch_camera,
        bgColor: buttonBgColor,
        onTap: widget.onSwitchCamera,
        isActive: true,
      ),
      
      SizedBox(width: context.percentWidth * 20),
      
      _buildNavButton(
        icon: widget.isRemoteHold ? Icons.play_arrow : Icons.pause,
        bgColor: buttonBgColor,
        onTap: widget.onHold,
        isActive: !widget.isRemoteHold,
      ),
      SizedBox(width: context.percentWidth * 5),
      
      _buildNavButton(
        icon: widget.isMicMuted ? Icons.mic_off : Icons.mic,
        bgColor: buttonBgColor,
        onTap: widget.onMuteMic,
        isActive: !widget.isMicMuted,
        showSlash: widget.isMicMuted,
      ),
    ];
  }

  Widget _buildNavButton({
    required IconData icon,
    required Color bgColor,
    required VoidCallback onTap,
    bool isActive = true,
    bool showSlash = false,
  }) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        onTap();
      },
      child: Container(
        width: context.percentWidth * 11,
        height: context.percentWidth * 11,
        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: context.percentWidth * 5.5,
            ),
            if (showSlash)
              Transform.rotate(
                angle: -0.5,
                child: Container(
                  width: context.percentWidth * 7,
                  height: context.percentWidth * 0.5,
                  color: Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildButtons(BuildContext context) {
    final hangupButton = FloatingActionButton(
      heroTag: 'hangup',
      onPressed: widget.onHangup,
      tooltip: L10n.of(context).hangup,
      backgroundColor: widget.state == CallState.kEnded ? Colors.black45 : Colors.red,
      child: const Icon(Icons.call_end),
    );

    final answerButton = FloatingActionButton(
      heroTag: 'answer',
      onPressed: widget.onAnswer,
      tooltip: L10n.of(context).answer,
      backgroundColor: Colors.green,
      child: const Icon(Icons.phone),
    );

    switch (widget.state) {
      case CallState.kRinging:
        return widget.isOutgoing
            ? [hangupButton]
            : [answerButton, hangupButton];
            
      case CallState.kInviteSent:
      case CallState.kFledgling:
      case CallState.kWaitLocalMedia:
      case CallState.kCreateOffer:
        if (widget.isAnswering) {
          return [hangupButton];
        }
        return widget.isOutgoing
            ? [hangupButton]
            : [answerButton, hangupButton];
            
      case CallState.kCreateAnswer:
      case CallState.kConnecting:
        return [hangupButton];
        
      case CallState.kConnected:
        return [];
        
      case CallState.kEnded:
        return [hangupButton];
        
      case CallState.kEnding:
      case null:
        return [];
    }
  }
}
