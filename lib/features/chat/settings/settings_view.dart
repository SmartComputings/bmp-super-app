import 'dart:io';
import 'dart:ui';

import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/Screens/OnBoardingScreen/widgets/DynamicHeader.dart';
import 'package:bmp/features/auth_onboarding/widgets/CountryDropdown.dart';
import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/bg_gradient_theme.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/constants/position_constants.dart';
import 'package:bmp/shared/widgets/avatar.dart';
import 'package:bmp/shared/widgets/hide_keyboard.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:bmp/shared/widgets/mxc_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:matrix/matrix.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:bmp/shared/widgets/qr_code_viewer.dart';

import '../chat_list/eula_dialog.dart';
import '../../../core/config/default_user_service.dart';
import 'settings.dart';

class SettingsView extends StatelessWidget {
  final SettingsController controller;

  const SettingsView(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final showChatBackupBanner = controller.showChatBackupBanner;
    final activeRoute =
        GoRouter.of(context).routeInformationProvider.value.uri.path;
    final accountManageUrl = Matrix.of(context)
        .client
        .wellKnown
        ?.additionalProperties
        .tryGetMap<String, Object?>('org.matrix.msc2965.authentication')
        ?.tryGet<String>('account');

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return HideKeyboardOnOutsideTap(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            // Background from wallet dashboard
            Positioned.fill(
              child: IgnorePointer(
                child: Container(
                  color: const Color(0xFF1B1C30),
                  child: Stack(
                    children: [
                      BgGradientTheme(
                        position: ShapePosition.center,
                        width: screenWidth * 1.8,
                        height: screenWidth * 1.8,
                        color: const Color(0xFF363EC1),
                        opacity: 0.6,
                      ),
                      BgGradientTheme(
                        position: ShapePosition.bottomFull,
                        height: screenHeight * 0.37,
                        colors: const [Color(0xFF1B1C30), Color(0xFFA912BF)],
                        opacity: 0.8,
                      ),
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 85, sigmaY: 85),
                        child: Container(color: Colors.transparent),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  SizedBox(height: context.percentHeight * 4),
                  // Header from wallet dashboard
                  const DynamicHeader(isInSettings: true),
                  Padding(
                    padding: EdgeInsets.all(context.screenWidth * 0.04),
                    child: _buildProfileCard(context),
                  ),
                  SizedBox(height: context.screenHeight * 0.006),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildQuickAccess(context),
                          SizedBox(height: context.screenHeight * 0.025),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: context.screenWidth * 0.04,
                            ),
                            child: _buildSettingsList(
                              context,
                              activeRoute,
                              accountManageUrl,
                              showChatBackupBanner,
                            ),
                          ),
                          SizedBox(height: context.screenHeight * 0.05),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context) {
    return FutureBuilder<Profile>(
      future: controller.profileFuture,
      builder: (context, snapshot) {
        final profile = snapshot.data;
        final avatar = profile?.avatarUrl;
        final mxid = Matrix.of(context).client.userID ?? L10n.of(context).user;
        // Use local display name if available, otherwise fall back to profile data
        final displayname = controller.localDisplayName ??
            profile?.displayName ??
            mxid.localpart ??
            mxid;

        return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.screenWidth * 0.032,
            ),
          child: Card(
            elevation: context.screenWidth * 0.013,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(context.screenWidth * 0.032)
          ),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: context.screenWidth * 0.059,
                vertical: context.screenHeight * 0.02,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF44229B),
                borderRadius: BorderRadius.circular(context.screenWidth * 0.032),
              ),
              child: Row(
                children: [
                  Stack(
                    children: [
                      Avatar(
                        mxContent: avatar,
                        name: displayname,
                        size: context.screenWidth * 0.16,
                        onTap: avatar != null
                            ? () => showDialog(
                                  context: context,
                                  useRootNavigator: false,
                                  barrierDismissible: true,
                                  builder: (dialogContext) => MxcImageViewer(avatar),
                                )
                            : null,
                      ),
                      if (profile != null)
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: controller.setAvatarAction,
                            child: Container(
                              width: context.screenWidth * 0.053,
                              height: context.screenWidth * 0.053,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xFF44229B),
                                  width: context.screenWidth * 0.0053,
                                ),
                              ),
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: const Color(0xFF44229B),
                                size: context.screenWidth * 0.032,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(width: context.screenWidth * 0.043),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: controller.setDisplaynameAction,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                displayname,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: context.screenWidth * 0.035,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: context.screenWidth * 0.021),
                              Container(
                                height: context.screenHeight * 0.04,
                                width: context.screenWidth * 0.1,
                                decoration: BoxDecoration(
                                  color: const Color(0x7F050926),
                                  borderRadius: BorderRadius.circular(context.screenWidth * 0.027),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(context.screenWidth * 0.021),
                                  child: SvgPicture.asset(
                                   'assets/images/svg/edit-2.svg',
                                    colorFilter: const ColorFilter.mode(
                                      Colors.white,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                           
                            ],
                          ),
                        ),
                      
                        Text(
                          '@${mxid.localpart}',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: context.screenWidth * 0.032,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildQuickAccess(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            L10n.of(context).quickAccess,
            style: TextStyle(
              color: Colors.white,
              fontSize: context.screenWidth * 0.04,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: context.screenHeight * 0.006),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder<Profile>(
                future: controller.profileFuture,
                builder: (context, snapshot) {
                  final profile = snapshot.data;
                  final avatar = profile?.avatarUrl;
                  final mxid =
                      Matrix.of(context).client.userID ?? L10n.of(context).user;
                  final displayname =
                      profile?.displayName ?? mxid.localpart ?? mxid;

                  // Convert Matrix avatar URL to HTTP URL if needed
                  String? imageUrl;
                  if (avatar != null) {
                    final avatarStr = avatar.toString();
                    if (avatarStr.startsWith('http')) {
                      imageUrl = avatarStr;
                    } else if (avatarStr.startsWith('mxc://')) {
                      // Convert MXC URL to HTTP URL using Matrix client
                      imageUrl = Matrix.of(context)
                                  .client
                                  .homeserver
                                  ?.toString() !=
                              null
                          ? '${Matrix.of(context).client.homeserver}/_matrix/media/r0/download/${avatarStr.substring(6)}'
                          : null;
                    }
                  }

                  return _buildQuickAccessItem(
                    context: context,
                    backgroundcolor: const Color.fromARGB(255, 0, 17, 252),
                    imagepath: ImageAssets.qrCode,
                    label: L10n.of(context).qr,
                    onTap: () => showQrCodeViewer(
                      context,
                      mxid,
                      name: displayname,
                      subtitle: L10n.of(context).qr,
                      avatarUrl: imageUrl,
                    ),
                  );
                },
              ),
              SizedBox(width: context.screenWidth * 0.053),
              _buildQuickAccessItem(
                imagepath: ImageAssets.card,
                context: context,
                backgroundcolor: Color(0xFF5F18BF),
                label: L10n.of(context).cards,
                onTap: () {},
              ),
            ],
          ),
          SizedBox(
            height: context.screenHeight * 0.01,
          ),
          Container(
            height: context.screenHeight * 0.001,
            color: const Color(0xFF1B1C30),
          )
        ],
      ),
    );
  }

  Widget _buildQuickAccessItem({
    required BuildContext context,
    required String imagepath,
    required String label,
    required VoidCallback onTap,
    required Color backgroundcolor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: context.screenWidth * 0.18,
            height: context.screenHeight * 0.1,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: backgroundcolor.withOpacity(0.8),
              boxShadow: [
                BoxShadow(
                  color: backgroundcolor.withValues(alpha: 0.5),
                  spreadRadius: 2,
                  blurRadius: 5
                )
              ]
            ),
            child: Padding(
              padding: EdgeInsets.all(context.screenWidth * 0.05),
              child: SvgPicture.asset(
                imagepath,
                width: context.screenWidth * 0.06,
                height: context.screenHeight * 0.06,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: context.screenWidth * 0.03,
              fontFamily: 'Neometric',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsList(
    BuildContext context,
    String activeRoute,
    String? accountManageUrl,
    bool? showChatBackupBanner,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            L10n.of(context).settings,
            style: TextStyle(
              color: Colors.white,
              fontSize: context.screenWidth * 0.035,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: context.screenHeight * 0.015),
          Column(
            children: [
                // _buildSettingsItem(
                //   icon: Icons.account_circle_outlined,
                //   title: 'Manage account',
                //   onTap: () => context.go('/rooms/wallet/manage-account'),
                // ),
              if (!DefaultUserService.instance.isDefaultUser)
                _buildSettingsItem(
                  context: context,
                  icon: Icons.credit_card,
                  title: 'Subscription',
                  onTap: () => context
                      .push('/mainMenuScreen/rooms/settings/subscription'),
                ),
                _buildSettingsItem(
                  context: context,
                  icon: Icons.shield,
                  title: L10n.of(context).privacy,
                  onTap: () =>
                      context.push('/mainMenuScreen/rooms/settings/security'),
                ),
                _buildSettingsItem(
                  context: context,
                  icon: Icons.description,
                  title: 'Terms & Conditions',
                  onTap: () => showChatEulaDialog(
                    context: context,
                    isReadOnly: true,
                  ),
                ),
                _buildSettingsItem(
                  context: context,
                  icon: Icons.notifications,
                  title: L10n.of(context).notification,
                  onTap: () => context
                      .push('/mainMenuScreen/rooms/settings/notifications'),
                ),
                _buildSettingsItem(
                  context: context,
                  icon: Icons.forum,
                  title: L10n.of(context).chats,
                  onTap: () =>
                      context.push('/mainMenuScreen/rooms/settings/chat'),
                ),

                // _buildSettingsItem(
                //   icon: Icons.language,
                //   title: 'Country/Region',
                //   onTap: () {},
                // ),
                // _buildSettingsItem(
                //   icon: Icons.accessibility,
                //   title: 'Accessibility',
                //   onTap: () {},
                // ),
                _buildSettingsItem(
                  context: context,
                  icon: Icons.language,
                  title: L10n.of(context).changeLanguageTitle,
                  onTap: () => _showCountrySelectionDialog(context),
                ),
                // _buildSettingsItem(
                //   icon: Icons.format_paint_outlined,
                //   title: L10n.of(context).changeTheme,
                //   onTap: () => context.go('/mainMenuScreen/rooms/settings/style'),
                // ),
                _buildSettingsItem(
                  context: context,
                  icon: Icons.devices,
                  title: L10n.of(context).devices,
                  onTap: () =>
                      context.push('/mainMenuScreen/rooms/settings/devices'),
                ),
                if (showChatBackupBanner == null)
                  _buildSettingsItem(
                    context: context,
                    icon: Icons.backup,
                    title: L10n.of(context).chatBackup,
                    onTap: () {},
                  )
                else
                  _buildSettingsItemWithSwitch(
                    context: context,
                    icon: Icons.backup,
                    title: L10n.of(context).chatBackup,
                    value: controller.showChatBackupBanner == false,
                    onChanged: controller.firstRunBootstrapAction,
                  ),
                _buildSettingsItem(
                  context: context,
                  icon: Icons.delete,
                  title: L10n.of(context).blockedUsers,
                  onTap: () => context.push(
                      '/mainMenuScreen/rooms/settings/security/userBlockedList'),
                ),
              // if(!Platform.isIOS)
              if (DefaultUserService.instance.isDefaultUser)
                _buildSettingsItem(
                  context: context,
                  icon: Icons.delete_outline,
                  title: L10n.of(context).deleteAccount,
                  onTap: controller.deleteAccountAction,
                  isDestructive: true,
                ),
                _buildSettingsItem(
                  context: context,
                  icon: Icons.logout,
                  title: L10n.of(context).logout,
                  onTap: controller.logoutActionPerform,
                ),
                GestureDetector(
                  onTap: () => controller.onVersionTap(context),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: context.screenHeight * 0.012,
                    ),
                    child: FutureBuilder<PackageInfo>(
                      future: PackageInfo.fromPlatform(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Center(
                            child: Text(
                              '${L10n.of(context).version} ${snapshot.data!.version}+${snapshot.data!.buildNumber}',
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.6),
                                fontSize: context.screenWidth * 0.037,
                              ),
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ),
              ],
            ),
          
        ],
      ),
    );
  }

  Widget _buildSettingsItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: context.screenHeight * 0.01),
      child: Material(
        color: const Color(0x7F050926).withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(context.screenWidth * 0.048),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(context.screenWidth * 0.048),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: context.screenWidth * 0.055,
                vertical: context.screenHeight * 0.025),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0x7F050926),
                  radius: context.screenWidth * 0.045,
                  child: Center(
                    child: Icon(
                      icon,
                      color: isDestructive ? Colors.red : Colors.white,
                      size: context.screenWidth * 0.05,
                    ),
                  ),
                ),
                SizedBox(width: context.screenWidth * 0.043),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: isDestructive ? Colors.red : Colors.white,
                      fontSize: context.screenWidth * 0.032,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showCountrySelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF2A1B5C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(context.screenWidth * 0.043),
          ),
          title: Text(
            L10n.of(context).selectLanguage,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: context.screenWidth * 0.045,
            ),
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: CountryDropdown(
              onChanged: (country) {
                print('Country changed to: ${country.name} ${country.flag}');
                Navigator.of(context).pop();
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildSettingsItemWithSwitch({
    required BuildContext context,
    required IconData icon,
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: context.screenHeight * 0.01),
      child: Material(
        color:  const Color(0x7F050926).withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(context.screenWidth * 0.048),
        child: Padding(
          padding: EdgeInsets.symmetric(
               horizontal: context.screenWidth * 0.055,
                vertical: context.screenHeight * 0.025),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: context.screenWidth * 0.06,
              ),
              SizedBox(width: context.screenWidth * 0.043),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                     color: Colors
                          .white /* Implementation-Neutral-Background-System */,
                      fontSize: context.screenWidth * 0.032,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Switch(
                value: value,
                onChanged: onChanged,
                activeTrackColor: Colors.green,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.grey[300],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
