import 'dart:ui';

import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/Screens/OnBoardingScreen/widgets/circular_icon_widget.dart';
import 'package:bmp/features/chat/new_private_chat/new_private_chat.dart';
import 'package:bmp/shared/utils/app_loading_widget.dart';
import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/bg_gradient_theme.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/constants/position_constants.dart';
import 'package:bmp/shared/widgets/avatar.dart';
import 'package:bmp/shared/widgets/keyboard_dismissible_popscope.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:bmp/shared/widgets/qr_code_viewer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matrix/matrix.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../contacts_screen/contacts_screen.dart';

class NewPrivateChatView extends StatelessWidget {
  final NewPrivateChatController controller;

  const NewPrivateChatView(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final searchResponse = controller.searchResponse;
    final userId = Matrix.of(context).client.userID!;

    return KeyboardDismissiblePopScope(
      focusNodes: [controller.textFieldFocus],
        child: Scaffold(
          resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
           Positioned.fill(
              child: Container(
                color: const Color(0xFF1B1C30),
              ),
            ),
            BgGradientTheme(
              position: ShapePosition.center,
              width: context.screenWidth * 1.8,
              height: context.screenHeight * 0.85,
              color: const Color(0xFF4754FF),
              opacity: 0.6,
            ),
             BgGradientTheme(
              position: ShapePosition.center,
              width: context.screenWidth * 0.65,
              height: context.screenHeight * 0.7,
              color: const Color(0xFF4754FF),
              opacity: 0.8,
            ),
            BgGradientTheme(
              position: ShapePosition.bottomRight,
              height: context.screenHeight * 0.33,
              width: context.screenWidth*0.65,
              
              colors: const [Color(0xFF1B1C30), Color(0xFFA912BF)],
              opacity: 0.9,
            ), BgGradientTheme(
              position: ShapePosition.center,
              width: context.screenWidth * 0.65,
              height: context.screenHeight * 0.65,
              color: const Color(0xFF4754FF),
              opacity: 0.8,
            ),
            BgGradientTheme(
              position: ShapePosition.bottomLeft,
              height: context.screenHeight * 0.25,
              width: context.screenWidth*0.2,
              color: const Color.fromARGB(255, 0, 0, 0),
              opacity: 0.8,
            ),
            BgGradientTheme(
              position: ShapePosition.bottomRight,
              height: context.screenHeight * 0.19,
              color: const Color(0xFF1B1C30),
              opacity: 0.8,
            ),
            BgGradientTheme(
              position: ShapePosition.bottomCenter,
              height: context.screenHeight * 0.12,
              color: const Color(0xFF1B1C30),
              opacity: 0.8,
            ),
            BgGradientTheme(
              position: ShapePosition.topLeft,
              width: context.screenWidth * 0.4,
              height: context.screenHeight * 0.25,
              color: Colors.black,
              opacity: 0.5,
            ),
            BgGradientTheme(
              position: ShapePosition.topRight,
            width: context.screenWidth * 0.4,
              height: context.screenHeight * 0.25,
              color: Colors.black,
              opacity: 0.5,
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 85, sigmaY: 85),
                child: Container(color: Colors.transparent),
              ),
            ),
          Positioned.fill(
            child: Opacity(
              opacity: 0.6,
              child: Image.asset(
                'assets/chat_icons/patron 1.png',
                fit: BoxFit.cover,
                color: const Color(0xFF7216BF),
                colorBlendMode: BlendMode.modulate,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: context.screenHeight * 0.0125),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.04),
                  padding: EdgeInsets.all(context.screenWidth * 0.04),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: const Color(0xff131EBF).withValues(alpha: 0.5),
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: Color(0xFF131EBF),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => context.pop(),
                            child: Image.asset(
                              ImageAssets.arrowLeft,
                              height: context.screenWidth * 0.1,
                              width: context.screenWidth * 0.1,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              L10n.of(context).newMessage,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: context.screenWidth * 0.04,
                                fontFamily: 'Neometric',
                                fontWeight: FontWeight.w700,
                                height: 1.1875,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                          SizedBox(width: context.screenWidth * 0.06),
                        ],
                      ),
                      SizedBox(height: context.screenHeight * 0.02),
                      Container(
                        width: double.infinity,
                        height: context.screenHeight * 0.06,
                        padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.04),
                        decoration: ShapeDecoration(
                          color: const Color(0xff050926).withOpacity(0.5),
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                          ),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/icons/search-normal (1).png',
                              width: context.screenWidth * 0.04,
                              height: context.screenWidth * 0.04,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: context.screenWidth * 0.025),
                            Expanded(
                              child: Material(
                                color: Colors.transparent,
                                child: TextField(
                                  controller: controller.controller,
                                  focusNode: controller.textFieldFocus,
                                  onChanged: controller.searchUsers,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: L10n.of(context).searchUsers,
                                    hintStyle: TextStyle(
                                      color:
                                          Colors.white.withValues(alpha: 0.64),
                                      fontSize: context.screenWidth * 0.035,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.zero,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: context.screenHeight * 0.02),
                Expanded(
                  child: searchResponse == null
                      ? _buildDefaultView(context, userId, theme)
                      : _buildSearchResults(context, theme, searchResponse),
                ),
              ],
            ),
          ),
        ],
      ),
      // bottomNavigationBar: Container(
      //   padding:
      //       EdgeInsets.only(bottom: bottomPadding > 0 ? bottomPadding : 16),
      //   child: Container(
      //     margin: EdgeInsets.fromLTRB(
      //       screenWidth * 0.05,
      //       0,
      //       screenWidth * 0.05,
      //       19.81,
      //     ),
      //     child: Stack(
      //       clipBehavior: Clip.none,
      //       children: [
      //         Container(
      //           height: screenHeight * 0.075,
      //           decoration: BoxDecoration(
      //             color: AppColors.bottomNavBarBg,
      //             borderRadius: BorderRadius.circular(35),
      //             boxShadow: [
      //               BoxShadow(
      //                 color: Colors.black.withOpacity(0.3),
      //                 blurRadius: 15,
      //                 offset: const Offset(0, 5),
      //               ),
      //             ],
      //           ),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //             children: [
      //               GestureDetector(
      //                 onTap: () => context.go('/rooms'),
      //                 child: Row(
      //                   children: [
      //                     Image.asset(
      //                       ImageAssets.chatDetailsMessage,
      //                       width: screenWidth * 0.06,
      //                       height: screenWidth * 0.06,
      //                     ),
      //                     const SizedBox(width: 8),
      //                     const Text(
      //                       'Chats',
      //                       style: TextStyle(
      //                         color: Colors.white54,
      //                         fontSize: 14,
      //                         fontWeight: FontWeight.w400,
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //               const SizedBox(width: 56),
      //               GestureDetector(
      //                 onTap: () {},
      //                 child: Row(
      //                   children: [
      //                     Image.asset(
      //                       ImageAssets.chatcall,
      //                       width: screenWidth * 0.06,
      //                       height: screenWidth * 0.06,
      //                     ),
      //                     const SizedBox(width: 8),
      //                     const Text(
      //                       'Calls',
      //                       style: TextStyle(
      //                         color: Colors.white54,
      //                         fontSize: 14,
      //                         fontWeight: FontWeight.w400,
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //         Positioned(
      //           top: -screenHeight * 0.025,
      //           left: 0,
      //           right: 0,
      //           child: Center(
      //             child: Container(
      //               width: screenHeight * 0.075,
      //               height: screenHeight * 0.075,
      //               decoration: const BoxDecoration(
      //                 shape: BoxShape.circle,
      //                 color: Color(0xFF3976F8),
      //               ),
      //               child: Center(
      //                 child: Image.asset(
      //                   "assets/chat_icons/add-square.png",
      //                   height: 29.32,
      //                   width: 29.32,
      //                   color: Colors.white,
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    ),);
  }

  Widget _buildDefaultView(
    BuildContext context,
    String userId,
    ThemeData theme,
  ) {
    return ListView(
      padding: EdgeInsets.all(context.screenWidth * 0.04),
      children: [
        Text(
          L10n.of(context)
              .yourGlobalUsernameIs(userId.split(':')[0].substring(1)),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white70,
            fontSize: context.screenWidth * 0.035,
            fontFamily: 'Montserrat',
            decoration: TextDecoration.none,
          ),
        ),
        SizedBox(height: context.screenHeight * 0.025),
        _buildActionCard(
          context: context,
          icon: 'assets/icons/personalcard.png',
          title: L10n.of(context).contacts,
          subtitle: L10n.of(context).selectFromYourContacts,
          circleColor: const Color(0xFF3976F8),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ContactsScreen()),
          ),
        ),
        SizedBox(height: context.screenHeight * 0.0125),
        _buildActionCard(
          context: context,
          icon: 'assets/chat_icons/link.png',
          title: L10n.of(context).invitationLink,
          subtitle: L10n.of(context).sendLinkToChat,
          circleColor: const Color(0xFF3976F8),
          onTap: controller.inviteAction,
        ),
        SizedBox(height: context.screenHeight * 0.0125),
        _buildActionCard(
          context: context,
          icon: 'assets/chat_icons/people.png',
          title: L10n.of(context).createGroup,
          subtitle: L10n.of(context).createGroupChat,
          circleColor: const Color(0xFF5F18BF),
          onTap: () => context.go('/mainMenuScreen/rooms/newgroup'),
        ),
        SizedBox(height: context.screenHeight * 0.0125),
        _buildActionCard(
          context: context,
          icon: 'assets/icons/QR.png',
          title: L10n.of(context).scanQR,
          subtitle: L10n.of(context).scanQRCode,
          circleColor: const Color(0xFFEF5DA8),
          onTap: () => showQrCodeViewer(
            context,
            userId,
            name: userId.split(':')[0].substring(1),
          ),
          // onTap: controller.openScannerAction,
        ),
        SizedBox(height: context.screenHeight * 0.025),
        Center(
          child: GestureDetector(
            onTap: () => showQrCodeViewer(
              context,
              userId,
              name: userId.split(':')[0].substring(1),
            ),
            child: Container(
              padding: EdgeInsets.all(context.screenWidth * 0.04),
              decoration: BoxDecoration(
                color: const Color(0xff1B1C30),
                borderRadius: BorderRadius.circular(context.screenWidth * 0.04),
                // border: Border.all(color: const Color(0xFF5F18BF), width: 3),
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: context.screenWidth * 0.5),
                child: PrettyQrView.data(
                  data: 'https://server.be-mindpower.net/#/$userId',
                  decoration: PrettyQrDecoration(
                    shape: PrettyQrSmoothSymbol(
                      roundFactor: 1,
                      color: const Color(0xFFffffff),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionCard({
    required BuildContext context,
    required String icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    required Color circleColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(context.screenWidth * 0.04),
        decoration: BoxDecoration(
          color: const Color(0xff050926).withOpacity(0.5),
          borderRadius: BorderRadius.circular(context.screenWidth * 0.075),
          border: Border.all(
            color: const Color(0xFF5F18BF).withOpacity(0.3),
            width: context.screenWidth * 0.0025,
          ),
        ),
        child: Row(
          children: [
            CircularIconWidget(
              color: circleColor,
              size: context.screenWidth * 0.175,
              iconSize: context.screenWidth * 0.0875,
              icon: Image.asset(
                icon,
                color: Colors.white,
                width: context.screenWidth * 0.0875,
                height: context.screenWidth * 0.0875,
              ),
            ),
            SizedBox(width: context.screenWidth * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: context.screenWidth * 0.04,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  SizedBox(height: context.screenHeight * 0.005),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: context.screenWidth * 0.035,
                      fontFamily: 'Montserrat',
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: context.screenHeight * 0.0375,
              width: context.screenWidth * 0.116,
              decoration: BoxDecoration(
                color: const Color(0xff050926).withOpacity(0.5),
                borderRadius: BorderRadius.all(Radius.circular(context.screenWidth * 0.04)),
              ),
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: context.screenWidth * 0.04,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchResults(
    BuildContext context,
    ThemeData theme,
    Future<List<Profile>>? searchResponse,
  ) {
    return FutureBuilder<List<Profile>>(
      future: searchResponse,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const AppLoadingWidget();
        }

        if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, color: Colors.red, size: 64),
                const SizedBox(height: 16),
                Text(
                  L10n.of(context).errorSearchingUsers,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => controller.searchUsers(),
                  child: Text(L10n.of(context).tryAgain),
                ),
              ],
            ),
          );
        }

        final results = snapshot.data ?? [];

        if (results.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.search_off, color: Colors.white54, size: 64),
                const SizedBox(height: 16),
                Text(
                  L10n.of(context).noUsersFound,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ],
            ),
          );
        }

        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.04, vertical: context.screenHeight * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    L10n.of(context).contacts,
                    style: TextStyle(
                      color: const Color(0xFFF3F7F8),
                      fontSize: context.screenWidth * 0.04,
                      fontFamily: 'Neometric',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        L10n.of(context).filter,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: context.screenWidth * 0.035,
                          fontFamily: 'Work Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.04),
                itemCount: results.length,
                itemBuilder: (context, index) {
                  final user = results[index];
                  final isEven = index % 2 == 0;
                  return Container(
                    margin: EdgeInsets.only(bottom: context.screenHeight * 0.0075),
                    decoration: ShapeDecoration(
                      color: const Color(0xFF3976F8),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: context.screenWidth * 0.0025,
                          color: const Color(0xFF2A2F35),
                        ),
                        borderRadius: BorderRadius.circular(context.screenWidth * 0.045),
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => controller.openUserModal(user),
                        borderRadius: BorderRadius.circular(context.screenWidth * 0.045),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: context.screenWidth * 0.04,
                            vertical: context.screenHeight * 0.0175,
                          ),
                          decoration: ShapeDecoration(
                            color: isEven
                                ? const Color(0xFF1F2166)
                                : const Color(0xF2252844),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(context.screenWidth * 0.045),
                            ),
                          ),
                          child: Row(
                            children: [
                              Avatar(
                                mxContent: user.avatarUrl,
                                name: user.displayName ?? user.userId,
                                size: context.screenWidth * 0.12,
                              ),
                              SizedBox(width: context.screenWidth * 0.03),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      user.displayName ??
                                          user.userId
                                              .split(':')[0]
                                              .substring(1),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: context.screenWidth * 0.04,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(height: context.screenHeight * 0.005),
                                    Text(
                                      '@${user.userId.split(':')[0].substring(1)}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: context.screenWidth * 0.03,
                                        fontFamily: 'Work Sans',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
