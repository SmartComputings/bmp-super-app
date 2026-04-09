import 'dart:ui';

import 'package:bmp/core/config/themes.dart';
import 'package:bmp/features/chat/chat_details/shadowtextfield.dart';
import 'package:bmp/features/chat/chat_search/chat_search_files_tab.dart';
import 'package:bmp/features/chat/chat_search/chat_search_images_tab.dart';
import 'package:bmp/features/chat/chat_search/chat_search_message_tab.dart';
import 'package:bmp/features/chat/chat_search/chat_search_page.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/matrix_sdk_extensions/matrix_locals.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/bg_gradient_theme.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/constants/position_constants.dart';
import 'package:bmp/shared/widgets/hide_keyboard.dart';
import 'package:bmp/shared/widgets/keyboard_dismissible_popscope.dart';
import 'package:bmp/shared/widgets/layouts/max_width_body.dart';
import 'package:flutter/material.dart';

class ChatSearchView extends StatelessWidget {
  final ChatSearchController controller;

  const ChatSearchView(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    final room = controller.room;
    if (room == null) {
      return Scaffold(
        appBar: AppBar(title: Text(L10n.of(context).oopsSomethingWentWrong)),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(L10n.of(context).youAreNoLongerParticipatingInThisChat),
          ),
        ),
      );
    }

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return KeyboardDismissiblePopScope(
      focusNodes: [controller.searchFocusNode],
      child: HideKeyboardOnOutsideTap(
        child: Scaffold(
      appBar: AppBar(
        leading: const Center(child: BackButton()),
        titleSpacing: 0,
        title: Text(
          L10n.of(context).searchIn(
            room.getLocalizedDisplayname(MatrixLocals(L10n.of(context))),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
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
            BgGradientTheme(
              position: ShapePosition.bottomLeft,
              height: screenHeight * 0.44,
              gradient: const LinearGradient(
                colors: [Color(0xFFA912BF), Color(0xFF1B1C30)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              opacity: 0.8,
            ),
            BgGradientTheme(
              position: ShapePosition.bottomRight,
              height: screenHeight * 0.31,
              color: const Color(0xFF1B1C30),
              opacity: 0.8,
            ),
            BgGradientTheme(
              position: ShapePosition.topRight,
              height: screenHeight * 0.44,
              gradient: const LinearGradient(
                colors: [Color(0xFF1B1C30), Color(0x88A912BF)],
                stops: [0.5, 0.5],
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
              ),
              opacity: 0.6,
            ),
            BgGradientTheme(
              position: ShapePosition.topLeft,
              width: screenWidth * 0.5,
              height: screenHeight * 0.25,
              color: Colors.black,
              opacity: 0.3,
            ),
            BgGradientTheme(
              position: ShapePosition.topRight,
              width: screenWidth * 0.5,
              height: screenHeight * 0.25,
              color: Colors.black,
              opacity: 0.3,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 85, sigmaY: 85),
              child: Container(color: Colors.transparent),
            ),
            MaxWidthBody(
              withScrolling: false,
              child: Column(
                children: [
                  if (FluffyThemes.isThreeColumnMode(context))
                    const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CustomShadowTextField(
                      focusNode: controller.searchFocusNode,
                      width: screenWidth - 32,
                      hintText: L10n.of(context).search,
                      controller: controller.searchController,
                      onSubmitted: (_) => controller.restartSearch(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TabBar(
                    controller: controller.tabController,
                    tabs: [
                      Tab(child: Text(L10n.of(context).messages)),
                      Tab(child: Text(L10n.of(context).gallery)),
                       Tab(child: Text(L10n.of(context).files(0))),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: controller.tabController,
                      children: [
                        ChatSearchMessageTab(
                          searchQuery: controller.searchController.text,
                          room: room,
                          startSearch: controller.startMessageSearch,
                          searchStream: controller.searchStream,
                        ),
                        ChatSearchImagesTab(
                          room: room,
                          startSearch: controller.startGallerySearch,
                          searchStream: controller.galleryStream,
                        ),
                        ChatSearchFilesTab(
                          room: room,
                          startSearch: controller.startFileSearch,
                          searchStream: controller.fileStream,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),),);
  }
}
