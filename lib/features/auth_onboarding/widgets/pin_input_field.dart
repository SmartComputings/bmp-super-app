import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PinInputField extends StatefulWidget {
  final TextEditingController controller;
  final int pinLength;
  final double width;
  final bool autoFocus;
  final VoidCallback? onPinComplete;
  final Color? dotColor;
  final Color? textColor;
  final double? fontSize;
  final FocusNode? focusNode;

  const PinInputField({
    super.key,
    required this.controller,
    this.pinLength = 4,
    this.width = 230,
    this.autoFocus = false,
    this.onPinComplete,
    this.dotColor,
    this.textColor,
    this.fontSize = 20,
    this.focusNode,
  });

  @override
  State<PinInputField> createState() => _PinInputFieldState();
}

class _PinInputFieldState extends State<PinInputField> {
  bool _isObscured = true;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    widget.controller.addListener(_onTextChanged);

    if (widget.autoFocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNode.requestFocus();
      });
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {});

    if (widget.controller.text.length == widget.pinLength) {
      widget.onPinComplete?.call();
    }
  }

  void _toggleObscure() => setState(() => _isObscured = !_isObscured);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * 0.03,
      width: context.screenWidth*0.6,
      child: Stack(
        children: [
          // Hidden TextField for controller
          Opacity(
            opacity: 0,
            child: Overlay(
              initialEntries: [
                OverlayEntry(
                  builder: (context) => TextField(
                    controller: widget.controller,
                    focusNode: _focusNode,
                    maxLength: widget.pinLength,
                    keyboardType: TextInputType.none,
                    enableInteractiveSelection: false,
                    enableSuggestions: false,
                    autocorrect: false,
                    style: const TextStyle(
                      fontSize: 1,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      counterText: '',
                    ),
                  ),
                ),
              ],
            ),
          ),

          // PIN Cells
          Positioned.fill(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: List.generate(widget.pinLength, (index) => 
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.02),
                    child: _buildPinCell(index),
                  ),
                ),
              ),
            ),
          ),

          // Small obscure icon near last PIN cell
          Positioned(
            right: context.screenWidth * 0,
     
            child: GestureDetector(
              onTap: _toggleObscure,
              child: SvgPicture.asset(
               ImageAssets.obscureIcon,
                width:  context.screenWidth * 0.035,
                height: context.screenWidth * 0.035,
                color: widget.dotColor ?? const Color(0xFFF2FBF9),
              ),
            ),
          ),

          // Eye Icon positioned to the right
       
        ],
      ),
    );
  }

  Widget _buildPinCell(int index) {
    final hasDigit = index < widget.controller.text.length;
    final dotColor = widget.dotColor ?? const Color(0xFFF2FBF9);
    final textColor = widget.textColor ?? const Color(0xFFF2FBF9);

    return GestureDetector(
      onTap: () => _focusNode.requestFocus(),
      child: SizedBox(
        width: context.screenWidth*0.1,
        height: context.screenHeight* 0.03,
        child: Stack(
          children: [
            // Digit or star positioned above line
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 18,
              child: Center(
                child: hasDigit
                    ? Text(
                  _isObscured ? '*' : widget.controller.text[index],
                  style: TextStyle(
                    color: textColor,
                    fontSize:16,
                    fontFamily: 'Work Sans',
                    fontWeight: FontWeight.w800,
                  ),
                )
                    : const SizedBox(),
              ),
            ),

            // Bolder line at bottom
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 4,
                width:  context.screenWidth*0.1,
                decoration: BoxDecoration(
                  color: dotColor,
                  borderRadius: BorderRadius.circular(2.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}