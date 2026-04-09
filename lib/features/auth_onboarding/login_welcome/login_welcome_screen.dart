import 'dart:ui';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/auth_onboarding/widgets/CustomButton.dart';
import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/bg_gradient_theme.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/constants/position_constants.dart';
import 'package:bmp/shared/widgets/app_exit_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import '../../../core/constant/finance_typography.dart';
import '../widgets/CountryDropdown.dart';

class LoginWelcomeScreen extends StatelessWidget {
  const LoginWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine if device is large (tablet/desktop) for capping sizes
    final isLargeDevice = context.screenWidth > 600;

    // Handle both gesture navigation and 3-button navigation
    // viewPadding.bottom works for gesture mode
    // For 3-button nav, we use padding.bottom or a minimum fallback
    final viewPadding = MediaQuery.of(context).viewPadding.bottom;
    final systemPadding = MediaQuery.of(context).padding.bottom;
    // Use the larger of viewPadding, systemPadding, or minimum 16 for 3-button nav
    final bottomPadding = viewPadding > 0
        ? viewPadding
        : (systemPadding > 0 ? systemPadding : 16.0);

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) return;

        await AppExitDialogue.show(context);
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: context.screenWidth,
          height: context.screenHeight,
          color: const Color(0xFF1B1C30),
          child: Stack(
            children: [
              BgGradientTheme(
                position: ShapePosition.center,
                width: context.screenWidth * 1.8,
                height: context.screenWidth * 1.8,
                color: const Color(0xFF363EC1),
                opacity: 0.6,
              ),
              // BgGradientTheme(
              //   position: ShapePosition.bottomFull,
              //   height: screenHeight * 0.37,
              //   colors: const [Color(0xFF1B1C30),Color(0xFF1B1C30)],
              //   opacity: 0.8,
              // ),
              BgGradientTheme(
                position: ShapePosition.bottomRight,
                height: context.screenHeight * 0.4,
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFFA912BF).withValues(alpha: 0.8),
                    const Color(0xFFA912BF).withValues(alpha: 0.8),
                  ],
                  stops: const [0.6, 1],
                  begin: Alignment.centerRight,
                  end: Alignment.bottomLeft,
                ),
                opacity: 0.6,
              ),
              BgGradientTheme(
                position: ShapePosition.bottomRight,
                height: context.screenHeight * 0.2,
                width: context.screenWidth * 0.5,
                color: const Color(0xFFA912BF),
                opacity: 0.5,
              ),
              BgGradientTheme(
                position: ShapePosition.topLeft,
                height: context.screenHeight * 0.44,
                gradient: const LinearGradient(
                  colors: [Color(0xFF1B1C30), Color(0x88A912BF)],
                  stops: [0.5, 0.5],
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                ),
                opacity: 0.6,
              ),
              BgGradientTheme(
                position: ShapePosition.bottomRight,
                width: context.screenWidth * 0.25,
                height: context.screenHeight * 0.2,
                color: Colors.black,
                opacity: 0.8,
              ),
              BgGradientTheme(
                position: ShapePosition.topLeft,
                width: context.screenWidth * 0.2,
                height: context.screenHeight * 0.25,
                color: Colors.black,
                opacity: 0.3,
              ),
              BgGradientTheme(
                position: ShapePosition.topRight,
                width: context.screenWidth * 0.15,
                height: context.screenHeight * 0.25,
                color: Colors.black,
                opacity: 0.3,
              ),
              BgGradientTheme(
                position: ShapePosition.bottomLeft,
                width: context.screenWidth * 0.25,
                height: context.screenHeight * 0.3,
                color: Colors.black,
                opacity: 0.4,
              ),
              BgGradientTheme(
                position: ShapePosition.bottomRight,
                width: context.screenWidth * 0.15,
                height: context.screenHeight * 0.15,
                color: Colors.black,
                opacity: 0.4,
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 85, sigmaY: 85),
                child: Container(color: Colors.transparent),
              ),
              //      createMainMenuBackground(context), // Add this line

              SafeArea(
                bottom: false,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 24.0,
                    right: 24.0,
                    bottom: bottomPadding,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(flex: 3),

                      // Welcome to Text
                      Text(
                        L10n.of(context).welcomeTo,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: const Color(0xFFD2D4E5),
                            // Responsive Font Size (approx 8.5% of width for mobile consistency)
                            // capped for tablets so it doesn't get too huge
                            fontSize:
                                isLargeDevice ? 40 : context.percentWidth * 8.5,
                            fontWeight: FontWeight.w400),
                      ),

                      const SizedBox(height: 20),

                      // Logo and Text Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Logo
                          SvgPicture.asset(
                            ImageAssets.beMindPowerLogo,
                            // Responsive Logo Size
                            width:
                                isLargeDevice ? 350 : context.percentWidth * 76,
                            // Aspect ratio will be maintained by SVG
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),

                      // Description Text
                      Text(
                        L10n.of(context).enjoyFullExperience,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFFD2D4E5),
                          // Responsive Font Size (approx 3.2% of width)
                          fontSize:
                              isLargeDevice ? 16 : context.percentWidth * 3.2,
                          fontFamily: 'Neometric',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Spacer(flex: 2),
                      SizedBox(
                        width: context.percentWidth * 55,
                        child: const CountryDropdown(),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: context.percentWidth * 55,
                        height: context.percentHeight * 8,
                        child: CustomButton(
                          text: L10n.of(context).login,
                          onPressed: () {
                            // context.push('/login');
                            context.push('/enter_phone?isLogin=true');
                          },
                        ),
                      ),

                      SizedBox(
                        height: context.percentWidth * 5,
                      ),

                      // Register Button - Darker Style
                      Container(
                        width: context.percentWidth * 55,
                        height: context.percentHeight * 8,
                        //height:  context.percentHeight * 8,
                        decoration: ShapeDecoration(
                          color: const Color.fromRGBO(5, 9, 38, 0.50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () async {
                              final client = await Matrix.of(context).getLoginClient();
                              if (context.mounted) {
                                context.push('/home/signup', extra: client);
                              }
                            },
                            borderRadius: BorderRadius.circular(24),
                            child: Center(
                              child: Text(
                                L10n.of(context).register,
                                style: TextStyle(
                                  color: Colors.white,
                                  // Responsive Font Size for button (4.8%)
                                  fontSize: context.screenWidth * 0.038,
                                  fontFamily: 'Work Sans',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const Spacer(flex: 3),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
