import 'dart:async';

import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/widgets/app_lock.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> with TickerProviderStateMixin {
  String? _errorText;
  int _coolDownSeconds = 5;
  bool _inputBlocked = false;
  bool _isProcessing = false;
  String _enteredPin = '';
  late AnimationController _shakeController;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();
    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _shakeAnimation = Tween(begin: 0.0, end: 10.0)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(_shakeController);
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  void _onNumberPressed(String number) {
    if (_inputBlocked || _isProcessing || _enteredPin.length >= 4) return;
    
    HapticFeedback.lightImpact();
    
    setState(() {
      _enteredPin += number;
      _errorText = null;
    });
    
    if (_enteredPin.length == 4) {
      setState(() {
        _isProcessing = true;
      });
      
      Future.delayed(const Duration(milliseconds: 300), () {
        _tryUnlock();
      });
    }
  }

  void _onBackspacePressed() {
    if (_inputBlocked || _isProcessing || _enteredPin.isEmpty) return;
    
    HapticFeedback.selectionClick();
    
    setState(() {
      _enteredPin = _enteredPin.substring(0, _enteredPin.length - 1);
    });
  }

  void _tryUnlock() async {
    if (AppLock.of(context).unlock(_enteredPin)) {
      HapticFeedback.mediumImpact();
      setState(() {
        _inputBlocked = false;
        _isProcessing = false;
        _errorText = null;
        _enteredPin = '';
      });
      return;
    }

    HapticFeedback.heavyImpact();
    _shakeController.forward().then((_) => _shakeController.reset());
    
    setState(() {
      _errorText = L10n.of(context).wrongPinEnteredWithCooldown(_coolDownSeconds);
      _inputBlocked = true;
      _isProcessing = false;
      _enteredPin = '';
    });
    
    Future.delayed(Duration(seconds: _coolDownSeconds)).then((_) {
      if (mounted) {
        setState(() {
          _inputBlocked = false;
          _coolDownSeconds = (_coolDownSeconds * 2).clamp(5, 30);
          _errorText = null;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: context.screenHeight - 100,
            ),
            child: Column(
              children: [
                SizedBox(height: context.percentHeight * 6),
                
                // Logo
                Container(
                  padding: EdgeInsets.all(context.percentWidth * 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/logo_main.png',
                    width: context.percentWidth * 18,
                    height: context.percentWidth * 18,
                  ),
                ),
                
                SizedBox(height: context.percentHeight * 3),
                
                // Title
                Text(
                  L10n.of(context).pleaseEnterYourPin,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: context.percentWidth * 5.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                
                SizedBox(height: context.percentHeight * 4),
                
                // PIN Dots
                AnimatedBuilder(
                  animation: _shakeAnimation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(_shakeAnimation.value, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(4, (index) {
                          final isFilled = index < _enteredPin.length;
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            margin: EdgeInsets.symmetric(horizontal: context.percentWidth * 2.5),
                            width: context.percentWidth * 4,
                            height: context.percentWidth * 4,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _isProcessing && isFilled
                                  ? Colors.amber
                                  : isFilled
                                      ? Colors.white
                                      : Colors.white.withOpacity(0.3),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.5),
                                width: 2,
                              ),
                            ),
                          );
                        }),
                      ),
                    );
                  },
                ),
                
                SizedBox(height: context.percentHeight * 2),
                
                // Error Text
                Container(
                  height: context.percentHeight * 4,
                  padding: EdgeInsets.symmetric(horizontal: context.percentWidth * 8),
                  child: _errorText != null
                      ? AnimatedOpacity(
                          opacity: 1.0,
                          duration: const Duration(milliseconds: 300),
                          child: Text(
                            _errorText!,
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: context.percentWidth * 3.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      : const SizedBox(),
                ),
                
                SizedBox(height: context.percentHeight * 3),
                
                // Number Pad
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.percentWidth * 8),
                  child: Column(
                    children: [
                      _buildNumberRow(['1', '2', '3']),
                      _buildNumberRow(['4', '5', '6']),
                      _buildNumberRow(['7', '8', '9']),
                      _buildNumberRow(['', '0', 'backspace']),
                    ],
                  ),
                ),
                
                SizedBox(height: context.percentHeight * 3),
                
                // Progress Indicator
                Container(
                  height: 4,
                  margin: EdgeInsets.symmetric(horizontal: context.percentWidth * 8),
                  child: _inputBlocked
                      ? LinearProgressIndicator(
                          backgroundColor: Colors.white.withOpacity(0.3),
                          valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : const SizedBox(),
                ),
                
                SizedBox(height: context.percentHeight * 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildNumberRow(List<String> numbers) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: numbers.map((number) {
          if (number.isEmpty) {
            return SizedBox(
              width: context.percentWidth * 15,
              height: context.percentWidth * 15,
            );
          }
          
          if (number == 'backspace') {
            return _buildNumberButton(
              child: Icon(
                Icons.backspace_outlined,
                color: Colors.white,
                size: context.percentWidth * 5,
              ),
              onPressed: _onBackspacePressed,
            );
          }
          
          return _buildNumberButton(
            child: Text(
              number,
              style: TextStyle(
                color: Colors.white,
                fontSize: context.percentWidth * 5,
                fontWeight: FontWeight.w500,
              ),
            ),
            onPressed: () => _onNumberPressed(number),
          );
        }).toList(),
      ),
    );
  }
  
  Widget _buildNumberButton({
    required Widget child,
    required VoidCallback onPressed,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (_inputBlocked || _isProcessing) ? null : onPressed,
        borderRadius: BorderRadius.circular(35),
        child: Container(
          width: context.percentWidth * 15,
          height: context.percentWidth * 15,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.1),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Center(child: child),
        ),
      ),
    );
  }
}
