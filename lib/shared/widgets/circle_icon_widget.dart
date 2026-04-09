import 'package:bmp/core/constant/app_colors.dart';
import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CircleIconWidget extends StatelessWidget {
  final String icon;
  final bool selected;
  final Color? color;
  final double size;
  final GestureTapCallback onTap;
  const CircleIconWidget({
    super.key,
    required this.icon,
    this.selected = false,
    this.color,
    this.size = 44,
    required this.onTap,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CircleIconWidget &&
        other.icon == icon &&
        other.selected == selected &&
        other.size == size;
  }

  @override
  int get hashCode => Object.hash(icon, selected, size);

  @override
  Widget build(BuildContext context) {
    final iconSize = size * 0.5;
    final isProfileIcon = icon == ImageAssets.profileIcon;
    final isNotificationIcon = icon == ImageAssets.icNotification;
    final isMenuIcon = icon == ImageAssets.icMenu;

    if (isNotificationIcon) {
      print('🔔 Notification icon - selected: $selected, icon: $icon');
    }

    Widget iconWidget;
    if (icon.toLowerCase().endsWith('.svg')) {
      iconWidget = SvgPicture.asset(
        icon,
        height: iconSize,
        width: iconSize,
        fit: BoxFit.contain,
        colorFilter:
            (isProfileIcon || isNotificationIcon || isMenuIcon) && selected
                ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                : null,
      );
    } else {
      iconWidget = Image.asset(
        icon,
        height: iconSize,
        width: iconSize,
        fit: BoxFit.contain,
        color: (isProfileIcon || isNotificationIcon || isMenuIcon) && selected
            ? Colors.white
            : null,
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: (isProfileIcon || isNotificationIcon || isMenuIcon) && selected
              ? AppColors.settingBtnBg
              : Colors.white,
          border: Border.all(
            color: AppColors.settingBtnBg,
            width: 1,
          ),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.settingBtnBg.withValues(alpha: 0.3),
              blurRadius: 4,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: iconWidget,
      ),
    );
  }
}
