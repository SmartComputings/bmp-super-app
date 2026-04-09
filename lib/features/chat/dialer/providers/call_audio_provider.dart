import 'package:flutter/material.dart';
import 'package:bmp/shared/utils/voip/user_media_manager.dart';

/// Manages call audio (ringtone, sounds)
/// Uses existing UserMediaManager for audio playback
class CallAudioProvider extends ChangeNotifier {
  final UserMediaManager _mediaManager = UserMediaManager();
  
  // Safety flag to prevent post-dispose operations
  bool _disposed = false;
  
  // Track ringtone state locally since UserMediaManager doesn't expose it
  bool _isRingtonePlaying = false;
  bool get isRingtonePlaying => _isRingtonePlaying;

  /// Start playing ringtone for incoming call
  Future<void> startRingtone() async {
    if (_disposed || _isRingtonePlaying) return;
    
    await _mediaManager.startRingingTone();
    _isRingtonePlaying = true;
    if (!_disposed) notifyListeners();
  }

  /// Stop ringtone playback
  Future<void> stopRingtone() async {
    if (!_isRingtonePlaying) return;
    
    await _mediaManager.stopRingingTone();
    _isRingtonePlaying = false;
    if (!_disposed) notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    if (_isRingtonePlaying) {
      _mediaManager.stopRingingTone();
      _isRingtonePlaying = false;
    }
    super.dispose();
  }
}
