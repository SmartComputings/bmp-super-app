import 'package:bmp/core/config/themes.dart';
import 'package:bmp/core/constant/app_colors.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/Screens/OnBoardingScreen/widgets/DynamicHeader.dart';
import 'package:bmp/features/chat/chat_list/chat_list.dart';
import 'package:bmp/features/chat/chat_list/chat_list_item.dart';
import 'package:bmp/features/chat/chat_list/dummy_chat_list_item.dart';
import 'package:bmp/features/chat/chat_list/search_title.dart';
import 'package:bmp/features/chat/chat_list/space_view.dart';
import 'package:bmp/features/chat/story_section/stories_widgets/stories_widget.dart';
import 'package:bmp/shared/providers/zone_color_provider.dart';
import 'package:bmp/shared/utils/app_loading_widget.dart';
import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/utils/room_archive_helper.dart';
import 'package:bmp/shared/utils/snackbar.dart';
import 'package:bmp/shared/utils/stream_extension.dart';
import 'package:bmp/shared/widgets/adaptive_dialogs/public_room_dialog.dart';
import 'package:bmp/shared/widgets/adaptive_dialogs/user_dialog.dart';
import 'package:bmp/shared/widgets/avatar.dart';
import 'package:bmp/shared/widgets/future_loading_dialog.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:bmp/shared/widgets/selection_header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matrix/matrix.dart';
import 'package:provider/provider.dart';

enum SettingsAction {
  addAccount,
  newGroup,
  setStatus,
  settings,
  archive,
  myBank,
  home,
}

class ChatListViewBody extends StatefulWidget {
  final ChatListController controller;
  final VoidCallback? onBackPressed;
  final AnimationController animationController;

  const ChatListViewBody(
    this.controller,
    this.animationController, {
    super.key,
    this.onBackPressed,
  });

  @override
  State<ChatListViewBody> createState() => _ChatListViewBodyState();
}

class _ChatListViewBodyState extends State<ChatListViewBody> {
  String? _selectedTab;
  bool _showingRequestsOnly = false;
  String? _roomWithOpenPopup; // Track which room has an open popup menu

  void _handleBulkDelete(BuildContext context, List<Room> rooms) async {
    await showFutureLoadingDialog(
      context: context,
      future: () async {
        for (final room in rooms) {
          await room.leave();
        }
      },
    );
    widget.controller.clearSelection();
  }

  void _handleBulkRead(BuildContext context, List<Room> rooms) async {
    await showFutureLoadingDialog(
      context: context,
      future: () async {
        for (final room in rooms) {
          await room.markUnread(false);
          final lastEvent = room.lastEvent;
          if (lastEvent != null) {
            await room.setReadMarker(
              lastEvent.eventId,
              mRead: lastEvent.eventId,
            );
          }
        }
      },
    );
    widget.controller.clearSelection();
  }

  void _handleBulkMute(BuildContext context, List<Room> rooms) async {
    await showFutureLoadingDialog(
      context: context,
      future: () async {
        for (final room in rooms) {
          if (room.pushRuleState == PushRuleState.notify) {
            await room.setPushRuleState(PushRuleState.dontNotify);
          } else {
            await room.setPushRuleState(PushRuleState.notify);
          }
        }
      },
    );
    widget.controller.clearSelection();
  }

  void _handleBulkPin(BuildContext context, List<Room> rooms) async {
    final client = Matrix.of(context).client;
    final currentlyPinned =
        client.rooms.where((r) => r.tags.containsKey('m.favourite')).length;

    final roomsToPin =
        rooms.where((room) => !room.tags.containsKey('m.favourite')).toList();
    final roomsToUnpin =
        rooms.where((room) => room.tags.containsKey('m.favourite')).toList();

    final totalAfterPinning =
        currentlyPinned + roomsToPin.length - roomsToUnpin.length;

    if (totalAfterPinning > 3) {
      CustomSnackbar.show(
        context,
        title: L10n.of(context).warning,
        message: L10n.of(context).pinLimitMessage,
        type: SnackbarType.warning,
      );

      final availableSlots = 3 - (currentlyPinned - roomsToUnpin.length);
      final roomsToPinLimited = roomsToPin.take(availableSlots).toList();

      await showFutureLoadingDialog(
        context: context,
        future: () async {
          for (final room in roomsToUnpin) {
            await room.removeTag('m.favourite');
          }
          for (final room in roomsToPinLimited) {
            await room.addTag('m.favourite', order: 0.5);
          }
        },
      );
    } else {
      await showFutureLoadingDialog(
        context: context,
        future: () async {
          for (final room in rooms) {
            final currentTags = room.tags;
            if (currentTags.containsKey('m.favourite')) {
              await room.removeTag('m.favourite');
            } else {
              await room.addTag('m.favourite', order: 0.5);
            }
          }
        },
      );
    }

    widget.controller.clearSelection();
  }

  void _handleBulkBlock(BuildContext context, List<Room> rooms) async {
    await showFutureLoadingDialog(
      context: context,
      future: () async {
        for (final room in rooms) {
          if (room.directChatMatrixID != null) {
            await room.client.ignoreUser(room.directChatMatrixID!);
          }
        }
      },
    );
    widget.controller.clearSelection();
  }

  void _handleBulkArchive(BuildContext context, List<Room> rooms) async {
    await showFutureLoadingDialog(
      context: context,
      future: () async {
        for (final room in rooms) {
          if (RoomArchiveHelper.isRoomArchived(room)) {
            await RoomArchiveHelper.unarchiveRoom(room);
          } else {
            await RoomArchiveHelper.archiveRoom(room);
          }
        }
      },
    );
    widget.controller.clearSelection();
  }

  void _handleMenuAction(SettingsAction action, BuildContext context) async {
    switch (action) {
      case SettingsAction.addAccount:
        // final consent = await showOkCancelAlertDialog(
        //   context: context,
        //   title: L10n.of(context).addAccount,
        //   message: L10n.of(context).enableMultiAccounts,
        //   okLabel: L10n.of(context).next,
        //   cancelLabel: L10n.of(context).cancel,
        // );
        // if (consent != OkCancelResult.ok) return;
        context.go('/mainMenuScreen/rooms/settings/addaccount');
        break;
      case SettingsAction.newGroup:
        context.go('/mainMenuScreen/rooms/newgroup');
        break;
      // case SettingsAction.invite:
      //   BmpShare.shareInviteLink(context);
      //   break;
      case SettingsAction.settings:
        context.go('/settings');
        break;
      case SettingsAction.archive:
        try {
          final client = Matrix.of(context).client;
          if (!client.isLogged()) {
            CustomSnackbar.show(
              context,
              title: L10n.of(context).accessRequired,
              message: L10n.of(context).pleaseLogInToAccessArchive,
              type: SnackbarType.warning,
            );
            return;
          }
          await context.push('/mainMenuScreen/rooms/archive');
          setState(() {});
        } catch (e) {
          CustomSnackbar.show(
            context,
            title: L10n.of(context).error,
            message: '${L10n.of(context).errorAccessingArchive}: $e',
            type: SnackbarType.error,
          );
        }
        break;
      case SettingsAction.setStatus:
        widget.controller.setStatus();
        break;
      case SettingsAction.myBank:
        context.push('/mainMenuScreen/wallet');
        break;
      case SettingsAction.home:
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const OnBoardingScreen(),
        //   ),
        // );
        context.go('/onboarding');
        break;
    }
  }
  // void _handleMenuAction(SettingsAction action, BuildContext context) async {
  //   switch (action) {
  //     case SettingsAction.addAccount:
  //       final consent = await showOkCancelAlertDialog(
  //         context: context,
  //         title: L10n.of(context).addAccount,
  //         message: L10n.of(context).enableMultiAccounts,
  //         okLabel: L10n.of(context).next,
  //         cancelLabel: L10n.of(context).cancel,
  //       );
  //       if (consent != OkCancelResult.ok) return;
  //       context.go('/rooms/settings/addaccount');
  //       break;
  //     case SettingsAction.newGroup:
  //       context.go('/rooms/newgroup');
  //       break;
  //     // case SettingsAction.invite:
  //     //   BmpShare.shareInviteLink(context);
  //     //   break;
  //     case SettingsAction.settings:
  //       context.go('/settings');
  //       break;
  //     case SettingsAction.archive:
  //       try {
  //         final client = Matrix.of(context).client;
  //         if (!client.isLogged()) {
  //           CustomSnackbar.show(
  //             context,
  //             title: 'Access Required',
  //             message: 'Please log in to access archive',
  //             type: SnackbarType.warning,
  //           );
  //           return;
  //         }
  //         context.go('/rooms/archive');
  //       } catch (e) {
  //         CustomSnackbar.show(
  //           context,
  //           title: 'Error',
  //           message: 'Error accessing archive: $e',
  //           type: SnackbarType.error,
  //         );
  //       }
  //       break;
  //     case SettingsAction.setStatus:
  //       widget.controller.setStatus();
  //       break;
  //     case SettingsAction.myWallet:
  //       context.push('/rooms/wallet');
  //       break;
  //     case SettingsAction.home:
  //       // Navigator.push(
  //       //   context,
  //       //   MaterialPageRoute(
  //       //     builder: (context) => const OnBoardingScreen(),
  //       //   ),
  //       // );
  //       context.go('/mainMenuScreen');
  //       break;
  //   }
  // }

  Widget _buildTabButton(String title, int count, bool isSelected) {
    return MouseRegion(
      onEnter: (_) => setState(() {}),
      onExit: (_) => setState(() {}),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTab = title; // Add this line
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: context.screenWidth * 0.045,
            vertical: context.screenHeight * 0.0075,
          ),
          decoration: ShapeDecoration(
            gradient: isSelected
                ? const LinearGradient(
                    begin: Alignment(-0.19, 0.43),
                    end: Alignment(0.52, 1.17),
                    colors: [Color(0xFF1929FF), Color(0xFF1929FF)],
                  )
                : null,
            color:
                isSelected ? null : const Color(0xFFF2FBF9).withOpacity(0.24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1000),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: context.screenWidth * 0.01,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: context.screenWidth * 0.035,
                  fontFamily: 'All Round Gothic',
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (count > 0)
                Container(
                  constraints:
                      BoxConstraints(minWidth: context.screenWidth * 0.045),
                  height: context.screenWidth * 0.045,
                  decoration: ShapeDecoration(
                    color: isSelected ? Colors.white : const Color(0xFF3976F8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1000),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      count.toString(),
                      style: TextStyle(
                        color:
                            isSelected ? const Color(0xFF3976F8) : Colors.white,
                        fontSize: context.screenWidth * 0.025,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),

        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _selectedTab ??= L10n.of(context).chat;

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);
    final matrix = Matrix.of(context);
    if (matrix.widget.clients.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        try {
          context.go('/home');
        } catch (_) {}
      });
      return const SizedBox.shrink();
    }
    final client = matrix.client;
    final activeSpace = widget.controller.activeSpaceId;
    if (activeSpace != null) {
      return SpaceView(
        key: ValueKey(activeSpace),
        spaceId: activeSpace,
        onBack: widget.controller.clearActiveSpace,
        onChatTab: (room) => widget.controller.onChatTap(room),
        onChatContext: (room, context) =>
            widget.controller.chatContextAction(room, context),
        activeChat: widget.controller.activeChat,
        toParentSpace: widget.controller.setActiveSpace,
      );
    }

    // Add PopScope to handle navigation and clear focus
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        // Clear focus when navigating away
        widget.controller.clearFocus();
      },
      child: _buildChatListView(context, client, theme),
    );
  }

  Widget _buildChatListView(
      BuildContext context, Client client, ThemeData theme) {
    return GestureDetector(
      onTap: () {
        // Clear focus when tapping outside the search field
        if (widget.controller.searchFocusNode.hasFocus) {
          widget.controller.clearFocus();
        }
      },
      child: _buildChatListContent(context, client, theme),
    );
  }

  Widget _buildChatListContent(
      BuildContext context, Client client, ThemeData theme) {
    final spaces = client.rooms.where((r) => r.isSpace);
    final spaceDelegateCandidates = <String, Room>{};
    for (final space in spaces) {
      for (final spaceChild in space.spaceChildren) {
        final roomId = spaceChild.roomId;
        if (roomId == null) continue;
        spaceDelegateCandidates[roomId] = space;
      }
    }

    final userSearchResult = widget.controller.userSearchResult;
    const dummyChatCount = 4;
    final filter = widget.controller.searchController.text.toLowerCase();
    // Use different room lists based on view mode
    final allRooms = _showingRequestsOnly
        ? widget.controller.chatRequests
        : widget.controller.activeChats;
    final rooms = allRooms
        .where((room) => !RoomArchiveHelper.isRoomArchived(room))
        .where((room) {
      // Hide story rooms from regular chat list
      if (room.getState('m.room.create')?.content['type'] == 'm.story_room') {
        return false;
      }
      // Show direct chats, parent spaces/groups, but hide channels
      if (room.isDirectChat) return true;
      if (room.isSpace) return true; // Always show spaces
      // For regular rooms, only show if they are not channels (no space parents)
      return room.spaceParents.isEmpty;
    }).toList();

    // Get server public rooms
    final serverPublicRooms = widget.controller.roomSearchResult?.chunk
            .where(
              (room) => room.roomType == null,
            )
            .toList() ??
        <PublicRoomsChunk>[];
    final serverPublicSpaces = widget.controller.roomSearchResult?.chunk
            .where(
              (room) => room.roomType == 'm.space' || room.roomType == 'space',
            )
            .toList() ??
        <PublicRoomsChunk>[];

    // Get local matching rooms (always include them in search)
    final localPublicRooms =
        (widget.controller.isSearchMode && filter.isNotEmpty)
            ? rooms
                .where((room) {
                  final searchText = filter.toLowerCase();
                  final roomName = room.getLocalizedDisplayname().toLowerCase();
                  final roomAlias = room.canonicalAlias.toLowerCase() ?? '';
                  final matches = roomName.contains(searchText) ||
                      roomAlias.contains(searchText);
                  final isGroup = !room.isDirectChat;
                  return matches && isGroup;
                })
                .map(
                  (room) => PublicRoomsChunk(
                    name: room.getLocalizedDisplayname(),
                    roomId: room.id,
                    canonicalAlias: room.canonicalAlias,
                    avatarUrl: room.avatar,
                    numJoinedMembers: room.getParticipants().length,
                    worldReadable: room.historyVisibility ==
                        HistoryVisibility.worldReadable,
                    guestCanJoin: room.guestAccess == GuestAccess.canJoin,
                  ),
                )
                .toList()
            : <PublicRoomsChunk>[];

    final localPublicSpaces =
        (widget.controller.isSearchMode && filter.isNotEmpty)
            ? rooms
                .where((room) {
                  final searchText = filter.toLowerCase();
                  final roomName = room.getLocalizedDisplayname().toLowerCase();
                  final roomAlias = room.canonicalAlias.toLowerCase() ?? '';
                  final matches = roomName.contains(searchText) ||
                      roomAlias.contains(searchText);
                  final isSpace = room.isSpace;
                  return matches && isSpace;
                })
                .map(
                  (room) => PublicRoomsChunk(
                    name: room.getLocalizedDisplayname(),
                    roomId: room.id,
                    canonicalAlias: room.canonicalAlias,
                    avatarUrl: room.avatar,
                    numJoinedMembers: room.getParticipants().length,
                    worldReadable: room.historyVisibility ==
                        HistoryVisibility.worldReadable,
                    guestCanJoin: room.guestAccess == GuestAccess.canJoin,
                    roomType: 'm.space',
                  ),
                )
                .toList()
            : <PublicRoomsChunk>[];

    // Combine server and local results
    final publicRooms = <PublicRoomsChunk>[
      ...serverPublicRooms,
      ...localPublicRooms,
    ];
    final publicSpaces = <PublicRoomsChunk>[
      ...serverPublicSpaces,
      ...localPublicSpaces,
    ];

    // Debug UI filtering
    if (widget.controller.isSearchMode && filter.isNotEmpty) {
      debugPrint('=== UI FILTERING ===');
      debugPrint('Server public rooms: ${serverPublicRooms.length}');
      debugPrint('Local public rooms: ${localPublicRooms.length}');
      debugPrint('Total public rooms: ${publicRooms.length}');
      debugPrint('Server public spaces: ${serverPublicSpaces.length}');
      debugPrint('Local public spaces: ${localPublicSpaces.length}');
      debugPrint('Total public spaces: ${publicSpaces.length}');
      for (final room in rooms.where((r) => !r.isDirectChat).take(5)) {
        final roomName = room.getLocalizedDisplayname().toLowerCase();
        final searchText = filter.toLowerCase();
        final matches = roomName.contains(searchText);
        debugPrint(
          'Room: "${room.getLocalizedDisplayname()}" joinRules:${room.joinRules} isSpace:${room.isSpace} isDirect:${room.isDirectChat} matches:$matches',
        );
      }
    }

    return StreamBuilder(
      key: ValueKey(
        client.userID.toString(),
      ),
      stream: client.onSync.stream.rateLimit(const Duration(milliseconds: 50)),
      builder: (context, _) {
        final isSelectionMode = widget.controller.isSelectionMode;
        final selectedCount = widget.controller.selectedRooms.length;

        return Stack(
          children: [
            if (rooms.isEmpty)
              Positioned.fill(
                child: Opacity(
                  opacity: 1,
                  child: Image.asset(
                    'assets/chat_icons/patron 1.png',
                    fit: BoxFit.cover,
                    color: const Color(0xFF5F18BF),
                    colorBlendMode: BlendMode.modulate,
                  ),
                ),
              ),
            if (rooms.isEmpty && !widget.controller.isSearchMode)
              Align(
                alignment: const Alignment(0, 0.3),
                child: Stack(
                  children: [
                    Image.asset(
                      ImageAssets.noChatFoundState,
                      fit: BoxFit.contain,
                    ),
                    Positioned(
                      bottom: context.screenHeight * 0.037,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          Text(
                            L10n.of(context).startAConversation,
                            style: TextStyle(
                              fontSize: context.screenWidth * 0.09,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              height: 1.1,
                              fontFamily: 'Montserrat',
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            L10n.of(context).sendMessageToGetStarted,
                            style: TextStyle(
                              fontSize: context.screenWidth * 0.04,
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            SafeArea(
              child: Column(
                children: [
                  // Static header - won't scroll
                  if (widget.controller.isSelectionMode)
                    SelectionHeader(
                      selectedCount: widget.controller.selectedRooms.length,
                      onClearSelection: widget.controller.clearSelection,
                      selectedRooms: client.rooms
                          .where(
                            (room) => widget.controller.selectedRooms
                                .contains(room.id),
                          )
                          .toList(),
                      onDelete: () => _handleBulkDelete(
                        context,
                        client.rooms
                            .where(
                              (room) => widget.controller.selectedRooms
                                  .contains(room.id),
                            )
                            .toList(),
                      ),
                      onMute: () => _handleBulkMute(
                        context,
                        client.rooms
                            .where(
                              (room) => widget.controller.selectedRooms
                                  .contains(room.id),
                            )
                            .toList(),
                      ),
                      onPin: () => _handleBulkPin(
                        context,
                        client.rooms
                            .where(
                              (room) => widget.controller.selectedRooms
                                  .contains(room.id),
                            )
                            .toList(),
                      ),
                      onBlock: () => _handleBulkBlock(
                        context,
                        client.rooms
                            .where(
                              (room) => widget.controller.selectedRooms
                                  .contains(room.id),
                            )
                            .toList(),
                      ),
                      onRead: () => _handleBulkRead(
                        context,
                        client.rooms
                            .where(
                              (room) => widget.controller.selectedRooms
                                  .contains(room.id),
                            )
                            .toList(),
                      ),
                      onArchive: () => _handleBulkArchive(
                        context,
                        client.rooms
                            .where(
                              (room) => widget.controller.selectedRooms
                                  .contains(room.id),
                            )
                            .toList(),
                      ),
                    ),
                  if (!widget.controller.isSelectionMode)
                    Padding(
                      padding:
                          EdgeInsets.only(top: context.screenHeight * 0.0125),
                      child: widget.controller.isSearchMode
                          ? Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: context.screenHeight * 0.0125,
                                    right: context.screenWidth * 0.025,
                                    left: context.screenWidth * 0.025,
                                    bottom: context.screenHeight * 0.02,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(
                                      context.screenWidth * 0.04,
                                    ),
                                    decoration: ShapeDecoration(
                                      color: AppColors.chatSearchHeaderBg
                                          .withValues(alpha: 0.95),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          context.screenWidth * 0.045,
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                // Navigator.pop(
                                                //   context,
                                                // ); // 🔙 Ek screen back
                                                widget.controller
                                                    .cancelSearch();
                                              },
                                              child: Image.asset(
                                                "assets/icons/close-circle.png",
                                                height:
                                                    context.screenHeight * 0.05,
                                                width:
                                                    context.screenHeight * 0.05,
                                              ),
                                            ),
                                            SizedBox(
                                              width:
                                                  context.screenWidth * 0.025,
                                            ),
                                            Expanded(
                                              child: _SearchBarDelegate(
                                                controller: widget.controller,
                                                theme: theme,
                                              ).build(context, 0, false),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: context.screenHeight * 0.02,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: context.screenWidth * 0.01,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              _buildTabButton(
                                                L10n.of(context).chat,
                                                widget.controller
                                                            .isSearchMode &&
                                                        filter.isNotEmpty
                                                    ? rooms.where((room) {
                                                        if (room.isDirectChat)
                                                          return false;
                                                        final searchText =
                                                            filter
                                                                .toLowerCase();
                                                        final nameMatch = room
                                                                .getLocalizedDisplayname()
                                                                .toLowerCase()
                                                                .contains(
                                                                  searchText,
                                                                ) ||
                                                            (room.canonicalAlias
                                                                    .toLowerCase()
                                                                    .contains(
                                                                      searchText,
                                                                    ) ??
                                                                false);
                                                        final participantMatch =
                                                            room
                                                                .getParticipants()
                                                                .any(
                                                                  (user) =>
                                                                      (user.displayName
                                                                              ?.toLowerCase()
                                                                              .contains(
                                                                                searchText,
                                                                              ) ??
                                                                          false) ||
                                                                      (user.id.localpart
                                                                              ?.toLowerCase()
                                                                              .contains(
                                                                                searchText,
                                                                              ) ??
                                                                          false),
                                                                );
                                                        return nameMatch ||
                                                            participantMatch;
                                                      }).length
                                                    : 0,
                                                _selectedTab! ==
                                                    L10n.of(context).chat,
                                              ),
                                              SizedBox(
                                                width:
                                                    context.screenWidth * 0.015,
                                              ),
                                              _buildTabButton(
                                                L10n.of(context).contacts,
                                                widget.controller
                                                            .isSearchMode &&
                                                        filter.isNotEmpty
                                                    ? (userSearchResult
                                                            ?.results.length ??
                                                        0)
                                                    : 0,
                                                _selectedTab! ==
                                                    L10n.of(context).contacts,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : DynamicHeader(
                              // onTapBack: () {
                              //   context.pop();
                              // },
                              child: Padding(
                                padding:
                                    EdgeInsets.all(context.screenWidth * 0.02),
                                child: _SearchBarDelegate(
                                  controller: widget.controller,
                                  theme: theme,
                                ).build(context, 0, false),
                              ),
                            ),
                    ),

                  // Scrollable content
                  Expanded(
                    child: CustomScrollView(
                      physics: client.rooms.isEmpty
                          ? const NeverScrollableScrollPhysics()
                          : null,
                      controller: widget.controller.scrollController,
                      slivers: [
                        // Stories section - now scrollable
                        if (!widget.controller.isSelectionMode)
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(
                                  context.screenWidth * 0.04,
                                  context.screenHeight * 0.0075,
                                  context.screenWidth * 0.04,
                                  context.screenHeight * 0.002),
                              child: StoriesWidget(),
                            ),
                          ),

                        // All Chats header
                        if (!widget.controller.isSearchMode &&
                            !widget.controller.isSelectionMode &&
                            allRooms.isNotEmpty)
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(
                                  context.screenWidth * 0.07,
                                  context.screenHeight * 0.0275,
                                  context.screenWidth * 0.07,
                                  context.screenHeight * 0.015),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _getFilterTitle(),
                                    style: TextStyle(
                                      color: Color(0xFFF3F3F3),
                                      fontSize: context.screenWidth * 0.04,
                                      fontFamily: 'Neometric',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  _buildPopupMenu(),
                                ],
                              ),
                            ),
                          ),

                        // Chat Requests Banner and Archive Chats section
                        if (!widget.controller.isSearchMode &&
                            !widget.controller.isSelectionMode &&
                            (widget.controller.chatRequestsCount > 0 ||
                                RoomArchiveHelper.getArchivedRooms(client)
                                    .isNotEmpty) &&
                            !_showingRequestsOnly)
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(
                                  context.screenWidth * 0.04,
                                  0,
                                  context.screenWidth * 0.04,
                                  context.screenHeight * 0.01),
                              child: Row(
                                children: [
                                  // Chat Requests Banner
                                  if (widget.controller.chatRequestsCount > 0)
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _showingRequestsOnly = true;
                                          });
                                        },
                                        child: Container(
                                          height: context.screenHeight * 0.05,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF170328)
                                                .withOpacity(0.6),
                                            borderRadius: BorderRadius.circular(
                                                context.screenWidth * 0.03),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  context.screenWidth * 0.03),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  '${L10n.of(context).newChatRequests} (${widget.controller.chatRequestsCount})',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize:
                                                        context.screenWidth *
                                                            0.03,
                                                    fontFamily: 'Neometric',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                color: Colors.white,
                                                size:
                                                    context.screenWidth * 0.035,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (widget.controller.chatRequestsCount > 0 &&
                                      RoomArchiveHelper.getArchivedRooms(client)
                                          .isNotEmpty)
                                    SizedBox(width: context.screenWidth * 0.02),
                                  // Archive Chats section
                                  if (RoomArchiveHelper.getArchivedRooms(client)
                                      .isNotEmpty)
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () async {
                                          await context.push(
                                              '/mainMenuScreen/rooms/archive');
                                          setState(() {});
                                        },
                                        child: Container(
                                          height: context.screenHeight * 0.05,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF170328)
                                                .withOpacity(0.6),
                                            borderRadius: BorderRadius.circular(
                                                context.screenWidth * 0.03),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  context.screenWidth * 0.03),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.archive_outlined,
                                                color: Colors.white,
                                                size:
                                                    context.screenWidth * 0.04,
                                              ),
                                              SizedBox(
                                                  width: context.screenWidth *
                                                      0.02),
                                              Expanded(
                                                child: Text(
                                                  '${L10n.of(context).archive} (${RoomArchiveHelper.getArchivedRooms(client).length})',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize:
                                                        context.screenWidth *
                                                            0.03,
                                                    fontFamily: 'Open Sans',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Icon(
                                                Icons.chevron_right,
                                                color: Colors.white,
                                                size:
                                                    context.screenWidth * 0.04,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        // Back button when showing requests only
                        if (_showingRequestsOnly &&
                            !widget.controller.isSearchMode)
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(
                                  context.screenWidth * 0.04,
                                  context.screenHeight * 0.01,
                                  context.screenWidth * 0.04,
                                  context.screenHeight * 0.01),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _showingRequestsOnly = false;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                      size: context.screenWidth * 0.05,
                                    ),
                                    SizedBox(width: context.screenWidth * 0.02),
                                    Text(
                                      L10n.of(context).goBackToAllChats,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: context.screenWidth * 0.035,
                                        fontFamily: 'Neometric',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        if (widget.controller.isSearchMode &&
                            widget.controller.searchController.text.isNotEmpty)
                          SliverList(
                            delegate: SliverChildListDelegate(
                              [
                                SizedBox(height: context.screenHeight * 0.01),
                                // SearchTitle(
                                //   title: L10n.of(context).publicRooms,
                                //   icon: const Icon(Icons.explore_outlined),
                                // ),
                                // PublicRoomsHorizontalList(publicRooms: publicRooms),
                                //
                                // SearchTitle(
                                //   title: L10n.of(context).publicSpaces,
                                //   icon: const Icon(Icons.workspaces_outlined),
                                // ),
                                // PublicRoomsHorizontalList(publicRooms: publicSpaces),
                                if (_selectedTab! == L10n.of(context).contacts)
                                  SearchTitle(
                                    title: L10n.of(context).users,
                                    icon: const Icon(Icons.group_outlined),
                                  ),
                                if (_selectedTab! == L10n.of(context).contacts)
                                  AnimatedContainer(
                                    clipBehavior: Clip.hardEdge,
                                    decoration: const BoxDecoration(),
                                    height: userSearchResult == null ||
                                            userSearchResult.results.isEmpty
                                        ? 0
                                        : null,
                                    duration: FluffyThemes.animationDuration,
                                    curve: FluffyThemes.animationCurve,
                                    margin: EdgeInsets.only(
                                      bottom: context.screenHeight * 0.01,
                                    ),
                                    child: userSearchResult == null
                                        ? null
                                        : Column(
                                            children: userSearchResult.results
                                                .where(
                                                  (user) => !client.ignoredUsers
                                                      .contains(user.userId),
                                                )
                                                .where((user) {
                                                  final existingUserIds =
                                                      client.rooms
                                                          .where(
                                                            (room) =>
                                                                room.isDirectChat &&
                                                                room.directChatMatrixID !=
                                                                    null,
                                                          )
                                                          .map(
                                                            (room) => room
                                                                .directChatMatrixID!,
                                                          )
                                                          .toSet();
                                                  return !existingUserIds
                                                      .contains(user.userId);
                                                })
                                                .map(
                                                  (user) => _SearchItem(
                                                    title: user.displayName ??
                                                        user.userId.localpart ??
                                                        L10n.of(context)
                                                            .unknownDevice,
                                                    avatar: user.avatarUrl,
                                                    onPressed: () =>
                                                        UserDialog.show(
                                                      context: context,
                                                      profile: user,
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                  ),
                                if (_selectedTab! == L10n.of(context).chat)
                                  SearchTitle(
                                    title: L10n.of(context).chats,
                                    icon: const Icon(Icons.forum_outlined),
                                  ),
                              ],
                            ),
                          ),

                        // SliverList(
                        //   delegate: SliverChildListDelegate(
                        //     [
                        //       if (!widget.controller.isSearchMode &&
                        //           AppConfig.showPresences)
                        //         GestureDetector(
                        //           onLongPress: () =>
                        //               widget.controller.dismissStatusList(),
                        //           child: StatusMessageList(
                        //             onStatusEdit: widget.controller.setStatus,
                        //           ),
                        //         ),
                        //       AnimatedContainer(
                        //         height: widget.controller.isTorBrowser ? 64 : 0,
                        //         duration: FluffyThemes.animationDuration,
                        //         curve: FluffyThemes.animationCurve,
                        //         clipBehavior: Clip.hardEdge,
                        //         decoration: const BoxDecoration(),
                        //         child: Material(
                        //           color: theme.colorScheme.surface,
                        //           child: ListTile(
                        //             leading: const Icon(Icons.vpn_key),
                        //             title: Text(L10n.of(context).dehydrateTor),
                        //             subtitle:
                        //                 Text(L10n.of(context).dehydrateTorLong),
                        //             trailing: const Icon(
                        //               Icons.chevron_right_outlined,
                        //             ),
                        //             onTap: widget.controller.dehydrate,
                        //           ),
                        //         ),
                        //       ),

                        //       // Container(
                        //       //   height: 64,
                        //       //   padding: const EdgeInsets.symmetric(
                        //       //     horizontal: 16.0,
                        //       //     vertical: 12.0,
                        //       //   ),
                        //       //   child: Row(
                        //       //     children: [
                        //       //       Expanded(
                        //       //         child: ListView(
                        //       //           scrollDirection: Axis.horizontal,
                        //       //           children: [
                        //       //             if (AppConfig.separateChatTypes)
                        //       //               ActiveFilter.messages
                        //       //             else
                        //       //               ActiveFilter.allChats,
                        //       //             ActiveFilter.groups,
                        //       //             ActiveFilter.unread,
                        //       //             if (spaceDelegateCandidates.isNotEmpty &&
                        //       //                 !AppConfig.displayNavigationRail &&
                        //       //                 !FluffyThemes.isColumnMode(context))
                        //       //               ActiveFilter.spaces,
                        //       //           ]
                        //       //               .map(
                        //       //                 (filter) => Padding(
                        //       //                   padding:
                        //       //                       const EdgeInsets.only(right: 12.0),
                        //       //                   child: _FilterButton(
                        //       //                     label:
                        //       //                         filter.toLocalizedString(context),
                        //       //                     isSelected:
                        //       //                         filter == controller.activeFilter,
                        //       //                     onTap: () => controller
                        //       //                         .setActiveFilter(filter),
                        //       //                   ),
                        //       //                 ),
                        //       //               )
                        //       //               .toList(),
                        //       //         ),
                        //       //       ),
                        //       //       // Filter icon button
                        //       //       Container(
                        //       //         padding: const EdgeInsets.symmetric(
                        //       //           horizontal: 12,
                        //       //           vertical: 8,
                        //       //         ),
                        //       //         decoration: BoxDecoration(
                        //       //           color: Colors.white.withOpacity(0.1),
                        //       //           borderRadius: BorderRadius.circular(20),
                        //       //         ),
                        //       //         child: const Row(
                        //       //           mainAxisSize: MainAxisSize.min,
                        //       //           children: [
                        //       //             Icon(
                        //       //               Icons.tune,
                        //       //               color: Colors.white,
                        //       //               size: 16,
                        //       //             ),
                        //       //             SizedBox(width: 4),
                        //       //             Text(
                        //       //               'Filter',
                        //       //               style: TextStyle(
                        //       //                 color: Colors.white,
                        //       //                 fontSize: 12,
                        //       //                 fontWeight: FontWeight.w500,
                        //       //               ),
                        //       //             ),
                        //       //           ],
                        //       //         ),
                        //       //       ),
                        //       //     ],
                        //       //   ),
                        //       // ),
                        //     ],
                        //   ),
                        // ),

                        /// Chat list items ....
                        if (!widget.controller.waitForFirstSync ||
                            (client.prevBatch == null && client.isLogged()))
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, i) => DummyChatListItem(
                                opacity: (dummyChatCount - i) / dummyChatCount,
                                animate: true,
                              ),
                              childCount: dummyChatCount,
                            ),
                          ),
                        if (widget.controller.waitForFirstSync &&
                            (client.prevBatch != null || !client.isLogged()))
                          SliverList.builder(
                            itemCount: rooms.length,
                            itemBuilder: (BuildContext context, int i) {
                              final room = rooms[i];
                              final space = spaceDelegateCandidates[room.id];
                              return ChatListItem(
                                room,
                                space: space,
                                // key: Key('chat_list_item_${room.id}'),
                                key: ValueKey(room.id),
                                filter: filter,
                                onTap: () => widget.controller.onChatTap(room),
                                onLongPress: (context) => widget.controller
                                    .chatContextAction(room, context, space),
                                activeChat:
                                    widget.controller.activeChat == room.id,
                                isSelected: widget.controller.selectedRooms
                                    .contains(room.id),
                                isSelectionMode:
                                    widget.controller.isSelectionMode,
                                onForget: () {
                                  // Force rebuild of the list by calling setState
                                  setState(() {});
                                },
                                hasOpenPopup: _roomWithOpenPopup == room.id,
                                onPopupOpen: () {
                                  setState(() {
                                    _roomWithOpenPopup = room.id;
                                  });
                                },
                                onPopupClose: () {
                                  setState(() {
                                    _roomWithOpenPopup = null;
                                  });
                                },
                              );
                            },
                          ),
                        // Add bottom padding to prevent last item from being hidden behind bottom nav bar
                        SliverToBoxAdapter(
                          child: SizedBox(height: context.screenHeight * 0.1),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  String _getFilterTitle() {
    switch (widget.controller.activeFilter) {
      case ActiveFilter.allChats:
        return L10n.of(context).allChats;
      // case ActiveFilter.unread:
      //   return L10n.of(context).unreadChats;
      case ActiveFilter.groups:
        return L10n.of(context).groupChats;
      case ActiveFilter.messages:
        return L10n.of(context).messages;
      case ActiveFilter.spaces:
        return L10n.of(context).spaces;
      case ActiveFilter.sortAZ:
        return L10n.of(context).sortAZ;
      case ActiveFilter.sortZA:
        return L10n.of(context).sortZA;
      case ActiveFilter.recentContacts:
        return L10n.of(context).recentContacts;
      case ActiveFilter.unread:
        return L10n.of(context).unreadChats;
    }
  }

  Widget _buildPopupMenu() {
    return PopupMenuButton<ActiveFilter>(
      color: const Color(0xF2252844),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.screenWidth * 0.045),
      ),
      constraints: const BoxConstraints(
        minWidth: 0,
        maxWidth: double.infinity,
      ),
      position: PopupMenuPosition.under,
      offset: Offset(context.screenWidth * 0.05, context.screenHeight * 0.01),
      onSelected: (filter) => widget.controller.setActiveFilter(filter),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            ImageAssets.chatDetailsFilter,
            width: context.screenWidth * 0.04,
            height: context.screenWidth * 0.04,
            color: Colors.white,
          ),
          SizedBox(width: context.screenWidth * 0.015),
          Text(
            L10n.of(context).filter,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: context.screenWidth * 0.035,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w700,
            ),
          ),
          // const SizedBox(width: 6),
        ],
      ),
      itemBuilder: (context) => [
        _buildPopupMenuItem(ActiveFilter.allChats, L10n.of(context).allChats),
        // _buildPopupMenuItem(ActiveFilter.unread, L10n.of(context).unreadChats),
        _buildPopupMenuItem(ActiveFilter.groups, L10n.of(context).groupChats),
        _buildPopupMenuItem(ActiveFilter.sortAZ, L10n.of(context).sortAZ),
        _buildPopupMenuItem(ActiveFilter.sortZA, L10n.of(context).sortZA),
        _buildPopupMenuItem(
            ActiveFilter.recentContacts, L10n.of(context).recentContacts),
      ],
    );
  }

  PopupMenuItem<ActiveFilter> _buildPopupMenuItem(
    ActiveFilter filter,
    String title,
  ) {
    final isSelected = widget.controller.activeFilter == filter;
    return PopupMenuItem(
      value: filter,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: context.screenHeight * 0.01),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: context.screenWidth * 0.05,
              height: context.screenWidth * 0.05,
              decoration: BoxDecoration(
                color:
                    isSelected ? const Color(0xFF3976F8) : Colors.transparent,
                border: isSelected
                    ? null
                    : Border.all(color: Colors.white, width: 2),
                shape: BoxShape.circle,
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: context.screenWidth * 0.02,
                        height: context.screenWidth * 0.02,
                        decoration: const BoxDecoration(
                          color: const Color(0xF2252844),
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
            SizedBox(width: context.screenWidth * 0.03),
            Flexible(
              child: Text(
                title,
                style: TextStyle(
                  color: isSelected ? const Color(0xFF3976F8) : Colors.white,
                  fontSize: context.screenWidth * 0.032,
                  fontFamily: 'Work Sans',
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PublicRoomsHorizontalList extends StatelessWidget {
  const PublicRoomsHorizontalList({
    super.key,
    required this.publicRooms,
  });

  final List<PublicRoomsChunk>? publicRooms;

  @override
  Widget build(BuildContext context) {
    final publicRooms = this.publicRooms;
    return AnimatedContainer(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(),
      height: publicRooms == null || publicRooms.isEmpty
          ? context.screenHeight * 0.075
          : context.screenHeight * 0.15,
      duration: FluffyThemes.animationDuration,
      curve: FluffyThemes.animationCurve,
      margin: EdgeInsets.only(bottom: context.screenHeight * 0.01),
      child: publicRooms == null || publicRooms.isEmpty
          ? Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.screenWidth * 0.04,
                  vertical: context.screenHeight * 0.01,
                ),
                child: Text(
                  L10n.of(context).noResultsFound,
                  style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.6),
                    fontSize: context.screenWidth * 0.035,
                  ),
                ),
              ),
            )
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              padding:
                  EdgeInsets.symmetric(horizontal: context.screenWidth * 0.04),
              itemCount: publicRooms.length,
              itemBuilder: (context, i) => _SearchItem(
                title: publicRooms[i].name ??
                    publicRooms[i].canonicalAlias?.localpart ??
                    L10n.of(context).group,
                avatar: publicRooms[i].avatarUrl,
                onPressed: () => showAdaptiveDialog(
                  context: context,
                  builder: (c) => PublicRoomDialog(
                    roomAlias:
                        publicRooms[i].canonicalAlias ?? publicRooms[i].roomId,
                    chunk: publicRooms[i],
                  ),
                ),
              ),
            ),
    );
  }
}

class _SearchBarDelegate extends SliverPersistentHeaderDelegate {
  final ChatListController controller;
  final ThemeData theme;

  _SearchBarDelegate({
    required this.controller,
    required this.theme,
  });

  @override
  double get minExtent => controller.isSearchMode ? 64.0 : 72.0;

  @override
  double get maxExtent => controller.isSearchMode ? 64.0 : 72.0;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return TextField(
      controller: controller.searchController,
      focusNode: controller.searchFocusNode,
      textInputAction: TextInputAction.search,
      textAlignVertical: TextAlignVertical.center,
      style: TextStyle(
        fontSize: context.screenWidth * 0.0375,
        color: Colors.white,
        height: 1.2,
      ),
      onChanged: (text) => controller.onSearchEnter(
        text,
        globalSearch: true,
      ),
      onTap: () {
        if (!controller.isSearchMode) {
          controller.startSearch(requestFocus: false);
        }
      },
      decoration: InputDecoration(
        filled: true,
        // fillColor: const Color(0xff05092680).withOpacity(0.8),
        fillColor: AppColors.splashBg.withValues(alpha: 0.5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.screenWidth * 0.0625),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.screenWidth * 0.0625),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.screenWidth * 0.0625),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: context.screenWidth * 0.05,
          vertical: context.screenHeight * 0.0175,
        ),
        hintText: L10n.of(context).search,
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.6),
          fontSize: context.screenWidth * 0.04,
          fontWeight: FontWeight.normal,
        ),
        prefixIcon: Icon(
          Icons.search_rounded,
          color: Colors.white.withOpacity(0.7),
          size: context.screenWidth * 0.045,
        ),
        suffixIcon: controller.searchController.text.isNotEmpty
            ? Container(
                child:
                    // controller.isSearching
                    //     ? const AppLoadingWidget()
                    //     :
                    IconButton(
                  icon: Icon(
                    Icons.clear_rounded,
                    color: Colors.white.withOpacity(0.7),
                    size: context.screenWidth * 0.045,
                  ),
                  onPressed: controller.clearSearch,
                  splashRadius: 18,
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class _SearchItem extends StatelessWidget {
  final String title;
  final Uri? avatar;
  final void Function() onPressed;

  const _SearchItem({
    required this.title,
    this.avatar,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: context.screenWidth * 0.04,
        vertical: context.screenHeight * 0.005,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(18),
          child: Container(
            height: context.screenHeight * 0.09,
            padding: EdgeInsets.symmetric(
              horizontal: context.screenWidth * 0.04,
              vertical: context.screenHeight * 0.011,
            ),
            decoration: ShapeDecoration(
              color: context
                  .watch<ZoneColorProvider>()
                  .getColorForPosition(context)
                  .withOpacity(0.8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            child: Row(
              children: [
                Avatar(
                  mxContent: avatar,
                  name: title,
                  size: context.screenWidth * 0.12,
                ),
                SizedBox(width: context.screenWidth * 0.03),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: context.screenWidth * 0.04,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: context.screenHeight * 0.0025),
                      Text(
                        L10n.of(context).tapToStartConversation,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.6),
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
  }
}

class _FilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth * 0.04,
          vertical: context.screenHeight * 0.01,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF4A5BF6)
              : Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: isSelected
              ? null
              : Border.all(
                  color: Colors.white.withOpacity(0.3),
                  width: 1,
                ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
