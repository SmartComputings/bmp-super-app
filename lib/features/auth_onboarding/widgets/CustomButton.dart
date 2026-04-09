import 'package:bmp/shared/utils/app_loading_widget.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool loading;
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.percentWidth * 55,
      height: context.percentHeight * 8,
      decoration: ShapeDecoration(
        color: const Color(0xFF3976F8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed == null ? null : () {
            print('DEBUG: CustomButton tapped');
            onPressed!();
          },
          borderRadius: BorderRadius.circular(24),
          child: Center(
            child: loading
                ? AppLoadingWidget()
                : Text(
                    text,
                    style:  TextStyle(
                      color: Colors.white,
                      fontSize: context.screenWidth*0.038,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
          ),
        ),
      ),
    );
  }
}