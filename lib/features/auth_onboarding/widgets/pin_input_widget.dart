import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

/// Controller for PinInputWidget to expose control methods
class PinInputController {
  _PinInputWidgetState? _state;

  void _attach(_PinInputWidgetState state) {
    _state = state;
  }

  void _detach() {
    _state = null;
  }

  /// Clear the PIN input fields
  void clear() {
    _state?.clearPin();
  }
}

class PinInputWidget extends StatefulWidget {
  final Function(bool)? onPinComplete;
  final Function(String)? onPinChanged;
  final PinInputController? controller;
  
  const PinInputWidget({
    super.key, 
    this.onPinComplete, 
    this.onPinChanged,
    this.controller,
  });

  @override
  State<PinInputWidget> createState() => _PinInputWidgetState();
}

class _PinInputWidgetState extends State<PinInputWidget> {
  late final TextEditingController pinController;
  late final FocusNode focusNode;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    pinController = TextEditingController();
    focusNode = FocusNode();
    widget.controller?._attach(this);
  }

  @override
  void dispose() {
    widget.controller?._detach();
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  /// Method to clear the PIN input
  void clearPin() {
    pinController.clear();
    widget.onPinComplete?.call(false);
    widget.onPinChanged?.call('');
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    final defaultPinTheme = PinTheme(
      width: screenWidth * 0.15,
      height: screenHeight * 0.075,
      textStyle: TextStyle(
        fontSize: screenWidth * 0.055,
        color: Colors.white,
        height: 1.0,
      ),
      decoration: BoxDecoration(
        color: const Color(0x7F050926),
        borderRadius: BorderRadius.circular(screenWidth * 0.05),
      ),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Toggle visibility icon
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () => setState(() => _obscureText = !_obscureText),
            child: Icon(
              _obscureText
                  ? Icons.visibility_off_rounded
                  : Icons.visibility_rounded,
              color: Colors.white54,
              size: screenWidth * 0.037,
            ),
          ),
        ), 
        SizedBox(height: screenHeight * 0.012),
        Pinput(
          length: 6,
          controller: pinController,
          focusNode: focusNode,
          defaultPinTheme: defaultPinTheme,
          separatorBuilder: (index) => SizedBox(width: screenWidth * 0.02),
          obscureText: _obscureText,
          obscuringCharacter: '●',
          onCompleted: (pin) {
            widget.onPinComplete?.call(pin.length == 6);
            widget.onPinChanged?.call(pin);
          },
          onChanged: (pin) {
            widget.onPinComplete?.call(pin.length == 6);
            widget.onPinChanged?.call(pin);
          },
          focusedPinTheme: defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration!.copyWith(
              color: const Color(0xFF22246F),
            ),
          ),
          submittedPinTheme: defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration!.copyWith(
              color: const Color(0xFF22246F),
            ),
          ),
        ),
      ],
    );
  }
}