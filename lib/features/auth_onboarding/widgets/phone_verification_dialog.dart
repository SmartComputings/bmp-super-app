import 'dart:ui';
import 'package:bmp/core/config/app_fonts.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:bmp/core/constant/app_colors.dart';

class PhoneVerificationDialog extends StatelessWidget {
  final String phoneNumber;
  final VoidCallback? onEdit;
  final VoidCallback? onOk;

  const PhoneVerificationDialog({
    super.key,
    required this.phoneNumber,
    this.onEdit,
    this.onOk,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color(0xff6F8DA1).withValues(alpha: 0.48),
      insetPadding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth * 0.06,
          vertical: context.screenHeight * 0.02,
        ),
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment(-0.00, 0.75),
            end: Alignment(1.05, 0.32),
            colors: [Color(0xFFA912BF), Color(0xFF131EBF)],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Stack(
          children: [
            // Backdrop blur positioned below content
            Positioned(
              top: 80,
              left: 0,
              right: 0,
              bottom: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(color: const Color.fromARGB(0, 26, 25, 25)),
                ),
              ),
            ),
            // Main content
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(L10n.of(context).verifyPhone,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: context.screenWidth * 0.035,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w400,
                      height: 1.30,
                    ),
                  ),
                  Gap(context.screenHeight * 0.018),
                  Text(
                    phoneNumber,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: context.screenWidth * 0.04,
                      letterSpacing: 1,
                      fontFamily:AppFonts.allRoundGothic,
                      fontWeight: FontWeight.w700,
                      height: 1.30,
                    ),
                  ),
                  Gap(context.screenHeight * 0.018),
                   Text(L10n.of(context).isItCorrectOrModify,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: context.screenWidth * 0.034,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w400,
                      height: 1.30,
                    ),
                  ),
                  Gap(context.screenHeight * 0.018),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildButton(context, L10n.of(context).edit, onEdit),
                      SizedBox(width: context.screenWidth * 0.04),
                      _buildButton(context, L10n.of(context).ok, onOk),
                    ],
                  ),
                ],
              ),
            ],
          ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, VoidCallback? onPressed) {
    return Container(
      width: context.screenWidth * 0.35,
      height: context.screenHeight * 0.045,
      decoration: ShapeDecoration(
        color: const Color(0xFF1929FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: AppColors.white,
            fontSize: context.screenWidth * 0.038,
            fontFamily: 'Work Sans',
            fontWeight: FontWeight.w700,
            height: 1.30,
          ),
        ),
      ),
    );
  }
}