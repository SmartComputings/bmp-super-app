import 'dart:async';

import 'package:bmp/core/config/app_config.dart';
import 'package:bmp/core/config/setting_keys.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/chat/chat_list/chat_list_body.dart';
import 'package:bmp/shared/utils/account_bundles.dart';
// import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:bmp/shared/utils/app_loading_widget.dart';
import 'package:bmp/shared/utils/encryption_helper.dart';
import 'package:bmp/shared/utils/localized_exception_extension.dart';
import 'package:bmp/shared/utils/matrix_sdk_extensions/matrix_locals.dart';
import 'package:bmp/shared/utils/show_update_snackbar.dart';
import 'package:bmp/shared/utils/snackbar.dart';
import 'package:bmp/shared/utils/tor_stub.dart'
    if (dart.library.html) 'package:tor_detector_web/tor_detector_web.dart';
import 'package:bmp/shared/utils/url_launcher.dart';
import 'package:bmp/shared/widgets/adaptive_dialogs/adaptive_dialog_action.dart';
import 'package:bmp/shared/widgets/adaptive_dialogs/show_modal_action_popup.dart';
import 'package:bmp/shared/widgets/adaptive_dialogs/show_ok_cancel_alert_dialog.dart';
import 'package:bmp/shared/widgets/adaptive_dialogs/show_text_input_dialog.dart';
import 'package:bmp/shared/widgets/future_loading_dialog.dart';
import 'package:bmp/shared/widgets/hide_keyboard.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:matrix/matrix.dart' as sdk;
import 'package:matrix/matrix.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import 'eula_dialog.dart';

enum PopupMenuAction {
  settings,
  invite,
  newGroup,
  newSpace,
  setStatus,
  archive,
}

enum ActiveFilter {
  allChats,
  messages,
  groups,
  unread,
  spaces,
  sortAZ,
  sortZA,
  recentContacts,
}

extension LocalizedActiveFilter on ActiveFilter {
  String toLocalizedString(BuildContext context) {
    switch (this) {
      case ActiveFilter.allChats:
        return L10n.of(context).all;
      case ActiveFilter.messages:
        return L10n.of(context).messages;
      case ActiveFilter.unread:
        return L10n.of(context).unread;
      case ActiveFilter.groups:
        return L10n.of(context).groups;
      case ActiveFilter.spaces:
        return L10n.of(context).spaces;
      case ActiveFilter.sortAZ:
        return L10n.of(context).sortAZ;
      case ActiveFilter.sortZA:
        return L10n.of(context).sortZA;
      case ActiveFilter.recentContacts:
        return L10n.of(context).recentContacts;
    }
  }
}

class ChatList extends StatefulWidget {
  static BuildContext? contextForVoip;
  final String? activeChat;
  final bool displayNavigationRail;

  const ChatList({
    super.key,
    required this.activeChat,
    this.displayNavigationRail = false,
  });

  @override
  ChatListController createState() => ChatListController();
}

class ChatListController extends State<ChatList>
    with TickerProviderStateMixin, RouteAware, WidgetsBindingObserver {
  StreamSubscription? _intentDataStreamSubscription;

  StreamSubscription? _intentFileStreamSubscription;

  StreamSubscription? _intentUriStreamSubscription;

  AnimationController? animationController;

  ActiveFilter activeFilter = AppConfig.separateChatTypes
      ? ActiveFilter.messages
      : ActiveFilter.allChats;

  String? _activeSpaceId;
  String? get activeSpaceId => _activeSpaceId;

  int get unreadChatsCount {
    return Matrix.of(context)
        .client
        .rooms
        .where(
          (room) =>
              (room.membership == Membership.join ||
                  room.membership == Membership.invite) &&
              room.isUnreadOrInvited,
        )
        .length;
  }

  int get unreadCallsCount {
    return Matrix.of(context)
        .client
        .rooms
        .where(
          (room) =>
              (room.membership == Membership.join ||
                  room.membership == Membership.invite) &&
              room.isUnreadOrInvited &&
              room.lastEvent?.type == EventTypes.CallInvite,
        )
        .length;
  }

  Set<String> selectedRooms = <String>{};
  bool get isSelectionMode => selectedRooms.isNotEmpty;

  void toggleRoomSelection(String roomId) {
    setState(() {
      if (selectedRooms.contains(roomId)) {
        selectedRooms.remove(roomId);
      } else {
        selectedRooms.add(roomId);
      }
    });
  }

  void disableSearchMode() {
    setState(() {
      isSearchMode = true;
    });
  }

  void clearSelection() {
    setState(() {
      selectedRooms.clear();
    });
  }

  void setActiveSpace(String spaceId) async {
    await Matrix.of(context).client.getRoomById(spaceId)!.postLoad();

    setState(() {
      _activeSpaceId = spaceId;
    });
  }

  void clearActiveSpace() => setState(() {
        _activeSpaceId = null;
      });

  void onChatTap(Room room) async {
    // If in selection mode, toggle selection instead of opening chat
    if (isSelectionMode) {
      toggleRoomSelection(room.id);
      return;
    }

    if (room.membership == Membership.invite) {
      final theme = Theme.of(context);
      final inviteEvent = room.getState(
        EventTypes.RoomMember,
        room.client.userID!,
      );
      final matrixLocals = MatrixLocals(L10n.of(context));
      final action = await showAdaptiveDialog<InviteAction>(
        context: context,
        builder: (context) => AlertDialog.adaptive(
          title: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 256),
            child: Center(
              child: Text(
                room.getLocalizedDisplayname(matrixLocals),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          content: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 256, maxHeight: 256),
            child: Text(
              inviteEvent == null
                  ? L10n.of(context).inviteForMe
                  : inviteEvent.content.tryGet<String>('reason') ??
                      L10n.of(context).youInvitedBy(
                        room
                            .unsafeGetUserFromMemoryOrFallback(
                              inviteEvent.senderId,
                            )
                            .calcDisplayname(i18n: matrixLocals),
                      ),
              textAlign: TextAlign.center,
            ),
          ),
          actions: [
            AdaptiveDialogAction(
              onPressed: () => Navigator.of(context).pop(InviteAction.accept),
              bigButtons: true,
              child: Text(L10n.of(context).accept),
            ),
            AdaptiveDialogAction(
              onPressed: () => Navigator.of(context).pop(InviteAction.decline),
              bigButtons: true,
              child: Text(
                L10n.of(context).decline,
                style: TextStyle(color: theme.colorScheme.error),
              ),
            ),
            AdaptiveDialogAction(
              onPressed: () => Navigator.of(context).pop(InviteAction.block),
              bigButtons: true,
              child: Text(
                L10n.of(context).block,
                style: TextStyle(color: theme.colorScheme.error),
              ),
            ),
          ],
        ),
      );
      switch (action) {
        case null:
          return;
        case InviteAction.accept:
          break;
        case InviteAction.decline:
          await showFutureLoadingDialog(
            context: context,
            future: () async {
              await room.leave();
              await room.forget();
            },
          );
          // this one is added for instant action ,
          if (mounted) setState(() {});
          return;
        case InviteAction.block:
          final userId = inviteEvent?.senderId;
          context.go(
            '/mainMenuScreen/rooms/settings/security/ignorelist',
            extra: userId,
          );
          return;
      }
      if (!mounted) return;
      final joinResult = await showFutureLoadingDialog(
        context: context,
        future: () async {
          final waitForRoom = room.client.waitForRoomInSync(
            room.id,
            join: true,
          );
          await room.join();
          await waitForRoom;
        },
        exceptionContext: ExceptionContext.joinRoom,
      );
      if (joinResult.error != null) return;
      if (mounted) setState(() {});
    }

    if (room.membership == Membership.ban) {
      CustomSnackbar.show(
        context,
        title: L10n.of(context).accessDenied,
        message: L10n.of(context).youHaveBeenBannedFromThisChat,
        type: SnackbarType.error,
      );
      return;
    }

    if (room.membership == Membership.leave) {
      context.push('/mainMenuScreen/rooms/archive/${room.id}');
      return;
    }

    // if (room.isSpace) {
    //   setActiveSpace(room.id);
    //   return;
    // }

    context.push('/mainMenuScreen/rooms/${room.id}');
    debugPrint("=========/rooms/${room.id}========");
    // context.push('/rooms/${room.id}');
  }

  bool Function(Room) getRoomFilterByActiveFilter(ActiveFilter activeFilter) {
    switch (activeFilter) {
      case ActiveFilter.allChats:
        return (room) => room.getState('m.room.create')?.content['type'] != 'm.story_room';
      case ActiveFilter.messages:
        return (room) => !room.isSpace && room.isDirectChat && room.getState('m.room.create')?.content['type'] != 'm.story_room';
      case ActiveFilter.groups:
        return (room) => !room.isDirectChat && room.getState('m.room.create')?.content['type'] != 'm.story_room';
      case ActiveFilter.unread:
        return (room) => room.isUnreadOrInvited && room.getState('m.room.create')?.content['type'] != 'm.story_room';
      case ActiveFilter.spaces:
        return (room) => room.isSpace && room.getState('m.room.create')?.content['type'] != 'm.story_room';
      case ActiveFilter.sortAZ:
        return (room) => room.getState('m.room.create')?.content['type'] != 'm.story_room';
      case ActiveFilter.sortZA:
        return (room) => room.getState('m.room.create')?.content['type'] != 'm.story_room';
      case ActiveFilter.recentContacts:
        return (room) => room.getState('m.room.create')?.content['type'] != 'm.story_room';
    }
  }

  /// Sort rooms based on active filter
  List<Room> sortRooms(List<Room> rooms, ActiveFilter filter) {
    switch (filter) {
      case ActiveFilter.sortAZ:
        // Sort alphabetically A-Z by display name
        rooms.sort((a, b) {
          final nameA = a.getLocalizedDisplayname(MatrixLocals(L10n.of(context))).toLowerCase();
          final nameB = b.getLocalizedDisplayname(MatrixLocals(L10n.of(context))).toLowerCase();
          return nameA.compareTo(nameB);
        });
        return rooms;
      case ActiveFilter.sortZA:
        // Sort alphabetically Z-A by display name
        rooms.sort((a, b) {
          final nameA = a.getLocalizedDisplayname(MatrixLocals(L10n.of(context))).toLowerCase();
          final nameB = b.getLocalizedDisplayname(MatrixLocals(L10n.of(context))).toLowerCase();
          return nameB.compareTo(nameA);
        });
        return rooms;
      case ActiveFilter.recentContacts:
        // Sort by most recent activity (latest to oldest)
        rooms.sort((a, b) {
          final timeA = a.lastEvent?.originServerTs ?? DateTime(1970);
          final timeB = b.lastEvent?.originServerTs ?? DateTime(1970);
          return timeB.compareTo(timeA);
        });
        return rooms;
      default:
        // Default sorting (by last activity)
        return rooms;
    }
  }

  List<Room> get filteredRooms {
    var rooms = Matrix.of(context)
        .client
        .rooms
        .where(
          (room) =>
              room.membership == Membership.join ||
              room.membership == Membership.invite,
        )
        .where(getRoomFilterByActiveFilter(activeFilter))
        .toList();
    return sortRooms(rooms, activeFilter);
  }

  // Active chats only (joined rooms)
  List<Room> get activeChats {
    var rooms = Matrix.of(context)
        .client
        .rooms
        .where((room) => room.membership == Membership.join)
        .where(getRoomFilterByActiveFilter(activeFilter))
        .toList();
    return sortRooms(rooms, activeFilter);
  }

  // Chat requests only (invitations)
  List<Room> get chatRequests => Matrix.of(context)
      .client
      .rooms
      .where((room) => room.membership == Membership.invite)
      .toList();

  // Count of pending chat requests
  int get chatRequestsCount => chatRequests.length;

  bool isSearchMode = false;
  Future<QueryPublicRoomsResponse>? publicRoomsResponse;
  String? searchServer;
  Timer? _coolDown;
  SearchUserDirectoryResponse? userSearchResult;
  QueryPublicRoomsResponse? roomSearchResult;

  bool isSearching = false;
  bool _encryptionMessageShown = false;
  static const String _serverStoreNamespace = 'im.fluffychat.search.server';
  static const String _encryptionMessageShownKey = 'encryption_message_shown';

  void setServer() async {
    final newServer = await showTextInputDialog(
      useRootNavigator: false,
      title: L10n.of(context).changeTheHomeserver,
      context: context,
      okLabel: L10n.of(context).ok,
      cancelLabel: L10n.of(context).cancel,
      prefixText: 'https://',
      hintText: Matrix.of(context).client.homeserver?.host,
      initialText: searchServer,
      keyboardType: TextInputType.url,
      autocorrect: false,
      validator: (server) => server.contains('.') == true
          ? null
          : L10n.of(context).invalidServerName,
    );
    if (newServer == null) return;
    Matrix.of(context).store.setString(_serverStoreNamespace, newServer);
    setState(() {
      searchServer = newServer;
    });
    _coolDown?.cancel();
    _coolDown = Timer(const Duration(milliseconds: 500), _search);
  }

  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  void _search() async {
    final client = Matrix.of(context).client;
    if (!isSearching) {
      setState(() {
        isSearching = true;
      });
    }
    SearchUserDirectoryResponse? userSearchResult;
    QueryPublicRoomsResponse? roomSearchResult;
    final searchQuery = searchController.text.trim();
    try {
      roomSearchResult = await client.queryPublicRooms(
        server: searchServer ?? client.homeserver?.host,
        filter: PublicRoomQueryFilter(
          genericSearchTerm: searchQuery,
        ),
        limit: 50,
      );

      // Debug: Print room types to understand what's being returned
      if (roomSearchResult.chunk.isNotEmpty) {
        Logs()
            .d('Search results: ${roomSearchResult.chunk.length} rooms found');
        for (final room in roomSearchResult.chunk) {
          Logs().d(
            'Room: ${room.name}, Type: ${room.roomType}, Alias: ${room.canonicalAlias}',
          );
        }
      }

      if (searchQuery.isValidMatrixId &&
          searchQuery.sigil == '#' &&
          roomSearchResult.chunk
                  .any((room) => room.canonicalAlias == searchQuery) ==
              false) {
        final response = await client.getRoomIdByAlias(searchQuery);
        final roomId = response.roomId;
        if (roomId != null) {
          roomSearchResult.chunk.add(
            PublicRoomsChunk(
              name: searchQuery,
              guestCanJoin: false,
              numJoinedMembers: 0,
              roomId: roomId,
              worldReadable: false,
              canonicalAlias: searchQuery,
            ),
          );
        }
      }
      userSearchResult = await client.searchUserDirectory(
        searchController.text,
        limit: 20,
      );

      // Filter out users who already exist in the user's chat list
      // Get all existing direct chat users
      final existingUserIds = <String>{};

      for (final room in client.rooms) {
        if (room.isDirectChat && room.directChatMatrixID != null) {
          existingUserIds.add(room.directChatMatrixID!);
          debugPrint('Existing user found: ${room.directChatMatrixID}');
        }
      }

      debugPrint('Total existing users: ${existingUserIds.length}');
      debugPrint(
        'Users before filtering: ${userSearchResult.results.length}',
      );

      // Filter out existing users
      userSearchResult.results.removeWhere((user) {
        final shouldRemove = existingUserIds.contains(user.userId);
        if (shouldRemove) {
          debugPrint('Filtering out existing user: ${user.userId}');
        }
        return shouldRemove;
      });

      debugPrint('Users after filtering: ${userSearchResult.results.length}');
    } catch (e, s) {
      Logs().w('Searching has crashed', e, s);
      if (mounted) {
        CustomSnackbar.show(
          context,
          title: L10n.of(context).searchError,
          message: e.toLocalizedString(context),
          type: SnackbarType.error,
        );
      }
    }
    if (!isSearchMode || !mounted) return;
    setState(() {
      isSearching = false;
      this.roomSearchResult = roomSearchResult;
      this.userSearchResult = userSearchResult;
    });

    // Debug: Log final results
    if (roomSearchResult != null) {
      debugPrint('=== SEARCH RESULTS ===');
      debugPrint('Total chunks: ${roomSearchResult.chunk.length}');
      debugPrint(
        'Public rooms: ${roomSearchResult.chunk.where((r) => r.roomType != 'm.space').length}',
      );
      debugPrint(
        'Spaces: ${roomSearchResult.chunk.where((r) => r.roomType == 'm.space').length}',
      );
      for (final room in roomSearchResult.chunk) {
        debugPrint(
          'Room: ${room.name}, Type: ${room.roomType}, Public: ${room.worldReadable}',
        );
      }
    } else {
      debugPrint('No search results - roomSearchResult is null');
    }
  }

  void onSearchEnter(String text, {bool globalSearch = true}) {
    if (text.isEmpty) {
      cancelSearch(unfocus: false);
      return;
    }

    if (!mounted) return;
    setState(() {
      isSearchMode = true;
    });
    _coolDown?.cancel();
    if (globalSearch) {
      // Reduce delay for better responsiveness
      _coolDown = Timer(const Duration(milliseconds: 300), _search);
    }
  }

  bool _preventAutoFocus = false;

  void startSearch({bool requestFocus = true}) {
    if (!mounted) return;
    setState(() {
      isSearchMode = true;
    });
    if (requestFocus && !_preventAutoFocus) {
      searchFocusNode.requestFocus();
    }
    _coolDown?.cancel();
    // If there's already text, search immediately
    if (searchController.text.trim().isNotEmpty) {
      _coolDown = Timer(const Duration(milliseconds: 100), _search);
    } else {
      _coolDown = Timer(const Duration(milliseconds: 500), _search);
    }
  }

  void cancelSearch({bool unfocus = true}) {
    setState(() {
      searchController.clear();
      isSearchMode = false;
      roomSearchResult = userSearchResult = null;
      isSearching = false;
    });
    _preventAutoFocus = false;
    if (unfocus) searchFocusNode.unfocus();
  }

  void clearSearch({bool unfocus = true}) {
    setState(() {
      searchController.clear();
      // isSearchMode = false;
      roomSearchResult = userSearchResult = null;
      isSearching = false;
    });
    // if (unfocus) searchFocusNode.unfocus();
  }

  bool isTorBrowser = false;

  BoxConstraints? snappingSheetContainerSize;

  final ScrollController scrollController = ScrollController();
  final ValueNotifier<bool> scrolledToTop = ValueNotifier(true);

  final StreamController<Client> _clientStream = StreamController.broadcast();

  Stream<Client> get clientStream => _clientStream.stream;

  // void addAccountAction() =>
  //     context.go('/mainMenuScreen/rooms/settings/account');

  void _onScroll() {
    final newScrolledToTop = scrollController.position.pixels <= 0;
    if (newScrolledToTop != scrolledToTop.value) {
      scrolledToTop.value = newScrolledToTop;
    }
  }

  // void editSpace(BuildContext context, String spaceId) async {
  //   await Matrix.of(context).client.getRoomById(spaceId)!.postLoad();
  //   if (mounted) {
  //     context.push('/mainMenuScreen/rooms/$spaceId/details');
  //   }
  // }

  // Needs to match GroupsSpacesEntry for 'separate group' checking.
  List<Room> get spaces =>
      Matrix.of(context).client.rooms.where((r) => r.isSpace).toList();

  String? get activeChat => widget.activeChat;

  // void _processIncomingSharedMedia(List<SharedMediaFile> files) {
  //   if (files.isEmpty) return;

  //   showScaffoldDialog(
  //     context: context,
  //     builder: (context) => ShareScaffoldDialog(
  //       items: files.map(
  //         (file) {
  //           if ({
  //             SharedMediaType.text,
  //             SharedMediaType.url,
  //           }.contains(file.type)) {
  //             return TextShareItem(file.path);
  //           }
  //           return FileShareItem(
  //             XFile(
  //               file.path.replaceFirst('file://', ''),
  //               mimeType: file.mimeType,
  //             ),
  //           );
  //         },
  //       ).toList(),
  //     ),
  //   );
  // }

  void _processIncomingUris(Uri? uri) async {
    if (uri == null) return;
    context.go('/mainMenuScreen/rooms');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      UrlLauncher(context, uri.toString()).openMatrixToUrl();
    });
  }

  // void _initReceiveSharingIntent() {
  //   if (!PlatformInfos.isMobile) return;

  //   // For sharing images coming from outside the app while the app is in the memory
  //   _intentFileStreamSubscription = ReceiveSharingIntent.instance
  //       .getMediaStream()
  //       .listen(_processIncomingSharedMedia, onError: print);

  //   // For sharing images coming from outside the app while the app is closed
  //   ReceiveSharingIntent.instance
  //       .getInitialMedia()
  //       .then(_processIncomingSharedMedia);

  //   // For receiving shared Uris
  //   _intentUriStreamSubscription =
  //       AppLinks().uriLinkStream.listen(_processIncomingUris);

  //   if (PlatformInfos.isAndroid) {
  //     final shortcuts = FlutterShortcuts();
  //     shortcuts.initialize().then(
  //           (_) => shortcuts.listenAction((action) {
  //             if (!mounted) return;
  //             UrlLauncher(context, action).launchUrl();
  //           }),
  //         );
  //   }
  // }

  @override
  void initState() {
    // _initReceiveSharingIntent();

    // Add lifecycle observer
    WidgetsBinding.instance.addObserver(this);

    // Initialize animation controller
    animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..forward();

    // Add focus listener to clear focus when search field loses focus
    searchFocusNode.addListener(() {
      if (!searchFocusNode.hasFocus && isSearchMode && searchController.text.isEmpty) {
        // If search field loses focus and is empty, exit search mode
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            cancelSearch(unfocus: false);
          }
        });
      }
    });

    // Add listener to prevent unwanted focus requests
    searchController.addListener(() {
      // If controller text changes and we're preventing auto focus, don't trigger search mode
      if (_preventAutoFocus && searchController.text.isEmpty && isSearchMode) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            setState(() {
              isSearchMode = false;
            });
          }
        });
      }
    });

    scrollController.addListener(_onScroll);
    _waitForFirstSync();
    _hackyWebRTCFixForWeb();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (mounted) {
        searchServer =
            Matrix.of(context).store.getString(_serverStoreNamespace);
        Matrix.of(context).backgroundPush?.setupPush();
        UpdateNotifier.showUpdateSnackBar(context);

        // Load persistent encryption message flag
        _encryptionMessageShown =
            Matrix.of(context).store.getBool(_encryptionMessageShownKey) ??
                false;
        
        // Listen to room updates for immediate UI refresh
        final client = Matrix.of(context).client;
        client.onRoomState.stream.listen((_) {
          if (mounted) setState(() {});
        });
      }

      // Workaround for system UI overlay style not applied on app start
      SystemChrome.setSystemUIOverlayStyle(
        Theme.of(context).appBarTheme.systemOverlayStyle!,
      );
      try {
        final client = Matrix.of(context).client;
      } catch (e) {}
    });

    _checkTorBrowser();
    _checkEula();

    super.initState();
  }

  void _checkEula() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      final store = Matrix.of(context).store;
      final isAccepted =
          store.getBool(ChatEulaDefaults.isChatTermsAcceptedKey) ?? false;

      if (!isAccepted) {
        final result = await showChatEulaDialog(context: context);
        if (result == true) {
          await store.setBool(ChatEulaDefaults.isChatTermsAcceptedKey, true);
        } else if (result == false) {
          // If declined, navigate back
          if (mounted) {
            context.pop();
          }
        }
      }
    });
  }

  @override
  void dispose() {
    // Remove lifecycle observer
    WidgetsBinding.instance.removeObserver(this);

    // Tokens are managed on-demand, no timer to manage
    Logs().i('ChatList: Page disposed');

    // Dispose animation controller
    animationController?.dispose();

    // Dispose search-related resources
    searchController.dispose();
    searchFocusNode.dispose();

    _intentDataStreamSubscription?.cancel();
    _intentFileStreamSubscription?.cancel();
    _intentUriStreamSubscription?.cancel();
    scrollController.removeListener(_onScroll);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.resumed:
        // App came to foreground - tokens refresh automatically when needed
        // Reset prevention flag after a delay to allow normal operation
        Timer(const Duration(milliseconds: 500), () {
          if (mounted) {
            _preventAutoFocus = false;
          }
        });
        Logs().i('ChatList: App resumed');
        break;
      case AppLifecycleState.paused:
      case AppLifecycleState.inactive:
        // App went to background - tokens managed on-demand
        // Also clear focus to prevent keyboard issues
        _preventAutoFocus = true;
        searchFocusNode.unfocus();
        Logs().i('ChatList: App backgrounded');
        break;
      case AppLifecycleState.detached:
        // App completely terminated
        Logs().i('ChatList: App detached');
        break;
      case AppLifecycleState.hidden:
        // App hidden - clear focus
        _preventAutoFocus = true;
        searchFocusNode.unfocus();
        Logs().i('ChatList: App hidden');
        break;
    }
  }

  /// Clear focus when navigating away from the screen
  void clearFocus() {
    _preventAutoFocus = true;
    if (searchFocusNode.hasFocus) {
      searchFocusNode.unfocus();
    }
    // Also exit search mode if it's active and search is empty
    if (isSearchMode && searchController.text.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          cancelSearch(unfocus: false);
        }
      });
    }
  }

  // RouteAware methods to handle navigation
  @override
  void didPushNext() {
    // Called when a new route is pushed on top of this route
    _preventAutoFocus = true;
    clearFocus();
  }

  @override
  void didPopNext() {
    // Called when the route above this route is popped
    // Prevent auto focus when returning to this screen
    _preventAutoFocus = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _preventAutoFocus = false;
      }
    });
  }

  @override
  void didPush() {
    // Called when this route is pushed
    // No action needed
  }

  @override
  void didPop() {
    // Called when this route is popped
    clearFocus();
  }

  void chatContextAction(
    Room room,
    BuildContext posContext, [
    Room? space,
  ]) async {
    // Directly toggle selection mode on long press
    toggleRoomSelection(room.id);
  }

  void showRoomContextMenu(
    Room room,
    BuildContext posContext, [
    Room? space,
  ]) async {
    final overlay =
        Overlay.of(posContext).context.findRenderObject() as RenderBox;
    final button = posContext.findRenderObject() as RenderBox;
    final position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(const Offset(0, 40), ancestor: overlay),
        button.localToGlobal(
          button.size.bottomRight(const Offset(0, 100)),
          ancestor: overlay,
        ),
      ),
      Offset.zero & overlay.size,
    );

    final displayname =
        room.getLocalizedDisplayname(MatrixLocals(L10n.of(context)));

    final action = await showMenu<ChatContextAction>(
      context: posContext,
      position: position,
      items: [
        PopupMenuItem(
          value: ChatContextAction.leave,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.delete_outlined, color: Colors.white),
              const SizedBox(width: 12),
              Text(
                L10n.of(context).delete,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );

    if (action == null) return;
    if (!mounted) return;

    switch (action) {
      case ChatContextAction.leave:
        final confirmed = await showOkCancelAlertDialog(
          context: context,
          title: L10n.of(context).areYouSure,
          message: L10n.of(context).archiveRoomDescription,
          okLabel: L10n.of(context).delete,
          cancelLabel: L10n.of(context).cancel,
            dialogType: DialogType.warning,
        );
        if (confirmed == OkCancelResult.cancel) return;
        if (!mounted) return;

        final result = await showFutureLoadingDialog(
          context: context,
          future: () async {
            await room.leave();
            await room.forget();
          },
        );
        if (result.error == null && mounted) {
          setState(() {});
        }
        return;
      default:
        return;
    }
  }

  void dismissStatusList() async {
    final result = await showOkCancelAlertDialog(
      title: L10n.of(context).hidePresences,
      context: context,
           dialogType: DialogType.success,
    );
    if (result == OkCancelResult.ok) {
      await Matrix.of(context).store.setBool(SettingKeys.showPresences, false);
      AppConfig.showPresences = false;
      setState(() {});
    }
  }

  void setStatus() async {
    final client = Matrix.of(context).client;
    final currentPresence = await client.fetchCurrentPresence(client.userID!);
    final input = await showTextInputDialog(
      useRootNavigator: false,
      context: context,
      title: L10n.of(context).setStatus,
      message: L10n.of(context).leaveEmptyToClearStatus,
      okLabel: L10n.of(context).ok,
      cancelLabel: L10n.of(context).cancel,
      hintText: L10n.of(context).statusExampleMessage,
      maxLines: 6,
      minLines: 1,
      maxLength: 255,
      initialText: currentPresence.statusMsg,
    );
    if (input == null) return;
    if (!mounted) return;
    await showFutureLoadingDialog(
      context: context,
      future: () => client.setPresence(
        client.userID!,
        PresenceType.online,
        statusMsg: input,
      ),
    );
  }

  bool waitForFirstSync = false;

  Future<void> _waitForFirstSync() async {
    try {
      final router = GoRouter.of(context);
      final client = Matrix.of(context).client;

      // Set initial state to show we're loading
      if (mounted) {
        setState(() {
          waitForFirstSync = false;
        });
      }

      // If client is not logged in, mark as ready immediately
      if (!client.isLogged()) {
        if (mounted) {
          setState(() {
            waitForFirstSync = true;
          });
        }
        return;
      }

      // Load client data with timeout
      final futures = <Future>[];
      if (client.roomsLoading != null) futures.add(client.roomsLoading!);
      if (client.accountDataLoading != null) {
        futures.add(client.accountDataLoading!);
      }
      if (client.userDeviceKeysLoading != null) {
        futures.add(client.userDeviceKeysLoading!);
      }

      if (futures.isNotEmpty) {
        await Future.wait(futures).timeout(
          const Duration(seconds: 10),
          onTimeout: () {
            Logs().w('Client loading timed out, continuing anyway');
            return [];
          },
        );
      }

      // Wait for sync if we don't have a previous batch
      if (client.prevBatch == null) {
        try {
          await client.onSyncStatus.stream
              .firstWhere((status) => status.status == SyncStatus.finished)
              .timeout(
            const Duration(seconds: 15),
            onTimeout: () {
              Logs().w('First sync timed out, continuing anyway');
              return const SyncStatusUpdate(SyncStatus.finished);
            },
          );
        } catch (e) {
          Logs().w('Error during first sync, continuing anyway', e);
        }
      }

      // Mark as ready after sync is complete or timed out
      if (mounted) {
        setState(() {
          waitForFirstSync = true;
        });
      }

      if (!mounted) return;

      // Check encryption status but don't auto-show bootstrap dialog
      if (client.encryption?.keyManager.enabled == true) {
        try {
          Logs().i('ChatList: Checking encryption bootstrap status');

          final encryptionStatus =
              EncryptionHelper.getEncryptionStatus(client, null);
          final recommendations =
              EncryptionHelper.getEncryptionRecommendations(client, null);

          Logs().i('ChatList: Encryption status', encryptionStatus);
          Logs().i('ChatList: Encryption recommendations', recommendations);

          if (!encryptionStatus['clientEncryptionReady'] ||
              client.isUnknownSession) {
            Logs().i(
              'ChatList: Encryption bootstrap needed but not auto-starting',
            );
            // Don't auto-show bootstrap dialog - let user enable it in settings
          } else {
            Logs().i('ChatList: Encryption bootstrap already completed');
          }
        } catch (e, stackTrace) {
          Logs().e(
            'ChatList: Error during encryption bootstrap check',
            e,
            stackTrace,
          );
        }
      } else if (client.isLogged()) {
        Logs().i('ChatList: Encryption not enabled for client');
      }

      if (!mounted) return;
// Generate security token for API access
      // if (client.isLogged() && client.userID != null) {
      //   try {
      //     final username = client.userID!.replaceFirst('@', '').split(':')[0];
      //     Logs()
      //         .i('ChatList: Generating security token for username: $username');

      //     Logs().i('ChatList: About to call SecurityService.generateToken');
      //     final tokenResult = await SecurityService.generateToken(username);
      //     Logs().i('ChatList: SecurityService.generateToken completed', {
      //       'success': tokenResult.success,
      //       'message': tokenResult.message,
      //     });

      //     if (tokenResult.success && tokenResult.data != null) {
      //       // Save token and matrix ID to SharedPreferences
      //       final prefs = await SharedPreferences.getInstance();
      //       await prefs.setString('security_token', tokenResult.data!['token']);
      //       await prefs.setString('matrix_id', client.userID!);

      //       Logs().i('ChatList: Security token saved successfully', {
      //         'username': username,
      //         'tokenExpiresIn': tokenResult.data!['expiresIn'],
      //       });

      //       // Now get CSRF token using the saved security token
      //       Logs().i('ChatList: Getting CSRF token for username: $username');
      //       final csrfResult = await SecurityService.getCsrfToken(username);

      //       if (csrfResult.success && csrfResult.data != null) {
      //         // Save CSRF token to SharedPreferences
      //         await prefs.setString(
      //             'csrf_token', csrfResult.data!['csrfToken']);

      //         Logs().i('ChatList: CSRF token saved successfully', {
      //           'username': username,
      //           'csrfToken': csrfResult.data!['csrfToken'],
      //         });

      //         // Initialize token refresh system (for both JWT and CSRF)
      //         Logs().i('ChatList: Initializing token refresh system');
      //         await SecurityService.initializeTokenRefresh();
      //         Logs().i('ChatList: Token refresh system initialized');
      //       } else {
      //         Logs().w('ChatList: Failed to get CSRF token', {
      //           'message': csrfResult.message,
      //         });
      //       }
      //     } else {
      //       Logs().w('ChatList: Failed to generate security token', {
      //         'message': tokenResult.message,
      //       });
      //     }
      //   } catch (e) {
      //     Logs().w('ChatList: Error generating security token', e);
      //   }
      // }

      // Show device verification warning if needed
      //  if (client.isLogged() &&
      //       client.userDeviceKeys[client.userID!]?.deviceKeys.values
      //               .any((device) => !device.verified && !device.blocked) ==
      //           true) {
      //     late final ScaffoldFeatureController controller;
      //     final theme = Theme.of(context);
      //     controller = ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(
      //         duration: const Duration(seconds: 15),
      //         showCloseIcon: true,
      //         backgroundColor: theme.colorScheme.errorContainer,
      //         closeIconColor: theme.colorScheme.onErrorContainer,
      //         content: Text(
      //           L10n.of(context).oneOfYourDevicesIsNotVerified,
      //           style: TextStyle(
      //             color: theme.colorScheme.onErrorContainer,
      //           ),
      //         ),
      //         action: SnackBarAction(
      //           onPressed: () {
      //             controller.close();
      //             router.go('/rooms/settings/devices');
      //           },
      //           textColor: theme.colorScheme.onErrorContainer,
      //           label: L10n.of(context).settings,
      //         ),
      //       ),
      //     );
      //   }

      // Check if encryption bootstrap is needed - only after proper initialization
      if (client.isLogged() &&
          client.encryption != null &&
          client.prevBatch != null) {
        try {
          // Wait a bit for encryption system to stabilize
          await Future.delayed(const Duration(seconds: 2));

          // Check if this is an unknown session that needs bootstrap
          final isUnknownSession = client.isUnknownSession;

          if (isUnknownSession && mounted && !_encryptionMessageShown) {
            final theme = Theme.of(context);
            setState(() {
              _encryptionMessageShown = true;
            });

            // Save flag to persistent storage
            Matrix.of(context).store.setBool(_encryptionMessageShownKey, true);

            // ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(
            //     duration: const Duration(seconds: 20),
            //     showCloseIcon: true,
            //     backgroundColor: const Color(0x7FDA771B),
            //     closeIconColor: Colors.white,
            //     content: Text(
            //       L10n.of(context).encryptionSetupRequired,
            //       style: const TextStyle(color: Colors.white),
            //     ),
            //     action: SnackBarAction(
            //       onPressed: () {
            //         router.go('/settings');
            //       },
            //       textColor: Colors.white,
            //       label: L10n.of(context).settings,
            //     ),
            //   ),
            // );
          }
        } catch (e) {
          Logs().w('Error checking encryption bootstrap status', e);
        }
      }
    } catch (e, s) {
      Logs().e('Error in _waitForFirstSync', e, s);
      // Ensure we still mark as ready even if there are errors
      if (mounted) {
        setState(() {
          waitForFirstSync = true;
        });
      }
    }
  }

  void setActiveFilter(ActiveFilter filter) {
    setState(() {
      activeFilter = filter;
    });
  }

  // void setActiveClient(Client client) {
  //   context.go('/mainMenuScreen/rooms');
  //   setState(() {
  //     activeFilter = ActiveFilter.allChats;
  //     _activeSpaceId = null;
  //     Matrix.of(context).setActiveClient(client);
  //   });
  //   _clientStream.add(client);
  // }

  // void setActiveBundle(String bundle) {
  //   context.go('/mainMenuScreen/rooms');
  //   setState(() {
  //     _activeSpaceId = null;
  //     Matrix.of(context).activeBundle = bundle;
  //     if (!Matrix.of(context)
  //         .currentBundle!
  //         .any((client) => client == Matrix.of(context).client)) {
  //       Matrix.of(context)
  //           .setActiveClient(Matrix.of(context).currentBundle!.first);
  //     }
  //   });
  // }

  void editBundlesForAccount(String? userId, String? activeBundle) async {
    final l10n = L10n.of(context);
    final client = Matrix.of(context)
        .widget
        .clients[Matrix.of(context).getClientIndexByMatrixId(userId!)];
    final action = await showModalActionPopup<EditBundleAction>(
      context: context,
      title: L10n.of(context).editBundlesForAccount,
      cancelLabel: L10n.of(context).cancel,
      actions: [
        AdaptiveModalAction(
          value: EditBundleAction.addToBundle,
          label: L10n.of(context).addToBundle,
        ),
        if (activeBundle != client.userID)
          AdaptiveModalAction(
            value: EditBundleAction.removeFromBundle,
            label: L10n.of(context).removeFromBundle,
          ),
      ],
    );
    if (action == null) return;
    switch (action) {
      case EditBundleAction.addToBundle:
        final bundle = await showTextInputDialog(
          context: context,
          title: l10n.bundleName,
          hintText: l10n.bundleName,
        );
        if (bundle == null || bundle.isEmpty || bundle.isEmpty) return;
        await showFutureLoadingDialog(
          context: context,
          future: () => client.setAccountBundle(bundle),
        );
        break;
      case EditBundleAction.removeFromBundle:
        await showFutureLoadingDialog(
          context: context,
          future: () => client.removeFromAccountBundle(activeBundle!),
        );
    }
  }

  bool get displayBundles =>
      Matrix.of(context).hasComplexBundles &&
      Matrix.of(context).accountBundles.keys.length > 1;

  String? get secureActiveBundle {
    if (Matrix.of(context).activeBundle == null ||
        !Matrix.of(context)
            .accountBundles
            .keys
            .contains(Matrix.of(context).activeBundle)) {
      return Matrix.of(context).accountBundles.keys.first;
    }
    return Matrix.of(context).activeBundle;
  }

  void resetActiveBundle() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        Matrix.of(context).activeBundle = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (animationController == null) {
      return const AppLoadingWidget();
    }
    return BackButtonListener(
      onBackButtonPressed: () async {

        final keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
        if (keyboardOpen) {
          FocusManager.instance.primaryFocus?.unfocus();
        }else if(isSearchMode){
          isSearchMode=false;
          clearSearch();
        }
        else{
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            } else {
              context.go('/mainMenuScreen');
            }
        }
        return true;
      },
      // canPop: false,
      // onPopInvokedWithResult: (didPop, result) {
      //   if (didPop) return;
      //   if (Navigator.of(context).canPop()) {
      //     Navigator.of(context).pop();
      //   } else {
      //     context.go('/mainMenuScreen');
      //   }
      // },
      child: HideKeyboardOnOutsideTap(
        child: ChatListViewBody(
          this,
          animationController!,
        ),
      ),
    );
  }

  void _hackyWebRTCFixForWeb() {
    ChatList.contextForVoip = context;
  }

  Future<void> _checkTorBrowser() async {
    if (!kIsWeb) return;
    final isTor = await TorBrowserDetector.isTorBrowser;
    isTorBrowser = isTor;
  }

  /// Reset the encryption message flag when encryption setup is completed
  void resetEncryptionMessageFlag() {
    setState(() {
      _encryptionMessageShown = false;
    });
    Matrix.of(context).store.setBool(_encryptionMessageShownKey, false);
  }

  /// Generate video thumbnail for video messages
  Future<Uint8List?> generateVideoThumbnail(String videoPath) async {
    try {
      final thumbnail = await VideoThumbnail.thumbnailData(
        video: videoPath,
        imageFormat: ImageFormat.JPEG,
        maxWidth: 300,
        maxHeight: 300,
        quality: 75,
      );
      return thumbnail;
    } catch (e) {
      Logs().w('Failed to generate video thumbnail: $e');
      return null;
    }
  }

  Future<void> dehydrate() => Matrix.of(context).dehydrateAction(context);
}

enum EditBundleAction { addToBundle, removeFromBundle }

enum InviteActions {
  accept,
  decline,
  block,
}

enum ChatContextAction {
  select,
  open,
  goToSpace,
  favorite,
  markUnread,
  mute,
  leave,
  addToSpace,
}

enum InviteAction { accept, decline, block }
