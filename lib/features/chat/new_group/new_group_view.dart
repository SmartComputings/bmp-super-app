import 'dart:ui';

import 'package:bmp/core/constant/app_colors.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/chat/new_group/add_contact_group.dart';
import 'package:bmp/features/chat/new_group/new_group.dart';
import 'package:bmp/features/chat/new_group/widgets/contact_item.dart';
import 'package:bmp/shared/utils/app_loading_widget.dart';
import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/utils/snackbar.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/bg_gradient_theme.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/constants/position_constants.dart';
import 'package:bmp/shared/widgets/keyboard_dismissible_popscope.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';

// class NewGroupView extends StatefulWidget {
//   final NewGroupController controller;

//   const NewGroupView(this.controller, {super.key});

//  }

class NewGroupView extends StatelessWidget {
  final NewGroupController controller;
  const NewGroupView(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    final avatar = controller.avatar;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return KeyboardDismissiblePopScope(
      focusNodes: [controller.nameFocusNode, controller.searchFocusNode],
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
              width: context.screenWidth * 0.65,
              colors: const [Color(0xFF1B1C30), Color(0xFFA912BF)],
              opacity: 0.9,
            ),
            BgGradientTheme(
              position: ShapePosition.center,
              width: context.screenWidth * 0.65,
              height: context.screenHeight * 0.65,
              color: const Color(0xFF4754FF),
              opacity: 0.8,
            ),
            BgGradientTheme(
              position: ShapePosition.bottomLeft,
              height: context.screenHeight * 0.25,
              width: context.screenWidth * 0.2,
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
                    margin: EdgeInsets.symmetric(
                      horizontal: context.screenWidth * 0.04,
                    ),
                    padding: EdgeInsets.all(context.screenWidth * 0.04),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Color.fromARGB(126, 118, 13, 134)
                          .withValues(alpha: 0.7),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: Color(0xFFA912BF),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: controller.loading
                                  ? null
                                  : () => Navigator.of(context).pop(),
                              child: Image.asset(
                                ImageAssets.arrowLeft,
                                height: context.screenWidth * 0.1,
                                width: context.screenWidth * 0.1,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                L10n.of(context).newGroup,
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
                          height: context.screenHeight * 0.05,
                          padding: EdgeInsets.symmetric(
                            horizontal: context.screenWidth * 0.04,
                          ),
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
                                child: TextField(
                                  controller: controller.searchController,
                                  focusNode: controller.searchFocusNode,
                                  onChanged: controller.searchContacts,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: context.screenWidth * 0.035,
                                  ),
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: context.screenHeight * 0.02),
                          Container(
                            width: context.screenWidth * 0.81,
                            padding: EdgeInsets.symmetric(
                              horizontal: context.screenWidth * 0.063,
                              vertical: context.screenHeight * 0.019,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xff050926).withOpacity(0.5),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: controller.loading
                                      ? null
                                      : controller.selectPhoto,
                                  child: Container(
                                    width: context.screenWidth * 0.24,
                                    height: context.screenWidth * 0.24,
                                    decoration: BoxDecoration(
                                      color: avatar == null
                                          ? const Color(0xff1B1C30)
                                          : null,
                                      borderRadius: BorderRadius.circular(
                                        context.screenWidth * 0.173,
                                      ),
                                      image: avatar != null
                                          ? DecorationImage(
                                              image: MemoryImage(avatar),
                                              fit: BoxFit.cover,
                                            )
                                          : null,
                                    ),
                                    child: avatar == null
                                        ? Icon(
                                            Icons.add_a_photo_outlined,
                                            color: Colors.white,
                                            size: context.screenWidth * 0.1,
                                          )
                                        : null,
                                  ),
                                ),
                                SizedBox(height: context.screenHeight * 0.0125),
                                Text(
                                  L10n.of(context).imageGroup,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: const Color(0xFFF3F7F8),
                                    fontSize: context.screenWidth * 0.03,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: context.screenHeight * 0.02),
                          Container(
                            width: context.screenWidth * 0.81,
                            padding: EdgeInsets.symmetric(
                              horizontal: context.screenWidth * 0.025,
                              vertical: context.screenHeight * 0.0275,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xff050926).withOpacity(0.5),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: context.screenWidth * 0.04,
                                  ),
                                  child: Text(
                                    L10n.of(context).groupName,
                                    style: TextStyle(
                                      color: const Color(0xFFF3F7F8),
                                      fontSize: context.screenWidth * 0.03,
                                    ),
                                  ),
                                ),
                                SizedBox(height: context.screenHeight * 0.0075),
                                Container(
                                  height: context.screenHeight * 0.06,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: context.screenWidth * 0.04,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xCC1B1C30),
                                    borderRadius: BorderRadius.circular(1000),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          controller: controller.nameController,
                                          focusNode: controller.nameFocusNode,
                                          readOnly: controller.loading,
                                          onChanged: (value) {
                                            if (controller
                                                    .nameValidationError !=
                                                null) {
                                              controller.setState(() {
                                                controller.nameValidationError =
                                                    null;
                                              });
                                            }
                                          },
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                context.screenWidth * 0.035,
                                          ),
                                          decoration: InputDecoration(
                                            hintText:
                                                L10n.of(context).enterGroupName,
                                            hintStyle: TextStyle(
                                              color: const Color(0x66FFFFFF),
                                              fontSize:
                                                  context.screenWidth * 0.035,
                                            ),
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.zero,
                                          ),
                                        ),
                                      ),
                                      if (controller
                                          .nameController.text.isNotEmpty)
                                        IconButton(
                                          icon: Icon(
                                            Icons.close,
                                            color: Colors.white,
                                            size: context.screenWidth * 0.04,
                                          ),
                                          onPressed: () =>
                                              controller.nameController.clear(),
                                          padding: EdgeInsets.zero,
                                          constraints: const BoxConstraints(),
                                        ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: context.screenHeight * 0.0075),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: context.screenWidth * 0.04,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      controller.nameValidationError != null
                                          ? Text(
                                              controller.nameValidationError!,
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontSize:
                                                    context.screenWidth * 0.03,
                                              ),
                                            )
                                          : Row(
                                              children: [
                                                Icon(
                                                  Icons.info_outline,
                                                  size: context.screenWidth *
                                                      0.03,
                                                  color:
                                                      const Color(0xFFC6D4DB),
                                                ),
                                                SizedBox(
                                                  width: context.screenWidth *
                                                      0.01,
                                                ),
                                                Text(
                                                  L10n.of(context)
                                                      .changeNameGroup,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xFFC6D4DB),
                                                    fontSize:
                                                        context.screenWidth *
                                                            0.03,
                                                  ),
                                                ),
                                              ],
                                            ),
                                      if (controller.fetchedRooms.isNotEmpty)
                                        Container(
                                          margin: EdgeInsets.only(
                                            top: context.screenHeight * 0.01,
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            horizontal:
                                                context.screenWidth * 0.03,
                                            vertical:
                                                context.screenHeight * 0.0075,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF3976F8),
                                            borderRadius: BorderRadius.circular(
                                              context.screenWidth * 0.04,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                L10n.of(context).contacts,
                                                style: TextStyle(
                                                  fontSize:
                                                      context.screenWidth *
                                                          0.035,
                                                ),
                                              ),
                                              SizedBox(
                                                width:
                                                    context.screenWidth * 0.01,
                                              ),
                                              Container(
                                                width:
                                                    context.screenWidth * 0.05,
                                                height:
                                                    context.screenWidth * 0.05,
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    '${controller.fetchedRooms.length}',
                                                    style: TextStyle(
                                                      color: AppColors
                                                          .settingBtnBg,
                                                      fontSize:
                                                          context.screenWidth *
                                                              0.025,
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
                              ],
                            ),
                          ),
                          SizedBox(height: context.screenHeight * 0.02),
                          // Public/Private Group Toggle
                          Container(
                            width: context.screenWidth * 0.81,
                            padding: EdgeInsets.symmetric(
                              horizontal: context.screenWidth * 0.03,
                              vertical: context.screenHeight * 0.025,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xff050926).withOpacity(0.5),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: context.screenWidth * 0.1,
                                      height: context.screenWidth * 0.1,
                                      decoration: BoxDecoration(
                                        color: const Color(0x7F050926)
                                            .withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      alignment: Alignment.center,
                                      child: Icon(
                                        controller.publicGroup
                                            ? Icons.public
                                            : Icons.lock_outline,
                                        color: Colors.white,
                                        size: context.screenWidth * 0.05,
                                      ),
                                    ),

                                    SizedBox(width: context.screenWidth * 0.03),

                                    /// TEXT COLUMN
                                    SizedBox(
                                      width: context.screenWidth * 0.45,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.publicGroup
                                                ? L10n.of(context).publicGroup
                                                : L10n.of(context).privateGroup,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  context.screenWidth * 0.035,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(
                                            height:
                                                context.screenHeight * 0.005,
                                          ),
                                          Text(
                                            controller.publicGroup
                                                ? L10n.of(context)
                                                    .anyoneCanFindAndJoin
                                                : L10n.of(context)
                                                    .onlyInvitedMembersCanJoin,
                                            style: TextStyle(
                                              color: const Color(0xFFC6D4DB),
                                              fontSize:
                                                  context.screenWidth * 0.03,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    /// SWITCH
                                    Transform.scale(
                                      scale: 0.7, // try 0.7 – 0.9
                                      child: Switch(
                                        value: controller.publicGroup,
                                        onChanged: controller.loading
                                            ? null
                                            : controller.setPublicGroup,
                                        thumbColor: WidgetStateProperty.all(
                                          Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                // Encryption Toggle for Private Groups
                                if (!controller.publicGroup) ...[
                                  SizedBox(
                                    height: context.screenHeight * 0.015,
                                  ),
                                  Divider(
                                    color: const Color(0xFF5F18BF),
                                    height: context.screenHeight * 0.00125,
                                  ),
                                  SizedBox(
                                    height: context.screenHeight * 0.015,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // Icon inside circular container
                                      Container(
                                        width: context.screenWidth * 0.1,
                                        height: context.screenWidth * 0.1,
                                        decoration: BoxDecoration(
                                          color: const Color(0x7F050926)
                                              .withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.security,
                                          color: Colors.white,
                                          size: context.screenWidth * 0.05,
                                        ),
                                      ),

                                      SizedBox(
                                          width: context.screenWidth * 0.03),

                                      // Column for title + subtitle
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              L10n.of(context)
                                                  .endToEndEncryption,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize:
                                                    context.screenWidth * 0.035,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(
                                                height: context.screenHeight *
                                                    0.005),
                                            Text(
                                              controller.encryptionEnabled
                                                  ? L10n.of(context)
                                                      .messagesWillBeEncrypted
                                                  : L10n.of(context)
                                                      .messagesWillNotBeEncrypted,
                                              style: TextStyle(
                                                color: controller
                                                        .encryptionEnabled
                                                    ? const Color(0xFF4CAF50)
                                                    : const Color(0xFFFF9800),
                                                fontSize:
                                                    context.screenWidth * 0.03,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      // Switch scaled smaller
                                      Transform.scale(
                                        scale: 0.7,
                                        child: Switch(
                                          value: controller.encryptionEnabled,
                                          onChanged: controller.loading
                                              ? null
                                              : controller.setEncryptionEnabled,
                                          thumbColor: WidgetStateProperty
                                              .resolveWith<Color>(
                                            (states) {
                                              if (states.contains(
                                                  WidgetState.selected)) {
                                                return const Color(0xFF4CAF50);
                                              }
                                              return Colors.white;
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ],
                            ),
                          ),
                          SizedBox(height: context.screenHeight * 0.02),
                          GestureDetector(
                            onTap: controller.loading
                                ? null
                                : () async {
                                    if (controller.nameController.text
                                        .trim()
                                        .isEmpty) {
                                      controller.setState(() {
                                        controller.nameValidationError =
                                            L10n.of(context)
                                                .pleaseEnterGroupNameFirst;
                                      });
                                      return;
                                    }
                                    controller.setState(() {
                                      controller.nameValidationError = null;
                                    });
                                    final result =
                                        await Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => AddContactGroup(
                                          preSelectedRooms:
                                              controller.fetchedRooms,
                                        ),
                                      ),
                                    );
                                    if (result != null &&
                                        result is List<Room>) {
                                      controller.updateFetchedRooms(result);
                                    }
                                  },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: context.screenWidth * 0.04,
                              ),
                              padding:
                                  EdgeInsets.all(context.screenWidth * 0.04),
                              decoration: BoxDecoration(
                                color: const Color(0xff050926).withOpacity(0.5),
                                borderRadius: BorderRadius.circular(
                                  context.screenWidth * 0.075,
                                ),
                                border: Border.all(
                                  color:
                                      const Color(0xFF5F18BF).withOpacity(0.3),
                                  width: context.screenWidth * 0.0025,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: context.screenWidth * 0.175,
                                    height: context.screenWidth * 0.175,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF3976F8),
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(0xFF3976F8),
                                          blurRadius:
                                              context.screenWidth * 0.052,
                                          offset: const Offset(0, 0),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        'assets/icons/personalcard.png',
                                        color: Colors.white,
                                        width: context.screenWidth * 0.0875,
                                        height: context.screenWidth * 0.0875,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: context.screenWidth * 0.04),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          L10n.of(context).addContacts,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                context.screenWidth * 0.04,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w600,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        SizedBox(
                                          height: context.screenHeight * 0.005,
                                        ),
                                        Text(
                                          L10n.of(context)
                                              .selectFromYourContacts,
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize:
                                                context.screenWidth * 0.035,
                                            fontFamily: 'Montserrat',
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: context.screenWidth * 0.04),
                                  Container(
                                    height: context.screenHeight * 0.0375,
                                    width: context.screenWidth * 0.116,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff050926)
                                          .withOpacity(0.5),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          context.screenWidth * 0.04,
                                        ),
                                      ),
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
                          ),
                          SizedBox(height: context.screenHeight * 0.0125),
                          Column(
                            children: [
                              if (controller.fetchedRooms.isNotEmpty) ...[
                                SizedBox(height: context.screenHeight * 0.025),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: context.screenWidth * 0.035,
                                  ),
                                  width: double.infinity,
                                  height: context.screenHeight * 0.0025,
                                  color: AppColors.primaryColor,
                                ),
                                SizedBox(height: context.screenHeight * 0.025),
                                Text(
                                  L10n.of(context).contactsInGroup,
                                  style: TextStyle(
                                    color: AppColors.whiteGrey,
                                    fontSize: context.screenWidth * 0.04,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: context.screenHeight * 0.02),
                                controller.filteredRooms.isEmpty
                                    ? Padding(
                                        padding: EdgeInsets.all(
                                          context.screenWidth * 0.05,
                                        ),
                                        child: Text(
                                          L10n.of(context).noContactsFound,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize:
                                                context.screenWidth * 0.035,
                                            fontFamily: 'Work Sans',
                                          ),
                                        ),
                                      )
                                    : ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        padding: EdgeInsets.symmetric(
                                          horizontal:
                                              context.screenWidth * 0.04,
                                        ),
                                        itemCount:
                                            controller.filteredRooms.length,
                                        itemBuilder: (context, index) {
                                          final room =
                                              controller.filteredRooms[index];
                                          final isSelected = controller
                                              .finalSelectedRooms
                                              .any((r) => r.id == room.id);

                                          return buildContactItem(
                                            context,
                                            room,
                                            isSelected,
                                            () => controller
                                                .toggleContact(room.id),
                                          );
                                        },
                                      ),
                              ],
                              Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: context.screenWidth * 0.2525,
                                  vertical: context.screenHeight * 0.019,
                                ),
                                child: ElevatedButton(
                                  onPressed: controller.loading
                                      ? null
                                      : () {
                                          if (controller
                                              .finalSelectedRooms.isEmpty) {
                                            CustomSnackbar.show(
                                              context,
                                              message: L10n.of(context)
                                                  .selectAtLeastOneMember,
                                              type: SnackbarType.warning,
                                            );
                                            return;
                                          }
                                          controller.submitAction();
                                        },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF3976F8),
                                    minimumSize: Size(
                                      context.screenWidth * 0.5,
                                      context.screenHeight * 0.075,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        context.screenWidth * 0.06,
                                      ),
                                    ),
                                  ),
                                  child: controller.loading
                                      ? const AppLoadingWidget()
                                      : Text(
                                          L10n.of(context).createGroup,
                                          style: TextStyle(
                                            color: const Color(0xFFFCFCFC),
                                            fontSize:
                                                context.screenWidth * 0.04,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                ),
                              ),
                              SizedBox(height: context.screenHeight * 0.0125),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // bottomNavigationBar: Container(
        //   padding: EdgeInsets.only(
        //     bottom: MediaQuery.of(context).viewPadding.bottom > 0
        //         ? MediaQuery.of(context).viewPadding.bottom
        //         : 16,
        //   ),
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
        //               child: Padding(
        //                 padding: const EdgeInsets.all(15),
        //                 child: Container(
        //                   decoration: BoxDecoration(
        //                     borderRadius: BorderRadius.circular(10),
        //                     color: const Color(0xFF6F8DA1),
        //                   ),
        //                   child: const Icon(
        //                     Icons.add,
        //                     color: Colors.white,
        //                     size: 25,
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
