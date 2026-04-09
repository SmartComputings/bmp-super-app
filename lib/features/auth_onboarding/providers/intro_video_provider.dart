import 'dart:async';
import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class IntroVideoProvider extends ChangeNotifier {
  // Video state
  VideoPlayerController? _videoController;
  bool _videoInitialized = false;
  bool _showFallbackUI = false;

  // Animation controllers
  AnimationController? _logoAnimationController;
  AnimationController? _characterAnimationController;

  // Animations
  Animation<double>? _logoFadeAnimation;
  Animation<double>? _logoScaleAnimation;
  Animation<double>? _logoRotationAnimation;
  Animation<double>? _characterFadeAnimation;
  Animation<Offset>? _characterSlideAnimation;
  Animation<double>? _characterScaleAnimation;

  // Callback for video completion
  VoidCallback? _onVideoComplete;
  
  // Timers
  Timer? _fallbackTimer;
  Timer? _timeoutTimer;
  Timer? _animationDelayTimer;

  // Getters
  VideoPlayerController? get videoController => _videoController;
  bool get videoInitialized => _videoInitialized;
  bool get showFallbackUI => _showFallbackUI;
  Animation<double>? get logoFadeAnimation => _logoFadeAnimation;
  Animation<double>? get logoScaleAnimation => _logoScaleAnimation;
  Animation<double>? get logoRotationAnimation => _logoRotationAnimation;
  Animation<double>? get characterFadeAnimation => _characterFadeAnimation;
  Animation<Offset>? get characterSlideAnimation => _characterSlideAnimation;
  Animation<double>? get characterScaleAnimation => _characterScaleAnimation;

  void initializeVideo(VoidCallback? onError) {
    _videoController =
        VideoPlayerController.asset(ImageAssets.splashVideo)
          ..setLooping(false)
          ..initialize().then((_) {
            _videoInitialized = true;
            notifyListeners();
            _videoController!.play();
            _setupVideoListener();
          }).catchError((error) {
            debugPrint('Video initialization failed: $error');
            if (onError != null) onError();
          });
  }

  void _setupVideoListener() {
    _videoController?.addListener(() {
      if (_videoController!.value.isInitialized &&
          !_videoController!.value.isPlaying &&
          _videoController!.value.position >=
              _videoController!.value.duration) {
        _onVideoComplete?.call();
      }
    });
  }

  bool _isDisposed = false;

  void showFallbackUIFunc() {
    if (_isDisposed) return;
    if (!_videoInitialized) {
      _showFallbackUI = true;
      notifyListeners();
    }
  }

  void setVideoCompleteCallback(VoidCallback callback) {
    _onVideoComplete = callback;
  }

  void startFallbackTimer(VoidCallback onTimeout) {
    _fallbackTimer?.cancel();
    _timeoutTimer?.cancel();
    
    _fallbackTimer = Timer(const Duration(seconds: 2), () {
      if (_isDisposed) return;
      if (!_videoInitialized) {
        showFallbackUIFunc();
      }
    });

    _timeoutTimer = Timer(const Duration(seconds: 3), () {
      if (_isDisposed) return;
      if (!_videoInitialized) {
        onTimeout();
      }
    });
  }

  void initializeAnimations(TickerProvider vsync) {
    if (_isDisposed) return;
    
    // Logo animation controller
    _logoAnimationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: vsync,
    );

    _logoFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoAnimationController!,
        curve: const Interval(0.0, 0.6, curve: Curves.easeInOut),
      ),
    );

    _logoScaleAnimation = Tween<double>(begin: 0.3, end: 1.1).animate(
      CurvedAnimation(
        parent: _logoAnimationController!,
        curve: const Interval(0.2, 0.8, curve: Curves.elasticOut),
      ),
    );

    _logoRotationAnimation = Tween<double>(begin: -0.1, end: 0.0).animate(
      CurvedAnimation(
        parent: _logoAnimationController!,
        curve: const Interval(0.0, 0.7, curve: Curves.easeOutBack),
      ),
    );

    // Character animation controller
    _characterAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: vsync,
    );

    _characterFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _characterAnimationController!,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );

    _characterSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _characterAnimationController!,
        curve: const Interval(0.1, 0.8, curve: Curves.easeOutBack),
      ),
    );

    _characterScaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _characterAnimationController!,
        curve: const Interval(0.2, 0.9, curve: Curves.elasticOut),
      ),
    );

    // Start animations
    if (!_isDisposed) {
      _logoAnimationController!.forward();
      _animationDelayTimer?.cancel();
      _animationDelayTimer = Timer(const Duration(milliseconds: 600), () {
        if (!_isDisposed && _characterAnimationController != null) {
          _characterAnimationController!.forward();
        }
      });
    }
  }

  void pauseVideo() {
    if (_videoController?.value.isInitialized == true) {
      _videoController!.pause();
    }
  }

  void resumeVideo() {
    if (_videoController?.value.isInitialized == true) {
      _videoController!.play();
    }
  }

  void reset() {
    _videoInitialized = false;
    _showFallbackUI = false;
    _onVideoComplete = null;
    notifyListeners();
  }

  @override
  void dispose() {
    _isDisposed = true;
    _fallbackTimer?.cancel();
    _timeoutTimer?.cancel();
    _animationDelayTimer?.cancel();
    _videoController?.removeListener(() {});
    _videoController?.dispose();
    _logoAnimationController?.stop();
    _logoAnimationController?.dispose();
    _characterAnimationController?.stop();
    _characterAnimationController?.dispose();
    super.dispose();
  }
}
