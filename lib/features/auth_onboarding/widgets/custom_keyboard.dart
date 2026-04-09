import 'dart:async';

import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:flutter/material.dart';

class CustomKeyboard extends StatefulWidget {
  final TextEditingController controller;
  final bool isPinKeyboard;
  final VoidCallback? onClose;
  final Color? buttonColor;
  final Color? textColor;
  final Function(String)? onNumberPressed;
  final VoidCallback? onBackspacePressed;
  final bool isDisabled;

  const CustomKeyboard({
    super.key,
    required this.controller,
    this.isPinKeyboard = false,
    this.onClose,
    this.buttonColor,
    this.textColor,
    this.onNumberPressed,
    this.onBackspacePressed,
    this.isDisabled = false,
  });

  @override
  State<CustomKeyboard> createState() => _CustomKeyboardState();
}

class _CustomKeyboardState extends State<CustomKeyboard> {
  Timer? _longPressTimer;
  bool _isLongPressing = false;

  void _onKeyPressed(String value) {
    if (widget.isDisabled) return;
    
    if (widget.onNumberPressed != null) {
      widget.onNumberPressed!(value);
    } else {
      setState(() {
        widget.controller.text += value;
      });
    }
  }

  void _onBackspacePressed() {
    if (widget.isDisabled) return;
    
    if (widget.onBackspacePressed != null) {
      widget.onBackspacePressed!();
    } else if (widget.controller.text.isNotEmpty) {
      setState(() {
        widget.controller.text = widget.controller.text
            .substring(0, widget.controller.text.length - 1);
      });
    }
  }

  void _onBackspaceLongPress() {
    setState(() {
      widget.controller.clear();
    });
  }

  void _startLongPress() {
    _isLongPressing = true;
    _longPressTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (_isLongPressing && widget.controller.text.isNotEmpty) {
        _onBackspacePressed();
      } else {
        _stopLongPress();
      }
    });
  }

  void _stopLongPress() {
    _isLongPressing = false;
    _longPressTimer?.cancel();
    _longPressTimer = null;
  }

  @override
  void dispose() {
    _stopLongPress();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      width: context.screenWidth*0.65,
     // padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(20),
      ),
      child: _buildPinKeyboardLayout(),
      //   : _buildStandardKeyboardLayout(),
    );
  }

  Widget _buildPinKeyboardLayout() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: context.screenHeight * 0.01),
       Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildGlassButton('1', onPressed: () => _onKeyPressed('1')),
            SizedBox(width: context.screenWidth * 0.02),
            _buildGlassButton('2', onPressed: () => _onKeyPressed('2')),
            SizedBox(width: context.screenWidth * 0.02),
            _buildGlassButton('3', onPressed: () => _onKeyPressed('3')),
          ],
        ),
        SizedBox(height: context.screenHeight * 0.016),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildGlassButton('4', onPressed: () => _onKeyPressed('4')),
            SizedBox(width: context.screenWidth * 0.02),
            _buildGlassButton('5', onPressed: () => _onKeyPressed('5')),
            SizedBox(width: context.screenWidth * 0.02),
            _buildGlassButton('6', onPressed: () => _onKeyPressed('6')),
          ],
        ),
    SizedBox(height: context.screenHeight * 0.016),
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildGlassButton('7', onPressed: () => _onKeyPressed('7')),
            SizedBox(width: context.screenWidth * 0.02),
            _buildGlassButton('8', onPressed: () => _onKeyPressed('8')),
            SizedBox(width: context.screenWidth * 0.02),
            _buildGlassButton('9', onPressed: () => _onKeyPressed('9')),
          ],
        ),
     SizedBox(height: context.screenHeight * 0.016),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             _buildGlassButton('', onPressed: (){}),
            // SizedBox(     width: context.screenWidth * 0.155,),
           SizedBox(width: context.screenWidth * 0.02),
            _buildGlassButton('0', onPressed: () => _onKeyPressed('0')),
           SizedBox(width: context.screenWidth * 0.02),
           _buildBackspaceButton(),
          ],
        ),
      ],
    );
  }


  Widget _buildGlassButton(String text, {VoidCallback? onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
       width: context.screenWidth * 0.155,
        height: context.screenHeight * 0.07,
        padding: EdgeInsets.all(context.screenWidth * 0.02),
        decoration: ShapeDecoration(
          color: widget.buttonColor ?? const Color(0x7F050926), // Glass effect
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(context.screenWidth * 0.025),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: widget.textColor ?? const Color(0xFFD2D4E5), // Text-Icon-Body
                fontSize: context.screenWidth * 0.04,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton({required IconData icon, VoidCallback? onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 57,
        height: 61,
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          color: const Color(0x7F050926), // Glass effect
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: const Color(0xFFD2D4E5), // Text-Icon-Body color
              size: 24,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackspaceButton() {
    return GestureDetector(
      onTap: _onBackspacePressed,
      onLongPressStart: (_) => _startLongPress(),
      onLongPressEnd: (_) => _stopLongPress(),
      child: Container(
           width: context.screenWidth * 0.155,
        height: context.screenHeight * 0.07,
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          color: const Color(0x7F050926), // Glass effect
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.backspace,
              color: Color(0xFFD2D4E5), // Text-Icon-Body color
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}