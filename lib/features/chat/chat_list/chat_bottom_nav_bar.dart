import 'dart:ui';

import 'package:badges/badges.dart' as badges;
import 'package:bmp/core/constant/app_colors.dart';
import 'package:bmp/features/chat/chat_list/chat_list.dart';
import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/bg_gradient_theme.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/constants/position_constants.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matrix/matrix.dart';

import '../../../core/localization/l10n.dart';
import '../dialer/widgets/call_history/calls_history_screen.dart';

class ChatBottomNavBar extends StatefulWidget {
  final ChatListController? controller;

  const ChatBottomNavBar({super.key, this.controller});

  @override
  State<ChatBottomNavBar> createState() => _ChatBottomNavBarState();
}

class _ChatBottomNavBarState extends State<ChatBottomNavBar>
    with SingleTickerProviderStateMixin {
  int _selectedTab = 0;
  final GlobalKey<ChatListController> _chatListKey =
      GlobalKey<ChatListController>();
  
  ChatListController? get _controller => _chatListKey.currentState;
  // late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    // animationController = AnimationController(
    //   duration: const Duration(milliseconds: 300),
    //   vsync: this,
    // );
  }

  @override
  void dispose() {
    // animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom;
    return Container(
    // return BackButtonListener(
      // onBackButtonPressed: () async {
      //   final keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
      //   if (keyboardOpen) {
      //     FocusManager.instance.primaryFocus?.unfocus();
      //
      //   }
      //
      //   else{
      //     if (Navigator.of(context).canPop()) {
      //       Navigator.of(context).pop();
      //     } else {
      //       context.go('/mainMenuScreen');
      //     }
      //   }
      //   return true;
      // },
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
              color: const Color.fromARGB(155, 71, 83, 255),
              opacity: 0.6,
            ),
             BgGradientTheme(
              position: ShapePosition.center,
              width: context.screenWidth * 0.65,
              height: context.screenHeight * 0.7,
              color: const Color.fromARGB(146, 71, 83, 255),
              opacity: 0.8,
            ),
            BgGradientTheme(
              position: ShapePosition.bottomRight,
              height: context.screenHeight * 0.4,
              width: context.screenWidth*0.65,

              colors: const [Color.fromARGB(193, 168, 18, 191), Color.fromARGB(204, 168, 18, 191)],
              opacity: 0.6,
            ), BgGradientTheme(
              position: ShapePosition.center,
              width: context.screenWidth * 0.65,
              height: context.screenHeight * 0.65,
              color: const Color.fromARGB(172, 71, 83, 255),
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
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(color:Color.fromARGB(55, 23, 32, 154)),
              ),
            ),
            IndexedStack(
              index: _selectedTab,
              children: [
                ChatList(
                  key: _chatListKey,
                  activeChat: null,
                ),
                const CallsScreen(),
              ],
            ),
            Positioned(
              bottom: bottomPadding > 0 ? bottomPadding + 0 : 0,
              left: context.screenWidth * 0.05,
              right: context.screenWidth * 0.05,
              child: Container(
                margin: EdgeInsets.only(bottom: context.screenHeight * 0.005),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: context.screenHeight * 0.075,
                      decoration: BoxDecoration(
                        color: AppColors.bottomNavBarBg,
                        borderRadius: BorderRadius.circular(context.screenWidth * 0.09),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Builder(
                            builder: (context) {
                              try {
                                final matrixState = Matrix.of(context);
                                final client = matrixState.client;
                                return StreamBuilder(
                                  stream: client.onSync.stream,
                                  builder: (context, _) {
                                    final unreadCount = client.rooms
                                        .where(
                                          (room) =>
                                              (room.membership == Membership.join ||
                                                  room.membership == Membership.invite) &&
                                              room.isUnreadOrInvited,
                                        )
                                        .length;
                                    return _buildNavItem(
                                      context,
                                      icon: ImageAssets.chatDetailsMessage,
                                      label: L10n.of(context).chats,
                                      badgeCount: unreadCount,
                                      isSelected: _selectedTab == 0,
                                      onTap: () => setState(() => _selectedTab = 0),
                                    );
                                  },
                                );
                              } catch (e) {
                                return _buildNavItem(
                                  context,
                                  icon: ImageAssets.chatDetailsMessage,
                                  label: L10n.of(context).chats,
                                  badgeCount: 0,
                                  isSelected: _selectedTab == 0,
                                  onTap: () => setState(() => _selectedTab = 0),
                                );
                              }
                            },
                          ),
                          const SizedBox(width: 56),
                          Builder(
                            builder: (context) {
                              try {
                                final matrixState = Matrix.of(context);
                                final client = matrixState.client;
                                return StreamBuilder(
                                  stream: client.onSync.stream,
                                  builder: (context, _) {
                                    final missedCallsCount = client.rooms
                                        .where(
                                          (room) =>
                                              (room.membership == Membership.join ||
                                                  room.membership == Membership.invite) &&
                                              room.isUnreadOrInvited &&
                                              room.lastEvent?.type == EventTypes.CallInvite,
                                        )
                                        .length;
                                    return _buildNavItem(
                                      context,
                                      icon: ImageAssets.chatcall,
                                      label: L10n.of(context).calls,
                                      badgeCount: missedCallsCount,
                                      isSelected: _selectedTab == 1,
                                      onTap: () => setState(() => _selectedTab = 1),
                                    );
                                  },
                                );
                              } catch (e) {
                                return _buildNavItem(
                                  context,
                                  icon: ImageAssets.chatcall,
                                  label: L10n.of(context).calls,
                                  badgeCount: 0,
                                  isSelected: _selectedTab == 1,
                                  onTap: () => setState(() => _selectedTab = 1),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: -context.screenHeight * 0.025,
                      left: 0,
                      right: 0,
                      child: _buildCenterButton(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required String icon,
    required String label,
    required int badgeCount,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    debugPrint(
      'Building nav item: $label, selected: $isSelected, badgeCount: $badgeCount',
    );
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth * 0.05,
          vertical: context.screenHeight * 0.012,
        ),
        child: badges.Badge(
          showBadge: badgeCount > 0,
          badgeContent: Text(
            '$badgeCount',
            style: const TextStyle(color: Colors.white, fontSize: 10),
          ),
          badgeStyle: const badges.BadgeStyle(
            badgeColor: Color(0xFF3976F8),
            padding: EdgeInsets.all(5),
          ),
          position: badges.BadgePosition.topStart(top: -35, start: 30),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                icon,
                width: context.screenWidth * 0.06,
                height: context.screenWidth * 0.06,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.white54,
                  fontSize: context.screenWidth*0.035,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCenterButton(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => context.push('/mainMenuScreen/rooms/newprivatechat'),
      child: Center(
        child: Container(
          width: context.screenHeight * 0.075,
          height: context.screenHeight * 0.075,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF3976F8),
          ),
          child: Center(
            child: Image.asset(
              'assets/icons/add-square.png',
              width: screenHeight * 0.038,
              height: screenHeight * 0.038,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
