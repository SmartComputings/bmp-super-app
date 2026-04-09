import 'dart:typed_data';

import 'package:bmp/features/chat/new_group/new_group_view.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/file_selector.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matrix/matrix.dart' as sdk;
import 'package:matrix/matrix.dart';
import 'process_group_screen.dart';

class NewGroup extends StatefulWidget {
  final CreateGroupType createGroupType;
  const NewGroup({
    this.createGroupType = CreateGroupType.group,
    super.key,
  });

  @override
  NewGroupController createState() => NewGroupController();
}

class NewGroupController extends State<NewGroup> {
  TextEditingController nameController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode searchFocusNode = FocusNode();

  bool publicGroup = false;
  bool groupCanBeFound = false;
  bool encryptionEnabled = true; // Default encryption for private groups

  Uint8List? avatar;

  Uri? avatarUrl;

  Object? error;

  bool loading = false;

  String? nameValidationError;

  List<Room> fetchedRooms = [];
  List<Room> filteredRooms = [];
  final List<Room> finalSelectedRooms = [];

  CreateGroupType get createGroupType =>
      _createGroupType ?? widget.createGroupType;

  CreateGroupType? _createGroupType;

  void setCreateGroupType(Set<CreateGroupType> b) =>
      setState(() => _createGroupType = b.single);

  void setPublicGroup(bool b) => setState(() {
    publicGroup = groupCanBeFound = b;
    // Auto-disable encryption for public groups
    if (b) encryptionEnabled = false;
    else encryptionEnabled = true;
  });

  void setGroupCanBeFound(bool b) => setState(() => groupCanBeFound = b);
  
  void setEncryptionEnabled(bool b) => setState(() => encryptionEnabled = b);

  void selectPhoto() async {
    final photo = await selectFiles(
      context,
      type: FileSelectorType.images,
      allowMultiple: false,
    );
    final bytes = await photo.singleOrNull?.readAsBytes();

    setState(() {
      avatarUrl = null;
      avatar = bytes;
    });
  }

    Future<String> _createGroup() async {
    if (!mounted) return '';
    final client = Matrix.of(context).client;
    
    // Create a Space instead of regular room (for channel support)
    final roomId = await client.createRoom(
      preset: publicGroup 
          ? sdk.CreateRoomPreset.publicChat 
          : sdk.CreateRoomPreset.privateChat,
      creationContent: {'type': RoomCreationTypes.mSpace},
      visibility: publicGroup ? sdk.Visibility.public : sdk.Visibility.private,
      roomAliasName: publicGroup
          ? nameController.text.trim().toLowerCase().replaceAll(' ', '_')
          : null,
      name: nameController.text.isNotEmpty ? nameController.text : null,
      initialState: [
        if (avatar != null)
          sdk.StateEvent(
            type: sdk.EventTypes.RoomAvatar,
            content: {'url': avatarUrl.toString()},
          ),
        // Enable encryption for private groups
        if (!publicGroup && encryptionEnabled)
          sdk.StateEvent(
            type: sdk.EventTypes.Encryption,
            content: const {'algorithm': 'm.megolm.v1.aes-sha2'},
          ),
      ],
    );
    if (!mounted) return '';
    
    // Wait for room to be available and force sync
    await client.waitForRoomInSync(roomId);
    await client.sync();
    
    // Send invites to all selected contacts
    for (final room in finalSelectedRooms) {
      try {
        final userId = room.directChatMatrixID;
        if (userId != null && userId.isNotEmpty) {
          await client.inviteUser(roomId, userId);
        }
      } catch (e) {
        sdk.Logs().w(L10n.of(context).failedToInviteUser(room.id), e);
        // Continue inviting others even if one fails
      }
    }
    
    // context.go('/rooms/$roomId/invite');
    return roomId;
  }

  // Future<void> _createGroup() async {
  //   if (!mounted) return;
  //   final roomId = await Matrix.of(context).client.createGroupChat(
  //     visibility:
  //         groupCanBeFound ? sdk.Visibility.public : sdk.Visibility.private,
  //     preset: publicGroup
  //         ? sdk.CreateRoomPreset.publicChat
  //         : sdk.CreateRoomPreset.privateChat,
  //     groupName: nameController.text.isNotEmpty ? nameController.text : null,
  //     initialState: [
  //       if (avatar != null)
  //         sdk.StateEvent(
  //           type: sdk.EventTypes.RoomAvatar,
  //           content: {'url': avatarUrl.toString()},
  //         ),
  //     ],
  //   );
  //   if (!mounted) return;
  //   context.go('/rooms/$roomId/invite');
  // }

  Future<void> _createSpace() async {
    if (!mounted) return;
    final spaceId = await Matrix.of(context).client.createRoom(
          preset: publicGroup
              ? sdk.CreateRoomPreset.publicChat
              : sdk.CreateRoomPreset.privateChat,
          creationContent: {'type': RoomCreationTypes.mSpace},
          visibility: publicGroup ? sdk.Visibility.public : null,
          roomAliasName: publicGroup
              ? nameController.text.trim().toLowerCase().replaceAll(' ', '_')
              : null,
          name: nameController.text.trim(),
          powerLevelContentOverride: {'events_default': 100},
          initialState: [
            if (avatar != null)
              sdk.StateEvent(
                type: sdk.EventTypes.RoomAvatar,
                content: {'url': avatarUrl.toString()},
              ),
          ],
        );
    if (!mounted) return;
    context.pop<String>(spaceId);
  }

  void submitAction([_]) async {
    final client = Matrix.of(context).client;

    try {
      if (nameController.text.trim().isEmpty &&
          createGroupType == CreateGroupType.space) {
        setState(() => error = L10n.of(context).pleaseFillOut);
        return;
      }

      setState(() {
        loading = true;
        error = null;
      });

      final avatar = this.avatar;
      avatarUrl ??= avatar == null ? null : await client.uploadContent(avatar);

      if (!mounted) return;

      final roomId = await _createGroup();
      
      if (!mounted) return;

      if (roomId.isNotEmpty) {
        // Force one more sync before navigation to ensure room list is updated
        await client.sync();
        
        // Pop current route first, then push the new screen
        if (mounted) {
          Navigator.of(context).pop();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProcessGroupScreen(
                groupName: nameController.text.isNotEmpty 
                    ? nameController.text 
                    : L10n.of(context).newGroup,
                roomId: roomId,
              ),
            ),
          );
        }
      }

      // switch (createGroupType) {
      //   case CreateGroupType.group:
      //     await _createGroup();
      //   case CreateGroupType.space:
      //     await _createSpace();
      // }
    } catch (e, s) {
      sdk.Logs().d(L10n.of(context).unableToCreateGroup, e, s);
      setState(() {
        error = e;
        loading = false;
      });
    }
  }

  void searchContacts(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredRooms = fetchedRooms;
      } else {
        filteredRooms = fetchedRooms
            .where((room) => room
                .getLocalizedDisplayname()
                .toLowerCase()
                .contains(query.toLowerCase()),)
            .toList();
      }
    });
  }

  void updateFetchedRooms(List<Room> rooms) {
    setState(() {
      fetchedRooms = rooms;
      filteredRooms = rooms;
      finalSelectedRooms.clear();
      finalSelectedRooms.addAll(rooms);
    });
  }

  void toggleContact(String roomId) {
    setState(() {
      final room = fetchedRooms.firstWhere((r) => r.id == roomId);
      if (finalSelectedRooms.any((r) => r.id == roomId)) {
        finalSelectedRooms.removeWhere((r) => r.id == roomId);
      } else {
        finalSelectedRooms.add(room);
      }
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    searchController.dispose();
    nameFocusNode.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => NewGroupView(this);
}

enum CreateGroupType { group, space }
