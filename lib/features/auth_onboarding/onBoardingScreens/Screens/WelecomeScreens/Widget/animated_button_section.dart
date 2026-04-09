import 'package:bmp/shared/widgets/bmp_chat_app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/localization/l10n.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import '../../../Utils/responsive_utils.dart';
import '../controllers/welcome_screen_controller.dart';

class AnimatedButtonSection extends StatelessWidget {
  final WelcomeScreenController controller;
  final BoxConstraints constraints;

  const AnimatedButtonSection({
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
              child: SizedBox(
                width: 200.w(context).clamp(180, 250),
                height: 55.h(context).clamp(50, 70),
                child: ElevatedButton(
                  onPressed: () {
                    try {
                      final isLoggedIn = Matrix.of(context)
                          .widget
                          .clients
                          .any((client) => client.isLogged());

                      if (isLoggedIn) {
                        if (context.mounted) {
                          // context.go('/home');
                          BmpChatApp.router.go('/mainMenuScreen');
                        }
                      } else {
                        context.go('/login');
                      }
                    } catch (e) {
                      context.go('/login');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3976F8),
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
    );
  }
}
