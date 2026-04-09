import 'package:flutter/material.dart';
import 'package:bmp/features/chat/voip/services/video_quality_service.dart';
import 'package:matrix/matrix.dart';

/// Provider for managing video quality state
class VideoQualityProvider extends ChangeNotifier {
  final VideoQualityService _qualityService = VideoQualityService();
  
  VideoQuality get currentQuality => _qualityService.currentQuality;
  bool _isChanging = false;
  bool get isChanging => _isChanging;

  /// Change video quality
  Future<bool> setQuality(VideoQuality quality, CallSession? call) async {
    if (_isChanging) return false;
    
    _isChanging = true;
    notifyListeners();

    final success = await _qualityService.setVideoQuality(quality, call);
    
    _isChanging = false;
    notifyListeners();

    return success;
  }

  /// Get recommended quality based on network
  VideoQuality getRecommendedQuality({
    required double packetLoss,
    required double bandwidth,
  }) {
    return _qualityService.getRecommendedQuality(
      packetLoss: packetLoss,
      bandwidth: bandwidth,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
