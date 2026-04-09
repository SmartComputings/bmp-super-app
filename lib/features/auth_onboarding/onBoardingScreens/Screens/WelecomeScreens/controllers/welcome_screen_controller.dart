import 'package:flutter/material.dart';

class WelcomeScreenController {
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

  // Getters for animations
  Animation<double> get textFadeAnimation => _textFadeAnimation;
  Animation<Offset> get textSlideAnimation => _textSlideAnimation;
  Animation<double> get textScaleAnimation => _textScaleAnimation;
  
  Animation<double> get characterFadeAnimation => _characterFadeAnimation;
  Animation<Offset> get characterSlideAnimation => _characterSlideAnimation;
  Animation<double> get characterScaleAnimation => _characterScaleAnimation;
  
  Animation<double> get buttonFadeAnimation => _buttonFadeAnimation;
  Animation<Offset> get buttonSlideAnimation => _buttonSlideAnimation;
  Animation<double> get buttonScaleAnimation => _buttonScaleAnimation;

  AnimationController get textAnimationController => _textAnimationController;
  AnimationController get characterAnimationController => _characterAnimationController;
  AnimationController get buttonAnimationController => _buttonAnimationController;

  void initializeAnimations(TickerProvider vsync) {
    _textAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: vsync,
    );

    _characterAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: vsync,
    );

    _buttonAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: vsync,
    );

    _textFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _textAnimationController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeInOut),
    ));

    _textSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _textAnimationController,
      curve: const Interval(0.1, 0.7, curve: Curves.easeOutBack),
    ));

    _textScaleAnimation = Tween<double>(
      begin: 0.9,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _textAnimationController,
      curve: const Interval(0.2, 0.8, curve: Curves.elasticOut),
    ));

    _characterFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _characterAnimationController,
      curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
    ));

    _characterSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.4),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _characterAnimationController,
      curve: const Interval(0.1, 0.8, curve: Curves.easeOutBack),
    ));

    _characterScaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _characterAnimationController,
      curve: const Interval(0.2, 0.9, curve: Curves.elasticOut),
    ));

    _buttonFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _buttonAnimationController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeInOut),
    ));

    _buttonSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _buttonAnimationController,
      curve: const Interval(0.1, 0.7, curve: Curves.easeOutBack),
    ));

    _buttonScaleAnimation = Tween<double>(
      begin: 0.9,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _buttonAnimationController,
      curve: const Interval(0.2, 0.8, curve: Curves.elasticOut),
    ));
  }

  void startAnimations() {
    _textAnimationController.forward();

    Future.delayed(const Duration(milliseconds: 400), () {
      _characterAnimationController.forward();
    });

    Future.delayed(const Duration(milliseconds: 800), () {
      _buttonAnimationController.forward();
    });
  }

  void dispose() {
    _textAnimationController.dispose();
    _characterAnimationController.dispose();
    _buttonAnimationController.dispose();
  }
}