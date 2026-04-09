import 'package:bmp/core/constant/app_colors.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:flutter/material.dart';

class CustomShadowTextField extends StatefulWidget {
  final double width;
  final String? hintText;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function(String)? onSubmitted;
  final int? maxLines;
  final int? minLines;
  final bool showPrefixIcon;
  final double borderRadius;
  final bool enabled;

  const CustomShadowTextField({
    super.key,
    required this.width,
    this.hintText,
    this.prefixIcon,
    this.controller,
    this.focusNode,
    this.onSubmitted,
    this.maxLines = 1,
    this.minLines,
    this.showPrefixIcon = true,
    this.borderRadius = 25,
    this.enabled=true,
  });

  @override
  State<CustomShadowTextField> createState() => _CustomShadowTextFieldState();
}

class _CustomShadowTextFieldState extends State<CustomShadowTextField> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.symmetric(vertical: 1),
      width: widget.width,
      decoration: BoxDecoration(
        color: AppColors.textFieldColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        boxShadow: [
          BoxShadow(
            color: AppColors.textFieldColor.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: Container(
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //     colors: [
          //       const Color.fromARGB(255, 27, 27, 27).withOpacity(0.25),
          //       Colors.transparent,
          //       Colors.transparent,
          //       const Color.fromARGB(255, 17, 17, 17).withOpacity(0.25),
          //     ],
          //     stops: const [0.0, 0.1, 0.9, 1.0],
          //   ),
          // ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: TextFormField(
              enabled: widget.enabled,
              controller: widget.controller,
              focusNode: widget.focusNode,
              onFieldSubmitted: widget.onSubmitted,
              maxLines: widget.maxLines,
              minLines: widget.minLines,
              style: TextStyle(
                color: Color(0xff6F8DA1),
                fontSize: context.screenWidth * 0.03,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: widget.showPrefixIcon
                    ? Padding(
                        padding: const EdgeInsets.only(
                            left: 16), // left padding only
                        child: Image.asset(
                          "assets/icons/search_icon.png",
                          height: context.screenWidth * 0.04,
                          width: context.screenWidth * 0.04,
                        ),
                      )
                    : null,
                prefixIconConstraints: widget.showPrefixIcon
                    ? BoxConstraints(
                        minHeight: context.screenWidth * 0.03,
                        minWidth: context.screenWidth *
                            0.032, // ensures spacing between icon & text
                      )
                    : null,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12, // centers text vertically
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
