import 'dart:ui';

import 'package:bmp/core/config/app_fonts.dart';
import 'package:bmp/core/constant/app_colors.dart';
import 'package:bmp/features/auth_onboarding/widgets/bg_gradient_theme.dart';
import 'package:bmp/features/chat/chat/events/video_player.dart';
import 'package:bmp/features/chat/chat/events/document_viewer.dart';
import 'package:bmp/features/chat/chat_details/chat_details.dart';
import 'package:bmp/features/chat/chat_details/edit_Profile_screen.dart';
import 'package:bmp/features/chat/image_viewer/image_viewer.dart';
import 'package:bmp/features/chat/chat_details/participant_list_item.dart';
import 'package:bmp/features/chat/chat_details/shadowtextfield.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/app_loading_widget.dart';
import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:bmp/shared/utils/matrix_sdk_extensions/matrix_locals.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/utils/url_launcher.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/constants/position_constants.dart';
import 'package:bmp/shared/widgets/avatar.dart';
import 'package:bmp/shared/widgets/layouts/max_width_body.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:bmp/shared/widgets/mxc_image.dart';
import 'package:bmp/shared/widgets/mxc_image_viewer.dart';
import 'package:bmp/shared/widgets/qr_code_viewer.dart';
import 'package:bmp/shared/widgets/hide_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:go_router/go_router.dart';
import 'package:matrix/matrix.dart';

class ChatDetailsView extends StatefulWidget {
  final ChatDetailsController controller;

  const ChatDetailsView(this.controller, {super.key});

  @override
  State<ChatDetailsView> createState() => _ChatDetailsViewState();
}

class _ChatDetailsViewState extends State<ChatDetailsView> {
  int selectedTab = 0;
  final TextEditingController _renameController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _renameController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _showRenameDialog(BuildContext context, Room room) {
    _renameController.text = room.name;
    final actualMembersCount = (room.summary.mInvitedMemberCount ?? 0) +
        (room.summary.mJoinedMemberCount ?? 0);

    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 720),
          child: Container(
            width: context.screenWidth * 0.95,
            padding: EdgeInsets.only(
                top: context.screenHeight * 0.02,
                left: context.screenWidth * 0.015,
                right: context.screenWidth * 0.015,
                bottom: context.screenHeight * 0.03),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: const Color(0x7F5F18BF),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFF5F18BF)),
                borderRadius: BorderRadius.circular(10),
              ),
              shadows: const [
                BoxShadow(
                    color: Color(0xFF1B1C30),
                    blurRadius: 16,
                    offset: Offset(0, 0),
                    spreadRadius: 0)
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 24,
              children: [
                Container(
                  width: context.screenWidth * 0.1,
                  height: context.screenHeight * 0.008,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1000)),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      horizontal: context.screenWidth * 0.025),
                  child: Row(
                    spacing: context.screenWidth * 0.025,
                    children: [
                      Container(
                        width: context.screenWidth * 0.12,
                        height: context.screenWidth * 0.12,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF1F252D),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1000)),
                        ),
                        child: room.avatar != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Avatar(
                                    mxContent: room.avatar,
                                    name: room.name,
                                    size: context.screenWidth * 0.12),
                              )
                            : const Icon(Icons.group, color: Colors.white),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: context.screenHeight * 0.005,
                          children: [
                            ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 210),
                              child: Text(
                                room.name,
                                style: TextStyle(
                                    color: Color(0xFFF3F7F8),
                                    fontSize: context.screenWidth * 0.035,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Text(
                              L10n.of(context)
                                  .countParticipants(actualMembersCount),
                              style: TextStyle(
                                  color: Color(0xFFC6D4DB),
                                  fontSize: context.screenWidth * 0.025,
                                  fontFamily: 'Neometric',
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      horizontal: context.screenWidth * 0.025),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: context.screenHeight * 0.02,
                    children: [
                      Container(
                        width: double.infinity,
                        height: context.screenHeight * 0.06,
                        padding: EdgeInsets.symmetric(
                            horizontal: context.screenWidth * 0.04),
                        decoration: ShapeDecoration(
                          color: const Color(0x7F050926),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1000)),
                        ),
                        child: TextField(
                          controller: _renameController,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: context.screenWidth * 0.035,
                              fontFamily: 'Work Sans',
                              fontWeight: FontWeight.w400),
                          decoration: InputDecoration(
                            hintText: L10n.of(context).renameChannel,
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: context.screenWidth * 0.035,
                                fontFamily: 'Work Sans',
                                fontWeight: FontWeight.w400),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Column(
                        spacing: 10,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              if (_renameController.text.trim().isNotEmpty) {
                                await room
                                    .setName(_renameController.text.trim());
                                Navigator.of(context).pop();
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              height: 48,
                              decoration: ShapeDecoration(
                                color: const Color(0xFF3976F8),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(1000)),
                                shadows: const [
                                  BoxShadow(
                                      color: Color(0xFF1929FF),
                                      blurRadius: 10,
                                      offset: Offset(0, 0),
                                      spreadRadius: -1)
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  L10n.of(context).renameGroupChannel,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Work Sans',
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Container(
                              width: double.infinity,
                              height: 48,
                              decoration: ShapeDecoration(
                                color: const Color(0xFFFEF2F2),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(1000)),
                                shadows: const [
                                  BoxShadow(
                                      color: Color(0xFF1929FF),
                                      blurRadius: 10,
                                      offset: Offset(0, 0),
                                      spreadRadius: -1)
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  L10n.of(context).cancel,
                                  style: const TextStyle(
                                      color: Color(0xFFF63D3D),
                                      fontSize: 14,
                                      fontFamily: 'Work Sans',
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                        ],
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
  }

  Widget _buildMediaGrid(List<Event> events, Room room) {
    if (events.isEmpty) {
      return _buildNoMediaWidget(
        title: L10n.of(context).noMediaToShow,
        subtitle: L10n.of(context).beTheFirstToShareAMoment,
        imagePath: "assets/images/image.png",
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return GestureDetector(
          onTap: () {
            if (!context.mounted) return;
            if (event.messageType == MessageTypes.Image) {
              showDialog(
                context: context,
                useRootNavigator: false,
                barrierDismissible: true,
                builder: (dialogContext) =>
                    ImageViewer(event, outerContext: context),
              );
            } else if (event.messageType == MessageTypes.Video) {
              showDialog(
                context: context,
                useRootNavigator: false,
                barrierDismissible: true,
                builder: (dialogContext) =>
                    ImageViewer(event, outerContext: context),
              );
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: _buildMediaContent(event),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMediaContent(Event event) {
    switch (event.messageType) {
      case MessageTypes.Image:
        return MxcImage(
          event: event,
          fit: BoxFit.cover,
          animated: true,
          isThumbnail: true,
        );

      case MessageTypes.Video:
        return Container(
          color: Colors.grey[800],
          child: Stack(
            fit: StackFit.expand,
            children: [
              Center(
                child: Icon(Icons.videocam, color: Colors.grey[400], size: 40),
              ),
              const Center(
                child: Icon(
                  Icons.play_circle_filled,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ],
          ),
        );

      default:
        return Container(
          color: Colors.grey[300],
          child: Icon(
            event.messageType == MessageTypes.Audio
                ? Icons.audiotrack
                : Icons.insert_drive_file,
            color: Colors.grey[600],
            size: 40,
          ),
        );
    }
  }

  Widget _buildFileList(List<Event> events, Room room) {
    if (events.isEmpty) {
      return _buildNoMediaWidget(
        title: L10n.of(context).noMediaToShow,
        subtitle: L10n.of(context).beTheFirstToShareAMoment,
        imagePath: "assets/images/image.png",
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade700.withOpacity(0.7),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(
                  event.messageType == MessageTypes.Audio
                      ? Icons.audiotrack
                      : Icons.insert_drive_file,
                ),
              ),
              title: Text(event.body.toString()),
              subtitle: Text(L10n.of(context).file),
              onTap: () async {
                if (!context.mounted) return;
                if (event.messageType == MessageTypes.Audio) {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  context.go('/mainMenuScreen/rooms/${room.id}');
                } else {
                  await DocumentOpener.openDocument(event, event.body);
                }
              },
            ),
          ),
        );
      },
    );
  }

  // widget to show when there is no media in the section
  Widget _buildNoMediaWidget({
    required String title,
    required String subtitle,
    required String imagePath,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
      child: Container(
        height: context.screenHeight * 9,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF1F252D), width: 3),
          color: const Color.fromARGB(255, 44, 44, 44).withOpacity(0.6),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: ListTile(
          leading: Image.asset(
            imagePath,
            width: context.screenWidth * 0.07,
            height: context.screenWidth * 0.07,
          ),
          title: Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: context.screenWidth * 0.033),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
                color: Colors.grey, fontSize: context.screenWidth * 0.03),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final room =
        Matrix.of(context).client.getRoomById(widget.controller.roomId!);
    if (room == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(L10n.of(context).oopsSomethingWentWrong),
        ),
        body: Center(
          child: Text(L10n.of(context).youAreNoLongerParticipatingInThisChat),
        ),
      );
    }

    final directChatMatrixID = room.directChatMatrixID;
    final roomAvatar = room.avatar;

    return StreamBuilder(
      stream: room.client.onRoomState.stream
          .where((update) => update.roomId == room.id),
      builder: (context, snapshot) {
        var members = room.getParticipants().toList()
          ..sort((b, a) => a.powerLevel.compareTo(b.powerLevel));
        members = members.take(10).toList();
        final actualMembersCount = (room.summary.mInvitedMemberCount ?? 0) +
            (room.summary.mJoinedMemberCount ?? 0);
        final canRequestMoreMembers = members.length < actualMembersCount;
        final iconColor = theme.textTheme.bodyLarge!.color;
        final displayname = room.getLocalizedDisplayname(
          MatrixLocals(L10n.of(context)),
        );
        return SafeArea(
          child: HideKeyboardOnOutsideTap(
            child: Scaffold(
              // bottomNavigationBar: _buildBottomNavBar(context),
              body: Container(
                decoration: const BoxDecoration(
                    // gradient: LinearGradient(
                    //   begin: Alignment.topCenter,
                    //   end: Alignment.bottomCenter,
                    //   colors: [
                    //     Color(0xFF1B1C30), // black (top)
                    //     Color(0xFF1B1C30), // purple (center)
                    //     Color(0xFF1B1C30), // black (bottom)
                    //   ],
                    //   stops: [0.0, 0.5, 1.0],
                    // ),
                    ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(color: const Color(0xFF1B1C30)),
                    ),
                    BgGradientTheme(
                      position: ShapePosition.center,
                      width: context.screenWidth * 1.8,
                      height: context.screenHeight * 0.85,
                      gradient: const RadialGradient(colors: [
                        const Color(0xFF17209A),
                        Colors.transparent,
                      ], radius: 1.5),
                      opacity: 0.8,
                    ),
                    BgGradientTheme(
                      position: ShapePosition.center,
                      width: context.screenWidth * 1.8,
                      height: context.screenHeight * 0.85,
                      gradient: const RadialGradient(colors: [
                        const Color(0x994754FF),
                        Colors.transparent,
                      ], radius: 1.5),
                      opacity: 0.8,
                    ),
                    BgGradientTheme(
                      position: ShapePosition.center,
                      width: context.screenWidth * 1.8,
                      height: context.screenHeight * 0.85,
                      gradient: const RadialGradient(colors: [
                        const Color(0x994754FF),
                        Colors.transparent,
                      ], radius: 1.5),
                      opacity: 0.8,
                    ),
                    BgGradientTheme(
                      position: ShapePosition.bottomFull,
                      height: context.screenHeight * 0.2,
                      colors: const [
                        Color(0xFF1B1C30),
                        Color(0xFFA912BF),
                      ],
                      opacity: 0.4,
                    ),
                    BgGradientTheme(
                      position: ShapePosition.topLeft,
                      width: context.screenWidth * 0.3,
                      height: context.screenHeight * 0.2,
                      color: Colors.black,
                      opacity: 0.25,
                    ),
                    BgGradientTheme(
                      position: ShapePosition.bottomLeft,
                      width: context.screenWidth * 0.3,
                      height: context.screenHeight * 0.2,
                      color: Colors.black,
                      opacity: 0.25,
                    ),
                    BgGradientTheme(
                      position: ShapePosition.bottomFull,
                      width: context.screenWidth * 05,
                      height: context.screenHeight * 0.1,
                      color: Colors.black,
                      opacity: 0.5,
                    ),
                    BgGradientTheme(
                      position: ShapePosition.topRight,
                      width: context.screenWidth * 0.3,
                      height: context.screenHeight * 0.2,
                      color: Colors.black,
                      opacity: 0.25,
                    ),
                    Positioned.fill(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 90, sigmaY: 90),
                        child: Container(color: Colors.transparent),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 0),
                      child: MaxWidthBody(
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: selectedTab == 1
                              ? members.length +
                                  1 +
                                  (canRequestMoreMembers ? 1 : 0)
                              : 1,
                          itemBuilder: (BuildContext context, int i) => i == 0
                              ? Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    SizedBox(
                                      height: context.screenHeight * 0.01,
                                    ),
                                    _buildHeaderSection(
                                      room,
                                      displayname,
                                      roomAvatar,
                                      actualMembersCount,
                                      theme,
                                      context,
                                    ),
                                    const Divider(color: Colors.transparent),
                                    selectedTab == 0
                                        ? _buildDetailSection(
                                            room,
                                            theme,
                                            context,
                                            iconColor,
                                          )
                                        : _buildSettingsSection(
                                            room,
                                            theme,
                                            context,
                                            iconColor,
                                            actualMembersCount,
                                          ),

                                    // Members Section at the end
                                    if (!room.isDirectChat)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0, vertical: 12.0),
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                                sigmaX: 10, sigmaY: 10),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: const Color(0xff7216BF)
                                                    .withOpacity(0.5),
                                                border: Border.all(
                                                    color:
                                                        const Color(0xff7216BF)
                                                            .withOpacity(1.0)),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(20)),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.all(6.0),
                                                  ),
                                                  ...() {
                                                    final filteredMembers = room
                                                        .getParticipants()
                                                        .where(
                                                          (member) =>
                                                              _searchQuery
                                                                  .isEmpty ||
                                                              member
                                                                  .calcDisplayname()
                                                                  .toLowerCase()
                                                                  .contains(
                                                                      _searchQuery),
                                                        )
                                                        .take(10)
                                                        .toList();

                                                    if (filteredMembers
                                                            .isEmpty &&
                                                        _searchQuery
                                                            .isNotEmpty) {
                                                      return [
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  16.0),
                                                          child: Center(
                                                            child: Text(
                                                              'Not Found',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize: 16),
                                                            ),
                                                          ),
                                                        ),
                                                      ];
                                                    }

                                                    return filteredMembers
                                                        .map(
                                                          (member) => Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        6,
                                                                    vertical:
                                                                        4),
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        10,
                                                                    vertical:
                                                                        10),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: const Color(
                                                                  0xff050926),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16),
                                                            ),
                                                            child: ListTile(
                                                              leading: Avatar(
                                                                mxContent: member
                                                                    .avatarUrl,
                                                                name: member
                                                                    .calcDisplayname(),
                                                                size: 40,
                                                              ),
                                                              title: Text(
                                                                member
                                                                    .calcDisplayname(),
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                        .toList();
                                                  }(),
                                                  if (actualMembersCount > 10)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              16.0),
                                                      child: Center(
                                                        child: Text(
                                                          '+${actualMembersCount - 10} more members',
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .grey),
                                                        ),
                                                      ),
                                                    ),
                                                  const SizedBox(height: 16),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                )
                              : selectedTab == 1 && i < members.length + 1
                                  ? ParticipantListItem(members[i - 1])
                                  : selectedTab == 1
                                      ? ListTile(
                                          title: Text(
                                            L10n.of(context)
                                                .loadCountMoreParticipants(
                                              (actualMembersCount -
                                                  members.length),
                                            ),
                                          ),
                                          leading: CircleAvatar(
                                            backgroundColor:
                                                theme.scaffoldBackgroundColor,
                                            child: const Icon(
                                              Icons.group_outlined,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          onTap: () => context.push(
                                            '/rooms/${widget.controller.roomId!}/details/members',
                                          ),
                                          trailing: const Icon(
                                            Icons.chevron_right_outlined,
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeaderSection(
    Room room,
    String displayname,
    Uri? roomAvatar,
    int actualMembersCount,
    ThemeData theme,
    BuildContext context,
  ) {
    return Container(
      height: room.isDirectChat
          ? context.screenHeight * 0.465
          : context.screenHeight * 0.465,
      width: context.screenWidth * 1,
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Stack(
        children: [
          // Background overlay
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff7216BF).withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                  boxShadow: const [
                    // BoxShadow(
                    //   color: Color(0xFF1B1C30),
                    //   blurRadius: 16,
                    //   spreadRadius: 0,
                    //   offset: Offset(0, 0),
                    // ),
                  ],
                  border: Border.all(
                    color: const Color(0xff7216BF).withOpacity(1.0),
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              height: context.screenHeight * 0.15,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                image: DecorationImage(
                  image: AssetImage(
                    ImageAssets.blueBg,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(context.screenWidth * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Image.asset(
                            ImageAssets.arrowLeft,
                            width: context.screenWidth * 0.09,
                            height: context.screenWidth * 0.09,
                          ),
                        ),
                        Row(
                          children: [
                            // Only show edit icon for group chats with edit permissions
                            if (!room.isDirectChat && room.canSendEvent('m.room.name'))
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => EditProfileScreen(
                                          room: room,
                                          displayname: displayname,
                                          roomAvatar: roomAvatar,
                                          actualMembersCount:
                                              actualMembersCount,
                                          controller: widget.controller,
                                         isDirectchat: room.isDirectChat,

                                        ),
                                      ),
                                    );
                                  },
                                  child: Image.asset(
                                    ImageAssets.editIcon2,
                                    width: context.screenWidth * 0.07,
                                    height: context.screenWidth * 0.07,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Profile picture positioned to overlap
          Positioned(
            top: () {
              final size = MediaQuery.of(context).size;
              final isTablet = size.shortestSide >= 600;
              return isTablet ? size.shortestSide * 0.13 : size.height * 0.055;
            }(),
            left: 0,
            right: 0,
            child: Center(
              child: Hero(
                tag: widget.controller.widget.embeddedCloseButton != null
                    ? 'embedded_content_banner'
                    : 'content_banner',
                child: GestureDetector(
                  onTap: roomAvatar != null
                      ? () => showDialog(
                            context: context,
                            useRootNavigator: false,
                            barrierDismissible: true,
                            builder: (dialogContext) =>
                                MxcImageViewer(roomAvatar),
                          )
                      : null,
                  child: Builder(
                    builder: (context) {
                      final size = MediaQuery.of(context).size;
                      final isTablet = size.shortestSide >= 600;
                      final avatarRadius =
                          isTablet ? size.shortestSide * 0.11 : 65.0;
                      final avatarSize =
                          isTablet ? size.shortestSide * 0.24 : 130.0;

                      return CircleAvatar(
                        radius: avatarRadius,
                        backgroundColor: Colors.white,
                        child: Avatar(
                          mxContent: room.avatar,
                          name: displayname,
                          size: avatarSize,
                          isGroup: !room.isDirectChat,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),

          // User details section
          Positioned(
            top: MediaQuery.of(context).size.height * 0.22,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  room.isDirectChat ? displayname : displayname,
                  style: TextStyle(
                    // fontFamily: AppFonts.allRoundGothic,
                    fontSize: context.screenWidth * 0.045,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: context.screenHeight * 0.0),
                room.isDirectChat
                    ? SizedBox()
                    : Text(
                        L10n.of(context).countParticipants(actualMembersCount),
                        style: TextStyle(
                          // fontFamily: AppFonts.allRoundGothic,
                          fontSize: context.screenWidth * 0.04,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                SizedBox(height: context.screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildActionButton(
                      context,
                      "assets/icons/message.png",
                      onTap: () {
                        context.go('/mainMenuScreen/rooms/${room.id}');
                      },
                    ),
                    if (!room.isDirectChat)
                      _buildActionButton(
                        context,
                        "assets/icons/user-add.png",
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EditProfileScreen(
                                room: room,
                                displayname: displayname,
                                roomAvatar: roomAvatar,
                                actualMembersCount: actualMembersCount,
                                controller: widget.controller,
                                isDirectchat: room.isDirectChat,
                                scrollToAddContacts: true,
                              ),
                            ),
                          );
                        },
                      ),
                    _buildActionButton(
                      context,
                      "assets/icons/call.png",
                      onTap: () => widget.controller.startVoiceCall(),
                    ),
                    _buildActionButton(
                      context,
                      "assets/icons/video.png",
                      onTap: () => widget.controller.startVideoCall(),
                    ),
                    _buildActionButton(
                      context,
                      "assets/icons/scan-barcode.png",
                      onTap: () {
                        showQrCodeViewer(
                          context,
                          room.canonicalAlias.isNotEmpty
                              ? room.canonicalAlias
                              : room.directChatMatrixID ?? '',
                          room: room,
                          name: displayname,
                          avatarUrl: room.avatar?.toString(),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: context.screenHeight * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.screenWidth * 0.03),
                  child: CustomShadowTextField(
                    width: double.infinity,
                    hintText: L10n.of(context).search,
                    controller: _searchController,
                  ),
                ),
                SizedBox(height: context.screenHeight * 0.02),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailSection(
    Room room,
    ThemeData theme,
    BuildContext context,
    Color? iconColor,
  ) {
    return Column(
      children: [
        // Chat Description Section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xff7216BF).withOpacity(0.5),
                  boxShadow: const [
                    // BoxShadow(
                    //   color: Color(0xFF1B1C30),
                    //   blurRadius: 16,
                    //   spreadRadius: 0,
                    //   offset: Offset(0, 0),
                    // ),
                  ],
                  border: Border.all(
                      color: const Color(0xff7216BF).withOpacity(1.0)),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (!room.canChangeStateEvent(EventTypes.RoomTopic))
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8),
                        child: Text(
                          L10n.of(context).chatDescription,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: context.screenWidth * 0.03,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    else
                      Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Bio',
                                style: TextStyle(
                                    fontFamily: 'Neometric',
                                    fontSize: context.screenWidth * 0.035,
                                    fontWeight: FontWeight.w500),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: GestureDetector(
                                  onTap: widget.controller.setTopicAction,
                                  child: Image.asset(
                                    ImageAssets.editIcon2,
                                    width: context.screenWidth * 0.05,
                                    height: context.screenWidth * 0.05,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                        bottom: 16.0,
                      ),
                      child: SelectableLinkify(
                        text: room.topic.isEmpty
                            ? L10n.of(context).noChatDescriptionYet
                            : room.topic,
                        textAlign: TextAlign.left,
                        textScaleFactor:
                            MediaQuery.textScalerOf(context).scale(1),
                        options: const LinkifyOptions(humanize: false),
                        linkStyle: TextStyle(
                          fontSize: context.screenWidth * 0.032,
                          color: Colors.blueAccent,
                          decorationColor: Colors.blueAccent,
                        ),
                        style: TextStyle(
                          fontSize: context.screenWidth * 0.028,
                          fontStyle: room.topic.isEmpty
                              ? FontStyle.italic
                              : FontStyle.normal,
                          color: theme.textTheme.bodyMedium!.color,
                          decorationColor: theme.textTheme.bodyMedium!.color,
                        ),
                        onOpen: (url) =>
                            UrlLauncher(context, url.url).launchUrl(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // New ListTile with image

        const SizedBox(height: 12),

        // Media Tabs Section
        Padding(
          padding: const EdgeInsets.only(
            left: 12,
            right: 12,
            bottom: 12,
            top: 0,
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xff7216BF).withOpacity(0.5),
                  border: Border.all(
                      color: const Color(0xff7216BF).withOpacity(1.0)),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: FutureBuilder<Timeline>(
                  future:
                      room.getTimeline().timeout(const Duration(seconds: 5)),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: theme.scaffoldBackgroundColor,
                          foregroundColor: iconColor,
                          child: const SizedBox(
                            width: 16,
                            height: 16,
                            child: AppLoadingWidget(),
                          ),
                        ),
                        title: Text(L10n.of(context).sharedMedia),
                        subtitle: Text(L10n.of(context).loading),
                      );
                    }

                    if (snapshot.hasError || !snapshot.hasData) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: theme.scaffoldBackgroundColor,
                          foregroundColor: iconColor,
                          child: const Icon(Icons.photo_library),
                        ),
                        title: Text(L10n.of(context).sharedMedia),
                        subtitle: Text(L10n.of(context).items(0)),
                        trailing: const Icon(Icons.chevron_right_outlined),
                      );
                    }

                    final timeline = snapshot.data!;
                    final mediaEvents = timeline.events
                        .where(
                          (event) => [
                            MessageTypes.Image,
                            MessageTypes.Video,
                            MessageTypes.File,
                            MessageTypes.Audio,
                          ].contains(event.messageType),
                        )
                        .toList();

                    final mediaCount = mediaEvents.length;
                    final images = mediaEvents
                        .where((e) => e.messageType == MessageTypes.Image)
                        .toList();
                    final videos = mediaEvents
                        .where((e) => e.messageType == MessageTypes.Video)
                        .toList();
                    print('Videos found: ${videos.length}');
                    for (var video in videos) {
                      print('Video event: ${video.content}');
                    }
                    final files = mediaEvents
                        .where((e) => e.messageType == MessageTypes.File)
                        .toList();
                    final audio = mediaEvents
                        .where((e) => e.messageType == MessageTypes.Audio)
                        .toList();
                    final filesCount = files.length;
                    final audioCount = audio.length;

                    return Column(
                      children: [
                        const SizedBox(
                          height: 4,
                        ),
                        DefaultTabController(
                          length: 4,
                          child: StatefulBuilder(
                            builder: (context, setState) {
                              return Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: TabBar(
                                      onTap: (index) => setState(
                                        () => selectedTab = index,
                                      ), // ✅ track which tab is selected
                                      indicator: const BoxDecoration(),
                                      // indicator: BoxDecoration(
                                      //   color:
                                      //       const Color.fromARGB(255, 185, 101, 4),
                                      //   borderRadius: BorderRadius.circular(50),
                                      // ),
                                      indicatorSize: TabBarIndicatorSize.tab,
                                      dividerColor: Colors.transparent,
                                      labelColor: Colors.white,
                                      unselectedLabelColor: Colors.white,
                                      labelPadding: const EdgeInsets.symmetric(
                                          horizontal: 0),
                                      tabs: [
                                        Container(
                                          height: context.screenHeight * 0.04,
                                          width: context.screenWidth * 0.2,
                                          decoration: BoxDecoration(
                                            color: selectedTab == 0
                                                ? AppColors.settingBtnBg
                                                : const Color(0x7F050926),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: Center(
                                            child: Text(
                                              L10n.of(context)
                                                  .photos(images.length),
                                              style: TextStyle(
                                                fontSize:
                                                    context.screenWidth * 0.03,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: context.screenHeight * 0.04,
                                          width: context.screenWidth * 0.2,
                                          decoration: BoxDecoration(
                                            color: selectedTab == 1
                                                ? AppColors.settingBtnBg
                                                : const Color(0x7F050926),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: Center(
                                            child: Text(
                                              L10n.of(context)
                                                  .videos(videos.length),
                                              style: TextStyle(
                                                fontSize:
                                                    context.screenWidth * 0.03,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: context.screenHeight * 0.04,
                                          width: context.screenWidth * 0.2,
                                          decoration: BoxDecoration(
                                            color: selectedTab == 2
                                                ? AppColors.settingBtnBg
                                                : const Color(0x7F050926),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: Center(
                                            child: Text(
                                              L10n.of(context)
                                                  .files(filesCount),
                                              style: TextStyle(
                                                fontSize:
                                                    context.screenWidth * 0.03,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: context.screenHeight * 0.04,
                                          width: context.screenWidth * 0.2,
                                          decoration: BoxDecoration(
                                            color: selectedTab == 3
                                                ? AppColors.settingBtnBg
                                                : const Color(0x7F050926),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: Center(
                                            child: Text(
                                              L10n.of(context)
                                                  .audio(audio.length),
                                              style: TextStyle(
                                                fontSize:
                                                    context.screenWidth * 0.03,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: mediaCount > 0
                                        ? context.screenHeight * 0.33
                                        : context.screenHeight * 0.11,
                                    child: TabBarView(
                                      children: [
                                        _buildMediaGrid(images, room),
                                        _buildMediaGrid(videos, room),
                                        _buildFileList(files, room),
                                        _buildFileList(audio, room),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

// section for the settings tab
  Widget _buildSettingsSection(
    Room room,
    ThemeData theme,
    BuildContext context,
    Color? iconColor,
    int actualMembersCount,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 37, 37, 37).withOpacity(0.6),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  '  ${L10n.of(context).setting}',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              if (!room.isDirectChat &&
                  room.canChangeStateEvent(EventTypes.RoomName))
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: theme.scaffoldBackgroundColor,
                      foregroundColor: iconColor,
                      child: const Icon(Icons.edit),
                    ),
                    title: Text(L10n.of(context).renameGroup),
                    subtitle: Text(L10n.of(context).changeGroupName),
                    onTap: () => _showRenameDialog(context, room),
                    trailing: const Icon(Icons.chevron_right_outlined),
                  ),
                ),
              if (!room.isDirectChat &&
                  room.canChangeStateEvent(EventTypes.RoomName))
                const SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: theme.scaffoldBackgroundColor,
                    foregroundColor: iconColor,
                    child: const Icon(
                      Icons.insert_emoticon_outlined,
                    ),
                  ),
                  title: Text(L10n.of(context).customEmojisAndStickers),
                  subtitle: Text(L10n.of(context).setCustomEmotes),
                  onTap: widget.controller.goToEmoteSettings,
                  trailing: const Icon(Icons.chevron_right_outlined),
                ),
              ),
              const SizedBox(height: 5),
              if (!room.isDirectChat)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: theme.scaffoldBackgroundColor,
                      foregroundColor: iconColor,
                      child: const Icon(Icons.shield_outlined),
                    ),
                    title: Text(
                      L10n.of(context).accessAndVisibility,
                    ),
                    subtitle: Text(
                      L10n.of(context).accessAndVisibilityDescription,
                    ),
                    onTap: () => context.push(
                        '/mainMenuScreen/rooms/${room.id}/details/access'),
                    trailing: const Icon(Icons.chevron_right_outlined),
                  ),
                ),
              if (!room.isDirectChat) const SizedBox(height: 5),
              if (!room.isDirectChat)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    title: Text(L10n.of(context).chatPermissions),
                    subtitle: Text(
                      L10n.of(context).whoCanPerformWhichAction,
                    ),
                    leading: CircleAvatar(
                      backgroundColor: theme.scaffoldBackgroundColor,
                      foregroundColor: iconColor,
                      child: const Icon(
                        Icons.edit_attributes_outlined,
                      ),
                    ),
                    trailing: const Icon(Icons.chevron_right_outlined),
                    onTap: () => context.push(
                        '/mainMenuScreen/rooms/${room.id}/details/permissions'),
                  ),
                ),
              if (!room.isDirectChat) const SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  title: Text(
                    L10n.of(context).countParticipants(
                      actualMembersCount,
                    ),
                    style: TextStyle(
                      color: theme.colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              if (!room.isDirectChat && room.canInvite)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    title: Text(L10n.of(context).inviteContact),
                    leading: CircleAvatar(
                      backgroundColor: theme.colorScheme.primaryContainer,
                      foregroundColor: theme.colorScheme.onPrimaryContainer,
                      radius: Avatar.defaultSize / 2,
                      child: const Icon(Icons.add_outlined),
                    ),
                    trailing: const Icon(Icons.chevron_right_outlined),
                    onTap: () =>
                        context.go('/mainMenuScreen/rooms/${room.id}/invite'),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildActionButton(String iconPath, VoidCallback onTap) {
  //   return GestureDetector(
  //     onTap: onTap,
  //     child: Container(
  //       width: 60,
  //       height: 60,
  //       decoration: BoxDecoration(
  //         color: const Color.fromARGB(255, 153, 41, 245),
  //         shape: BoxShape.circle,
  //       ),
  //       child: Center(
  //         child: Image.asset(
  //           iconPath,
  //           width: 30,
  //           height: 30,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildBottomNavBar(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin:
          EdgeInsets.fromLTRB(screenWidth * 0.05, 0, screenWidth * 0.05, 19.81),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: screenHeight * 0.075,
            decoration: BoxDecoration(
              color: AppColors.bottomNavBarBg,
              borderRadius: BorderRadius.circular(35),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 5))
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(context,
                    icon: ImageAssets.chatDetailsMessage,
                    label: 'Chats',
                    onTap: () => context.go('/mainMenuScreen/rooms')),
                const SizedBox(width: 56),
                _buildNavItem(context,
                    icon: ImageAssets.chatcall, label: 'Calls', onTap: () {}),
              ],
            ),
          ),
          Positioned(
              top: -screenHeight * 0.025,
              left: 0,
              right: 0,
              child: _buildCenterButton(context, screenHeight)),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context,
      {required String icon,
      required String label,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(icon,
              width: MediaQuery.of(context).size.width * 0.06,
              height: MediaQuery.of(context).size.width * 0.06),
          const SizedBox(width: 8),
          Text(label,
              style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 14,
                  fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }

  Widget _buildCenterButton(BuildContext context, double screenHeight) {
    return GestureDetector(
      onTap: () => context.go('/mainMenuScreen/rooms/newprivatechat'),
      child: Center(
        child: Container(
          width: screenHeight * 0.075,
          height: screenHeight * 0.075,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Color(0xFF3976F8)),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFF6F8DA1)),
              child: const Icon(Icons.add, color: Colors.white, size: 25),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildActionButton(
  BuildContext context,
  String imagePath, {
  VoidCallback? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: context.screenWidth * 0.15,
      width: context.screenWidth * 0.15,
      decoration: const BoxDecoration(
        color: AppColors.settingBtnBg,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.settingBtnBg,
            blurRadius: 10,
            spreadRadius: -1,
          ),
        ],
      ),
      child: Center(
        child: Image.asset(
          imagePath,
          height: context.screenWidth * 0.08,
          width: context.screenWidth * 0.08,
          color: Colors.white,
        ),
      ),
    ),
  );
}
