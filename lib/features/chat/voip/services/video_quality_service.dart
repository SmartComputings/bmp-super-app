import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:matrix/matrix.dart';

/// Video quality presets
enum VideoQuality {
  auto,
  high,    // 720p @ 30fps
  medium,  // 480p @ 30fps
  low,     // 360p @ 30fps
}

extension VideoQualityExtension on VideoQuality {
  String get label {
    switch (this) {
      case VideoQuality.auto:
        return 'Auto';
      case VideoQuality.high:
        return '720p';
      case VideoQuality.medium:
        return '480p';
      case VideoQuality.low:
        return '360p';
    }
  }

  Map<String, dynamic> get constraints {
    switch (this) {
      case VideoQuality.auto:
        return {
          'width': {'ideal': 1280},
          'height': {'ideal': 720},
          'frameRate': {'ideal': 30},
        };
      case VideoQuality.high:
        return {
          'width': {'exact': 1280},
          'height': {'exact': 720},
          'frameRate': {'exact': 30},
        };
      case VideoQuality.medium:
        return {
          'width': {'exact': 640},
          'height': {'exact': 480},
          'frameRate': {'exact': 30},
        };
      case VideoQuality.low:
        return {
          'width': {'exact': 640},
          'height': {'exact': 360},
          'frameRate': {'exact': 30},
        };
    }
  }
}

/// Service to manage video quality settings
class VideoQualityService {
  VideoQuality _currentQuality = VideoQuality.auto;
  
  VideoQuality get currentQuality => _currentQuality;

  /// Change video quality for a call
  Future<bool> setVideoQuality(
    VideoQuality quality,
    CallSession? call,
  ) async {
    if (call == null) {
      Logs().w('[VideoQualityService] No active call');
      return false;
    }

    try {
      // Get current local stream
      final localStream = call.localUserMediaStream?.stream;
      if (localStream == null) {
        Logs().w('[VideoQualityService] No local stream available');
        return false;
      }

      // Get video track
      final videoTracks = localStream.getVideoTracks();
      if (videoTracks.isEmpty) {
        Logs().w('[VideoQualityService] No video track found');
        return false;
      }

      final videoTrack = videoTracks[0];
      final constraints = quality.constraints;

      // Apply new constraints to existing track
      await videoTrack.applyConstraints(constraints);
      
      _currentQuality = quality;
      Logs().i('[VideoQualityService] Video quality changed to ${quality.label}');
      
      return true;
    } catch (e, s) {
      Logs().e('[VideoQualityService] Failed to change quality', e, s);
      return false;
    }
  }

  /// Get recommended quality based on network stats
  VideoQuality getRecommendedQuality({
    required double packetLoss,
    required double bandwidth, // Kbps
  }) {
    // Poor network (packet loss > 5% or bandwidth < 500 Kbps)
    if (packetLoss > 5.0 || bandwidth < 500) {
      return VideoQuality.low;
    }
    
    // Fair network (packet loss > 3% or bandwidth < 1000 Kbps)
    if (packetLoss > 3.0 || bandwidth < 1000) {
      return VideoQuality.medium;
    }
    
    // Good network
    return VideoQuality.high;
  }
}
