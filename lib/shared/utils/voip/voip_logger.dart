import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:matrix/matrix.dart';
import 'package:path_provider/path_provider.dart';

/// Comprehensive VoIP logging utility for debugging and monitoring
/// Provides detailed logging for call states, media streams, and network quality
class VoipLogger {
  static final VoipLogger _instance = VoipLogger._internal();
  factory VoipLogger() => _instance;
  VoipLogger._internal();

  static const String _logPrefix = '[VoIP]';
  final List<String> _logBuffer = [];
  Timer? _flushTimer;
  bool _initialized = false;
  String? _logFilePath;

  /// Initialize the VoIP logger
  Future<void> initialize() async {
    if (_initialized) return;
    
    try {
      if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
        final directory = await getApplicationDocumentsDirectory();
        _logFilePath = '${directory.path}/voip_logs.txt';
        Logs().i('$_logPrefix Logger initialized. Log file: $_logFilePath');
      }
      
      // Timer is now started lazily when logs are added
      // This prevents memory leak from forever-running timer
      
      _initialized = true;
      logInfo('VoIP Logger initialized successfully');
    } catch (e) {
      Logs().e('$_logPrefix Failed to initialize logger: $e');
    }
  }

  /// Log info level message
  void logInfo(String message) {
    _log('INFO', message);
  }

  /// Log warning level message
  void logWarning(String message) {
    _log('WARN', message);
  }

  /// Log error level message
  void logError(String message, [Object? error, StackTrace? stackTrace]) {
    final errorMsg = error != null ? ' - Error: $error' : '';
    final stackMsg = stackTrace != null ? '\nStack: $stackTrace' : '';
    _log('ERROR', '$message$errorMsg$stackMsg');
  }

  /// Log debug level message
  void logDebug(String message) {
    if (kDebugMode) {
      _log('DEBUG', message);
    }
  }

  /// Log call state changes with detailed information
  void logCallState(String callId, CallState oldState, CallState newState) {
    logInfo('Call [$callId] state changed: $oldState -> $newState');
  }

  /// Log media stream events (audio/video track changes)
  void logMediaStream(String callId, String streamType, String event, {Map<String, dynamic>? details}) {
    final detailsStr = details != null ? ' - Details: $details' : '';
    logInfo('Call [$callId] - $streamType stream $event$detailsStr');
  }

  /// Log permission requests and results
  void logPermission(String permission, bool granted) {
    logInfo('Permission [$permission]: ${granted ? 'GRANTED' : 'DENIED'}');
  }

  /// Log WebRTC peer connection events
  void logPeerConnection(String callId, String event, {Map<String, dynamic>? data}) {
    final dataStr = data != null ? ' - Data: $data' : '';
    logInfo('Call [$callId] - PeerConnection: $event$dataStr');
  }

  /// Log ICE candidate events
  void logIceCandidate(String callId, String candidateType, {String? candidate}) {
    final candidateInfo = candidate != null ? ' - $candidate' : '';
    logDebug('Call [$callId] - ICE Candidate [$candidateType]$candidateInfo');
  }

  /// Log ICE connection state changes
  void logIceConnectionState(String callId, String state) {
    logInfo('Call [$callId] - ICE Connection State: $state');
  }

  /// Log TURN server connection attempts
  void logTurnServer(String event, {String? uri, String? error}) {
    final uriStr = uri != null ? ' URI: $uri' : '';
    final errorStr = error != null ? ' Error: $error' : '';
    logInfo('TURN Server: $event$uriStr$errorStr');
  }

  /// Log audio/video device events
  void logDeviceEvent(String deviceType, String event, {String? deviceId}) {
    final deviceStr = deviceId != null ? ' (ID: $deviceId)' : '';
    logInfo('Device [$deviceType] $event$deviceStr');
  }

  /// Log network quality metrics
  void logNetworkQuality(String callId, Map<String, dynamic> metrics) {
    logInfo('Call [$callId] - Network Quality: $metrics');
  }

  /// Log call performance metrics
  void logPerformanceMetrics(String callId, Map<String, dynamic> metrics) {
    logInfo('Call [$callId] - Performance: $metrics');
  }

  /// Log call direction (incoming/outgoing)
  void logCallDirection(String callId, String direction, String roomId) {
    logInfo('Call [$callId] - Direction: $direction, Room: $roomId');
  }

  /// Log call type (voice/video)
  void logCallType(String callId, String callType) {
    logInfo('Call [$callId] - Type: $callType');
  }

  /// Internal logging method
  void _log(String level, String message) {
    final timestamp = DateTime.now().toIso8601String();
    final logEntry = '[$timestamp] [$level] $_logPrefix $message';
    
    // Always log to console via Matrix SDK logger
    switch (level) {
      case 'ERROR':
        Logs().e(logEntry);
        break;
      case 'WARN':
        Logs().w(logEntry);
        break;
      case 'DEBUG':
        Logs().v(logEntry);
        break;
      default:
        Logs().i(logEntry);
    }
    
    // Buffer for file logging
    _logBuffer.add(logEntry);
    
    // Start flush timer lazily when there's content
    _ensureFlushTimer();
    
    // Prevent buffer from growing too large
    if (_logBuffer.length > 1000) {
      _logBuffer.removeRange(0, 500);
    }
  }
  
  /// Ensure flush timer is running (lazy start)
  void _ensureFlushTimer() {
    _flushTimer ??= Timer.periodic(const Duration(seconds: 30), (timer) {
      _flushLogs();
      // Auto-stop timer when buffer is empty to prevent memory leak
      if (_logBuffer.isEmpty) {
        timer.cancel();
        _flushTimer = null;
      }
    });
  }

  /// Flush logs to file
  Future<void> _flushLogs() async {
    if (_logBuffer.isEmpty || _logFilePath == null) return;
    
    try {
      final file = File(_logFilePath!);
      final logs = '${_logBuffer.join('\n')}\n';
      await file.writeAsString(logs, mode: FileMode.append);
      _logBuffer.clear();
    } catch (e) {
      Logs().e('$_logPrefix Failed to flush logs: $e');
    }
  }

  /// Get recent logs as string (for debugging UI)
  String getRecentLogs({int maxLines = 100}) {
    final recentLogs = _logBuffer.length > maxLines 
        ? _logBuffer.sublist(_logBuffer.length - maxLines)
        : _logBuffer;
    return recentLogs.join('\n');
  }

  /// Clear all logs
  Future<void> clearLogs() async {
    _logBuffer.clear();
    if (_logFilePath != null) {
      try {
        final file = File(_logFilePath!);
        if (await file.exists()) {
          await file.delete();
        }
        logInfo('Logs cleared successfully');
      } catch (e) {
        Logs().e('$_logPrefix Failed to clear logs: $e');
      }
    }
  }

  /// Export logs for sharing/debugging
  Future<String?> exportLogs() async {
    await _flushLogs();
    if (_logFilePath != null) {
      try {
        final file = File(_logFilePath!);
        if (await file.exists()) {
          return await file.readAsString();
        }
      } catch (e) {
        Logs().e('$_logPrefix Failed to export logs: $e');
      }
    }
    return _logBuffer.join('\n');
  }

  /// Dispose resources
  void dispose() {
    _flushTimer?.cancel();
    _flushLogs();
    logInfo('VoIP Logger disposed');
  }
}
