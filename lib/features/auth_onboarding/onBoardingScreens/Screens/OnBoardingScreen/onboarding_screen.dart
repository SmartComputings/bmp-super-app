import 'package:bmp/shared/widgets/app_exit_dialogue.dart';
import 'package:flutter/material.dart';
import 'controllers/onboarding_controller.dart';
import 'widgets/onboarding_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  final int initialPage;

  const OnBoardingScreen({super.key, this.initialPage = 0});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> with TickerProviderStateMixin {
  late OnboardingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = OnboardingController();
    _controller.initialize(widget.initialPage, this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        
        await AppExitDialogue.show(context);
      },
      child: OnboardingWidget(
        controller: _controller,
        onStateChanged: () => setState(() {}),
      ),
    );
  }

}
