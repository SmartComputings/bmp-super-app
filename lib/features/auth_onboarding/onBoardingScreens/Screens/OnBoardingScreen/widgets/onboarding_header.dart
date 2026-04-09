import 'package:bmp/core/constant/app_colors.dart';
// AuthService import removed

import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:bmp/shared/widgets/adaptive_dialogs/show_ok_cancel_alert_dialog.dart';
import 'package:bmp/shared/widgets/app_exit_dialogue.dart';
import 'package:bmp/shared/widgets/back_button.dart';
import 'package:bmp/shared/widgets/future_loading_dialog.dart';
import 'package:bmp/shared/widgets/matrix.dart';

import 'package:bmp/shared/widgets/message_question_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../core/localization/l10n.dart';

enum SettingsAction {
  mycard,
  settings,
  myWallet,
  home,
  logout,
}

class OnboardingHeader extends StatefulWidget {
  final bool isInSettings;
  final bool isInNotifications;
  final GestureTapCallback? onTapBack;
  final Widget? child;
  final bool showCloseIcon;
  final EdgeInsetsGeometry? menuIconPadding;
  final bool isMainMenuOpen;

  const OnboardingHeader({
    super.key,
    this.isInSettings = false,
    this.isInNotifications = false,
    this.onTapBack,
    this.child,
    this.showCloseIcon = false,
    this.menuIconPadding,
    this.isMainMenuOpen = false,
  });

  @override
  State<OnboardingHeader> createState() => _OnboardingHeaderState();
}

class _OnboardingHeaderState extends State<OnboardingHeader>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _rotationAnimation = Tween<double>(begin: 0, end: 0.5).animate(
      CurvedAnimation(parent: _animationController!, curve: Curves.easeInOut),
    );
    if (widget.isMainMenuOpen) {
      _animationController!.value = 1.0;
    }
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(OnboardingHeader oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isMainMenuOpen != oldWidget.isMainMenuOpen) {
      if (widget.isMainMenuOpen) {
        _animationController?.forward();
      } else {
        _animationController?.reverse();
      }
    }
  }

  bool get _isInSettings {
    if (widget.isInSettings) return true;
    try {
      final currentRoute =
          GoRouter.of(context).routeInformationProvider.value.uri.path;
      return currentRoute == '/settings' ||
          (currentRoute.startsWith('/rooms/settings') &&
              !currentRoute.contains('/notifications'));
    } catch (e) {
      return false;
    }
  }

  bool get _isInNotifications {
    if (widget.isInNotifications) return true;
    try {
      final currentRoute =
          GoRouter.of(context).routeInformationProvider.value.uri.path;
      return currentRoute.contains('/notifications');
    } catch (e) {
      return false;
    }
  }

  bool get _isInHome {
    try {
      final currentRoute =
          GoRouter.of(context).routeInformationProvider.value.uri.path;
      return currentRoute == '/onboarding' ||
          currentRoute == '/mainMenuScreen' ||
          currentRoute == '/rooms' ||
          widget.isMainMenuOpen;
    } catch (e) {
      return false;
    }
  }

  Future<void> _showLogoutConfirmation(BuildContext context) async {
    final result = await showOkCancelAlertDialog(
      context: context,
      dialogType: DialogType.logout,
      title: L10n.of(context).logoutConfirmTitle,
      message: L10n.of(context).logoutConfirmMessage,
      okLabel: L10n.of(context).logoutButton,
      cancelLabel: L10n.of(context).cancel,
    );

    if (result == OkCancelResult.ok) {
      try {
        final matrix = Matrix.of(context);
        await showFutureLoadingDialog(
          context: context,
          future: () async {
            // Clear shared preferences data before logout
            try {
              final prefs = await SharedPreferences.getInstance();
              await prefs.remove('cached_wallets');
              await prefs.remove('customer_id');
              print('🧹 DEBUG: SharedPreferences data cleared before logout');
            } catch (e) {
              print('⚠️ DEBUG: Failed to clear SharedPreferences data: $e');
            }

            await matrix.client.logout();
            return true;
          },
        );
        if (context.mounted) {
          context.go('/home');
        }
      } catch (e) {
        if (context.mounted) {
          context.go('/home');
        }
      }
    }
  }

  // bool _isUserLoggedIn(BuildContext context) {
  //   try {
  //     final matrix = Matrix.of(context);
  //     return matrix.client.isLogged();
  //   } catch (e) {
  //     return false;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    const isProfileIcon = ImageAssets.icPerson;
    const isNotificationIcon = ImageAssets.icNotification;
    const isMenuIcon = ImageAssets.icMenu;
    print(
      'check route name ::: ${GoRouter.of(context).routeInformationProvider.value.uri.path}',
    );
    return Padding(
      padding: const EdgeInsets.symmetric(
        // horizontal: context.percentWidth * 2,
        horizontal: 10,
      ),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.02),
        ),
        child: Container(
          padding: const EdgeInsets.all(
            5,
            // horizontal: screenWidth * 0.02,
            // vertical: screenHeight * 0.015,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(screenWidth * 0.02),
            color: AppColors.dynamicHeaderBg.withValues(alpha: 0.8),
            border: Border.all(
              color: AppColors.dynamicHeaderBg,
              width: 1,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          BackButtonWidget(
                            onTap: widget.onTapBack ??
                                () async {
                                  print('Back arrow pressed!'); // Debug print
                                  // Navigate back if possible, otherwise handle exit
                                  if (Navigator.of(context).canPop()) {
                                    Navigator.of(context).pop();
                                    print('Navigating back'); // Debug print
                                  } else {
                                    // Show exit dialogue
                                    await AppExitDialogue.show(context);
                                    print(
                                      'No route to pop, handled exit logic',
                                    ); // Debug print
                                  }
                                },
                          ),
                          const SizedBox(width: 8),
                          // Logo
                          SvgPicture.asset(
                            ImageAssets.beMindPowerLogo,
                            height: screenHeight * 0.033,
                            width: screenWidth * 0.1,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Icon buttons
                    Row(
                      children: [
                        MessageQuestionWidget(isInSettings: _isInSettings),
                        const SizedBox(width: 3),
                        _CircleIcon(
                          onTap: () {
                            if (!Matrix.of(context).client.isLogged()) return;
                            context.push('/settings');
                          },
                          icon: ImageAssets.profileIcon,
                          selected: _isInSettings,
                          size: screenHeight * 0.045,
                        ),
                        const SizedBox(width: 3),
                        _CircleIcon(
                          onTap: () {
                            if (!Matrix.of(context).client.isLogged()) return;
                            context.push('/settings/notifications');
                          },
                          icon: ImageAssets.icNotification,
                          selected: _isInNotifications,
                          size: screenHeight * 0.045,
                        ),
                        const SizedBox(width: 3),
                        GestureDetector(
                          onTap: () {
                            print(
                              '_isInHome ::: $_isInHome ::: widget.isMainMenuOpen ::: ${widget.isMainMenuOpen}',
                            );
                            if (widget.isMainMenuOpen) {
                              _animationController?.reverse();
                              if (context.canPop()) {
                                context.pop();
                              } else {
                                context.go('/onboarding');
                              }
                            } else {
                              _animationController?.forward();
                              context.push('/mainMenuScreen');
                            }
                          },
                          child: _animationController != null
                              ? AnimatedBuilder(
                                  animation: _animationController!,
                                  builder: (context, child) {
                                    return Container(
                                      width: screenHeight * 0.045,
                                      height: screenHeight * 0.045,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: _isInHome
                                            ? AppColors.settingBtnBg
                                            : Colors.white,
                                        border: Border.all(
                                          color: AppColors.settingBtnBg,
                                          width: 2,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Padding(
                                        padding: widget.menuIconPadding ??
                                            EdgeInsets.zero,
                                        child: RotationTransition(
                                          turns: _rotationAnimation!,
                                          child: AnimatedSwitcher(
                                            duration: const Duration(
                                                milliseconds: 200,),
                                            transitionBuilder:
                                                (child, animation) {
                                              return FadeTransition(
                                                opacity: animation,
                                                child: ScaleTransition(
                                                  scale: animation,
                                                  child: child,
                                                ),
                                              );
                                            },
                                            child: Image.asset(
                                              widget.isMainMenuOpen
                                                  ? ImageAssets.menuVertical
                                                  : ImageAssets.icMenu,
                                              key: ValueKey(
                                                  widget.isMainMenuOpen,),
                                              width: screenHeight * 0.055 * 0.5,
                                              height:
                                                  screenHeight * 0.055 * 0.5,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : Container(
                                  width: screenHeight * 0.055,
                                  height: screenHeight * 0.055,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: _isInHome
                                        ? AppColors.settingBtnBg
                                        : Colors.white,
                                    border: Border.all(
                                      color: AppColors.settingBtnBg,
                                      width: 2,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: widget.menuIconPadding ??
                                        EdgeInsets.zero,
                                    child: Image.asset(
                                      widget.isMainMenuOpen
                                          ? ImageAssets.menuVertical
                                          : ImageAssets.icMenu,
                                      width: screenHeight * 0.055 * 0.5,
                                      height: screenHeight * 0.055 * 0.5,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                        ),
                        // PopupMenuButton<SettingsAction>(
                        //   enabled: _isUserLoggedIn(context),
                        //   offset: Offset(0, screenHeight * 0.059 + 8),
                        //   padding: EdgeInsets.zero,
                        //   icon: Container(
                        //     width: screenHeight * 0.055,
                        //     height: screenHeight * 0.055,
                        //     alignment: Alignment.center,
                        //     decoration: BoxDecoration(
                        //       color:
                        //           _isInHome ? Colors.white : AppColors.settingBtnBg,
                        //       border: Border.all(
                        //         color: AppColors.settingBtnBg,
                        //         width: 2,
                        //       ),
                        //       shape: BoxShape.circle,
                        //     ),
                        //     child: Image.asset(
                        //       ImageAssets.icMenu,
                        //       width: screenHeight * 0.055 * 0.5,
                        //       height: screenHeight * 0.055 * 0.5,
                        //       fit: BoxFit.contain,
                        //       // color: _isInHome ? Colors.white : AppColors.settingBtnBg,
                        //     ),
                        //   ),
                        //   onSelected: (SettingsAction action) {
                        //     _handleMenuAction(action, context);
                        //   },
                        //   itemBuilder: (BuildContext context) => [
                        //     const PopupMenuItem(
                        //       value: SettingsAction.home,
                        //       child: Row(
                        //         children: [
                        //           Icon(Icons.home_outlined),
                        //           SizedBox(width: 18),
                        //           Text('Home'),
                        //         ],
                        //       ),
                        //     ),
                        //     const PopupMenuItem(
                        //       value: SettingsAction.myWallet,
                        //       child: Row(
                        //         children: [
                        //           Icon(Icons.account_balance_wallet_outlined),
                        //           SizedBox(width: 18),
                        //           Text('My Wallet'),
                        //         ],
                        //       ),
                        //     ),
                        //     const PopupMenuItem(
                        //       value: SettingsAction.mycard,
                        //       child: Row(
                        //         children: [
                        //           Icon(Icons.credit_card),
                        //           SizedBox(width: 18),
                        //           Text('My Card'),
                        //         ],
                        //       ),
                        //     ),
                        //     PopupMenuItem(
                        //       value: SettingsAction.settings,
                        //       child: Row(
                        //         children: [
                        //           const Icon(Icons.settings_outlined),
                        //           const SizedBox(width: 18),
                        //           Text(L10n.of(context).settings),
                        //         ],
                        //       ),
                        //     ),
                        //     const PopupMenuDivider(),
                        //     const PopupMenuItem(
                        //       value: SettingsAction.logout,
                        //       child: Row(
                        //         children: [
                        //           Icon(Icons.logout, color: Colors.red),
                        //           SizedBox(width: 18),
                        //           Text(
                        //             'Logout',
                        //             style: TextStyle(color: Colors.red),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
              widget.child ?? const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}

class _CircleIcon extends StatelessWidget {
  final String icon;
  final bool selected;
  final Color? color;
  final double size;
  final GestureTapCallback onTap;
  const _CircleIcon({
    required this.icon,
    this.selected = false,
    this.color,
    this.size = 35,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final iconSize = size * 0.5;
    final isProfileIcon = icon == ImageAssets.icPerson;
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

    return InkWell(
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
            width: 2,
          ),
          shape: BoxShape.circle,
        ),
        child: iconWidget,
      ),
    );
  }
}
