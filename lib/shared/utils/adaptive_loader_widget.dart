import 'package:flutter/material.dart';

class AdaptiveLoaderWidget extends StatelessWidget {
  final double strokeWidth;
  final Color color;

  const AdaptiveLoaderWidget({
    super.key,
    this.strokeWidth = 2,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        strokeWidth: strokeWidth,
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}
