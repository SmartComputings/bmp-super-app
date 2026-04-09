import 'package:flutter_webrtc/flutter_webrtc.dart';

class AudioProcessingService {
  /// Get optimal audio constraints for WebRTC calls
  /// Set [isSpeakerMode] to true for enhanced echo cancellation when using loudspeaker
  static Map<String, dynamic> getOptimalAudioConstraints({
    bool echoCancellation = true,
    bool noiseSuppression = true,
    bool autoGainControl = true,
    bool isSpeakerMode = false,
  }) {
    return {
      'audio': {
        // Standard Web Audio constraints
        'echoCancellation': echoCancellation,
        'noiseSuppression': noiseSuppression,
        'autoGainControl': autoGainControl,
        
        // Google-specific echo cancellation (Chromium-based engines)
        'googEchoCancellation': echoCancellation,
        'googEchoCancellation2': echoCancellation,
        'googDAEchoCancellation': echoCancellation,
        // Experimental AEC - more aggressive, good for speaker mode
        'googExperimentalEchoCancellation': isSpeakerMode || echoCancellation,
        
        // Google-specific noise suppression
        'googNoiseSuppression': noiseSuppression,
        'googNoiseSuppression2': noiseSuppression,
        'googExperimentalNoiseSuppression': noiseSuppression,
        
        // Google-specific auto gain control
        'googAutoGainControl': autoGainControl,
        'googAutoGainControl2': autoGainControl,
        'googExperimentalAutoGainControl': autoGainControl,
        
        // Audio filters
        'googHighpassFilter': true,
        'googTypingNoiseDetection': true,
        
        // Prevent audio mirroring (self-echo prevention)
        'googAudioMirroring': false,
        
        // Beamforming for better voice pickup (if supported)
        'googBeamforming': true,
        'googArrayGeometry': true,
        
        // Low-latency audio optimization for real-time communication
        'latency': 0.01,  // Target 10ms latency
        'channelCount': 1,  // Mono audio (optimal for voice)
        'sampleRate': 48000,  // Opus codec optimal sample rate
        'sampleSize': 16,  // 16-bit audio quality
      },
    };
  }

  /// Get user media stream with optimal audio processing
  /// Set [isSpeakerMode] to true when using loudspeaker for enhanced echo cancellation
  static Future<MediaStream> getUserMediaWithProcessing({
    bool video = false,
    bool echoCancellation = true,
    bool noiseSuppression = true,
    bool autoGainControl = true,
    bool isSpeakerMode = false,
  }) async {
    // Use the same optimized audio constraints
    final audioConstraints = getOptimalAudioConstraints(
      echoCancellation: echoCancellation,
      noiseSuppression: noiseSuppression,
      autoGainControl: autoGainControl,
      isSpeakerMode: isSpeakerMode,
    );
    
    final constraints = {
      ...audioConstraints,
      if (video)
        'video': {
          'facingMode': 'user',
          'width': {'ideal': 1280},
          'height': {'ideal': 720},
          'frameRate': {'ideal': 30},
        },
    };

    return await navigator.mediaDevices.getUserMedia(constraints);
  }
}
