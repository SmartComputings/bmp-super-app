import 'dart:async';
import 'dart:ui';
import 'package:bmp/shared/widgets/Backgroundgradient/constants/position_constants.dart';
import 'package:flutter/material.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/bg_gradient_theme.dart';
import 'package:go_router/go_router.dart';
import '../../../core/localization/l10n.dart';
import 'group_done_screen.dart';

class ProcessGroupScreen extends StatefulWidget {
  final String groupName;
  final String roomId;

  const ProcessGroupScreen({
    super.key,
    required this.groupName,
    required this.roomId,
  });

  @override
  State<ProcessGroupScreen> createState() => _ProcessGroupScreenState();
}

class _ProcessGroupScreenState extends State<ProcessGroupScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => GroupDoneScreen(
              groupName: widget.groupName,
              roomId: widget.roomId,
            ),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

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
                    'assets/images/chat_details/processContact_image.png',
                    width: 152,
                    height: 228,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 11),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      L10n.of(context).creatingGroup,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 11),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      L10n.of(context).settingUpYourGroup(widget.groupName),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: GestureDetector(
                      onTap: () {
                        _timer?.cancel();
                        context.go('/mainMenuScreen/rooms');
                      },
                      child: Container(
                        width: 200,
                        height: 60,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 1,
                              color: Color(0xFFF2FBF9),
                            ),
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            L10n.of(context).cancel,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
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
