import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/localization/l10n.dart';
import '../../../Utils/responsive_utils.dart';
import '../controllers/welcome_screen_controller.dart';

class AnimatedExploreButton extends StatelessWidget {
  final WelcomeScreenController controller;
  final BoxConstraints constraints;

  const AnimatedExploreButton({
    super.key,
    required this.controller,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.buttonAnimationController,
      builder: (context, child) {
        return Transform.scale(
          scale: controller.buttonScaleAnimation.value,
          child: Transform.translate(
            offset: Offset(
              controller.buttonSlideAnimation.value.dx * constraints.maxWidth,
              controller.buttonSlideAnimation.value.dy * constraints.maxHeight,
            ),
            child: FadeTransition(
              opacity: controller.buttonFadeAnimation,
              child: TextButton(
                onPressed: () => context.go('/mainMenuScreen'),
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
    );
  }
}