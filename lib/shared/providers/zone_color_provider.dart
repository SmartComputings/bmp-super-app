import 'package:flutter/material.dart';

class ZoneColorProvider extends ChangeNotifier {
  ScrollController? _scrollController;
  
  static const List<Color> _gradientColors = [
    Color(0xFF202267),
    Color(0xff222588),
    Color(0xFF222587),
    Color(0xFF232576),
    Color(0xFF222587),
    Color(0xFF202267),

    // Color(0xFF8E27CD),
    // Color.fromARGB(255, 152, 27, 224),
    // Color.fromARGB(255, 184, 90, 231),
    // Color.fromARGB(255, 135, 64, 170),
    Color(0xFF4A4A4A),
    Color(0xFF222222),
  ];

  void initialize(ScrollController scrollController) {
    // Remove old listener if exists
    _scrollController?.removeListener(_onScroll);
    _scrollController = scrollController;
    _scrollController?.addListener(_onScroll);
  }

  void _onScroll() {
    notifyListeners();
  }

  Color getColorForIndex(int index) {
    return _gradientColors[index % _gradientColors.length];
  }

  Color getColorForPosition(BuildContext context) {
    try {
      final renderBox = context.findRenderObject() as RenderBox?;
      if (renderBox != null && renderBox.hasSize) {
        final position = renderBox.localToGlobal(Offset.zero);
        final screenHeight = MediaQuery.of(context).size.height;
        final itemCenter = position.dy + (renderBox.size.height / 2);

        final normalizedPosition = (itemCenter / screenHeight).clamp(0.0, 1.0);

        if (normalizedPosition <= 0.167) {
          return _gradientColors[0];
        } else if (normalizedPosition <= 0.333) {
          return _gradientColors[1];
        } else if (normalizedPosition <= 0.5) {
          return _gradientColors[2];
        } else if (normalizedPosition <= 0.667) {
          return _gradientColors[3];
        } else if (normalizedPosition <= 0.833) {
          return _gradientColors[4];
        } else {
          return _gradientColors[5];
        }
      }
    } catch (e) {
      // Fallback to default color
    }
    return _gradientColors[0];
  }

  @override
  void dispose() {
    _scrollController?.removeListener(_onScroll);
    super.dispose();
  }
}