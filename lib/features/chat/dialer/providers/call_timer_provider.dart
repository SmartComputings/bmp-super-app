import 'dart:async';
import 'package:flutter/material.dart';

/// Provider for managing call duration timer
/// Used by CallVideoLayout and other widgets that need timer without setState
class CallTimerProvider extends ChangeNotifier {
  Timer? _timer;
  int _durationSeconds = 0;
  bool _isRunning = false;
  bool _disposed = false;

  // Getters
  int get durationSeconds => _durationSeconds;
  bool get isRunning => _isRunning;
  
  String get formatted {
    final minutes = (_durationSeconds / 60).floor().toString().padLeft(2, '0');
    final seconds = (_durationSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  /// Start the timer
  void start() {
    if (_isRunning) return;
    
    _isRunning = true;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_disposed) {
        timer.cancel();  // Self-cancel when disposed
        return;
      }
      _durationSeconds++;
      notifyListeners();
    });
    if (!_disposed) notifyListeners();
  }

  /// Stop the timer
  void stop() {
    _timer?.cancel();
    _timer = null;
    _isRunning = false;
    if (!_disposed) notifyListeners();
  }

  /// Reset the timer
  void reset() {
    stop();
    _durationSeconds = 0;
    if (!_disposed) notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }
}
