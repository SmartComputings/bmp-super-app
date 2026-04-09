import 'package:bmp/features/chat/dialer/widgets/call_screen.dart';
import 'package:bmp/shared/utils/voip/voip_logger.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';

/// Handles call UI navigation and screen management
class CallUiService {
  final GlobalKey<NavigatorState> _navigatorKey;
  bool _isCallScreenShown = false;
  String? _currentCallId;
  OverlayEntry? _pipOverlayEntry;
  OverlayEntry? _fullscreenCallOverlay;

  CallUiService(this._navigatorKey);

  /// Show incoming call screen - directly shows full call screen
  void showIncomingCallScreen(CallSession call) {
    if (_isCallScreenShown && _currentCallId == call.callId) {
      VoipLogger().logWarning('Call screen already shown for: ${call.callId}');
      return;
    }

    _showCallScreen(call);
  }

  /// Remove PiP overlay
  void _removePipOverlay() {
    try {
      if (_pipOverlayEntry != null && _pipOverlayEntry!.mounted) {
        _pipOverlayEntry!.remove();
      }
    } catch (e) {
      VoipLogger().logError('Error removing PiP overlay: $e');
    } finally {
      _pipOverlayEntry = null;
    }
  }

  /// Remove Fullscreen overlay
  void _removeCallOverlay() {
    try {
      if (_fullscreenCallOverlay != null && _fullscreenCallOverlay!.mounted) {
        _fullscreenCallOverlay!.remove();
      }
    } catch (e) {
      VoipLogger().logError('Error removing Call overlay: $e');
    } finally {
      _fullscreenCallOverlay = null;
    }
  }

  /// Show outgoing call screen
  void showOutgoingCallScreen(CallSession call) {
    _showCallScreen(call);
  }

  /// Hide call screen - removes overlays, no navigation changes
  void hideCallScreen() {
    _removePipOverlay();
    _removeCallOverlay();
    if (!_isCallScreenShown) return;

    VoipLogger().logInfo('Hiding call screen');
    _isCallScreenShown = false;
    _currentCallId = null;
  }

  /// Internal method to show call screen
  void _showCallScreen(CallSession call) {
    final context = _navigatorKey.currentContext;
    if (context == null) {
      VoipLogger().logError('No navigator context available, retrying in 100ms');
      // Retry after a short delay to allow context to be available
      Future.delayed(const Duration(milliseconds: 100), () {
        final retryContext = _navigatorKey.currentContext;
        if (retryContext != null) {
          _performOverlayInsertion(retryContext, call);
        } else {
          VoipLogger()
              .logError('Navigator context still not available after retry');
        }
      });
      return;
    }

    _performOverlayInsertion(context, call);
  }

  void _performOverlayInsertion(BuildContext context, CallSession call) {
    VoipLogger().logInfo('Showing call screen for: ${call.callId}');
    _isCallScreenShown = true;
    _currentCallId = call.callId;

    // Remove any existing overlays first
    _removePipOverlay();
    _removeCallOverlay();

    // Create fullscreen call overlay
    _fullscreenCallOverlay = OverlayEntry(
      opaque: true, // Covers everything underneath
      builder: (context) => Material(
        color: Colors.black,
        child: CallScreen(
          call: call,
          client: call.room.client,
          onClear: () {
            // This is called when the call ends or user dismisses the screen
            _isCallScreenShown = false;
            _currentCallId = null;
            _removeCallOverlay();
            
            // Note: We don't need to pop or navigate here anymore.
            // Removing the overlay naturally reveals the screen underneath.
          },
        ),
      ),
    );

    // Try to get overlay and insert
    try {
        // Try multiple ways to find the overlay
        OverlayState? overlay;
        
        try {
            overlay = Overlay.of(context, rootOverlay: true);
        } catch (_) {
             try {
                 final navigator = Navigator.of(context, rootNavigator: true);
                 overlay = navigator.overlay;
             } catch (_) {
                 overlay = Overlay.maybeOf(context, rootOverlay: true);
             }
        }
        
        if (overlay != null) {
            overlay.insert(_fullscreenCallOverlay!);
        } else {
            VoipLogger().logError('Could not find valid OverlayState to show call screen');
             _isCallScreenShown = false;
             _currentCallId = null;
        }

    } catch (e) {
       VoipLogger().logError('Failed to insert call overlay: $e');
        _isCallScreenShown = false;
        _currentCallId = null;
        _fullscreenCallOverlay = null;
    }
  }



  void dispose() {
    _removePipOverlay();
    _removeCallOverlay();
    _isCallScreenShown = false;
    _currentCallId = null;
  }
}