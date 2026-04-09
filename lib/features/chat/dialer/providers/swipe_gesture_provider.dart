import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

/// Provider for managing swipe-to-answer gesture state
/// Used by CallActionButtons for swipe animation without setState
class SwipeGestureProvider extends ChangeNotifier {
  double _dragOffset = 0.0;
  bool _isDragging = false;
  bool _disposed = false;
  
  // Animation controller reference (managed externally due to TickerProvider requirement)
  AnimationController? _springController;

  // Getters
  double get dragOffset => _dragOffset;
  bool get isDragging => _isDragging;

  /// Set the animation controller (created with TickerProvider in widget)
  void setAnimationController(AnimationController controller) {
    _springController = controller;
    _springController?.addListener(_onAnimationUpdate);
  }

  void _onAnimationUpdate() {
    if (_springController != null) {
      _dragOffset = _springController!.value;
      if (!_disposed) notifyListeners();
    }
  }

  /// Called when drag starts
  void onDragStart() {
    _springController?.stop();
    _isDragging = true;
    if (!_disposed) notifyListeners();
  }

  /// Called during drag with delta
  void onDragUpdate(double delta, double maxDistance) {
    _dragOffset = (_dragOffset - delta).clamp(0.0, maxDistance);
    if (!_disposed) notifyListeners();
  }

  /// Called when drag ends
  void onDragEnd({
    required double velocity,
    required double maxDistance,
    required VoidCallback onSwipeComplete,
  }) {
    _isDragging = false;
    if (!_disposed) notifyListeners();
    
    if (_springController == null) return;
    
    // Check if swipe was successful (more than 50% or high velocity)
    if (_dragOffset >= maxDistance * 0.5 || velocity < -1000) {
      // Animate to end position
      final spring = SpringDescription(
        mass: 1,
        stiffness: 200,
        damping: 20,
      );
      final simulation = SpringSimulation(spring, _dragOffset, maxDistance, velocity / 1000);
      _springController!.animateWith(simulation).then((_) {
        onSwipeComplete();
      });
    } else {
      // Snap back to start
      final spring = SpringDescription(
        mass: 1,
        stiffness: 300,
        damping: 25,
      );
      final simulation = SpringSimulation(spring, _dragOffset, 0, velocity / 1000);
      _springController!.animateWith(simulation);
    }
  }

  /// Reset the gesture state
  void reset() {
    _dragOffset = 0.0;
    _isDragging = false;
    if (!_disposed) notifyListeners();
  }

  /// Clean up without full dispose (for reuse)
  void cleanup() {
    _springController?.removeListener(_onAnimationUpdate);
    _springController = null;
  }

  @override
  void dispose() {
    _disposed = true;
    cleanup();
    super.dispose();
  }
}
