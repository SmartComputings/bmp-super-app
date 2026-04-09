import 'dart:ui';
import 'package:bmp/shared/widgets/Backgroundgradient/constants/position_constants.dart';
import 'package:flutter/material.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/bg_gradient_theme.dart';
import 'package:bmp/core/localization/l10n.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({super.key});

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
                    // Main blue circle background
                    BgGradientTheme(
                      position: ShapePosition.center,
                      width: MediaQuery.of(context).size.width * 1.8,
                      height: MediaQuery.of(context).size.width * 1.8,
                      color: const Color(0xFF4754FF),
                      opacity: 0.6,
                    ),

                    // Additional gradient shapes
                    BgGradientTheme(
                      position: ShapePosition.bottomFull,
                      height: MediaQuery.of(context).size.height * 0.25,
                      colors: const [Color(0xFF1B1C30), Color(0xFFA912BF)],
                      opacity: 0.4,
                    ),

                    BgGradientTheme(
                      position: ShapePosition.topLeft,
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.35,
                      color: Colors.black,
                      opacity: 0.3,
                    ),

                    BgGradientTheme(
                      position: ShapePosition.topRight,
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.35,
                      color: Colors.black,
                      opacity: 0.5,
                    ),
                    BgGradientTheme(
                      position: ShapePosition.bottomLeft,
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.35,
                      color: Colors.black,
                      opacity: 0.6,
                    ),

                    BgGradientTheme(
                      position: ShapePosition.bottomRight,
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.35,
                      color: Colors.black,
                      opacity: 0.6,
                    ),
                    // Blur effect overlay
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 85, sigmaY: 85),
                      child: Container(color: Colors.transparent),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Main content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Images with zero margin
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/icons/Done 1.png',
                      width: 211,
                      errorBuilder: (context, error, stackTrace) {
                        return Transform.rotate(
                          angle: -0.189,
                          child: Container(
                            width: 211,
                            height: 175,
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.person,
                              size: 100,
                              color: Colors.white54,
                            ),
                          ),
                        );
                      },
                    ),
                    
                  ],
                ),
                
                const SizedBox(height: 40),
                
                // Text content
                Column(
                  children: [
                    Text(
                      L10n.of(context).done,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      L10n.of(context).signupSuccessMessage,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 80),
                
                // Go back button
                Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3976F8),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(24),
                      onTap: () {
                        Navigator.of(context).popUntil((route) => route.isFirst);
                      },
                      child: Center(
                        child: Text(
                          L10n.of(context).done.replaceAll('!', ''),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // // Home indicator
          // Positioned(
          //   bottom: 8,
          //   left: 0,
          //   right: 0,
          //   child: Center(
          //     child: Container(
          //       width: 144,
          //       height: 5,
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(100),
          //         border: Border.all(color: Colors.white),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

// Usage example:
// Navigator.push(
//   context,
//   MaterialPageRoute(builder: (context) => const DoneScreen()),
// );
