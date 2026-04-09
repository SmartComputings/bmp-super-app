import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:flutter/material.dart';

class AttachmentBottomSheet extends StatelessWidget {
  final double? width;
  final double? maxHeight;
  final Color backgroundColor;
  final Color borderColor;
  final double borderRadius;
  final EdgeInsets padding;
  final Widget child;

  const AttachmentBottomSheet({
    super.key,
    this.width,
    this.maxHeight = 650,
    this.backgroundColor = const Color(0x7F5F18BF),
    this.borderColor = const Color(0xFF5F18BF),
    this.borderRadius = 10,
    this.padding = const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 10),
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: context.screenHeight*0.8),
        child: Container(
          width: width ?? screenWidth - 20,
          padding: padding,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: backgroundColor,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: borderColor),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            shadows: [
              BoxShadow(
                color: Color(0xFF1B1C30),
                blurRadius: 16,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding:EdgeInsets.only(top: 10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40,
                    height: 6,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1000),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(child: child),
                   // SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}