import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:bmp/features/chat/voip/services/network_quality_service.dart';

class NetworkQualityProvider extends ChangeNotifier {
  final NetworkQualityService _service = NetworkQualityService();
  NetworkQuality _quality = NetworkQuality.good;
  StreamSubscription<NetworkQuality>? _qualitySubscription;

  NetworkQuality get quality => _quality;

  NetworkQualityProvider() {
    _qualitySubscription = _service.qualityStream.listen((quality) {
      _quality = quality;
      notifyListeners();
    });
  }

  void startMonitoring(dynamic peerConnection) {
    _service.startMonitoring(peerConnection);
  }

  @override
  void dispose() {
    _qualitySubscription?.cancel();
    _service.dispose();
    super.dispose();
  }
}
