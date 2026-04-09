import 'package:bmp/core/constant/app_colors.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/chat/main_menu/main_menu_overlay.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:bmp/shared/utils/logout_action.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/widgets/back_button.dart';
import 'package:bmp/shared/widgets/circle_icon_widget.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SettingsAction {
  mycard,
  settings,
  myBank,
  support,
  home,
  logout,
}

class DynamicHeader extends StatefulWidget {
  final bool isInSettings;
  final bool isInNotifications;
  final bool isInSupport;
  final GestureTapCallback? onTapBack;
  final Widget? child;
  final bool hideSupport;

  const DynamicHeader({
    super.key,
    this.isInSettings = false,
    this.isInNotifications = false,
    this.isInSupport=false,
    this.onTapBack,
    this.child,
    this.hideSupport = false,
  });

  @override
  State<DynamicHeader> createState() => _DynamicHeaderState();
}

class _DynamicHeaderState extends State<DynamicHeader> {
  String? _cachedRoute;
  bool? _cachedIsInSettings;
  bool? _cachedIsInNotifications;
  bool? _cachedIsInHome;
  bool? _cachedIsInSupport;

  String? get _currentRoute {
    if (_cachedRoute != null) return _cachedRoute;
    try {
      _cachedRoute =
          GoRouter.of(context).routeInformationProvider.value.uri.path;
      return _cachedRoute;
    } catch (e) {
      return null;
    }
  }

  bool get _isInSettings {
    if (widget.isInSettings) return true;
    if (_cachedIsInSettings != null) return _cachedIsInSettings!;

    final route = _currentRoute;
    if (route == null) return false;

    _cachedIsInSettings = route == '/settings' ||
        (route.startsWith('/rooms/settings') &&
            !route.contains('/notifications'));
    return _cachedIsInSettings!;
  }

  bool get _isInNotifications {
    if (widget.isInNotifications) return true;
    if (_cachedIsInNotifications != null) return _cachedIsInNotifications!;

    final route = _currentRoute;
    if (route == null) return false;

    _cachedIsInNotifications = route.contains('/notifications');
    return _cachedIsInNotifications!;
  }

  bool get _isInHome {
    if (_cachedIsInHome != null) return _cachedIsInHome!;

    final route = _currentRoute;
    if (route == null) return false;

    _cachedIsInHome = route == '/rooms' ||
        route.startsWith('/rooms/') &&
            !route.contains('/settings') &&
            !route.contains('/notifications') &&
            !route.contains('/manage-account');
    return _cachedIsInHome!;
  }

  bool get _isInSupport {
    print('🔍 _isInSupport check - widget.isInSupport: ${widget.isInSupport}');
    if (widget.isInSupport) return true;
    final route = _currentRoute;
    print('🔍 _isInSupport check - route: $route');
    if (route == null) return false;
    final result = route.contains('/support');
    print('🔍 _isInSupport check - result: $result');
    return result;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Clear cache when dependencies change
    _cachedRoute = null;
    _cachedIsInSettings = null;
    _cachedIsInNotifications = null;
    _cachedIsInHome = null;
    _cachedIsInSupport = null;
  }

  void _handleMenuAction(SettingsAction action, BuildContext context) async {
    final isLoggedIn = Matrix.of(context).widget.clients.any((c) => c.isLogged());
    if (!isLoggedIn) return;

    print('🍔 Menu Action: $action');

    switch (action) {
      case SettingsAction.mycard:
        context.push('/onboarding/coming-soon/Wallet');
        break;
      case SettingsAction.settings:
        context.push('/mainMenuScreen/settings');
        break;
      case SettingsAction.support:
        context.push('/mainMenuScreen/support');
        break;
      case SettingsAction.myBank:
        context.push('/onboarding/coming-soon/Wallet');
        break;
      case SettingsAction.home:
        context.go('/mainMenuScreen');
        break;
      case SettingsAction.logout:
        logoutAction(context);

        break;
    }
  }

  /// Shows the MainMenuScreen as a full-screen overlay
  void _showMainMenuOverlay(BuildContext context) {
    showMainMenuOverlay(context);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Clear route cache on every build to get fresh route info
    _cachedRoute = null;

    return Container(
      padding: EdgeInsets.all(
        context.percentWidth * 1.25,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: context.percentWidth * 4,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.percentWidth * 2),
        color: AppColors.dynamicHeaderBg.withValues(alpha: 0.5),
        border: Border.all(
          color: AppColors.dynamicHeaderBg,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              screenWidth * 0.025,
              screenHeight * 0.01,
              screenWidth * 0.025,
              screenHeight * 0.01,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      BackButtonWidget(
                        onTap: widget.onTapBack ??
                                () {
                              print('Back arrow pressed!');
                              if (Navigator.of(context).canPop()) {
                                Navigator.of(context).pop();
                                print('Navigating back');
                              } else {
                                context.go('/mainMenuScreen');
                                print(
                                  'No route to pop, going to OnBoardingScreen Ch at slide',
                                );
                              }
                            },
                      ),
                      SizedBox(width: context.percentWidth * 2),
                      SvgPicture.asset(
                        ImageAssets.beMindPowerLogo,
                        height: context.percentHeight * 3.5,
                        width: context.percentWidth * 1,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: context.percentWidth * 2),
                Row(
                  children: [
                    CircleIconWidget(
                      onTap: () {
                        print('🔘 Support button tapped');
                        final isLoggedIn = Matrix.of(context).widget.clients.any((c) => c.isLogged());
                        if (!isLoggedIn) {
                          print('⛔ User not logged in');
                          return;
                        }
                        print('🔍 _isInSupport value: $_isInSupport');
                        if (_isInSupport) {
                          print('⛔ Already in support, blocking navigation');
                          return;
                        }
                        print('✅ Navigating to support');
                        context.push('/mainMenuScreen/support');
                      },
                      icon: ImageAssets.icMessageQuestion,
                      selected: _isInSupport,
                      size: context.percentHeight * 4.5,
                    ),
                    SizedBox(width: screenWidth * 0.0075),
                    CircleIconWidget(
                      onTap: () {
                        final isLoggedIn = Matrix.of(context).widget.clients.any((c) => c.isLogged());
                        if (!isLoggedIn) return;
                        if (_isInSettings) return;
                        context.push('/settings');
                      },
                      icon: ImageAssets.profileIcon,
                      selected: _isInSettings,
                      size: context.percentHeight * 4.5,
                    ),
                    SizedBox(width: context.percentWidth * 1.5),
                    CircleIconWidget(
                      onTap: () {
                        final isLoggedIn = Matrix.of(context).widget.clients.any((c) => c.isLogged());
                        if (!isLoggedIn) return;
                        if (_isInNotifications) return;
                        context.push('/settings/notifications');
                      },
                      icon: ImageAssets.icNotification,
                      selected: _isInNotifications,
                      size: context.percentHeight * 4.5,
                    ),
                    SizedBox(width: context.percentWidth * 1.5),
                    GestureDetector(
                      onTap: () {
                        final isLoggedIn = Matrix.of(context).widget.clients.any((c) => c.isLogged());
                        if (!isLoggedIn) return;
                        _showMainMenuOverlay(context);
                      },
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
              ],
            ),
          ),
          widget.child ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
