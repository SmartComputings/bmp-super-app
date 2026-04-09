import 'dart:io';

import 'package:bmp/core/constant/app_colors.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/chat/main_menu/widegts/menu_item.dart';
import 'package:bmp/shared/domain/entities/subscription/feature_types.dart';
import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:bmp/shared/utils/logout_action.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/default_user_service.dart';

/// Shows the MainMenuScreen as a full-screen overlay that slides from top
/// Returns when the user presses back/close button or taps menu button again
void showMainMenuOverlay(BuildContext context) {
  Navigator.of(context).push(
    PageRouteBuilder(
      opaque: false,
      barrierDismissible: true,
      barrierColor: Colors.black54,
      pageBuilder: (context, animation, secondaryAnimation) {
        return const MainMenuOverlay();
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Slide from top to bottom (like a popup menu)
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, -1.0), // Start from top
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutCubic,
          )),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
      reverseTransitionDuration: const Duration(milliseconds: 250),
    ),
  );
}

/// Main menu overlay widget that displays as a full-screen overlay
class MainMenuOverlay extends StatelessWidget {
  const MainMenuOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: Material(
        color: Colors.transparent,
        child: _OverlayContent(),
      ),
    );
  }
}

class _OverlayContent extends StatefulWidget {
  @override
  State<_OverlayContent> createState() => _OverlayContentState();
}

class _OverlayContentState extends State<_OverlayContent> {
  static final _blueBox = const Color(0xFF1929FF).withOpacity(0.20);
  static const _blackBox = Colors.transparent;

  void _closeOverlay() {
    Navigator.of(context).pop();
  }

  /// Navigate to a route after closing the overlay
  /// This prevents route stacking by ensuring overlay is closed first
  void _navigateAndClose(String route) {
    Navigator.of(context).pop(); // Close overlay
    // Use a small delay to ensure overlay is fully closed
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        context.go(route);
      }
    });
  }

  /// Navigate with feature access check
  void _navigateWithFeatureCheck(FeatureType feature, String route) {
    Navigator.of(context).pop(); // Close overlay
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        context.go(route);
        // FeatureAccessHelper.handleFeatureAccess(
        //   context: context,
        //   feature: feature,
        //   onAccessGranted: () => context.go(route),
        // );
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: context.percentWidth * 100,
        height: context.percentHeight * 100,
        color: const Color(0xFF1B1C30),
        child: Stack(
          children: [
            // Background gradient
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF1B1C30),
                    const Color(0xFF363EC1).withOpacity(0.3),
                    const Color(0xFFA912BF).withOpacity(0.2),
                    const Color(0xFF1B1C30),
                  ],
                  stops: const [0.0, 0.3, 0.7, 1.0],
                ),
              ),
            ),
            // Main content with header and menu items
            Column(
              children: [
                // Custom header with close buttons
                Padding(
                  padding: EdgeInsets.only(
                    top: context.percentHeight * 7,
                    left: context.percentWidth * 2.5,
                    right: context.percentWidth * 2.5,
                  ),
                  child: _OverlayHeader(onClose: _closeOverlay),
                ),
                SizedBox(height: context.percentHeight * 3),
                // Menu items
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: context.percentWidth * 5),
                    child: Column(
                      children: [
                        MenuItem(
                          color: _blueBox,
                          icon: "assets/MainMenu/message_chat.png",
                          title: L10n.of(context).chat,
                          menuIcon: "assets/MainMenu/chat_menu.png",
                          menuIconPadding: EdgeInsets.only(left: context.percentWidth * 6),
                          onTap: () => _navigateAndClose('/mainMenuScreen/rooms'),
                        ),
                        MenuItem(
                          color: _blackBox,
                          icon: "assets/MainMenu/finance.png",
                          title: L10n.of(context).finance,
                          menuIcon: "assets/MainMenu/finance_menu.png",
                          menuIconPadding: EdgeInsets.only(left: context.percentWidth * 11),
                          onTap: () => _navigateWithFeatureCheck(FeatureType.finance, '/rooms/wallet'),
                        ),
                        if (!Platform.isIOS)
                        MenuItem(
                          color: _blueBox,
                          icon: "assets/MainMenu/apps.png",
                          title: L10n.of(context).apps,
                          menuIcon: "assets/MainMenu/app_menu.png",
                          menuIconPadding: EdgeInsets.only(left: context.percentWidth * 2.5),
                          onTap: () {
                            context.go('/mainMenuScreen/coming-soon', extra: {'feature': L10n.of(context).apps});
                          },
                        ),
                        if (!Platform.isIOS)
                        MenuItem(
                          color: _blackBox,
                          icon: "assets/MainMenu/marketplace.png",
                          title: L10n.of(context).marketplace,
                          menuIcon: "assets/MainMenu/marketplace_menu.png",
                          menuIconPadding: EdgeInsets.zero,
                          onTap: () {
                            context.go('/mainMenuScreen/coming-soon', extra: {'feature': L10n.of(context).marketplace});
                          },
                        ),
                        if (!Platform.isIOS)
                        MenuItem(
                          color: _blueBox,
                          icon: "assets/MainMenu/community.png",
                          title: L10n.of(context).community,
                          menuIcon: "assets/MainMenu/community_menu.png",
                          menuIconPadding: EdgeInsets.zero,
                          onTap: () {
                            context.go('/mainMenuScreen/coming-soon', extra: {'feature': L10n.of(context).community});
                          },
                        ),
                        if (!Platform.isIOS)
                        MenuItem(
                          color: _blackBox,
                          icon: "assets/MainMenu/message.png",
                          title: L10n.of(context).tourGuide,
                          menuIcon: "assets/MainMenu/tourguide_menu.png",
                          menuIconPadding: EdgeInsets.zero,
                          onTap: () {
                            context.go('/mainMenuScreen/coming-soon', extra: {'feature': L10n.of(context).tourGuide});
                          },
                        ),
                        MenuItem(
                          color: _blueBox,
                          icon: "assets/MainMenu/settings.png",
                          title: L10n.of(context).settings,
                          menuIcon: "assets/MainMenu/setting_app.png",
                          menuIconPadding: EdgeInsets.zero,
                          onTap: () => _navigateAndClose('/settings'),
                        ),
                        MenuItem(
                          color: _blackBox,
                          icon: "assets/MainMenu/logout.png",
                          title: L10n.of(context).logout,
                          menuIcon: "assets/MainMenu/logout_menu.png",
                          menuIconPadding: EdgeInsets.only(left: context.percentWidth * 8.5),
                          iconHeight: context.percentWidth * 15,
                          iconWidth: context.percentWidth * 15,
                          onTap: () async {
                            await logoutAction(context);
                            if (mounted && Navigator.of(context).canPop()) {
                              Navigator.of(context).pop();
                            }
                          },
                        ),
                        SizedBox(height: context.percentHeight * 4),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Header for the overlay with back and menu close buttons
class _OverlayHeader extends StatelessWidget {
  final VoidCallback onClose;

  const _OverlayHeader({required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.percentWidth * 1.25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.percentWidth * 2),
        color: AppColors.dynamicHeaderBg.withOpacity(0.5),
        border: Border.all(
          color: AppColors.dynamicHeaderBg,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
        child: Row(
          children: [
            // Back/Close button
            GestureDetector(
              onTap: onClose,
              child: Container(
                width: context.percentHeight * 4.5,
                height: context.percentHeight * 4.5,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: AppColors.settingBtnBg,
                    width: 2,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back,
                  size: context.percentHeight * 2.5,
                  color: AppColors.settingBtnBg,
                ),
              ),
            ),
            SizedBox(width: context.percentWidth * 2),
            // Logo
            SvgPicture.asset(
              ImageAssets.beMindPowerLogo,
              height: context.percentHeight * 3.5,
              width: context.percentWidth * 1,
              fit: BoxFit.contain,
            ),
            const Spacer(),
            // Close/Menu button
            GestureDetector(
              onTap: onClose,
              child: Container(
                width: context.percentHeight * 4.5,
                height: context.percentHeight * 4.5,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: AppColors.settingBtnBg,
                    width: 2,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  ImageAssets.icMenu,
                  width: context.percentHeight * 5.5 * 0.45,
                  height: context.percentHeight * 5.5 * 0.45,
                  fit: BoxFit.contain,
                  color: AppColors.settingBtnBg,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
