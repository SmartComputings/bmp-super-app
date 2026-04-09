import 'dart:async';
import 'package:flutter/material.dart';

/// Provider for PiP overlay state management
/// Handles position, dragging, and call timer without setState
class PipOverlayProvider extends ChangeNotifier {
  // Position tracking
  Offset _position = Offset.zero;
  bool _isPositionInitialized = false;
  bool _isDragging = false;
  
  // Call timer
  Timer? _callTimer;
  int _callDurationSeconds = 0;
  
  // Safety flag
  bool _disposed = false;

  // Getters
  Offset get position => _position;
  bool get isPositionInitialized => _isPositionInitialized;
  bool get isDragging => _isDragging;
  int get callDurationSeconds => _callDurationSeconds;
  
  String get formattedDuration {
    final minutes = (_callDurationSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (_callDurationSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  /// Initialize position with default values
  void initializePosition(double defaultX, double defaultY) {
    if (!_isPositionInitialized) {
      _position = Offset(defaultX, defaultY);
      _isPositionInitialized = true;
      if (!_disposed) notifyListeners();
    }
  }

  /// Update position with delta
  void updatePosition(Offset delta) {
    _position = Offset(
      _position.dx + delta.dx,
      _position.dy + delta.dy,
    );
    if (!_disposed) notifyListeners();
  }

  /// Set dragging state
  void setDragging(bool value) {
    if (_isDragging != value) {
      _isDragging = value;
      if (!_disposed) notifyListeners();
    }
  }

  /// Start call timer
  void startTimer() {
    _callTimer?.cancel();
    _callDurationSeconds = 0;
    _callTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_disposed) {
        timer.cancel();  // Self-cancel when disposed
        return;
      }
      _callDurationSeconds++;
      notifyListeners();
    });
  }

  /// Stop call timer
  void stopTimer() {
    _callTimer?.cancel();
    _callTimer = null;
  }

  /// Reset timer
  void resetTimer() {
    stopTimer();
    _callDurationSeconds = 0;
    if (!_disposed) notifyListeners();
  }

  /// Trigger manual UI update (for stream changes)
  void notifyChange() {
    if (!_disposed) notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    _callTimer?.cancel();
    _callTimer = null;
    super.dispose();
  }
}
