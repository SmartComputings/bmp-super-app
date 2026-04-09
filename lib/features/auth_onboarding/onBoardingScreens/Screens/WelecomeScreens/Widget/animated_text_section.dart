import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/localization/l10n.dart';
import '../../../Utils/responsive_utils.dart';
import '../controllers/welcome_screen_controller.dart';

class AnimatedTextSection extends StatelessWidget {
  final WelcomeScreenController controller;
  final BoxConstraints constraints;

  const AnimatedTextSection({
    super.key,
    required this.controller,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.textAnimationController,
      builder: (context, child) {
        return Transform.scale(
          scale: controller.textScaleAnimation.value,
          child: Transform.translate(
            offset: Offset(
              controller.textSlideAnimation.value.dx * constraints.maxWidth,
              controller.textSlideAnimation.value.dy * constraints.maxHeight,
            ),
            child: FadeTransition(
              opacity: controller.textFadeAnimation,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      L10n.of(context).welcome,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 32.sp(context).clamp(28, 42),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 1.h(context)),
                    Text(
                      L10n.of(context).welcomeSubtitle,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.plusJakartaSans(
                        color: Colors.white,
                        fontSize: 14.sp(context).clamp(12, 16),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 14.h(context)),
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
          ),
        );
      },
    );
  }
}
