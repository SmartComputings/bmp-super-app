import 'package:bmp/core/constant/app_colors.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/Screens/OnBoardingScreen/widgets/onboarding_header.dart';
import 'package:flutter/material.dart';

import 'package:bmp/shared/utils/image/assets/image_assets.dart';

class WelcomeLayout extends StatelessWidget {
  final Widget child;
  final bool isHeaderShow;

  const WelcomeLayout({
    super.key,
    required this.child,
    this.isHeaderShow = true,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            // Blue radial glow background
            Positioned.fill(
              child: Image.asset(
                ImageAssets.welcomeBg,
                fit: BoxFit.cover,
              ),
            ),
            // Top card with logo and icons
            Column(
              children: [
                if (isHeaderShow)
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * .03),
                    child: const OnboardingHeader(),
                  ),
                // Main content area
                Expanded(child: child),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
