import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/widgets/avatar.dart';

/// Displays waiting screen for incoming/outgoing calls
/// Updated with Figma design - full screen blue overlay card style
class CallWaitingView extends StatelessWidget {
  const CallWaitingView({
    required this.room,
    required this.displayName,
    required this.client,
    required this.isOutgoing,
    required this.isVoiceOnly,
    this.callState,
    super.key,
  });

  final Room room;
  final String displayName;
  final Client client;
  final bool isOutgoing;
  final bool isVoiceOnly;
  final CallState? callState;

  // Figma colors
  static const Color _backgroundColor = Color(0xFF1B1C30);
  static const Color _overlayColor = Color(0x7F131EBF); // 50% opacity
  static const Color _borderColor = Color(0xFF131EBF);
  static const Color _surfaceColor = Color(0xFF1F252D);
  static const Color _primaryTextColor = Color(0xFFF3F7F8);
  static const Color _statusTextColor = Color(0xFF3976F8);
  static const Color _avatarIconColor = Color(0xFF3976F8);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: _backgroundColor,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.percentWidth * 2.5),
          child: Column(
            children: [
              SizedBox(height: context.percentHeight * 1.2),
              
              // // Back button
              // Align(
              //   alignment: Alignment.topLeft,
              //   child: GestureDetector(
              //     onTap: () => Navigator.of(context).pop(),
              //     child: Container(
              //       width: context.percentWidth * 10,
              //       height: context.percentWidth * 10,
              //       decoration: const BoxDecoration(
              //         color: Color.fromRGBO(255, 255, 255, 0.1),
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
              
              SizedBox(height: context.percentHeight * 1.2),
              
              // Caller info card with blue overlay - FULL WIDTH
              Expanded(
                child: _buildCallerCard(context),
              ),
              
              // Space for action buttons (rendered by parent)
              SizedBox(height: context.percentHeight * 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCallerCard(BuildContext context) {
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
          // Avatar - 148x148 with surface background and fallback
          _buildAvatar(context),
          
          SizedBox(height: context.percentHeight * 2),
          
          // Caller name
          Text(
            displayName,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: _primaryTextColor,
              fontSize: context.percentWidth * 4,
              fontWeight: FontWeight.w600,
            ),
          ),
          
          SizedBox(height: context.percentHeight * 0.5),
          
          // Status text
          Text(
            _getStatusText(context),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: _statusTextColor,
              fontSize: context.percentWidth * 3.5,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(BuildContext context) {
    final hasAvatar = room.avatar != null && 
                       room.avatar.toString().isNotEmpty &&
                       room.avatar.toString() != 'null';
    
    return Container(
      width: context.percentWidth * 37,
      height: context.percentWidth * 37,
      decoration: BoxDecoration(
        color: hasAvatar ? _surfaceColor : _avatarIconColor,
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: hasAvatar
            ? Avatar(
                mxContent: room.avatar,
                name: displayName,
                size: context.percentWidth * 37,
                client: client,
              )
            : Center(
                child: Icon(
                  Icons.person_outline,
                  color: Colors.white,
                  size: context.percentWidth * 20,
                ),
              ),
      ),
    );
  }

  String _getStatusText(BuildContext context) {
    if (isOutgoing) {
      // Only show "Ringing..." if we detected candidates (user is online)
      if (callState == CallState.kRinging) {
        return L10n.of(context).dialerRinging;
      }
      // Otherwise keep showing "Calling..." (user might be offline)
      return isVoiceOnly ? L10n.of(context).dialerCalling : L10n.of(context).dialerVideoCalling;
    } else {
      return isVoiceOnly ? L10n.of(context).dialerIncomingVoiceCall : L10n.of(context).dialerIncomingVideoCall;
    }
  }
}
