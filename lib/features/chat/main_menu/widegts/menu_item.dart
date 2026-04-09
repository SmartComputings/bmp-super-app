import 'package:bmp/core/constant/finance_typography.dart';
import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final Color color;
  final String icon;
  final String title;
  final String? menuIcon;
  final EdgeInsetsGeometry? menuIconPadding;
  final double? iconHeight;
  final double? iconWidth;
  final VoidCallback onTap;

  const MenuItem({
    super.key,
    required this.color,
    required this.icon,
    required this.title,
    this.menuIcon,
    this.menuIconPadding,
    this.iconHeight,
    this.iconWidth,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.screenWidth * 0.005),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 8,
              spreadRadius: 0,
              offset: const Offset(0, 4),
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 4,
              spreadRadius: 0,
              offset: const Offset(-2, 0),
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 4,
              spreadRadius: 0,
              offset: const Offset(2, 0),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.screenWidth * 0.04,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  icon,
                  height: iconHeight ?? context.screenWidth * 0.11,
                  width: iconWidth ?? context.screenWidth * 0.11,
                ),
              ),
              SizedBox(width: context.screenWidth * 0.02),
              Expanded(
                flex: 4,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: context.screenWidth * 0.035,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      height: 1.20,
                      letterSpacing: -0.40,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: menuIcon != null
                    ? Padding(
                        padding: menuIconPadding ?? EdgeInsets.zero,
                        child: Image.asset(
                          menuIcon!,
                          height: context.screenHeight * 0.085,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                    : const SizedBox(),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Image.asset(
                    ImageAssets.forwardButton,
                    width: context.screenWidth * 0.04,
                    height: context.screenWidth * 0.04,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
