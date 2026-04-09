import 'package:bmp/core/localization/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnimatedPhoneInputField extends StatefulWidget {
  final TextEditingController phoneController;
  final String hintText;
  final VoidCallback onCountryTap;
  final ValueChanged<String>? onChanged;
  final String? errorMessage;
  final String dialCode;
  final int? maxLength;
  final String? Function(String?)? validator;

  const AnimatedPhoneInputField({
    super.key,
    required this.phoneController,
    required this.hintText,
    required this.onCountryTap,
    this.onChanged,
    this.errorMessage,
    required this.dialCode,
    this.maxLength,
    this.validator,
  });

  @override
  _AnimatedPhoneInputFieldState createState() => _AnimatedPhoneInputFieldState();
}

class _AnimatedPhoneInputFieldState extends State<AnimatedPhoneInputField> {
  @override
  void initState() {
    super.initState();
    widget.phoneController.addListener(_updateBorder);
  }

  @override
  void dispose() {
    widget.phoneController.removeListener(_updateBorder);
    super.dispose();
  }

  void _updateBorder() {
    setState(() {});
  }

  /// Sanitizes error messages to prevent raw HTML/server responses from
  /// being displayed to the user.
  String _sanitizeErrorMessage(BuildContext context, String message) {
    // If the message contains HTML tags or is excessively long,
    // show a generic user-friendly error instead
    if (message.contains('<') || message.contains('DOCTYPE') || message.length > 150) {
      return L10n.of(context).connectionError;
    }
    return message;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          height: screenHeight * 0.075,
          decoration: BoxDecoration(
            color: const Color(0x7F050926),
            borderRadius: BorderRadius.circular(screenWidth * 0.04),
            border: Border.all(
              color: widget.errorMessage != null
                  ? Colors.red
                  : const Color.fromRGBO(0, 0, 0, 0.25),
              width: widget.errorMessage != null ? 2 : 1,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.15),
                offset: Offset(0, 2),
                blurRadius: 4,
              ),
            ],
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenWidth * 0.05),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(125, 4, 8, 39),
                      Colors.transparent,
                    ],
                    stops: [0.0, 0.07],
                  ),
                ),
              ),
              Center(
                child: Row(
                  children: [
                    SizedBox(width: screenWidth * 0.04),
                    InkWell(
                      onTap: widget.onCountryTap,
                      child: Row(
                        children: [
                          SizedBox(width: screenWidth * 0.02),
                          Text(
                            widget.dialCode,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: screenWidth * 0.04,
                              fontFamily: 'Work Sans',
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white70,
                            size: screenWidth * 0.045,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.025),
                    Container(
                      height: screenHeight * 0.018,
                      width: 1,
                      color: const Color(0xFF4754FF),
                    ),
                    SizedBox(width: screenWidth * 0.025),
                    Expanded(
                      child: TextFormField(
                        controller: widget.phoneController,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.04,
                        ),
                        onChanged: widget.onChanged,
                        keyboardType: TextInputType.phone,
                        maxLength: widget.maxLength,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          if (widget.maxLength != null)
                            LengthLimitingTextInputFormatter(widget.maxLength!),
                        ],
                        validator: widget.validator,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          errorStyle: const TextStyle(height: 0, fontSize: 0),
                          counterText: '',
                          hintText: widget.hintText,
                          hintStyle: TextStyle(
                            color: Colors.white30,
                            fontFamily: 'Work Sans',
                            fontSize: screenWidth * 0.04,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (widget.errorMessage != null)
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.01, left: screenWidth * 0.04),
            child: Text(
              _sanitizeErrorMessage(context, widget.errorMessage!),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.red,
                fontSize: screenWidth * 0.03,
                fontFamily: 'Work Sans',
              ),
            ),
          ),
      ],
    );
  }
}