import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:flutter/material.dart';

enum AuthMethod { phone, email }

class AuthMethodToggle extends StatelessWidget {
  final AuthMethod selectedMethod;
  final Function(AuthMethod) onMethodChanged;

  const AuthMethodToggle({
    super.key,
    required this.selectedMethod,
    required this.onMethodChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight*0.055,
      decoration: BoxDecoration(
        // color: const Color(0xFF1F2166),
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Expanded(
            child: _buildMethodButton(
              context: context,
              method: AuthMethod.phone,
              iconPath: ImageAssets.phoneIcon,
              label: 'Phone',
              isSelected: selectedMethod == AuthMethod.phone,
            ),
          ),
           SizedBox(width: context.percentWidth * 3),
          Expanded(
            child: _buildMethodButton(
              context: context,
              method: AuthMethod.email,
              iconPath: ImageAssets.emailIcon,
              label: 'Email',
              isSelected: selectedMethod == AuthMethod.email,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMethodButton({
    required BuildContext context,
    required AuthMethod method,
    required String iconPath,
    required String label,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () => onMethodChanged(method),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: context.screenHeight*0.05,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF3976F8) : const Color(0x7F050926),
          borderRadius: BorderRadius.circular(context.screenWidth*0.03),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              width: context.screenHeight*0.04,
              height: context.screenHeight*0.04,
              color: isSelected ? Colors.white : const Color(0xFFD2D4E5).withOpacity(0.5),
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFFD2D4E5).withOpacity(0.5),
                fontSize: context.screenHeight*0.02,
                fontFamily: 'Work Sans',
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
