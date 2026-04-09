import 'dart:ui';
import 'package:flutter/material.dart';

class InnerShadow extends StatelessWidget {
  final double blur;           // roughly = svg stdDeviation * 2
  final Color color;           // shadow color
  final Offset offset;         // e.g. Offset(0, 4)
  final double radius;         // same as container radius
  final Widget child;

  const InnerShadow({
    super.key,
    required this.blur,
    required this.color,
    required this.offset,
    required this.radius,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: _InnerShadowPainter(
        blur: blur,
        color: color,
        offset: offset,
        radius: radius,
      ),
      child: child,
    );
  }
}

class _InnerShadowPainter extends CustomPainter {
  final double blur;
  final Color color;
  final Offset offset;
  final double radius;

  _InnerShadowPainter({
    required this.blur,
    required this.color,
    required this.offset,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));

    // Layer for masking
    canvas.saveLayer(rect, Paint());

    // 1) Draw a blurred, shifted copy of the shape
    final paintShadow = Paint()
      ..color = color
      ..imageFilter = ImageFilter.blur(sigmaX: blur, sigmaY: blur);
    final Path shifted = Path()..addRRect(rrect.shift(-offset));
    canvas.drawPath(shifted, paintShadow);

    // 2) Cut out the original shape so the blur remains only inside edges
    final clear = Paint()..blendMode = BlendMode.dstOut;
    final Path cut = Path()..addRRect(rrect);
    canvas.drawPath(cut, clear);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _InnerShadowPainter oldDelegate) {
    return blur != oldDelegate.blur ||
        color != oldDelegate.color ||
        offset != oldDelegate.offset ||
        radius != oldDelegate.radius;
  }
}
