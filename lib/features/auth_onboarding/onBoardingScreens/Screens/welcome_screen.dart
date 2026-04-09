import '../Utils/responsive_utils.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/localization/l10n.dart';
import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import '../components/welcome_layout.dart';



class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _textAnimationController;
  late AnimationController _characterAnimationController;
  late AnimationController _buttonAnimationController;

  late Animation<double> _textFadeAnimation;
  late Animation<Offset> _textSlideAnimation;
  late Animation<double> _textScaleAnimation;

  late Animation<double> _characterFadeAnimation;
  late Animation<Offset> _characterSlideAnimation;
  late Animation<double> _characterScaleAnimation;

  late Animation<double> _buttonFadeAnimation;
  late Animation<Offset> _buttonSlideAnimation;
  late Animation<double> _buttonScaleAnimation;

  @override
  void initState() {
    super.initState();
    _printDeviceId();

    // Initialize text animation controller
    _textAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    // Initialize character animation controller
    _characterAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: this,
    );

    // Initialize button animation controller
    _buttonAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    // Text animations
    _textFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _textAnimationController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeInOut),
    ),);

    _textSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _textAnimationController,
      curve: const Interval(0.1, 0.7, curve: Curves.easeOutBack),
    ),);

    _textScaleAnimation = Tween<double>(
      begin: 0.9,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _textAnimationController,
      curve: const Interval(0.2, 0.8, curve: Curves.elasticOut),
    ),);

    // Character animations
    _characterFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _characterAnimationController,
      curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
    ),);

    _characterSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.4),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _characterAnimationController,
      curve: const Interval(0.1, 0.8, curve: Curves.easeOutBack),
    ),);

    _characterScaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _characterAnimationController,
      curve: const Interval(0.2, 0.9, curve: Curves.elasticOut),
    ),);

    // Button animations
    _buttonFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _buttonAnimationController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeInOut),
    ),);

    _buttonSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _buttonAnimationController,
      curve: const Interval(0.1, 0.7, curve: Curves.easeOutBack),
    ),);

    _buttonScaleAnimation = Tween<double>(
      begin: 0.9,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _buttonAnimationController,
      curve: const Interval(0.2, 0.8, curve: Curves.elasticOut),
    ),);

    // Start animations with delays
    _textAnimationController.forward();

    Future.delayed(const Duration(milliseconds: 400), () {
      if (mounted) {
        _characterAnimationController.forward();
      }
    });

    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) {
        _buttonAnimationController.forward();
      }
    });
  }

  Future<void> _printDeviceId() async {
    try {
      final deviceInfo = DeviceInfoPlugin();
      var deviceId = '';
      
      if (Theme.of(context).platform == TargetPlatform.android) {
        final androidInfo = await deviceInfo.androidInfo;
        deviceId = androidInfo.id;
      } else if (Theme.of(context).platform == TargetPlatform.iOS) {
        final iosInfo = await deviceInfo.iosInfo;
        deviceId = iosInfo.identifierForVendor ?? 'Unknown';
      }
      
      print('Device ID: $deviceId');
    } catch (e) {
      print('Error getting device ID: $e');
    }
  }

  @override
  void dispose() {
    _textAnimationController.dispose();
    _characterAnimationController.dispose();
    _buttonAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WelcomeLayout(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: ResponsiveUtils.padding(context, horizontal: 30),
                child: Stack(
                  children: [
                    Positioned(
                      left:0,
                      right: 0,
                      top: 40,
                      child: Image.asset(
                        ImageAssets.ballImage,
                        height: (constraints.maxHeight * 0.55).clamp(300, 500),
                        width: constraints.maxWidth,
                        // fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      left: 80,
                      top: 35,
                      child: Image.asset(
                        ImageAssets.smallBallImage,
                        height: (constraints.maxHeight * 0.55).clamp(300, 500),
                        width: constraints.maxWidth,
                        // fit: BoxFit.cover,
                      ),
                    ),
                    // Positioned(
                    //   left: 80,
                    //   top: 100,
                    //   child: Image.asset(
                    //     ImageAssets.msgIcon,
                    //     height: (constraints.maxHeight * 0.55).clamp(300, 500),
                    //     width: constraints.maxWidth,
                    //     // fit: BoxFit.cover,
                    //   ),
                    // ),


                    Container(
                      margin: EdgeInsets.only(top:30.h(context) ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Animated Text Section

                          AnimatedBuilder(
                            animation: _textAnimationController,
                            builder: (context, child) {
                              return Transform.scale(
                                scale: _textScaleAnimation.value,
                                child: Transform.translate(
                                  offset: Offset(
                                    _textSlideAnimation.value.dx * constraints.maxWidth,
                                    _textSlideAnimation.value.dy * constraints.maxHeight,
                                  ),
                                  child: FadeTransition(
                                    opacity: _textFadeAnimation,
                                    child: Column(
                                      children: [
                                        Text(
                                          L10n.of(context).welcomeToBeMindPower+"sss",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.inter(
                                            color: Colors.white,
                                            fontSize: 25.sp(context).clamp(28, 42),
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        SizedBox(height: 8.h(context)),
                                        Text(
                                          L10n.of(context).welcomeSubtitle,
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.plusJakartaSans(
                                            color: Colors.white,
                                            fontSize: 14.sp(context).clamp(12, 16),
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        SizedBox(height: 20.h(context)),
                                       Text(
                                      L10n.of(context).welcomeDescription,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.plusJakartaSans(
                    color: Colors.white,
                    fontSize: 12.sp(context).clamp(12, 16),
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                                      ),
                                    ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 100.h(context)),
                          // Animated Character Section
                          AnimatedBuilder(
                            animation: _characterAnimationController,
                            builder: (context, child) {
                              return Transform.scale(
                                scale: _characterScaleAnimation.value,
                                child: Transform.translate(
                                  offset: Offset(
                                    _characterSlideAnimation.value.dx * constraints.maxWidth,
                                    _characterSlideAnimation.value.dy * constraints.maxHeight,
                                  ),
                                  child: FadeTransition(
                                    opacity: _characterFadeAnimation,
                                    child: Container(
                                      constraints: BoxConstraints(
                                        maxWidth: constraints.maxWidth * 0.8,
                                        maxHeight: constraints.maxHeight * 0.35,
                                      ),
                                      child: Image.asset(
                                        ImageAssets.welcomeChar1,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 10.h(context)),
                          // Animated Button Section
                          AnimatedBuilder(
                            animation: _buttonAnimationController,
                            builder: (context, child) {
                              return Transform.scale(
                                scale: _buttonScaleAnimation.value,
                                child: Transform.translate(
                                  offset: Offset(
                                    _buttonSlideAnimation.value.dx * constraints.maxWidth,
                                    _buttonSlideAnimation.value.dy * constraints.maxHeight,
                                  ),
                                  child: FadeTransition(
                                    opacity: _buttonFadeAnimation,
                                    child: SizedBox(
                                      width: 200.w(context).clamp(180, 250),
                                      height: 55.h(context).clamp(50, 70),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          context.go('/home');
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(0xFF4754FF),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(24.w(context)),
                                          ),
                                          elevation: 0,
                                        ),
                                        child: Text(
                                          L10n.of(context).getStarted,
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 16.sp(context).clamp(14, 18),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 16.h(context)),
                          // Skip/Explore Button
                          AnimatedBuilder(
                            animation: _buttonAnimationController,
                            builder: (context, child) {
                              return Transform.scale(
                                scale: _buttonScaleAnimation.value,
                                child: Transform.translate(
                                  offset: Offset(
                                    _buttonSlideAnimation.value.dx * constraints.maxWidth,
                                    _buttonSlideAnimation.value.dy * constraints.maxHeight,
                                  ),
                                  child: FadeTransition(
                                    opacity: _buttonFadeAnimation,
                                    child: TextButton(
                                      onPressed: () {
                                        context.go('/onboarding');
                                      },
                                      child: Text(
                                        L10n.of(context).exploreFeatures,
                                        style: GoogleFonts.poppins(
                                          color: Colors.white70,
                                          fontSize: 14.sp(context).clamp(12, 16),
                                          fontWeight: FontWeight.w400,
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colors.white70,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 20.h(context) + MediaQuery.of(context).viewPadding.bottom),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CircleIcon extends StatelessWidget {
  final String icon;
  final bool selected;
  final Color? color;
  const _CircleIcon({required this.icon, this.selected = false, this.color});

  @override
  Widget build(BuildContext context) {
    Widget iconWidget;
    if (icon.toLowerCase().endsWith('.svg')) {
      iconWidget = SvgPicture.asset(
        icon,
        height: 22,
        width: 22,
        fit: BoxFit.contain,
      );
    } else {
      iconWidget = Image.asset(
        icon,
        height: 22,
        width: 22,
        fit: BoxFit.contain,
      );
    }
    return Container(
      width: 44,
      height: 44,
      alignment: Alignment.center,
      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: iconWidget,
    );
  }
}
