import 'dart:io';
import 'dart:ui';
import 'package:bmp/core/errors/api_exception.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/Screens/OnBoardingScreen/widgets/onboarding_header.dart';
import 'package:bmp/features/chat/main_menu/widegts/menu_item.dart';
import 'package:bmp/shared/domain/entities/subscription/feature_types.dart';
import 'package:bmp/shared/providers/subscription_provider.dart';
import 'package:bmp/shared/utils/app_loading_widget.dart';
import 'package:bmp/shared/utils/snackbar.dart';
import 'package:bmp/shared/utils/logout_action.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/utils/username_helper.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/bg_gradient_theme.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/constants/position_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/config/default_user_service.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  // Static color constants to avoid recreation on every build
  static final _blueBox = const Color(0xFF1929FF).withValues(alpha: 0.20);
  static const _blackBox = Colors.transparent;

  // Track loading dialog state to prevent multiple dialogs
  bool _isLoadingDialogShowing = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _checkSubscription();
    });
  }

  /// Shows loading dialog with tracking
  void _showLoadingDialog() {
    if (_isLoadingDialogShowing || !mounted) return;
    _isLoadingDialogShowing = true;
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black54,
      builder: (ctx) => const Center(
        child: AppLoadingWidget(),
      ),
    );
  }

  /// Dismisses loading dialog safely
  void _dismissLoadingDialog() {
    if (!_isLoadingDialogShowing || !mounted) return;
    _isLoadingDialogShowing = false;
    if (Navigator.canPop(context)) {
      Navigator.of(context).pop();
    }
  }

  /// Shows 429 Too Many Requests error snackbar
  void _show429Error() {
    if (!mounted) return;
    CustomSnackbar.show(
      context,
      title: L10n.of(context).error,
      message: L10n.of(context).tooManyRequestsWarning,
      type: SnackbarType.error,
    );
  }

  /// Checks if error is a 429 Too Many Requests error
  bool _is429Error(Object e) {
    return (e is ApiException && e.statusCode == 429) ||
        e.toString().contains('429');
  }

  Future<void> _checkSubscription() async {
    if (!mounted) return;

    try {
      final subscriptionProvider = context.read<SubscriptionProvider>();

      if (subscriptionProvider.state == SubscriptionState.initial) {
        await subscriptionProvider.checkSubscription();
      }

      if (!mounted) return;

      // Customer data check removed - finance module removed
    } catch (e) {
      _dismissLoadingDialog();

      if (_is429Error(e)) {
        _show429Error();
      }
    }
  }

// initShareStorige() async {
//    const String _prefKey = 'is_default_user';
//   final prefs = await SharedPreferences.getInstance();
//   await prefs.get(_prefKey);
//
// }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        if (context.canPop()) {
          context.pop();
        } else {
          context.go('/onboarding');
        }
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: context.screenWidth,
          height: context.screenHeight,
          color: const Color(0xFF1B1C30),
          child: Stack(
            children: [
              BgGradientTheme(
                position: ShapePosition.center,
                width: context.screenWidth * 1.8,
                height: context.screenWidth * 1.8,
                color: const Color(0xFF363EC1),
                opacity: 0.6,
              ),
              // BgGradientTheme(
              //   position: ShapePosition.bottomFull,
              //   height: screenHeight * 0.37,
              //   colors: const [Color(0xFF1B1C30),Color(0xFF1B1C30)],
              //   opacity: 0.8,
              // ),
              BgGradientTheme(
                position: ShapePosition.bottomRight,
                height: context.screenHeight * 0.4,
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFFA912BF).withValues(alpha: 0.8),
                    const Color(0xFFA912BF).withValues(alpha: 0.8)
                  ],
                  stops: const [0.6, 1],
                  begin: Alignment.centerRight,
                  end: Alignment.bottomLeft,
                ),
                opacity: 0.6,
              ),
              BgGradientTheme(
                position: ShapePosition.bottomRight,
                height: context.screenHeight * 0.2,
                width: context.screenWidth * 0.5,
                color: const Color(0xFFA912BF),
                opacity: 0.5,
              ),
              BgGradientTheme(
                position: ShapePosition.topLeft,
                height: context.screenHeight * 0.44,
                gradient: const LinearGradient(
                  colors: [Color(0xFF1B1C30), Color(0x88A912BF)],
                  stops: [0.5, 0.5],
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                ),
                opacity: 0.6,
              ),
              BgGradientTheme(
                position: ShapePosition.bottomRight,
                width: context.screenWidth * 0.25,
                height: context.screenHeight * 0.2,
                color: Colors.black,
                opacity: 0.8,
              ),
              BgGradientTheme(
                position: ShapePosition.topLeft,
                width: context.screenWidth * 0.2,
                height: context.screenHeight * 0.25,
                color: Colors.black,
                opacity: 0.3,
              ),
              BgGradientTheme(
                position: ShapePosition.topRight,
                width: context.screenWidth * 0.15,
                height: context.screenHeight * 0.25,
                color: Colors.black,
                opacity: 0.3,
              ),
              BgGradientTheme(
                position: ShapePosition.bottomLeft,
                width: context.screenWidth * 0.25,
                height: context.screenHeight * 0.3,
                color: Colors.black,
                opacity: 0.4,
              ),
              BgGradientTheme(
                position: ShapePosition.bottomRight,
                width: context.screenWidth * 0.15,
                height: context.screenHeight * 0.15,
                color: Colors.black,
                opacity: 0.4,
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 85, sigmaY: 85),
                child: Container(color: Colors.transparent),
              ),
              //      createMainMenuBackground(context), // Add this line

              /// Main Content
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: context.screenHeight * 0.07,
                      left: context.screenWidth * 0.025,
                      right: context.screenWidth * 0.025,
                    ),
                    child: const OnboardingHeader(isMainMenuOpen: true),
                  ),
                  SizedBox(height: context.screenHeight * 0.03),

                  // Scrollable Menu
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                          horizontal: context.screenWidth * 0.05),
                      child: Column(
                        children: [
                          /// --- CHAT ---

                          MenuItem(
                            color: _blueBox,
                            icon: "assets/MainMenu/message_chat.png",
                            title: L10n.of(context).chat,
                            menuIcon: "assets/MainMenu/chat_menu.png",
                            menuIconPadding: EdgeInsets.only(
                                left: context.screenWidth * 0.06),
                            onTap: () => context
                                .pushReplacement('/mainMenuScreen/rooms'),
                          ),

                          /// --- FINANCE REMOVED ---
                          MenuItem(
                            color: _blackBox,
                            icon: "assets/MainMenu/finance.png",
                            title: L10n.of(context).finance,
                            menuIcon: "assets/MainMenu/finance_menu.png",
                            menuIconPadding: EdgeInsets.only(left: context.percentWidth * 11),
                            onTap: (){
                              context.go('/mainMenuScreen/coming-soon',
                                  extra: {
                                    'feature': L10n.of(context).apps
                                  });
                            }
                          ),

                          /// --- APPS ---
                          if (!Platform.isIOS)

                            MenuItem(
                                color: _blueBox,
                                icon: "assets/MainMenu/apps.png",
                                title: L10n.of(context).apps,
                                menuIcon: "assets/MainMenu/app_menu.png",
                                menuIconPadding: EdgeInsets.only(
                                    left: context.screenWidth * 0.025),
                                onTap:
                                    //  () => FeatureAccessHelper.handleFeatureAccess(
                                    //   context: context,
                                    //   feature: FeatureType.apps,
                                    //   onAccessGranted: () {
                                    () {
                                  context.go('/mainMenuScreen/coming-soon',
                                      extra: {
                                        'feature': L10n.of(context).apps
                                      });
                                }
                                //  },
                                // ),
                                ),

                          /// --- MARKETPLACE ---
                          if (!Platform.isIOS)
                            MenuItem(
                                color: _blackBox,
                                icon: "assets/MainMenu/marketplace.png",
                                title: L10n.of(context).marketplace,
                                menuIcon:
                                    "assets/MainMenu/marketplace_menu.png",
                                menuIconPadding: const EdgeInsets.only(left: 0),
                                onTap: () {
                                  context.go('/mainMenuScreen/coming-soon',
                                      extra: {
                                        'feature': L10n.of(context).marketplace
                                      });
                                }
                                //() => FeatureAccessHelper.handleFeatureAccess(
                                // context: context,
                                //feature: FeatureType.marketplace,
                                //  onAccessGranted: () {

                                //  },
                                // ),
                                ),

                          /// --- COMMUNITY ---
                          if (!Platform.isIOS)
                            MenuItem(
                                color: _blueBox,
                                icon: "assets/MainMenu/community.png",
                                title: L10n.of(context).community,
                                menuIcon: "assets/MainMenu/community_menu.png",
                                menuIconPadding: const EdgeInsets.only(left: 0),
                                onTap: () {
                                  context.go('/mainMenuScreen/coming-soon',
                                      extra: {
                                        'feature': L10n.of(context).community
                                      });
                                }
                                //() => FeatureAccessHelper.handleFeatureAccess(
                                // context: context,
                                // feature: FeatureType.communities,
                                //onAccessGranted: () {

                                //},
                                // ),
                                ),

                          /// --- TOUR GUIDE ---
                          if (!Platform.isIOS)
                            MenuItem(
                              color: _blackBox,
                              icon: "assets/MainMenu/message.png",
                              title: L10n.of(context).tourGuide,
                              menuIcon: "assets/MainMenu/tourguide_menu.png",
                              onTap: () => context
                                  .go('/mainMenuScreen/coming-soon', extra: {
                                'feature': L10n.of(context).tourGuide
                              }),
                            ),

                          /// --- SETTINGS ---
                          MenuItem(
                            color: _blueBox,
                            icon: "assets/MainMenu/settings.png",
                            title: L10n.of(context).settings,
                            menuIcon: "assets/MainMenu/setting_app.png",
                            menuIconPadding: const EdgeInsets.only(left: 0),
                            onTap: () => context.pushReplacement('/settings'),
                          ),

                          /// --- LOGOUT ---
                          MenuItem(
                            color: _blackBox,
                            icon: "assets/MainMenu/logout.png",
                            title: L10n.of(context).logout,
                            menuIcon: "assets/MainMenu/logout_menu.png",
                            menuIconPadding: EdgeInsets.only(
                                left: context.screenWidth * 0.085),
                            iconHeight: context.screenWidth * 0.15,
                            iconWidth: context.screenWidth * 0.15,
                            onTap: () => logoutAction(context),
                          ),
                          SizedBox(height: context.screenHeight * 0.04),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
