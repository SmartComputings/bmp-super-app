import 'dart:async';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:matrix/matrix.dart';

/// Network quality levels
enum NetworkQuality {
  excellent,
  good,
  fair,
  poor,
  unknown,
}

/// Network statistics data
class NetworkStats {
  final double packetLoss; // Percentage
  final double jitter; // Milliseconds
  final double roundTripTime; // Milliseconds
  final double uploadBandwidth; // Kbps
  final double downloadBandwidth; // Kbps
  final int bytesSent;
  final int bytesReceived;
  final NetworkQuality quality;

  NetworkStats({
    required this.packetLoss,
    required this.jitter,
    required this.roundTripTime,
    required this.uploadBandwidth,
    required this.downloadBandwidth,
    required this.bytesSent,
    required this.bytesReceived,
    required this.quality,
  });

  factory NetworkStats.empty() {
    return NetworkStats(
      packetLoss: 0,
      jitter: 0,
      roundTripTime: 0,
      uploadBandwidth: 0,
      downloadBandwidth: 0,
      bytesSent: 0,
      bytesReceived: 0,
      quality: NetworkQuality.unknown,
    );
  }
}

/// Service to monitor WebRTC network statistics
class NetworkStatsService {
  Timer? _statsTimer;
  RTCPeerConnection? _peerConnection;
  
  // Previous values for bandwidth calculation
  int _previousBytesSent = 0;
  int _previousBytesReceived = 0;
  DateTime _previousTimestamp = DateTime.now();

  NetworkStats _currentStats = NetworkStats.empty();
  NetworkStats get currentStats => _currentStats;

  /// Start monitoring network stats
  void startMonitoring(RTCPeerConnection? peerConnection) {
    if (peerConnection == null) {
      Logs().w('[NetworkStatsService] Peer connection is null');
      return;
    }

    _peerConnection = peerConnection;
    _previousTimestamp = DateTime.now();
    
    // Poll stats every 2 seconds
    _statsTimer = Timer.periodic(const Duration(seconds: 2), (_) {
      _collectStats();
    });
    
    Logs().i('[NetworkStatsService] Started monitoring');
  }

  /// Stop monitoring
  void stopMonitoring() {
    _statsTimer?.cancel();
    _statsTimer = null;
    _peerConnection = null;
    _currentStats = NetworkStats.empty();
    Logs().i('[NetworkStatsService] Stopped monitoring');
  }

  /// Collect and parse WebRTC stats
  Future<void> _collectStats() async {
    if (_peerConnection == null) return;

    try {
      final stats = await _peerConnection!.getStats();
      
      double packetLoss = 0;
      double jitter = 0;
      double rtt = 0;
      int bytesSent = 0;
      int bytesReceived = 0;

      // Parse stats reports
      for (final report in stats) {
        final values = report.values;
        
        // Inbound RTP stats (receiving)
        if (report.type == 'inbound-rtp') {
          final packetsLost = values['packetsLost'] as int? ?? 0;
          final packetsReceived = values['packetsReceived'] as int? ?? 0;
          final totalPackets = packetsLost + packetsReceived;
          
          if (totalPackets > 0) {
            packetLoss = (packetsLost / totalPackets) * 100;
          }
          
          final jitterValue = values['jitter'] as num?;
          if (jitterValue != null) {
            jitter = jitterValue.toDouble() * 1000; // Convert to ms
          }
          
          bytesReceived += values['bytesReceived'] as int? ?? 0;
        }
        
        // Outbound RTP stats (sending)
        if (report.type == 'outbound-rtp') {
          bytesSent += values['bytesSent'] as int? ?? 0;
        }
        
        // Candidate pair stats (RTT)
        if (report.type == 'candidate-pair') {
          final currentRtt = values['currentRoundTripTime'] as num?;
          if (currentRtt != null) {
            rtt = currentRtt.toDouble() * 1000; // Convert to ms
          }
        }
      }

      // Calculate bandwidth
      final now = DateTime.now();
      final deltaTime = now.difference(_previousTimestamp).inMilliseconds / 1000.0;
      
      double uploadBandwidth = 0;
      double downloadBandwidth = 0;
      
      if (deltaTime > 0) {
        final deltaBytesSent = bytesSent - _previousBytesSent;
        final deltaBytesReceived = bytesReceived - _previousBytesReceived;
        
        // Convert to Kbps
        uploadBandwidth = (deltaBytesSent * 8) / (deltaTime * 1000);
        downloadBandwidth = (deltaBytesReceived * 8) / (deltaTime * 1000);
      }
      
      // Update previous values
      _previousBytesSent = bytesSent;
      _previousBytesReceived = bytesReceived;
      _previousTimestamp = now;

      // Calculate quality
      final quality = _calculateQuality(packetLoss, jitter, rtt);

      _currentStats = NetworkStats(
        packetLoss: packetLoss,
        jitter: jitter,
        roundTripTime: rtt,
        uploadBandwidth: uploadBandwidth,
        downloadBandwidth: downloadBandwidth,
        bytesSent: bytesSent,
        bytesReceived: bytesReceived,
        quality: quality,
      );

      Logs().d('[NetworkStatsService] Stats: Quality=$quality, '
          'Loss=${packetLoss.toStringAsFixed(1)}%, '
          'Jitter=${jitter.toStringAsFixed(1)}ms, '
          'RTT=${rtt.toStringAsFixed(1)}ms, '
          'Up=${uploadBandwidth.toStringAsFixed(1)}Kbps, '
          'Down=${downloadBandwidth.toStringAsFixed(1)}Kbps');
    } catch (e, s) {
      Logs().e('[NetworkStatsService] Error collecting stats', e, s);
    }
  }

  /// Calculate network quality based on metrics
  NetworkQuality _calculateQuality(double packetLoss, double jitter, double rtt) {
    // Excellent: Packet loss < 1%, RTT < 100ms, Jitter < 20ms
    if (packetLoss < 1.0 && rtt < 100 && jitter < 20) {
      return NetworkQuality.excellent;
    }
    
    // Good: Packet loss < 3%, RTT < 200ms, Jitter < 50ms
    if (packetLoss < 3.0 && rtt < 200 && jitter < 50) {
      return NetworkQuality.good;
    }
    
    // Fair: Packet loss < 5%, RTT < 400ms, Jitter < 100ms
    if (packetLoss < 5.0 && rtt < 400 && jitter < 100) {
      return NetworkQuality.fair;
    }
    
    // Poor: Above thresholds
    return NetworkQuality.poor;
  }

  void dispose() {
    stopMonitoring();
  }
}
