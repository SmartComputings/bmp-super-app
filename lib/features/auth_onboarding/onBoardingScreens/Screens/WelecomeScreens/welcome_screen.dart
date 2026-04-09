import 'package:flutter/material.dart';

import 'controllers/welcome_screen_controller.dart';
import 'Widget/welcome_screen_widget.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late WelcomeScreenController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WelcomeScreenController();
    _controller.initializeAnimations(this);
    _controller.startAnimations();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WelcomeScreenWidget(controller: _controller);
  }
}
