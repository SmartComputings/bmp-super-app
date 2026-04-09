import 'package:flutter/material.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';

class CircularIconWidgetNoShadow extends StatelessWidget {
  final Color color;
  final Widget icon;
  final double size;
  final double iconSize;

  const CircularIconWidgetNoShadow({
    super.key,
    required this.color,
    required this.icon,
    this.size = 70.20,
    this.iconSize = 33.80,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1000),
        ),
      ),
      child: Center(
        child: SizedBox(
          width: iconSize,
          height: iconSize,
          child: icon,
        ),
      ),
    );
  }
}