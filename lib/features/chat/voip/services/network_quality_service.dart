import 'dart:async';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:matrix/matrix.dart';

enum NetworkQuality { excellent, good, fair, poor, disconnected }

class NetworkQualityService {
  Timer? _statsTimer;
  NetworkQuality _currentQuality = NetworkQuality.good;
  final _qualityController = StreamController<NetworkQuality>.broadcast();
  
  // Safety flags
  bool _disposed = false;
  int _consecutiveFailures = 0;
  static const int _maxConsecutiveFailures = 3; // Reduced from 5 for faster detection
  
  // Track bytes received to detect stalled connection
  int _lastBytesReceived = 0;
  int _stalledCount = 0;
  static const int _maxStalledCount = 2; // Stalled for 4 seconds = disconnected

  Stream<NetworkQuality> get qualityStream => _qualityController.stream;
  NetworkQuality get currentQuality => _currentQuality;

  void startMonitoring(RTCPeerConnection peerConnection) {
    _statsTimer?.cancel();
    _disposed = false;
    _consecutiveFailures = 0;
    _stalledCount = 0;
    _lastBytesReceived = 0;
    
    _statsTimer = Timer.periodic(const Duration(seconds: 2), (timer) async {
      if (_disposed) {
        timer.cancel();
        return;
      }
      try {
        final stats = await peerConnection.getStats();
        _analyzeStats(stats);
        _consecutiveFailures = 0;
      } catch (e) {
        _consecutiveFailures++;
        Logs().w('[NetworkQualityService] getStats failed: $e (attempt $_consecutiveFailures)');
        if (_consecutiveFailures >= _maxConsecutiveFailures) {
          _updateQuality(NetworkQuality.disconnected);
        }
      }
    });
  }

  void _analyzeStats(List<StatsReport> stats) {
    double? packetsLost;
    double? jitter;
    double? rtt;
    int bytesReceived = 0;
    String? connectionState;

    for (final report in stats) {
      if (report.type == 'inbound-rtp') {
        packetsLost = double.tryParse(report.values['packetsLost']?.toString() ?? '0');
        jitter = double.tryParse(report.values['jitter']?.toString() ?? '0');
        bytesReceived += int.tryParse(report.values['bytesReceived']?.toString() ?? '0') ?? 0;
      }
      if (report.type == 'candidate-pair' && report.values['state'] == 'succeeded') {
        rtt = double.tryParse(report.values['currentRoundTripTime']?.toString() ?? '0');
      }
      // Check ICE connection state
      if (report.type == 'transport') {
        connectionState = report.values['dtlsState']?.toString();
      }
    }
    
    // Check if connection is stalled (no new bytes received)
    if (bytesReceived > 0 && bytesReceived == _lastBytesReceived) {
      _stalledCount++;
      Logs().w('[NetworkQualityService] Connection stalled (count: $_stalledCount)');
      if (_stalledCount >= _maxStalledCount) {
        _updateQuality(NetworkQuality.disconnected);
        return;
      }
    } else {
      _stalledCount = 0;
    }
    _lastBytesReceived = bytesReceived;
    
    // Check for disconnected state
    if (connectionState == 'failed' || connectionState == 'closed') {
      Logs().w('[NetworkQualityService] DTLS state indicates disconnection: $connectionState');
      _updateQuality(NetworkQuality.disconnected);
      return;
    }

    final quality = _calculateQuality(packetsLost ?? 0, jitter ?? 0, (rtt ?? 0) * 1000);
    _updateQuality(quality);
  }

  NetworkQuality _calculateQuality(double packetsLost, double jitter, double rtt) {
    // Very poor conditions likely indicate impending disconnection
    if (packetsLost > 10 || rtt > 500 || jitter > 0.2) return NetworkQuality.poor;
    if (packetsLost > 5 || rtt > 300 || jitter > 0.1) return NetworkQuality.poor;
    if (packetsLost > 2 || rtt > 200 || jitter > 0.05) return NetworkQuality.fair;
    if (packetsLost > 0 || rtt > 100 || jitter > 0.02) return NetworkQuality.good;
    return NetworkQuality.excellent;
  }

  void _updateQuality(NetworkQuality quality) {
    if (_currentQuality != quality) {
      Logs().i('[NetworkQualityService] Quality changed: $_currentQuality -> $quality');
      _currentQuality = quality;
      _qualityController.add(quality);
    }
  }

  void dispose() {
    _disposed = true;
    _statsTimer?.cancel();
    _statsTimer = null;
    if (!_qualityController.isClosed) {
      _qualityController.close();
    }
  }
}
