import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:flutter/material.dart';
  
class BackButtonWidget extends StatelessWidget {
  final VoidCallback? onTap;
  const BackButtonWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap ?? () => Navigator.pop(context),
      child: Image.asset(
        ImageAssets.arrowLeft,
        width: screenHeight * 0.04,
        height: screenHeight * 0.04,
      ),
    );
  }
}
