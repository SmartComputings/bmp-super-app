import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:flutter/material.dart';

import '../controllers/welcome_screen_controller.dart';

class AnimatedCharacterSection extends StatelessWidget {
  final WelcomeScreenController controller;
  final BoxConstraints constraints;

  const AnimatedCharacterSection({
    super.key,
    required this.controller,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.characterAnimationController,
      builder: (context, child) {
        return Transform.scale(
          scale: controller.characterScaleAnimation.value,
          child: Transform.translate(
            offset: Offset(
              controller.characterSlideAnimation.value.dx * constraints.maxWidth,
              controller.characterSlideAnimation.value.dy * constraints.maxHeight,
            ),
            child: FadeTransition(
              opacity: controller.characterFadeAnimation,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: constraints.maxWidth * 1,
                  maxHeight: constraints.maxHeight * 0.5,
                ),
                child: Image.asset(
                  ImageAssets.welcomeChar1,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}