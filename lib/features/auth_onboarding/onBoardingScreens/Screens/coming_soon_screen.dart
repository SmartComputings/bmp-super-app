import 'package:bmp/features/auth_onboarding/onBoardingScreens/Screens/OnBoardingScreen/widgets/DynamicHeader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/localization/l10n.dart';

class ComingSoonScreen extends StatelessWidget {
  final String? featureName;
  
  const ComingSoonScreen({super.key, this.featureName});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isTablet = screenSize.width > 600;
    final isSmallScreen = screenSize.height < 700;
    
    return Scaffold(
      backgroundColor: const Color(0xFF1B1E43),
      body: SizedBox(
        width: screenSize.width,
        height: screenSize.height,
        child: Stack(
          children: [
            // Background glow
            Positioned(
              bottom: screenSize.height * 0.2,
              left: screenSize.width * 0.1,
              right: screenSize.width * 0.1,
              child: Container(
                height: screenSize.height * 0.4,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF1929FF).withOpacity(0.2),
                      blurRadius: isTablet ? 150 : 100,
                      spreadRadius: isTablet ? 80 : 50,
                    ),
                  ],
                ),
              ),
            ),

            // Header
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: SafeArea(
                child: DynamicHeader(),
              ),
            ),

            // Logo and Coming Soon text
            Positioned(
              top: screenSize.height * (isSmallScreen ? 0.2 : 0.25),
              left: 0,
              right: 0,
              bottom: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: isTablet ? 250 : 180,
                    height: isTablet ? 130 : 90,
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      L10n.of(context).comingSoonEllipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: isTablet ? 32 : 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      constraints: BoxConstraints(
                        maxHeight: screenSize.height * 0.5,
                      ),
                      child: Image.asset(
                        'assets/images/Bemind_Man 1.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}