import 'dart:ui';

import 'package:bmp/shared/widgets/Backgroundgradient/bg_gradient_theme.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/constants/position_constants.dart';
import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final String iconPath;
  final String title;
  final String description;
  final String buttonName;
  final VoidCallback? onButtonTap;
  final double? iconWidth;
  final bool showButton;
  final bool isSvg;

  const EmptyState({
    super.key,
    required this.iconPath,
    required this.title,
    required this.description,
    required this.buttonName,
    this.onButtonTap,
    this.iconWidth = 211,
    this.showButton = true,
    this.isSvg = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: IgnorePointer(
              child: Container(
                color: const Color(0xFF1B1C30),
                child: Stack(
                  children: [
                     Positioned.fill(
              child: Container(
                color: const Color(0xFF1B1C30),
              ),
            ),

            // Main blue circle background
            const BgGradientTheme(
              position: ShapePosition.center,
              width: 681,
              height: 681,
              color: Color(0xFF4754FF),
              opacity: 0.6,
            ),

            // Additional gradient shapes for the background effect
            const BgGradientTheme(
              position: ShapePosition.bottomFull,
              height: 300,
              colors: [Color(0xFF1B1C30), Color(0xFFA912BF)],
              opacity: 0.8,
            ),
            const BgGradientTheme(
              position: ShapePosition.bottomLeft,
              height: 250,
              color: Color(0xFF1B1C30),
              opacity: 0.8,
            ),
            const BgGradientTheme(
              position: ShapePosition.bottomRight,
              height: 200,
              color: Color(0xFF1B1C30),
              opacity: 0.8,
            ),
            const BgGradientTheme(
              position: ShapePosition.bottomCenter,
              height: 150,
              color: Color(0xFF1B1C30),
              opacity: 0.8,
            ),

            const BgGradientTheme(
              position: ShapePosition.topLeft,
              width: 200,
              height: 300,
              color: Colors.black,
              opacity: 0.3,
            ),

            const BgGradientTheme(
              position: ShapePosition.topRight,
              width: 200,
              height: 300,
              color: Colors.black,
              opacity: 0.3,
            ),

            // Blur effect overlay
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 85, sigmaY: 85),
                child: Container(color: Colors.transparent),
              ),
            ),

                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Image.asset(
                        iconPath,
                        width: iconWidth,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: iconWidth,
                            height: 175,
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.image_not_supported,
                              size: 100,
                              color: Colors.white54,
                            ),
                          );
                        },
                      ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
                if (showButton) ...[
                  const SizedBox(height: 60),
                  Container(
                    width: 200,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xFF3976F8),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(25),
                        onTap: onButtonTap ?? () => Navigator.of(context).pop(),
                        child: Center(
                          child: Text(
                            buttonName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
