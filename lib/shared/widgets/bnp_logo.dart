import 'package:flutter/material.dart';

class BMPLogo extends StatelessWidget {
  final double size;
  final Color? backgroundColor;
  final Color? textColor;

  const BMPLogo({
    super.key,
    this.size = 100,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor ?? const Color(0xFF0D6EFD),
        borderRadius: BorderRadius.circular(size * 0.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          'BMP',
          style: TextStyle(
            fontSize: size * 0.3,
            fontWeight: FontWeight.bold,
            color: textColor ?? Colors.white,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}