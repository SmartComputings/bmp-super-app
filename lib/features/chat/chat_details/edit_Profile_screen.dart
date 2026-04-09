import 'dart:ui';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/auth_onboarding/widgets/CustomButton.dart';
import 'package:bmp/features/auth_onboarding/widgets/bg_gradient_theme.dart';
import 'package:bmp/features/chat/chat_details/chat_details.dart';
import 'package:bmp/features/chat/chat_details/done_screen.dart';
import 'package:bmp/features/chat/chat_details/shadowtextfield.dart';
import 'package:bmp/features/chat/new_group/add_contact_group.dart';
import 'package:bmp/features/chat/new_group/widgets/contact_item.dart';

import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/utils/snackbar.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/constants/position_constants.dart';
import 'package:bmp/shared/widgets/avatar.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:matrix/matrix.dart';

class EditProfileScreen extends StatefulWidget {
  final Room room;
  final String displayname;
  final Uri? roomAvatar;
  final int actualMembersCount;
  final ChatDetailsController controller;
  final bool isDirectchat;
  final bool scrollToAddContacts;

  const EditProfileScreen({
    super.key,
    required this.room,
    required this.displayname,
    required this.roomAvatar,
    required this.actualMembersCount,
    required this.controller,
    required this.isDirectchat,
    this.scrollToAddContacts = false,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _addContactsKey = GlobalKey();
  bool _isLoading = false;
  bool _isEditing = false;
  bool _showAdminMessage = true;

  // For add contacts section
  final List<Room> _selectedRooms = [];
  bool _addingMembers = false;

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.displayname;
    _bioController.text = widget.room.topic;

    if (widget.scrollToAddContacts) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToAddContacts();
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToAddContacts() {
    Future.delayed(const Duration(milliseconds: 500), () {
      if (_addContactsKey.currentContext != null) {
        Scrollable.ensureVisible(
          _addContactsKey.currentContext!,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  /// Opens AddContactGroup screen, excluding existing group members,
  /// and returns selected contacts.
  Future<void> _openAddContactsScreen() async {
    // Get existing member IDs to exclude
    final existingMemberIds =
        widget.room.getParticipants().map((m) => m.id).toSet();

    // Also exclude already-selected contacts
    final alreadySelectedIds = _selectedRooms
        .map((r) => r.directChatMatrixID)
        .whereType<String>()
        .toSet();

    final excludeIds = {...existingMemberIds, ...alreadySelectedIds};

    final result = await Navigator.of(context).push<List<Room>>(
      MaterialPageRoute(
        builder: (context) => AddContactGroup(
          excludeUserIds: excludeIds,
        ),
      ),
    );

    if (result != null && result.isNotEmpty) {
      setState(() {
        // Add newly selected rooms (avoid duplicates)
        for (final room in result) {
          if (!_selectedRooms.any((r) => r.id == room.id)) {
            _selectedRooms.add(room);
          }
        }
      });
    }
  }

  void _removeSelectedContact(Room room) {
    setState(() {
      _selectedRooms.removeWhere((r) => r.id == room.id);
    });
  }

  Future<void> _addSelectedMembers() async {
    if (_selectedRooms.isEmpty) return;

    setState(() => _addingMembers = true);

    int successCount = 0;

    for (final room in _selectedRooms) {
      try {
        final userId = room.directChatMatrixID;
        if (userId != null && userId.isNotEmpty) {
          await widget.room.invite(userId);
          successCount++;
        }
      } catch (e) {
        Logs().w('Failed to invite user from room ${room.id}', e);
      }
    }

    if (!mounted) return;

    setState(() => _addingMembers = false);

    if (successCount > 0) {
      // Navigate to done screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => AddMembersDoneScreen(
            groupName: widget.displayname,
            roomId: widget.room.id,
            addedCount: successCount,
          ),
        ),
      );
    } else {
      CustomSnackbar.show(
        context,
        title: L10n.of(context).error,
        message: 'Failed to add members',
        type: SnackbarType.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(color: const Color(0xFF1B1C30)),
            ),
            BgGradientTheme(
              position: ShapePosition.center,
              width: screenWidth * 1.8,
              height: screenHeight * 0.85,
              gradient: const RadialGradient(colors: [
                const Color(0xFF17209A),
                Colors.transparent,
              ], radius: 1.5),
              opacity: 0.8,
            ),
            BgGradientTheme(
              position: ShapePosition.center,
              width: screenWidth * 1.8,
              height: screenHeight * 0.85,
              gradient: const RadialGradient(colors: [
                const Color(0x994754FF),
                Colors.transparent,
              ], radius: 1.5),
              opacity: 0.8,
            ),
            BgGradientTheme(
              position: ShapePosition.center,
              width: screenWidth * 1.8,
              height: screenHeight * 0.85,
              gradient: const RadialGradient(colors: [
                const Color(0x994754FF),
                Colors.transparent,
              ], radius: 1.5),
              opacity: 0.8,
            ),
            BgGradientTheme(
              position: ShapePosition.bottomFull,
              height: screenHeight * 0.2,
              colors: const [
                Color(0xFF1B1C30),
                Color(0xFFA912BF),
              ],
              opacity: 0.4,
            ),
            BgGradientTheme(
              position: ShapePosition.topLeft,
              width: screenWidth * 0.3,
              height: screenHeight * 0.2,
              color: Colors.black,
              opacity: 0.25,
            ),
            BgGradientTheme(
              position: ShapePosition.bottomLeft,
              width: screenWidth * 0.3,
              height: screenHeight * 0.2,
              color: Colors.black,
              opacity: 0.25,
            ),
            BgGradientTheme(
              position: ShapePosition.bottomFull,
              width: screenWidth * 05,
              height: screenHeight * 0.1,
              color: Colors.black,
              opacity: 0.5,
            ),
            BgGradientTheme(
              position: ShapePosition.topRight,
              width: screenWidth * 0.3,
              height: screenHeight * 0.2,
              color: Colors.black,
              opacity: 0.25,
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 90, sigmaY: 90),
                child: Container(color: Colors.transparent),
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(height: 8),
                    // Admin message chip for group chats
                    if (!widget.isDirectchat && _showAdminMessage && !widget.room.canSendEvent('m.room.name'))
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF6B35).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xFFFF6B35).withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: const Color(0xFFFF6B35),
                              size: 16,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                L10n.of(context).onlyAdminsCanEditGroup,
                                style: TextStyle(
                                  color: const Color(0xFFFF6B35),
                                  fontSize: 12,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showAdminMessage = false;
                                });
                              },
                              child: Icon(
                                Icons.close,
                                color: const Color(0xFFFF6B35),
                                size: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    _buildHeaderSection(
                      widget.room,
                      widget.displayname,
                      widget.roomAvatar,
                      widget.actualMembersCount,
                      Theme.of(context),
                      context,
                    ),
                    SizedBox(
                      height: context.screenHeight * 0.03,
                    ),
                    if (_isEditing)
                      Center(
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              )
                            : CustomButton(
                                text: L10n.of(context).save,
                                onPressed: () async {
                                  setState(() {
                                    _isLoading = true;
                                  });

                                  try {
                                    // Check if user has permission to edit
                                    final canSendStateEvent = widget.room.canSendEvent('m.room.name');
                                    debugPrint('Can send m.room.name: $canSendStateEvent');
                                    debugPrint('User power level: ${widget.room.ownPowerLevel}');
                                    
                                    if (_nameController.text.trim().isNotEmpty) {
                                      await widget.room
                                          .setName(_nameController.text.trim());
                                    }
                                    // Update bio (topic) only for direct chats
                                    if (widget.isDirectchat &&
                                        _bioController.text.trim() !=
                                            widget.room.topic) {
                                      await widget.room.setDescription(
                                          _bioController.text.trim());
                                    }
                                    if (mounted) {
                                      CustomSnackbar.show(
                                        context,
                                        title: L10n.of(context).success,
                                        message: L10n.of(context).profileUpdatedSuccessfully,
                                        type: SnackbarType.success,
                                      );
                                      setState(() {
                                        _isEditing = false;
                                        _isLoading = false;
                                      });
                                    }

                                    Navigator.of(context).pop();
                                  } catch (e) {
                                    debugPrint('Error updating profile: $e');
                                    if (mounted) {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      
                                      String errorMessage = L10n.of(context).failedToUpdateProfile;
                                      if (e.toString().contains('M_FORBIDDEN')) {
                                        errorMessage = L10n.of(context).groupEditPermissionDenied;
                                      } else if (e.toString().contains('power level')) {
                                        errorMessage = L10n.of(context).insufficientGroupPermissions;
                                      }
                                      
                                      CustomSnackbar.show(
                                        context,
                                        title: L10n.of(context).error,
                                        message: errorMessage,
                                        type: SnackbarType.error,
                                      );
                                    }
                                  }
                                },
                              ),
                      ),
                    // Add Contacts Section for group chats only
                    if (!widget.isDirectchat) ...[
                      SizedBox(height: context.screenHeight * 0.03),
                      _buildAddContactsSection(context),
                    ],
                    SizedBox(height: context.screenHeight * 0.03),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAddContactsSection(BuildContext context) {
    return Padding(
      key: _addContactsKey,
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // "Add Contacts" button — navigates to AddContactGroup screen
          GestureDetector(
            onTap: _openAddContactsScreen,
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: context.screenWidth * 0.04,
              ),
              padding: EdgeInsets.all(context.screenWidth * 0.04),
              decoration: BoxDecoration(
                color: const Color(0xff050926).withOpacity(0.5),
                borderRadius: BorderRadius.circular(
                  context.screenWidth * 0.075,
                ),
                border: Border.all(
                  color: const Color(0xFF5F18BF).withOpacity(0.3),
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
                          blurRadius: context.screenWidth * 0.052,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          L10n.of(context).addContacts,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: context.screenWidth * 0.04,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(
                          height: context.screenHeight * 0.005,
                        ),
                        Text(
                          L10n.of(context).selectFromYourContacts,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: context.screenWidth * 0.035,
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
                      color: const Color(0xff050926).withOpacity(0.5),
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

          // Show "Contacts in group" label + selected contacts list only when contacts are selected
          if (_selectedRooms.isNotEmpty) ...[
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Contacts in group',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 14,
                  fontFamily: 'Neometric',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Selected contacts list (display only, with remove on tap)
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _selectedRooms.length,
              itemBuilder: (context, index) {
                final room = _selectedRooms[index];
                return buildContactItem(
                  context,
                  room,
                  true, // always show as selected
                  () => _removeSelectedContact(room),
                );
              },
            ),

            // Done button to add all selected members
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: _addingMembers
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : ElevatedButton(
                        onPressed: _addSelectedMembers,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3976F8),
                          minimumSize: const Size(200, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: Text(
                          L10n.of(context).done,
                          style: const TextStyle(
                            color: Color(0xFFFCFCFC),
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildHeaderSection(Room room, String displayname, Uri? roomAvatar,
      int actualMembersCount, ThemeData theme, BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xff7216BF).withOpacity(0.5),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                color: const Color(0xff7216BF).withOpacity(1.0),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: context.screenHeight * 0.02),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Image.asset(
                          ImageAssets.arrowLeft,
                          width: 40,
                          height: 40,
                        ),
                      ),
                      Text(
                        L10n.of(context).editContact,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFFF3F7F8),
                          fontSize: context.screenWidth * 0.04,
                          fontFamily: 'Neometric',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 40),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                      height: context.screenHeight * 0.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(ImageAssets.blueBg),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(),
                            if (room.canSendEvent('m.room.name'))
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isEditing = !_isEditing;
                                    });
                                  },
                                  child: Image.asset(
                                    ImageAssets.editIcon2,
                                    width: 25,
                                    height: 25,
                                  ),
                                ),
                              ),
                          ],
                        )
                        ],
                      )),
                ),
                const SizedBox(height: 65),
                const SizedBox(height: 8),
                Text(
                  displayname,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  L10n.of(context).countParticipants(actualMembersCount),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: context.screenHeight * 0.02,
                ),
                SizedBox(
                  width: context.screenWidth * 0.88,
                  child: Text(
                    L10n.of(context).name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 1),
                  child: CustomShadowTextField(
                    width: double.infinity,
                    hintText: room.isDirectChat
                        ? L10n.of(context).displayName
                        : L10n.of(context).groupName,
                    controller: _nameController,
                    enabled: _isEditing,
                  ),
                ),
                SizedBox(
                  height: context.screenHeight * 0.02,
                ),
                // Show Bio only for direct chats, NOT for group chats
                if (widget.isDirectchat) ...[
                  SizedBox(
                    width: context.screenWidth * 0.88,
                    child: Text(
                      'Bio',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 1),
                    child: CustomShadowTextField(
                      width: double.infinity,
                      hintText: L10n.of(context).noChatDescriptionYet,
                      controller: _bioController,
                      maxLines: 3,
                      minLines: 3,
                      showPrefixIcon: false,
                      borderRadius: 35,
                      enabled: _isEditing,
                    ),
                  ),
                ],

                SizedBox(
                  height: context.screenHeight * 0.04,
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: context.screenHeight * 0.17,
          left: MediaQuery.of(context).size.width * 0.5 - 65,
          child: GestureDetector(
            onTap: () => widget.controller.setAvatarAction(),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 65,
                  backgroundColor: Colors.white,
                  child: Avatar(
                    mxContent: room.avatar,
                    name: displayname,
                    size: 130,
                  ),
                ),
                 if (room.canSendEvent('m.room.name'))
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: CircleAvatar(
                    child: Center(
                      child: SvgPicture.asset(
                        ImageAssets.cameraIcon,
                        width: 55,
                        height: 55,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
