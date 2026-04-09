import 'package:flutter/material.dart';

/// Provider for managing video quality selector expanded state
/// Used by VideoQualityQuickSelector without setState
class VideoQualitySelectorProvider extends ChangeNotifier {
  bool _isExpanded = false;
  bool _disposed = false;

  // Getters
  bool get isExpanded => _isExpanded;

  /// Toggle expanded state
  void toggle() {
    _isExpanded = !_isExpanded;
    if (!_disposed) notifyListeners();
  }

  /// Collapse the selector
  void collapse() {
    if (_isExpanded) {
      _isExpanded = false;
      if (!_disposed) notifyListeners();
    }
  }

  /// Expand the selector
  void expand() {
    if (!_isExpanded) {
      _isExpanded = true;
      if (!_disposed) notifyListeners();
    }
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
