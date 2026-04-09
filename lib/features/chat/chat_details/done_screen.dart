
import 'dart:ui';

import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/auth_onboarding/widgets/bg_gradient_theme.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/constants/position_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Screen shown after members are successfully added to the group
class AddMembersDoneScreen extends StatelessWidget {
  final String groupName;
  final String roomId;
  final int addedCount;

  const AddMembersDoneScreen({
    required this.groupName,
    required this.roomId,
    required this.addedCount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(color: const Color(0xFF1B1C30)),
          ),
          const BgGradientTheme(
            position: ShapePosition.center,
            width: 681,
            height: 681,
            color: Color(0xFF4754FF),
            opacity: 0.6,
          ),
          const BgGradientTheme(
            position: ShapePosition.bottomFull,
            height: 300,
            colors: [Color(0xFF1B1C30), Color(0xFFA912BF)],
            opacity: 0.8,
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 85, sigmaY: 85),
              child: Container(color: Colors.transparent),
            ),
          ),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Image.asset(
                    'assets/images/chat_details/done_screenimage.png',
                    width: 250,
                    height: 250,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Members Added!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 5.5),
                  Text(
                    '$addedCount contact${addedCount > 1 ? 's' : ''} added to $groupName',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        context.go('/mainMenuScreen/rooms/$roomId');
                      },
                      child: Container(
                        width: 200,
                        height: 60,
                        decoration: const BoxDecoration(
                          color: Color(0xFF3976F8),
                          borderRadius: BorderRadius.all(
                            Radius.circular(24),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            L10n.of(context).goToGroup,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
