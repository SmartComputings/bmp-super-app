import 'dart:ui';

import 'package:bmp/core/config/setting_keys.dart';
import 'package:bmp/features/auth_onboarding/widgets/bg_gradient_theme.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/constants/position_constants.dart';

import 'package:bmp/shared/widgets/lock_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:matrix/matrix.dart';
import 'package:provider/provider.dart';

class AppLockWidget extends StatefulWidget {
  const AppLockWidget({
    required this.child,
    required this.pincode,
    required this.clients,
    super.key,
  });

  final List<Client> clients;
  final String? pincode;
  final Widget child;

  @override
  State<AppLockWidget> createState() => AppLock();
}

class AppLock extends State<AppLockWidget> with WidgetsBindingObserver {
  String? _pincode;
  bool _isLocked = false;
  bool _paused = false;
  bool get isActive =>
      _pincode != null &&
      int.tryParse(_pincode!) != null &&
      _pincode!.length == 4 &&
      !_paused;

  @override
  void initState() {
    super.initState();
    _pincode = widget.pincode;
    _isLocked = isActive;
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback(_checkLoggedIn);
  }

  void _checkLoggedIn(_) async {
    try {
      if (widget.clients.any((client) => client.isLogged())) return;
      
      await changePincode(null);
      if (mounted) {
        setState(() {
          _isLocked = false;
        });
      }
    } catch (e) {
      // Handle error silently for security
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (isActive &&
        state == AppLifecycleState.hidden &&
        !_isLocked) {
      showLockScreen();
    }
  }

  bool get isLocked => _isLocked;

  Future<void> changePincode(String? pincode) async {
    await const FlutterSecureStorage().write(
      key: SettingKeys.appLockKey,
      value: pincode,
    );
    if (mounted) {
      setState(() {
        _pincode = pincode;
      });
    }
  }

  bool unlock(String pincode) {
    final isCorrect = pincode == _pincode;
    if (isCorrect && mounted) {
      setState(() {
        _isLocked = false;
      });
    }
    return isCorrect;
  }

  void showLockScreen() {
    if (mounted) {
      setState(() {
        _isLocked = true;
      });
    }
  }

  Future<T> pauseWhile<T>(Future<T> future) async {
    if (mounted) {
      setState(() {
        _paused = true;
      });
    }
    try {
      return await future;
    } finally {
      if (mounted) {
        setState(() {
          _paused = false;
        });
      }
    }
  }

  static AppLock of(BuildContext context) => Provider.of<AppLock>(
        context,
        listen: false,
      );

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Provider<AppLock>(
        create: (_) => this,
        child: Stack(
          fit: StackFit.expand,
          children: [
            widget.child,
            if (isLocked) _buildLockScreenWithTheme(),
          ],
        ),
      );

  Widget _buildLockScreenWithTheme() {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background base color
        Container(
          color: const Color.fromRGBO(71, 84, 255, 0.6),
        ),
        
        // Top gradient
        const BgGradientTheme(
          position: ShapePosition.topFull,
          height: 200,
          gradient: LinearGradient(
            colors: [Color(0xFF4754FF), Color(0xFFA912BF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        
        // Bottom gradient
        const BgGradientTheme(
          position: ShapePosition.bottomFull,
          height: 250,
          gradient: LinearGradient(
            colors: [Color(0xFFA912BF), Color(0xFF000000)],
            stops: [0.3, 1.0],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        
        // Center circle
        const BgGradientTheme(
          position: ShapePosition.center,
          width: 681,
          height: 681,
          color: Color(0xFF4754FF),
          opacity: 0.6,
        ),
        
        // Blur overlay
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 85, sigmaY: 85),
            child: Container(color: Colors.transparent),
          ),
        ),
        
        // Lock screen content
        const LockScreen(),
      ],
    );
  }
}
