import 'package:bmp/core/constant/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/responsive_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:bmp/shared/widgets/matrix.dart';
import 'package:bmp/shared/utils/image/assets/image_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoAnimationController;
  late Animation<double> _logoFadeAnimation;
  late Animation<double> _logoScaleAnimation;
  late Animation<double> _logoRotationAnimation;

  late AnimationController _characterAnimationController;
  late Animation<double> _characterFadeAnimation;
  late Animation<Offset> _characterSlideAnimation;
  late Animation<double> _characterScaleAnimation;

  late AnimationController _loaderAnimationController;

  @override
  void initState() {
    super.initState();

    // Initialize loader animation controller
    _loaderAnimationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Initialize logo animation controller
    _logoAnimationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    // Create logo fade animation with delay
    _logoFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _logoAnimationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeInOut),
      ),
    );

    // Create logo scale animation with bounce
    _logoScaleAnimation = Tween<double>(
      begin: 0.3,
      end: 1.1,
    ).animate(
      CurvedAnimation(
        parent: _logoAnimationController,
        curve: const Interval(0.2, 0.8, curve: Curves.elasticOut),
      ),
    );

    // Create logo rotation animation
    _logoRotationAnimation = Tween<double>(
      begin: -0.1,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _logoAnimationController,
        curve: const Interval(0.0, 0.7, curve: Curves.easeOutBack),
      ),
    );

    // Initialize character animation controller
    _characterAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: this,
    );

    // Create character fade animation
    _characterFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _characterAnimationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );

    // Create character slide animation with bounce
    _characterSlideAnimation = Tween<Offset>(
      begin: const Offset(0, -1.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _characterAnimationController,
        curve: const Interval(0.1, 0.8, curve: Curves.easeOutBack),
      ),
    );

    // Create character scale animation
    _characterScaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _characterAnimationController,
        curve: const Interval(0.2, 0.9, curve: Curves.elasticOut),
      ),
    );

    // Start the logo and loader animations
    _logoAnimationController.forward();
    _loaderAnimationController.forward();

    // Start character animation after a delay
    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) {
        _characterAnimationController.forward();
      }
    });

    // Auto navigate after animation
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        _checkLoginAndNavigate();
      }
    });
    // _checkSession();
  }

  @override
  void dispose() {
    _logoAnimationController.dispose();
    _characterAnimationController.dispose();
    _loaderAnimationController.dispose();
    super.dispose();
  }

  void _checkLoginAndNavigate() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('matrix_access_token');
    final userId = prefs.getString('matrix_id');
    
    if (accessToken != null && userId != null) {
      context.go('/onboarding');
    } else {
      try {
        final matrix = Matrix.of(context);
        final isLoggedIn = matrix.widget.clients.any((client) => client.isLogged());
        context.go(isLoggedIn ? '/onboarding' : '/welcome');
      } catch (e) {
        context.go('/welcome');
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    // Set status bar to light
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  // Centered logo near the top
                  Positioned(
                    top: constraints.maxHeight * 0.27,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        AnimatedBuilder(
                          animation: _logoAnimationController,
                          builder: (context, child) {
                            return Transform.rotate(
                              angle: _logoRotationAnimation.value,
                              child: Transform.scale(
                                scale: _logoScaleAnimation.value,
                                child: FadeTransition(
                                  opacity: _logoFadeAnimation,
                                  child: SvgPicture.asset(
                                    ImageAssets.beMindPowerLogo,
                                    width: 240.w(context),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  // Loader bar animation (below logo)
                  Positioned(
                    top: constraints.maxHeight * 0.42,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        width: 240,
                        height: 8,
                        decoration: BoxDecoration(
                          color: const Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(5.5),
                        ),
                        child: AnimatedBuilder(
                          animation: _loaderAnimationController,
                          builder: (context, child) {
                            return FractionallySizedBox(
                              alignment: Alignment.centerLeft,
                              widthFactor: _loaderAnimationController.value,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFF3976F8),
                                  borderRadius: BorderRadius.circular(5.5),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                  // 3D character at the bottom center
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image.asset(
                          ImageAssets.splashBg,
                          height: (constraints.maxHeight * 0.6).clamp(300, 500),
                          width: constraints.maxWidth,
                          fit: BoxFit.cover,
                        ),
                        // Character image
                        AnimatedBuilder(
                          animation: _characterAnimationController,
                          builder: (context, child) {
                            return Transform.scale(
                              scale: _characterScaleAnimation.value,
                              child: Transform.translate(
                                offset: Offset(
                                  _characterSlideAnimation.value.dx *
                                      constraints.maxWidth,
                                  _characterSlideAnimation.value.dy *
                                      constraints.maxHeight,
                                ),
                                child: FadeTransition(
                                  opacity: _characterFadeAnimation,
                                  child: Image.asset(
                                    ImageAssets.splashBottomPic,
                                    height: (constraints.maxHeight * 0.55)
                                        .clamp(300, 500),
                                    width: constraints.maxWidth,
                                    // fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
