import 'package:flutter/material.dart';

class UnderlineWidget extends StatelessWidget {
  const UnderlineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 5,
      decoration: BoxDecoration(
        color: const Color(0xFF4754FF),
        borderRadius: BorderRadius.circular(2.5),
      ),
    );
  }
}