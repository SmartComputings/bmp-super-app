import 'package:bmp/shared/widgets/Backgroundgradient/constants/position_constants.dart';
import 'package:flutter/material.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/bg_gradient_theme.dart';
import 'dart:ui';
import 'package:go_router/go_router.dart';
import 'package:bmp/shared/widgets/matrix.dart';

import '../../../core/localization/l10n.dart';

class AccountTypeSelectionScreen extends StatelessWidget {
  const AccountTypeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        color: const Color(0xFF1B1C30),
        child: Stack(
          children: [
            // Main blue circle background
            BgGradientTheme(
              position: ShapePosition.center,
              width: screenWidth * 1.8,
              height: screenWidth * 1.8,
              color: const Color(0xFF363EC1),
              opacity: 0.6,
            ),

            // Additional gradient shapes for the background effect
            BgGradientTheme(
              position: ShapePosition.bottomFull,
              height: screenHeight * 0.37,
              colors: const [Color(0xFF1B1C30), Color(0xFFA912BF)],
              opacity: 0.8,
            ),
            BgGradientTheme(
              position: ShapePosition.bottomLeft,
              height: screenHeight * 0.44,
              gradient: const LinearGradient(
                  colors: [Color(0xFFA912BF), Color(0xFF1B1C30)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,),
              opacity: 0.8,
            ),
            BgGradientTheme(
              position: ShapePosition.bottomRight,
              height: screenHeight * 0.31,
              color: const Color(0xFF1B1C30),
              opacity: 0.8,
            ),
            BgGradientTheme(
              position: ShapePosition.topRight,
              height: screenHeight * 0.44,
              gradient: const LinearGradient(
                  colors: [Color(0xFF1B1C30), Color(0x88A912BF)],
                  stops: [0.5, 0.5],
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,),
              opacity: 0.6,
            ),
            BgGradientTheme(
              position: ShapePosition.bottomRight,
              height: screenHeight * 0.19,
              color: const Color(0xFF1B1C30),
              opacity: 0.8,
            ),
            BgGradientTheme(
              position: ShapePosition.bottomCenter,
              height: screenHeight * 0.125,
              color: const Color(0xFF1B1C30),
              opacity: 0.8,
            ),

            BgGradientTheme(
              position: ShapePosition.topLeft,
              width: screenWidth * 0.5,
              height: screenHeight * 0.25,
              color: Colors.black,
              opacity: 0.3,
            ),

            BgGradientTheme(
              position: ShapePosition.topRight,
              width: screenWidth * 0.5,
              height: screenHeight * 0.25,
              color: Colors.black,
              opacity: 0.3,
            ),

            // Blur effect overlay
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 85, sigmaY: 85),
              child: Container(color: Colors.transparent),
            ),

            // Main content
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.063),

                    // Logo section
                    SizedBox(
                      width: screenWidth * 0.27,
                      height: screenHeight * 0.05,
                      child: Image.asset(
                        'assets/logo_main.png',
                        fit: BoxFit.contain,
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.063),

                    // Sign up for an account title
                    Text(
                      L10n.of(context).signUpForAnAccount,
                      style: TextStyle(
                        color: const Color(0xFFD2D4E5),
                        fontSize: screenWidth * 0.085,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.025),

                    // Subtitle
                    Text(
                      L10n.of(context).whatTypeOfAccountDoYouWantToOpen,
                      style: TextStyle(
                        color: const Color(0xFFD2D4E5),
                        fontSize: screenWidth * 0.037,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.045),

                    // Personal Account Card
                    GestureDetector(
                      onTap: () async {
                        // Navigate to signup screen
                        final client = await Matrix.of(context).getLoginClient();
                        context.push('/home/signup', extra: client);
                      },
                      child: Container(
                        width: double.infinity,
                        height: screenHeight * 0.092,
                        decoration: BoxDecoration(
                          color: const Color(0x7F050926),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                          child: Row(
                            children: [
                              // Icon container
                              Container(
                                width: screenWidth * 0.064,
                                height: screenWidth * 0.064,
                                decoration: BoxDecoration(
                                  color: const Color(0x7F1F267E),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Image.asset(
                                  'assets/chat_icons/personal_icon.png',
                                  width: 24,
                                  height: 24,
                                  color: const Color(0xFF4754FF),
                                ),
                              ),

                              SizedBox(width: screenWidth * 0.055),

                              // Text content
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      L10n.of(context).personalAccount,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: screenWidth * 0.043,
                                        fontFamily: 'Work Sans',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: screenHeight * 0.003),
                                    Text(
                                      L10n.of(context).naturalPerson,
                                      style: TextStyle(
                                        color: const Color(0xFFD2D4E5),
                                        fontSize: screenWidth * 0.032,
                                        fontFamily: 'Work Sans',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Arrow icon
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: const Color(0x7F1F267E),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: const Color(0xFFD2D4E5),
                                  size: screenWidth * 0.04,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Spacer to push image to bottom
                    const Spacer(),

                    // Bottom character image
                    SizedBox(
                      width: double.infinity,
                      height: screenHeight * 0.32,
                      child: Image.asset(
                        'assets/images/chat_details/signup_personal_image.png',
                        fit: BoxFit.contain,
                        alignment: Alignment.bottomCenter,
                      ),
                    ),

                    // SizedBox(height: screenHeight * 0.02),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}