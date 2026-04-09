import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bmp/features/auth_onboarding/widgets/InnerShadow.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/utils/image/assets/image_assets.dart';

import '../../../core/localization/l10n.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final Widget? prefixImage;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Widget? suffixImage;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final bool obscureText;

  // Advanced options:
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final bool readOnly;
  final bool enabled;
  final bool showPasswordToggle; // show eye icon for password fields
  final bool clearable; // show clear button when there's text (non-password)
  final bool
      showPasswordStrength; // show inline small strength bars for passwords
  final String? errorText; // display error border when non-null

  const CustomTextField({
    super.key,
    this.hintText,
    this.prefixImage,
    this.prefixIcon,
    this.suffixImage, // ✅ new

    this.suffixIcon,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.onSubmitted,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.maxLength,
    this.readOnly = false,
    this.enabled = true,
    this.showPasswordToggle = true,
    this.clearable = true,
    this.showPasswordStrength = false,
    this.errorText,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;
  late TextEditingController _internalController;
  bool _isUsingInternalController = false;
  bool _isUsingInternalFocusNode = false;

  bool _isFocused = false;
  late bool _obscureText;
  String get _text => _internalController.text;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    if (widget.controller == null) {
      _internalController = TextEditingController();
      _isUsingInternalController = true;
    } else {
      _internalController = widget.controller!;
    }

    if (widget.focusNode == null) {
      _focusNode = FocusNode();
      _isUsingInternalFocusNode = true;
    } else {
      _focusNode = widget.focusNode!;
    }

    _focusNode.addListener(() {
      if (mounted) {
        setState(() => _isFocused = _focusNode.hasFocus);
      }
    });

    // listen to controller changes so we can show/hide clear button & strength
    _internalController.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    if (_isUsingInternalFocusNode) {
      _focusNode.dispose();
    }
    if (_isUsingInternalController) {
      _internalController.dispose();
    }
    super.dispose();
  }

  // Very small password strength heuristic (0..3)
  int _computePasswordStrength(String s) {
    if (s.isEmpty) return 0;
    var score = 0;
    if (s.length >= 6) score++;
    if (RegExp(r'[A-Z]').hasMatch(s) && RegExp(r'[0-9]').hasMatch(s)) score++;
    if (RegExp(r'[^A-Za-z0-9]').hasMatch(s) && s.length >= 8) score++;
    return score; // 0..3
  }

  Widget _buildSuffix() {
    final screenWidth = MediaQuery.of(context).size.width;
    final children = <Widget>[];

    if (widget.obscureText && widget.showPasswordToggle) {
      children.add(
        GestureDetector(
          onTap: widget.enabled
              ? () {
                  setState(() => _obscureText = !_obscureText);
                }
              : null,
          child: _obscureText
              ? Icon(size: screenWidth * 0.05, Icons.visibility_off_rounded)
              : Image.asset(
                  ImageAssets.passwordEyeIcon,
                  width: screenWidth * 0.062,
                  height: screenWidth * 0.062,
                  color: const Color(0xFFD2D4E5),
                ),
        ),
      );
    } else if (!widget.obscureText && widget.clearable && _text.isNotEmpty) {
      children.add(
        GestureDetector(
          onTap: widget.enabled
              ? () {
                  _internalController.clear();
                  widget.onChanged?.call('');
                  if (mounted) setState(() {});
                }
              : null,
          child: Icon(Icons.close_rounded,
              color: const Color(0xFFD2D4E5), size: screenWidth * 0.045),
        ),
      );
    } else if (widget.suffixImage != null || widget.suffixIcon != null) {
      children.add(
        widget.suffixImage ??
            Icon(widget.suffixIcon, color: const Color(0xFFD2D4E5)),
      );
    }

    if (widget.obscureText && widget.showPasswordStrength) {
      final strength = _computePasswordStrength(_text);
      children.insert(
        0,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (i) {
            final active = i < strength;
            return Container(
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.005),
              width: screenWidth * 0.015,
              height: screenWidth * 0.015,
              decoration: BoxDecoration(
                color: active
                    ? const Color(0xFF4754FF)
                    : const Color(0xFFD2D4E5).withOpacity(0.18),
                borderRadius: BorderRadius.circular(screenWidth * 0.005),
              ),
            );
          }),
        ),
      );
    }

    if (children.isEmpty) return const SizedBox.shrink();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final radius = screenWidth * 0.04;

    final borderColor = widget.errorText != null
        ? const Color(0xFFD23F3F)
        : (_isFocused ? const Color(0xFF3976F8) : Colors.transparent);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: InnerShadow(
            radius: radius,
            offset: const Offset(0, 4),
            blur: 4,
            color: Colors.black.withOpacity(0.25),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: context.percentWidth * 80,
              height: context.percentHeight * 7.5,
              decoration: ShapeDecoration(
                color: const Color(0x7F050926),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: _isFocused ? 2 : 0,
                    color: borderColor,
                  ),
                  borderRadius: BorderRadius.circular(radius),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.037),
              child: Row(
                children: [
                  if (widget.prefixImage != null ||
                      widget.prefixIcon != null) ...[
                    widget.prefixImage ??
                        Icon(widget.prefixIcon, color: const Color(0xFF4754FF)),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                      width: 1,
                      height: screenHeight * 0.03,
                      color: const Color(0xFF4754FF).withOpacity(0.4),
                    ),
                  ],

                  Expanded(
                    child: TextField(
                      focusNode: _focusNode,
                      controller: _internalController,
                      onChanged: widget.onChanged,
                      onSubmitted: widget.onSubmitted,
                      obscureText: _obscureText,
                      keyboardType: widget.keyboardType,
                      textInputAction: widget.textInputAction,
                      inputFormatters: widget.inputFormatters,
                      maxLength: widget.maxLength,
                      readOnly: widget.readOnly,
                      enabled: widget.enabled,
                      style: TextStyle(
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        fontSize: screenWidth * 0.035,
                        color: const Color(0xFFA5A8CB),
                      ),
                      decoration: InputDecoration(
                        counterText: '',
                        isCollapsed: true,
                        border: InputBorder.none,
                        hintText: widget.hintText ?? L10n.of(context).enterText,
                        hintStyle: TextStyle(
                          fontFamily: 'Work Sans',
                          fontWeight: FontWeight.w400,
                          fontSize: screenWidth * 0.035,
                          color: const Color(0xFFA5A8CB),
                        ),
                      ),
                    ),
                  ),
                  _buildSuffix(),
                ],
              ),
            ),
          ),
        ),
        if (widget.errorText != null)
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.005, left: screenWidth * 0.04),
            child: Text(
              widget.errorText!,
              style: TextStyle(
                color: const Color(0xFFD23F3F),
                fontSize: screenWidth * 0.03,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
      ],
    );
  }
}
