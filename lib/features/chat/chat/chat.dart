import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:bmp/core/config/app_config.dart';
import 'package:bmp/core/config/setting_keys.dart';
import 'package:bmp/core/config/themes.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/chat/chat/event_info_dialog.dart';
import 'package:bmp/features/chat/chat/new_chat_view.dart';
import 'package:bmp/features/chat/chat/recording_dialog.dart';
import 'package:bmp/features/chat/chat_details/chat_details.dart';
import 'package:bmp/features/chat/share_screen/share_screen.dart';
import 'package:bmp/features/chat/story_section/services/favorites_service.dart';
// transfer_models removed

import 'package:bmp/shared/utils/account_bundles.dart';
import 'package:bmp/shared/utils/encryption_helper.dart';
import 'package:bmp/shared/utils/error_reporter.dart';
import 'package:bmp/shared/utils/file_selector.dart';
import 'package:bmp/shared/utils/localized_exception_extension.dart';
import 'package:bmp/shared/utils/matrix_sdk_extensions/event_extension.dart';
import 'package:bmp/shared/utils/matrix_sdk_extensions/filtered_timeline_extension.dart';
import 'package:bmp/shared/utils/matrix_sdk_extensions/matrix_locals.dart';
import 'package:bmp/shared/utils/other_party_can_receive.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/utils/platform_infos.dart';
import 'package:bmp/shared/utils/snackbar.dart';
import 'package:bmp/shared/widgets/adaptive_dialogs/show_modal_action_popup.dart';
import 'package:bmp/shared/widgets/adaptive_dialogs/show_ok_cancel_alert_dialog.dart';
import 'package:bmp/shared/widgets/adaptive_dialogs/show_text_input_dialog.dart';
import 'package:bmp/shared/widgets/future_loading_dialog.dart';
import 'package:bmp/shared/widgets/keyboard_dismissible_popscope.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:bmp/shared/widgets/share_scaffold_dialog.dart';
import 'package:collection/collection.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matrix/matrix.dart';
import 'package:record/record.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_html/html.dart' as html;

// ChatTransferDialog removed

import 'send_file_dialog.dart';
import 'send_location_dialog.dart';

class ChatPage extends StatelessWidget {
  final String roomId;
  final List<ShareItem>? shareItems;
  final String? eventId;

  const ChatPage({
    super.key,
    required this.roomId,
    this.eventId,
    this.shareItems,
  });

  @override
  Widget build(BuildContext context) {
    try {
      final client = Matrix.of(context).client;

      final room = client.getRoomById(roomId);
      if (room == null) {
        return Scaffold(
          appBar: AppBar(title: Text(L10n.of(context).oopsSomethingWentWrong)),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child:
                  Text(L10n.of(context).youAreNoLongerParticipatingInThisChat),
            ),
          ),
        );
      }

      final parentSpaceId =
          GoRouterState.of(context).uri.queryParameters['parentSpaceId'];

      return ChatPageWithRoom(
        key: Key('chat_page_${roomId}_$eventId'),
        room: room,
        shareItems: shareItems,
        eventId: eventId,
        parentSpaceId: parentSpaceId,
      );
    } catch (e, s) {
      Logs().e('Error building ChatPage', e, s);
      return Scaffold(
        appBar: AppBar(title: Text(L10n.of(context).oopsSomethingWentWrong)),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                Text(L10n.of(context).failedToLoadChat),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(L10n.of(context).goBack),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}

class ChatPageWithRoom extends StatefulWidget {
  final Room room;
  final List<ShareItem>? shareItems;
  final String? eventId;
  final String? parentSpaceId;

  const ChatPageWithRoom({
    super.key,
    required this.room,
    this.shareItems,
    this.eventId,
    this.parentSpaceId,
  });

  @override
  ChatController createState() => ChatController();
}

class ChatController extends State<ChatPageWithRoom>
    with WidgetsBindingObserver {
  Room get room => sendingClient.getRoomById(roomId) ?? widget.room;

  late Client sendingClient;
  late FavoritesService favoritesService;

  Timeline? timeline;

  late final String readMarkerEventId;

  String get roomId => widget.room.id;

  final AutoScrollController scrollController = AutoScrollController();

  late final FocusNode inputFocus;
  StreamSubscription<html.Event>? onFocusSub;

  Timer? typingCoolDown;
  Timer? typingTimeout;
  bool currentlyTyping = false;
  bool dragging = false;

  void onDragEntered(_) => setState(() => dragging = true);

  void onDragExited(_) => setState(() => dragging = false);

  void onDragDone(DropDoneDetails details) async {
    setState(() => dragging = false);
    if (details.files.isEmpty) return;

    await showAdaptiveDialog(
      context: context,
      builder: (c) => SendFileDialog(
        files: details.files,
        room: room,
        outerContext: context,
      ),
    );
  }

  bool get canSaveSelectedEvent =>
      selectedEvents.length == 1 &&
      {
        MessageTypes.Video,
        MessageTypes.Image,
        MessageTypes.Sticker,
        MessageTypes.Audio,
        MessageTypes.File,
      }.contains(selectedEvents.single.messageType);

  void saveSelectedEvent(context) => selectedEvents.single.saveFile(context);

  List<Event> selectedEvents = [];

  final Set<String> unfolded = {};

  Event? replyEvent;

  Event? editEvent;

  bool _scrolledUp = false;

  bool get showScrollDownButton =>
      _scrolledUp || timeline?.allowNewEvent == false;

  bool get selectMode => selectedEvents.isNotEmpty;

  bool _isInitiatingCall = false;

  final int _loadHistoryCount = 100;

  String pendingText = '';

  bool showEmojiPicker = false;
  bool showVoiceRecorder = false;
  bool _isReactionMode = false; // Flag to distinguish reaction mode from text mode

  void recreateChat() async {
    final room = this.room;
    final userId = room.directChatMatrixID;
    if (userId == null) {
      throw Exception(
        L10n.of(context).recreateChatError,
      );
    }
    await showFutureLoadingDialog(
      context: context,
      future: () => room.invite(userId),
    );
  }

  void leaveChat() async {
    final success = await showFutureLoadingDialog(
      context: context,
      future: room.leave,
    );
    if (success.error != null) return;
    context.go('/mainMenuScreen/rooms');
  }

  void requestHistory([_]) async {
    Logs().v('Requesting history...');
    await timeline?.requestHistory(historyCount: _loadHistoryCount);
  }

  void requestFuture() async {
    final timeline = this.timeline;
    if (timeline == null) return;
    Logs().v('Requesting future...');
    final mostRecentEventId = timeline.events.first.eventId;
    await timeline.requestFuture(historyCount: _loadHistoryCount);
    setReadMarker(eventId: mostRecentEventId);
  }

  void _updateScrollController() {
    if (!mounted) {
      return;
    }
    if (!scrollController.hasClients) return;
    if (timeline?.allowNewEvent == false ||
        scrollController.position.pixels > 0 && _scrolledUp == false) {
      setState(() => _scrolledUp = true);
    } else if (scrollController.position.pixels <= 0 && _scrolledUp == true) {
      setState(() => _scrolledUp = false);
      setReadMarker();
    }

    if (scrollController.position.pixels == 0 ||
        scrollController.position.pixels == 64) {
      requestFuture();
    }
  }

  void _loadDraft() async {
    final prefs = await SharedPreferences.getInstance();
    final draft = prefs.getString('draft_$roomId');
    if (draft != null && draft.isNotEmpty) {
      sendController.text = draft;
    }
  }

  void _saveDraft() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('draft_$roomId', sendController.text);
  }

  void _clearDraft() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('draft_$roomId');
  }

  void _autosaveDraft() async {
    if (sendController.text.isNotEmpty) {
      // await _saveDraft();
    }
  }

  void _shareItems([_]) {
    final shareItems = widget.shareItems;
    if (shareItems == null || shareItems.isEmpty) return;
    if (!room.otherPartyCanReceiveMessages) {
      final theme = Theme.of(context);
      final encryptionStatus =
          EncryptionHelper.getEncryptionStatus(room.client, room);
      final recommendations =
          EncryptionHelper.getEncryptionRecommendations(room.client, room);

      CustomSnackbar.show(
        context,
        title: L10n.of(context).encryptionIssue,
        message: L10n.of(context).otherPartyNotLoggedIn,
        type: SnackbarType.error,
      );
      return;
    }
    for (final item in shareItems) {
      if (item is FileShareItem) continue;
      if (item is TextShareItem) room.sendTextEvent(item.value);
      if (item is ContentShareItem) room.sendEvent(item.value);
    }
    final files = shareItems
        .whereType<FileShareItem>()
        .map((item) => item.value)
        .toList();
    if (files.isEmpty) return;
    showAdaptiveDialog(
      context: context,
      builder: (c) => SendFileDialog(
        files: files,
        room: room,
        outerContext: context,
      ),
    );
  }

  void _handleShareError(String error) {
    CustomSnackbar.show(
      context,
      title: L10n.of(context).error,
      message: error,
      type: SnackbarType.error,
    );
  }

  void _validateShareItems() {
    final shareItems = widget.shareItems;
    if (shareItems == null || shareItems.isEmpty) return;

    for (final item in shareItems) {
      if (item is FileShareItem && item.value.path.isEmpty) {
        _handleShareError(L10n.of(context).shareItemsValidationError);
        return;
      }
    }
  }

  void _processShareItems() {
    _validateShareItems();
    _shareItems();
  }

  void _showEncryptionStatus() {
    final encryptionStatus =
        EncryptionHelper.getEncryptionStatus(room.client, room);
    final recommendations =
        EncryptionHelper.getEncryptionRecommendations(room.client, room);

    showAdaptiveDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(L10n.of(context).encryptionStatus),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Room: ${room.name ?? room.id}'),
              const SizedBox(height: 8),
              Text('Encrypted: ${room.encrypted}'),
              Text(
                'Client Ready: ${encryptionStatus['clientEncryptionReady']}',
              ),
              Text('Room Ready: ${encryptionStatus['roomEncryptionReady']}'),
              Text('Can Receive: ${encryptionStatus['otherPartyCanReceive']}'),
              const SizedBox(height: 8),
              const Text(
                'Recommendations:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ...recommendations.map((rec) => Text('• $rec')),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(L10n.of(context).close),
          ),
          if (!encryptionStatus['clientEncryptionReady'])
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Navigate to encryption settings or trigger bootstrap
                context.push('/mainMenuScreen/rooms/${room.id}/encryption');
              },
              child: Text(L10n.of(context).fixEncryption),
            ),
        ],
      ),
    );
  }

  KeyEventResult _customEnterKeyHandling(FocusNode node, KeyEvent evt) {
    if (!HardwareKeyboard.instance.isShiftPressed &&
        evt.logicalKey.keyLabel == 'Enter' &&
        (AppConfig.sendOnEnter ?? !PlatformInfos.isMobile)) {
      if (evt is KeyDownEvent) {
        send();
      }
      return KeyEventResult.handled;
    } else if (evt.logicalKey.keyLabel == 'Enter' && evt is KeyDownEvent) {
      final currentLineNum = sendController.text
              .substring(
                0,
                sendController.selection.baseOffset,
              )
              .split('\n')
              .length -
          1;
      final currentLine = sendController.text.split('\n')[currentLineNum];

      for (final pattern in [
        '- [ ] ',
        '- [x] ',
        '* [ ] ',
        '* [x] ',
        '- ',
        '* ',
        '+ ',
      ]) {
        if (currentLine.startsWith(pattern)) {
          if (currentLine == pattern) {
            return KeyEventResult.ignored;
          }
          sendController.text += '\n$pattern';
          return KeyEventResult.handled;
        }
      }

      return KeyEventResult.ignored;
    } else {
      return KeyEventResult.ignored;
    }
  }

  @override
  void initState() {
    inputFocus = FocusNode(onKeyEvent: _customEnterKeyHandling);

    scrollController.addListener(_updateScrollController);
    inputFocus.addListener(_inputFocusListener);

    _loadDraft();
    WidgetsBinding.instance.addPostFrameCallback(_shareItems);
    super.initState();
    _displayChatDetailsColumn = ValueNotifier(
      AppSettings.displayChatDetailsColumn.getItem(Matrix.of(context).store),
    );

    sendingClient = Matrix.of(context).client;
    favoritesService = FavoritesService(sendingClient);
    readMarkerEventId = room.hasNewMessages ? room.fullyRead : '';
    WidgetsBinding.instance.addObserver(this);
    _tryLoadTimeline();
    if (kIsWeb) {
      onFocusSub = html.window.onFocus.listen((_) => setReadMarker());
    }
  }

  void _tryLoadTimeline() async {
    if (!mounted) return;

    final initialEventId = widget.eventId;
    loadTimelineFuture = _getTimeline();
    try {
      await loadTimelineFuture;
      if (!mounted) return;

      if (initialEventId != null && timeline != null) {
        scrollToEventId(initialEventId);
      }

      if (timeline == null) {
        Logs().w('Timeline is null after loading');
        return;
      }

      var readMarkerEventIndex = readMarkerEventId.isEmpty
          ? -1
          : timeline!.events
              .filterByVisibleInGui(exceptionEventId: readMarkerEventId)
              .indexWhere((e) => e.eventId == readMarkerEventId);

      // Read marker is existing but not found in first events. Try a single
      // requestHistory call before opening timeline on event context:
      if (readMarkerEventId.isNotEmpty &&
          readMarkerEventIndex == -1 &&
          mounted) {
        try {
          await timeline?.requestHistory(historyCount: _loadHistoryCount);
          if (!mounted || timeline == null) return;

          readMarkerEventIndex = timeline!.events
              .filterByVisibleInGui(exceptionEventId: readMarkerEventId)
              .indexWhere((e) => e.eventId == readMarkerEventId);
        } catch (e) {
          Logs().w('Failed to request history for read marker', e);
        }
      }

      if (readMarkerEventIndex > 1 && mounted) {
        Logs().v('Scroll up to visible event', readMarkerEventId);
        scrollToEventId(readMarkerEventId, highlightEvent: false);
        return;
      } else if (readMarkerEventId.isNotEmpty &&
          readMarkerEventIndex == -1 &&
          mounted) {
        _showScrollUpMaterialBanner(readMarkerEventId);
      }

      // Mark room as read on first visit if requirements are fulfilled
      if (mounted) {
        setReadMarker();
      }
    } catch (e, s) {
      Logs().e('Timeline loading failed', e, s);
      if (mounted) {
        ErrorReporter(context, 'Unable to load timeline').onErrorCallback(e, s);
        // Don't rethrow to prevent black screen, instead show error state
        setState(() {
          timeline = null;
        });
      }
    }
  }

  String? scrollUpBannerEventId;

  void discardScrollUpBannerEventId() => setState(() {
        scrollUpBannerEventId = null;
      });

  void _showScrollUpMaterialBanner(String eventId) => setState(() {
        scrollUpBannerEventId = eventId;
      });

  void updateView() {
    if (!mounted) return;
    setReadMarker();
    setState(() {});
  }

  Future<void>? loadTimelineFuture;

  int? animateInEventIndex;

  void onInsert(int i) {
    // setState will be called by updateView() anyway
    animateInEventIndex = i;
  }

  Future<void> _getTimeline({
    String? eventContextId,
  }) async {
    if (!mounted) return;

    try {
      await Matrix.of(context).client.roomsLoading;
      await Matrix.of(context).client.accountDataLoading;

      if (!mounted) return;

      if (eventContextId != null &&
          (!eventContextId.isValidMatrixId || eventContextId.sigil != '\$')) {
        eventContextId = null;
      }

      timeline?.cancelSubscriptions();
      timeline = null;

      try {
        timeline = await room.getTimeline(
          onUpdate: updateView,
          eventContextId: eventContextId,
          onInsert: onInsert,
        );
      } catch (e, s) {
        Logs().w('Unable to load timeline on event ID $eventContextId', e, s);
        if (!mounted) return;

        // Fallback: try to get timeline without event context
        try {
          timeline = await room.getTimeline(
            onUpdate: updateView,
            onInsert: onInsert,
          );
        } catch (fallbackError, fallbackStack) {
          Logs().e(
            'Fallback timeline loading also failed',
            fallbackError,
            fallbackStack,
          );
          if (!mounted) return;
          rethrow;
        }

        if (!mounted) return;
        if (e is TimeoutException || e is IOException) {
          if (eventContextId != null) {
            _showScrollUpMaterialBanner(eventContextId);
          }
        }
      }

      if (!mounted || timeline == null) return;

      try {
        timeline!.requestKeys(onlineKeyBackupOnly: false);
      } catch (e) {
        Logs().w('Failed to request keys', e);
      }

      if (room.markedUnread) {
        try {
          room.markUnread(false);
        } catch (e) {
          Logs().w('Failed to mark room as read', e);
        }
      }
    } catch (e, s) {
      Logs().e('Critical timeline loading error', e, s);
      if (mounted) {
        rethrow;
      }
    }
  }

 
  String? scrollToEventIdMarker;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) return;
    if (!mounted) return;
    setReadMarker();
  }

  Future<void>? _setReadMarkerFuture;

  void setReadMarker({String? eventId}) {
    if (eventId?.isValidMatrixId == false) return;
    if (_setReadMarkerFuture != null) return;
    if (_scrolledUp) return;
    if (scrollUpBannerEventId != null) return;

    if (eventId == null &&
        !room.hasNewMessages &&
        room.notificationCount == 0) {
      return;
    }

    // Do not send read markers when app is not in foreground
    if (kIsWeb && !Matrix.of(context).webHasFocus) return;
    if (!kIsWeb &&
        WidgetsBinding.instance.lifecycleState != AppLifecycleState.resumed) {
      return;
    }

    final timeline = this.timeline;
    if (timeline == null || timeline.events.isEmpty) return;

    Logs().d('Set read marker...', eventId);
    // ignore: unawaited_futures
    _setReadMarkerFuture = timeline
        .setReadMarker(
      eventId: eventId,
      public: AppConfig.sendPublicReadReceipts,
    )
        .then((_) {
      _setReadMarkerFuture = null;
    });
    if (eventId == null || eventId == timeline.room.lastEvent?.eventId) {
      Matrix.of(context).backgroundPush?.cancelNotification(roomId);
    }
  }

  @override
  void dispose() {
    timeline?.cancelSubscriptions();
    timeline = null;
    inputFocus.removeListener(_inputFocusListener);
    onFocusSub?.cancel();
    super.dispose();
  }

  TextEditingController sendController = TextEditingController();
  int currentLines = 1;

  void updateCurrentLines(String text) {
    final newLines = '\n'.allMatches(text).length + 1;
    final calculatedLines = newLines.clamp(1, 3); // Min 1, Max 3 lines
    if (currentLines != calculatedLines) {
      setState(() {
        currentLines = calculatedLines;
      });
    }
  }

  void setSendingClient(Client c) {
    // first cancel typing with the old sending client
    if (currentlyTyping) {
      // no need to have the setting typing to false be blocking
      typingCoolDown?.cancel();
      typingCoolDown = null;
      room.setTyping(false);
      currentlyTyping = false;
    }
    // then cancel the old timeline
    // fixes bug with read reciepts and quick switching
    loadTimelineFuture = _getTimeline(eventContextId: room.fullyRead).onError(
      ErrorReporter(
        context,
        'Unable to load timeline after changing sending Client',
      ).onErrorCallback,
    );

    // then set the new sending client
    setState(() => sendingClient = c);
  }

  void setActiveClient(Client c) => setState(() {
        Matrix.of(context).setActiveClient(c);
      });

  Future<void> send() async {
    final trimmedText = sendController.text.trim();
    if (trimmedText.isEmpty) return;
    _storeInputTimeoutTimer?.cancel();
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('draft_$roomId');
    var parseCommands = true;

    final commandMatch = RegExp(r'^\/(\w+)').firstMatch(trimmedText);
    if (commandMatch != null &&
        !sendingClient.commands.keys.contains(commandMatch[1]!.toLowerCase())) {
      final l10n = L10n.of(context);
      final dialogResult = await showOkCancelAlertDialog(
        context: context,     dialogType: DialogType.success,
        title: l10n.commandInvalid,
        message: l10n.commandMissing(commandMatch[0]!),
        okLabel: l10n.sendAsText,
        cancelLabel: l10n.cancel,
      );
      if (dialogResult == OkCancelResult.cancel) return;
      parseCommands = false;
    }

    // ignore: unawaited_futures
    room.sendTextEvent(
      trimmedText,
      inReplyTo: replyEvent,
      editEventId: editEvent?.eventId,
      parseCommands: parseCommands,
    );
    sendController.value = TextEditingValue(
      text: pendingText,
      selection: const TextSelection.collapsed(offset: 0),
    );

    // Close keyboard after sending message
    // inputFocus.unfocus();

    setState(() {
      sendController.text = pendingText;
      _inputTextIsEmpty = pendingText.isEmpty;
      replyEvent = null;
      editEvent = null;
      pendingText = '';
      showVoiceRecorder = false;
    });
  }

  void sendFileAction({
    FileSelectorType type = FileSelectorType.any,
    List<XFile>? preSelectedFiles,
  }) async {
    setState(() {
      showVoiceRecorder = false;
    });
    final files = preSelectedFiles ??
        await selectFiles(
          context,
          allowMultiple: true,
          type: type,
        );
    if (files.isEmpty) return;
    await showAdaptiveDialog(
      context: context,
      builder: (c) => SendFileDialog(
        files: files,
        room: room,
        outerContext: context,
      ),
    );
  }

  void _handleFileSelectionError(String error) {
    CustomSnackbar.show(
      context,
      title: L10n.of(context).error,
      message: error,
      type: SnackbarType.error,
    );
  }

  void sendImageFromClipBoard(Uint8List? image) async {
    if (image == null) return;
    await showAdaptiveDialog(
      context: context,
      builder: (c) => SendFileDialog(
        files: [XFile.fromData(image)],
        room: room,
        outerContext: context,
      ),
    );
  }

  void openCameraAction() async {
    // Make sure the textfield is unfocused before opening the camera
    FocusScope.of(context).requestFocus(FocusNode());
    final file = await ImagePicker().pickImage(source: ImageSource.camera);
    if (file == null) return;

    await showAdaptiveDialog(
      context: context,
      builder: (c) => SendFileDialog(
        files: [file],
        room: room,
        outerContext: context,
      ),
    );
  }

void toggleFavorite(Event event) async {
  try {
    final isFavorited = await favoritesService.isFavorited(event.eventId);

    if (isFavorited) {
      await favoritesService.removeFavorite(event.eventId);

      CustomSnackbar.show(
        context,
        title: L10n.of(context).success,
        message: L10n.of(context).removedFromFavorites,
        type: SnackbarType.success,
      );
    } else {
      await favoritesService.addFavorite(room.id, event.eventId);

      CustomSnackbar.show(
        context,
        title: L10n.of(context).success,
        message: L10n.of(context).addedToFavorites,
        type: SnackbarType.success,
      );
    }

    setState(() {}); // Refresh UI
  } catch (e) {
    CustomSnackbar.show(
      context,
      title: L10n.of(context).error,
      message: 'Error: ${e.toString()}',
      type: SnackbarType.error,
    );
  }
}


  void _handleFavoriteError(String error) {
    CustomSnackbar.show(
      context,
      title: L10n.of(context).error,
      message: error,
      type: SnackbarType.error,
    );
  }

  void _refreshFavorites() {
    if (mounted) {
      setState(() {});
    }
  }

  void _updateFavoriteStatus(String eventId, bool isFavorited) {
    if (mounted) {
      setState(() {});
    }
  }

void favoriteMessage(Event event) async {
  try {
    final isFavorited = await favoritesService.isFavorited(event.eventId);

    if (isFavorited) {
      await favoritesService.removeFavorite(event.eventId);

      CustomSnackbar.show(
        context,
        title: L10n.of(context).success,
        message: L10n.of(context).removedFromFavorites,
        type: SnackbarType.success,
      );
    } else {
      await favoritesService.addFavorite(room.id, event.eventId);

      CustomSnackbar.show(
        context,
        title: L10n.of(context).success,
        message: L10n.of(context).addedToFavorites,
        type: SnackbarType.success,
      );
    }

    setState(() {}); // Refresh UI
  } catch (e) {
    CustomSnackbar.show(
      context,
      title: L10n.of(context).error,
      message: 'Error: ${e.toString()}',
      type: SnackbarType.error,
    );
  }
}


  void openVideoCameraAction() async {
    // Make sure the textfield is unfocused before opening the camera
    FocusScope.of(context).requestFocus(FocusNode());
    final file = await ImagePicker().pickVideo(
      source: ImageSource.camera,
      maxDuration: const Duration(minutes: 1),
    );
    if (file == null) return;

    await showAdaptiveDialog(
      context: context,
      builder: (c) => SendFileDialog(
        files: [file],
        room: room,
        outerContext: context,
      ),
    );
  }

  void voiceMessageAction() async {
    room.client.getConfig();

    if (PlatformInfos.isAndroid) {
      final info = await DeviceInfoPlugin().androidInfo;
      if (info.version.sdkInt < 19) {
        showOkAlertDialog(
          context: context,
              dialogType: DialogType.warning,
          title: L10n.of(context).unsupportedAndroidVersion,
          message: L10n.of(context).unsupportedAndroidVersionLong,
          okLabel: L10n.of(context).close,
        );
        return;
      }
    }

    if (await AudioRecorder().hasPermission() == false) return;

    setState(() {
      showVoiceRecorder = true;
    });
  }

  void onVoiceRecordingComplete(RecordingResult result) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final audioFile = XFile(result.path);

    final bytesResult = await showFutureLoadingDialog(
      context: context,
      future: audioFile.readAsBytes,
    );
    final bytes = bytesResult.result;
    if (bytes == null) {
      setState(() {
        showVoiceRecorder = false;
      });
      return;
    }

    final file = MatrixAudioFile(
      bytes: bytes,
      name: result.fileName ?? audioFile.path,
    );

    try {
      await room.sendFileEvent(
        file,
        inReplyTo: replyEvent,
        extraContent: {
          'info': {
            ...file.info,
            'duration': result.duration,
          },
          'org.matrix.msc3245.voice': {},
          'org.matrix.msc1767.audio': {
            'duration': result.duration,
            'waveform': result.waveform,
          },
        },
      );

      // Audio sent successfully, reset state
      setState(() {
        replyEvent = null;
        showVoiceRecorder = false;
      });
    } catch (e) {
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text(
            (e).toLocalizedString(context),
          ),
        ),
      );
      // Even on error, close the recorder
      setState(() {
        showVoiceRecorder = false;
      });
    }
  }

  void _handleVoiceRecordingError(String error) {
    CustomSnackbar.show(
      context,
      title: L10n.of(context).error,
      message: error,
      type: SnackbarType.error,
    );
  }

  void _validateVoiceRecording() {
    if (!mounted) return;
    if (showVoiceRecorder) {
      setState(() {
        showVoiceRecorder = false;
      });
    }
  }

  void _checkVoicePermissions() async {
    if (await AudioRecorder().hasPermission() == false) {
      _handleVoiceRecordingError(
        L10n.of(context).voiceRecordingPermissionDenied,
      );
    }
  }

  void cancelVoiceRecording() {
    setState(() {
      showVoiceRecorder = false;
    });
  }

  void hideEmojiPicker() {
    setState(() {
      showEmojiPicker = false;
      _isReactionMode = false;
    });
  }

  void emojiPickerAction() {
    if (showEmojiPicker) {
      inputFocus.requestFocus();
    } else {
      inputFocus.unfocus();
    }
    _isReactionMode = false; // Regular emoji picker for text
    setState(() => showEmojiPicker = !showEmojiPicker);
  }

  void reactionEmojiPickerAction() {
    if (showEmojiPicker) {
      inputFocus.unfocus();
    } else {
      inputFocus.unfocus();
    }
    _isReactionMode = true; // Reaction mode
    setState(() => showEmojiPicker = !showEmojiPicker);
  }

  void _inputFocusListener() {
    if (showEmojiPicker && inputFocus.hasFocus) {
      setState(() {
        showEmojiPicker = false;
        _isReactionMode = false;
      });
    }
  }

  void sendLocationAction() async {
    await showAdaptiveDialog(
      context: context,
      builder: (c) => SendLocationDialog(room: room),
    );
  }

  void transferAction() async {
    // Finance feature removed. Redirect to coming soon.
    context.push('/onboarding/coming-soon/Wallet');
  }

  /* removed old transferAction implementation */
  // void _old_transferAction() async {
  //   // Check email first - if null, show CreateCustomerBottomSheet
  //   final emailExists = await EmailCheckHelper.checkEmailAndShowBottomSheetIfNeeded(context);
  //   if (!emailExists) {
  //     print('⚠️ transferAction: Email is null, CreateCustomerBottomSheet was shown');
  //     return;
  //   }
  //
  //   // Then check subscription before accessing finance feature
  //   final provider = context.read<SubscriptionProvider>();
  //   print('💸 transferAction: Checking finance access. Has Access: ${provider.hasAccess(FeatureType.finance)}');
  //
  //   if (!provider.hasAccess(FeatureType.finance)) {
  //     print('🔒 transferAction: Access denied, showing paywall');
  //     await SubscriptionPaywall.show(context, FeatureType.finance);
  //     return;
  //   }
  //
  //   final recipientId = room.directChatMatrixID;
  //   if (recipientId == null) {
  //     CustomSnackbar.show(
  //       context,
  //       title: "",
  //       message: L10n.of(context).transferOnlyDirectChats,
  //       type: SnackbarType.error,
  //     );
  //
  //     return;
  //   }
  //
  //   await showDialog(
  //     context: context,
  //     builder: (context) => Container(),
  //   );
  // }

  void _handleTransferSuccess(dynamic transfer) {
    // Disabled
  }

  String _buildTransferMessage(dynamic transfer) {
    return 'Finance feature removed';
  }

  void _sendTransferMessage(String message) {
    try {
      room.sendTextEvent(message);
    } catch (e) {
      CustomSnackbar.show(
        context,
        title: L10n.of(context).error,
        message: "Failed to send transfer message: $e",
        type: SnackbarType.error,
      );
    }
  }

  String _getSelectedEventString() {
    var copyString = '';
    if (selectedEvents.length == 1) {
      return selectedEvents.first
          .getDisplayEvent(timeline!)
          .calcLocalizedBodyFallback(MatrixLocals(L10n.of(context)));
    }
    for (final event in selectedEvents) {
      if (copyString.isNotEmpty) copyString += '\n\n';
      copyString += event.getDisplayEvent(timeline!).calcLocalizedBodyFallback(
            MatrixLocals(L10n.of(context)),
            withSenderNamePrefix: true,
          );
    }
    return copyString;
  }

  void copyEventsAction() {
    Clipboard.setData(ClipboardData(text: _getSelectedEventString()));
    setState(() {
      showEmojiPicker = false;
      _isReactionMode = false;
      selectedEvents.clear();
    });
  }

  void reportEventAction() async {
    final event = selectedEvents.single;
    final score = await showModalActionPopup<int>(
      context: context,
      title: L10n.of(context).reportMessage,
      message: L10n.of(context).howOffensiveIsThisContent,
      cancelLabel: L10n.of(context).cancel,
      actions: [
        AdaptiveModalAction(
          value: -100,
          label: L10n.of(context).extremeOffensive,
        ),
        AdaptiveModalAction(
          value: -50,
          label: L10n.of(context).offensive,
        ),
        AdaptiveModalAction(
          value: 0,
          label: L10n.of(context).inoffensive,
        ),
      ],
    );
    if (score == null) return;
    final reason = await showTextInputDialog(
      context: context,
      title: L10n.of(context).whyDoYouWantToReportThis,
      okLabel: L10n.of(context).ok,
      cancelLabel: L10n.of(context).cancel,
      hintText: L10n.of(context).reason,
    );
    if (reason == null || reason.isEmpty) return;
    final result = await showFutureLoadingDialog(
      context: context,
      future: () => Matrix.of(context).client.reportEvent(
            event.roomId!,
            event.eventId,
            reason: reason,
            score: score,
          ),
    );
    if (result.error != null) return;
    setState(() {
      showEmojiPicker = false;
      _isReactionMode = false;
      selectedEvents.clear();
    });
    CustomSnackbar.show(
      context,
      title: L10n.of(context).everythingReady,
      message: L10n.of(context).contentHasBeenReported,
      type: SnackbarType.success,
    );
  }

  void deleteErrorEventsAction() async {
    try {
      if (selectedEvents.any((event) => event.status != EventStatus.error)) {
        throw Exception(
          'Tried to delete failed to send events but one event is not failed to sent',
        );
      }
      for (final event in selectedEvents) {
        await event.cancelSend();
      }
      setState(selectedEvents.clear);
    } catch (e, s) {
      ErrorReporter(
        context,
        'Error while delete error events action',
      ).onErrorCallback(e, s);
    }
  }

  void redactEventsAction() async {
    final hasSentMessages = selectedEvents.any((event) => event.status.isSent);
    final reasonInput = hasSentMessages
        ? await showTextInputDialog(
            context: context,
            title: L10n.of(context).redactMessage,
            message: L10n.of(context).redactMessageDescription,
            isDestructive: true,
            hintText: L10n.of(context).optionalRedactReason,
            okLabel: L10n.of(context).remove,
            cancelLabel: L10n.of(context).cancel,
          )
        : '';
    if (hasSentMessages && reasonInput == null) return;
    final reason = reasonInput?.isEmpty == true ? null : reasonInput;
    for (final event in selectedEvents) {
      await showFutureLoadingDialog(
        context: context,
        future: () async {
          if (event.status.isSent) {
            if (event.canRedact) {
              await event.redactEvent(reason: reason);
            } else {
              final client = currentRoomBundle.firstWhere(
                (cl) => selectedEvents.first.senderId == cl!.userID,
                orElse: () => null,
              );
              if (client == null) {
                return;
              }
              final room = client.getRoomById(roomId)!;
              await Event.fromJson(event.toJson(), room).redactEvent(
                reason: reason,
              );
            }
          } else {
            await event.cancelSend();
          }
        },
      );
    }
    setState(() {
      showEmojiPicker = false;
      _isReactionMode = false;
      selectedEvents.clear();
    });
  }

  List<Client?> get currentRoomBundle {
    final clients = Matrix.of(context).currentBundle!;
    clients.removeWhere((c) => c!.getRoomById(roomId) == null);
    return clients;
  }

  bool get canRedactSelectedEvents {
    if (isArchived) return false;
    final clients = Matrix.of(context).currentBundle;
    for (final event in selectedEvents) {
      if (!event.status.isSent) return false;
      if (event.canRedact == false &&
          !(clients!.any((cl) => event.senderId == cl!.userID))) {
        return false;
      }
    }
    return true;
  }

  bool get canPinSelectedEvents {
    if (isArchived || selectedEvents.isEmpty || !selectedEvents.every((e) => e.status.isSent)) {
      return false;
    }

    // In direct chats, allow anyone to pin
    if (room.isDirectChat) {
      return true;
    }

    // For group chats: Allow users to pin their own messages OR if they have admin permissions
    final currentUserId = room.client.userID;
    final hasAdminPermission = room.canChangeStateEvent(EventTypes.RoomPinnedEvents);

    // Check if all selected events are either from current user or user has admin permission
    return selectedEvents.every((event) => 
      event.senderId == currentUserId || hasAdminPermission
    );
  }

  bool get canEditSelectedEvents {
    if (isArchived ||
        selectedEvents.length != 1 ||
        !selectedEvents.first.status.isSent) {
      return false;
    }
    return currentRoomBundle
        .any((cl) => selectedEvents.first.senderId == cl!.userID);
  }

  void forwardEventsAction() async {
    if (selectedEvents.isEmpty) return;
    final timeline = this.timeline;
    if (timeline == null) return;

    final selectedRoomIds = await Navigator.of(context).push<List<String>>(
      MaterialPageRoute(
        builder: (context) => const ShareScreen(),
      ),
    );

    if (selectedRoomIds == null || selectedRoomIds.isEmpty) {
      Logs().d('[Forward] No rooms selected for forwarding');
      return;
    }

    Logs().d(
        '[Forward] Starting to forward ${selectedEvents.length} messages to ${selectedRoomIds.length} rooms');
    Logs().d('[Forward] Selected room IDs: ${selectedRoomIds.join(", ")}');

    final forwardEvents = List<Event>.from(selectedEvents)
        .map((event) => event.getDisplayEvent(timeline))
        .toList();

    int successCount = 0;
    for (final roomId in selectedRoomIds) {
      final targetRoom = Matrix.of(context).client.getRoomById(roomId);
      if (targetRoom == null) {
        Logs().w('[Forward] Room not found: $roomId');
        continue;
      }

      Logs().d(
          '[Forward] Forwarding to room: ${targetRoom.getLocalizedDisplayname()} ($roomId)');

      for (final event in forwardEvents) {
        try {
          await targetRoom.sendEvent(event.content);
          Logs().d(
              '[Forward] Successfully sent event ${event.eventId} to room $roomId');
        } catch (e) {
          Logs().e(
              '[Forward] Failed to send event ${event.eventId} to room $roomId: $e');
        }
      }
      successCount++;
    }

    Logs().d(
        '[Forward] Completed forwarding to $successCount out of ${selectedRoomIds.length} rooms');

    if (!mounted) return;
    CustomSnackbar.show(
      context,
      title: L10n.of(context).everythingReady,
      message: selectedRoomIds.length == 1
          ? L10n.of(context).messageForwardedSuccessfully
          : 'Messages forwarded to ${selectedRoomIds.length} chats successfully',
      type: SnackbarType.success,
    );
    setState(() => selectedEvents.clear());
  }

  void sendAgainAction() {
    final event = selectedEvents.first;
    if (event.status.isError) {
      event.sendAgain();
    }
    final allEditEvents = event
        .aggregatedEvents(timeline!, RelationshipTypes.edit)
        .where((e) => e.status.isError);
    for (final e in allEditEvents) {
      e.sendAgain();
    }
    setState(() => selectedEvents.clear());
  }

  void replyAction({Event? replyTo}) {
    setState(() {
      replyEvent = replyTo ?? selectedEvents.first;
      selectedEvents.clear();
    });
    inputFocus.requestFocus();
  }

  void scrollToEventId(
    String eventId, {
    bool highlightEvent = true,
  }) async {
    final foundEvent =
        timeline!.events.firstWhereOrNull((event) => event.eventId == eventId);

    final eventIndex = foundEvent == null
        ? -1
        : timeline!.events
            .filterByVisibleInGui(exceptionEventId: eventId)
            .indexOf(foundEvent);

    if (eventIndex == -1) {
      setState(() {
        timeline = null;
        _scrolledUp = false;
        loadTimelineFuture = _getTimeline(eventContextId: eventId).onError(
          ErrorReporter(context, 'Unable to load timeline after scroll to ID')
              .onErrorCallback,
        );
      });
      await loadTimelineFuture;
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        scrollToEventId(eventId);
      });
      return;
    }
    if (highlightEvent) {
      setState(() {
        scrollToEventIdMarker = eventId;
      });
      // Clear highlight after 3 seconds
      Timer(const Duration(seconds: 3), () {
        if (mounted) {
          setState(() {
            scrollToEventIdMarker = null;
          });
        }
      });
    }
    await scrollController.scrollToIndex(
      eventIndex + 1,
      duration: FluffyThemes.animationDuration,
      preferPosition: AutoScrollPosition.middle,
    );
    _updateScrollController();
  }

  void scrollDown() async {
    if (!timeline!.allowNewEvent) {
      setState(() {
        timeline = null;
        _scrolledUp = false;
        loadTimelineFuture = _getTimeline().onError(
          ErrorReporter(context, 'Unable to load timeline after scroll down')
              .onErrorCallback,
        );
      });
      await loadTimelineFuture;
    }
    scrollController.jumpTo(0);
  }

  void onEmojiSelected(_, Emoji? emoji) {
    if (_isReactionMode && selectedEvents.isNotEmpty) {
      // Send as reaction
      if (emoji != null) {
        room.sendReaction(
          selectedEvents.first.eventId,
          emoji.emoji,
        );
        clearSelectedEvents();
      }
    } else {
      // Add to text field
      typeEmoji(emoji);
      onInputBarChanged(sendController.text);
    }
  }

  void typeEmoji(Emoji? emoji) {
    if (emoji == null) return;
    final text = sendController.text;
    final selection = sendController.selection;
    final newText = sendController.text.isEmpty
        ? emoji.emoji
        : text.replaceRange(selection.start, selection.end, emoji.emoji);
    sendController.value = TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(
        // don't forget an UTF-8 combined emoji might have a length > 1
        offset: selection.baseOffset + emoji.emoji.length,
      ),
    );
  }

  void emojiPickerBackspace() {
    sendController
      ..text = sendController.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
        TextPosition(offset: sendController.text.length),
      );
  }

  void clearSelectedEvents() => setState(() {
        selectedEvents.clear();
        showEmojiPicker = false;
        _isReactionMode = false; // Reset reaction mode
      });

  void clearSingleSelectedEvent() {
    if (selectedEvents.length <= 1) {
      clearSelectedEvents();
    }
  }

  void editSelectedEventAction() {
    final client = currentRoomBundle.firstWhere(
      (cl) => selectedEvents.first.senderId == cl!.userID,
      orElse: () => null,
    );
    if (client == null) {
      return;
    }
    setSendingClient(client);
    setState(() {
      pendingText = sendController.text;
      editEvent = selectedEvents.first;
      sendController.text =
          editEvent!.getDisplayEvent(timeline!).calcLocalizedBodyFallback(
                MatrixLocals(L10n.of(context)),
                withSenderNamePrefix: false,
                hideReply: true,
              );
      selectedEvents.clear();
    });
    inputFocus.requestFocus();
  }

  void goToNewRoomAction() async {
    debugPrint("=======goToNewRoomAction=======");
    final newRoomId = room
        .getState(EventTypes.RoomTombstone)!
        .parsedTombstoneContent
        .replacementRoom;
    final result = await showFutureLoadingDialog(
      context: context,
      future: () => room.client.joinRoom(
        room
            .getState(EventTypes.RoomTombstone)!
            .parsedTombstoneContent
            .replacementRoom,
        via: [newRoomId.domain!],
      ),
    );
    if (result.error != null) return;
    if (!mounted) return;
    context.go('/mainMenuScreen/rooms/${result.result!}');

    await showFutureLoadingDialog(
      context: context,
      future: room.leave,
    );
  }

  void onSelectMessage(Event event) {
    if (!event.redacted) {
      if (selectedEvents.contains(event)) {
        setState(
          () => selectedEvents.remove(event),
        );
      } else {
        setState(
          () => selectedEvents.add(event),
        );
      }
      selectedEvents.sort(
        (a, b) => a.originServerTs.compareTo(b.originServerTs),
      );
    }
  }

  int? findChildIndexCallback(Key key, Map<String, int> thisEventsKeyMap) {
    // this method is called very often. As such, it has to be optimized for speed.
    if (key is! ValueKey) {
      return null;
    }
    final eventId = key.value;
    if (eventId is! String) {
      return null;
    }
    // first fetch the last index the event was at
    final index = thisEventsKeyMap[eventId];
    if (index == null) {
      return null;
    }
    // we need to +1 as 0 is the typing thing at the bottom
    return index + 1;
  }

  void onInputBarSubmitted(_) {
    send();
    FocusScope.of(context).requestFocus(inputFocus);
  }

  void onAddPopupMenuButtonSelected(String choice) {
    room.client.getConfig(); // Preload server file configuration.

// transfer choice removed

    if (choice == 'file') {
      sendFileAction();
    }
    if (choice == 'image') {
      sendFileAction(type: FileSelectorType.images);
    }
    if (choice == 'video') {
      sendFileAction(type: FileSelectorType.videos);
    }
    if (choice == 'camera') {
      openCameraAction();
    }
    if (choice == 'camera-video') {
      openVideoCameraAction();
    }
    if (choice == 'location') {
      sendLocationAction();
    }
  }

  unpinEvent(String eventId) async {
    final response = await showOkCancelAlertDialog(
      context: context,
           dialogType: DialogType.success,
      title: L10n.of(context).unpin,
      message: L10n.of(context).confirmEventUnpin,
      okLabel: L10n.of(context).unpin,
      cancelLabel: L10n.of(context).cancel,
    );
    if (response == OkCancelResult.ok) {
      final events = List<String>.from(room.pinnedEventIds)
        ..removeWhere((oldEvent) => oldEvent == eventId);

      final result = await showFutureLoadingDialog(
        context: context,
        future: () => room.setPinnedEvents(events),
      );

      if (result.error == null && mounted) {
        // Force immediate UI refresh
        setState(() {});
      }
    }
  }

  void pinEvent() async {
    final pinnedEventIds = room.pinnedEventIds;
    final selectedEventIds = selectedEvents.map((e) => e.eventId).toSet();
    
    // Check if we're unpinning (all selected events are already pinned)
    final unpin = selectedEventIds.isNotEmpty &&
        selectedEventIds.every((id) => pinnedEventIds.contains(id));

    if (unpin) {
      pinnedEventIds.removeWhere(selectedEventIds.contains);
    } else {
      // Check if user is trying to pin more than 5 messages at once
      if (selectedEventIds.length > 5) {
        CustomSnackbar.show(
          context,
          title: L10n.of(context).error,
          message: 'You can only pin up to 5 messages at once',
          type: SnackbarType.error,
        );
        setState(() => selectedEvents.clear());
        return;
      }

      // Check if adding new pins would exceed the limit
      final newPinsCount = selectedEventIds.where((id) => !pinnedEventIds.contains(id)).length;
      if (pinnedEventIds.length + newPinsCount > 5) {
        final result = await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (context) => BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: AlertDialog(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(context.screenWidth * 0.05),
              ),
              content: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment(-0.00, 0.75),
                    end: Alignment(1.05, 0.32),
                    colors: [Color(0xFFA912BF), Color(0xFF131EBF)],
                  ),
                  borderRadius: BorderRadius.circular(context.screenWidth * 0.05),
                ),
                padding: EdgeInsets.all(context.screenWidth * 0.05),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      L10n.of(context).replaceOldestPin,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: context.screenWidth * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: context.screenHeight * 0.02),
                    Text(
                      'Maximum 5 pins allowed. Your new pins will replace the oldest ones.',
                      style: TextStyle(
                        color: const Color(0xFFB0B0B0),
                        fontSize: context.screenWidth * 0.035,
                      ),
                    ),
                    SizedBox(height: context.screenHeight * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pop(false),
                            child: Container(
                              width: context.screenWidth * 0.38,
                              height: context.screenHeight * 0.034,
                              alignment: Alignment.center,
                              child: Text(
                                L10n.of(context).cancel,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: context.screenWidth * 0.045,
                                  fontFamily: 'Work Sans',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: context.screenWidth * 0.04),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pop(true),
                            child: Container(
                              width: context.screenWidth * 0.38,
                              height: context.screenHeight * 0.034,
                              alignment: Alignment.center,
                              child: Text(
                                L10n.of(context).continueText,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: context.screenWidth * 0.045,
                                  fontFamily: 'Work Sans',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );

        if (result != true) {
          setState(() => selectedEvents.clear());
          return;
        }

        // Remove oldest pins to make room for new ones
        final pinsToRemove = (pinnedEventIds.length + newPinsCount) - 5;
        for (var i = 0; i < pinsToRemove; i++) {
          if (pinnedEventIds.isNotEmpty) {
            pinnedEventIds.removeAt(0);
          }
        }
      }
      
      // Add only the new pins (skip already pinned events)
      for (final eventId in selectedEventIds) {
        if (!pinnedEventIds.contains(eventId)) {
          pinnedEventIds.add(eventId);
        }
      }
    }

    final result = await showFutureLoadingDialog(
      context: context,
      future: () => room.setPinnedEvents(pinnedEventIds),
    );

    if (result.error == null && mounted) {
      setState(() {
        selectedEvents.clear();
      });
    }
  }

  Timer? _storeInputTimeoutTimer;
  static const Duration _storeInputTimeout = Duration(milliseconds: 500);

  void onInputBarChanged(String text) {
    updateCurrentLines(text);

    if (_inputTextIsEmpty != text.isEmpty) {
      setState(() {
        _inputTextIsEmpty = text.isEmpty;
      });
    }

    _storeInputTimeoutTimer?.cancel();
    _storeInputTimeoutTimer = Timer(_storeInputTimeout, () async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('draft_$roomId', text);
    });
    if (text.endsWith(' ') && Matrix.of(context).hasComplexBundles) {
      final clients = currentRoomBundle;
      for (final client in clients) {
        final prefix = client!.sendPrefix;
        if ((prefix.isNotEmpty) &&
            text.toLowerCase() == '${prefix.toLowerCase()} ') {
          setSendingClient(client);
          setState(() {
            sendController.clear();
          });
          return;
        }
      }
    }
    if (AppConfig.sendTypingNotifications) {
      typingCoolDown?.cancel();
      typingCoolDown = Timer(const Duration(seconds: 2), () {
        typingCoolDown = null;
        currentlyTyping = false;
        room.setTyping(false);
      });
      typingTimeout ??= Timer(const Duration(seconds: 30), () {
        typingTimeout = null;
        currentlyTyping = false;
      });
      if (!currentlyTyping) {
        currentlyTyping = true;
        room.setTyping(
          true,
          timeout: const Duration(seconds: 30).inMilliseconds,
        );
      }
    }
  }

  bool _inputTextIsEmpty = true;

  bool get isArchived =>
      {Membership.leave, Membership.ban}.contains(room.membership);

  void showEventInfo([Event? event]) =>
      (event ?? selectedEvents.single).showInfoDialog(context);

  void startVoiceCall() async {
    Logs().i('[Call] 🎤 Starting voice call for room: ${room.id}');

    if (!_canStartCall()) return;

    await _initiateCall(CallType.kVoice);
  }

  void startVideoCall() async {
    Logs().i('[Call] 📹 Starting video call for room: ${room.id}');

    if (!_canStartCall()) return;

    await _initiateCall(CallType.kVideo);
  }

  void onPhoneButtonTap() {
    startVoiceCall();
  }

  bool _canStartCall() {
    if (_isInitiatingCall) {
      Logs().w('[Call] Already initiating a call, ignoring duplicate request');
      return false;
    }

    if (!room.isDirectChat) {
      _showCallError(L10n.of(context).callsOnlyDirectChats);
      return false;
    }

    if (room.membership != Membership.join) {
      _showCallError(L10n.of(context).mustBeMemberToCall);
      return false;
    }

    final otherUserId = room.directChatMatrixID;
    if (otherUserId == null) {
      _showCallError(L10n.of(context).cannotDetermineCallRecipient);
      return false;
    }

    return true;
  }

  Future<void> _initiateCall(CallType callType) async {
    _isInitiatingCall = true;

    try {
      Logs().i('[Call] 📞 Initiating ${callType == CallType.kVoice ? 'voice' : 'video'} call');

      // Skip slow Android SDK check for most devices (99%+ have SDK 21+)
      // Only very old devices (Android 4.x) would fail, and they would fail
      // gracefully when trying to start the call anyway
      
      final voipManager = Matrix.of(context).voipPlugin;
      if (voipManager == null) {
        Logs().e('[Call] ❌ VoIP manager not available');
        _showCallError(L10n.of(context).voiceVideoCallsNotAvailable);
        return;
      }

      Logs().i('[Call] 📤 Sending call invitation...');
      // This will show the call screen immediately
      await voipManager.startCall(room, callType);
      Logs().i('[Call] ✅ Call invitation sent successfully');
    } catch (e, s) {
      Logs().e('[Call] ❌ Failed to initiate call', e, s);
      // Show error to user if call fails
      if (mounted) {
        _showCallError(L10n.of(context).failedToStartCall);
      }
    } finally {
      _isInitiatingCall = false;
    }
  }

  void _showCallError(String message) {
    CustomSnackbar.show(
      context,
      title: L10n.of(context).error,
      message: message,
      type: SnackbarType.error,
    );
  }

  Future<void> _startGroupCall(bool isVideo) async {
    Logs().i('[GroupCall] 🎥 Starting group call - video: $isVideo');

    try {
      final members = room.getParticipants();
      final participantIds = members
          .map((m) => m.id)
          .where((id) => id != room.client.userID)
          .toList();

      if (participantIds.isEmpty) {
        _showCallError(L10n.of(context).noParticipantsGroupCall);
        return;
      }

      CustomSnackbar.show(
        context,
        title: L10n.of(context).info,
        message:
            '${L10n.of(context).groupCallsInDevelopmentDirectOnly} Starting ${isVideo ? 'video' : 'voice'} call with ${participantIds.length} participants...',
        type: SnackbarType.info,
      );
    } catch (e) {
      Logs().e('[GroupCall] Failed to start group call', e);
      _showCallError(L10n.of(context).groupCallsInDevelopmentDirectOnly);
    }
  }

  void showMessageActionDialog() {
    if (selectedEvents.isEmpty) return;
    _showMessageContextMenu();
  }

  void _showMessageContextMenu() {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      barrierDismissible: true,
      builder: (dialogContext) => SelectionContainer.disabled(
        child: Stack(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(dialogContext),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.transparent,
              ),
            ),
            Positioned(
              // left: 20,
              right: 10,
              bottom: MediaQuery.of(context).size.height * 0.25,
              child: SelectionContainer.disabled(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 144,
                      padding: EdgeInsets.all(context.percentWidth * 2.5),
                      decoration: ShapeDecoration(
                        color: const Color(0xff262845).withOpacity(0.95),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(dialogContext);
                                if (selectedEvents.isNotEmpty) {
                                  room.sendReaction(
                                    selectedEvents.first.eventId,
                                    '👍',
                                  );
                                  clearSelectedEvents();
                                }
                              },
                              child: const Text(
                                '👍',
                                style: TextStyle(
                                  fontSize: 20,
                                  decoration: TextDecoration.none,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 1.5),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(dialogContext);
                                if (selectedEvents.isNotEmpty) {
                                  room.sendReaction(
                                    selectedEvents.first.eventId,
                                    '❤',
                                  );
                                  clearSelectedEvents();
                                }
                              },
                              child: const Text(
                                '❤',
                                style: TextStyle(
                                  fontSize: 20,
                                  decoration: TextDecoration.none,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 1.5),

                            GestureDetector(
                              onTap: () {
                                Navigator.pop(dialogContext);
                                if (selectedEvents.isNotEmpty) {
                                  room.sendReaction(
                                    selectedEvents.first.eventId,
                                    '😂',
                                  );
                                  clearSelectedEvents();
                                }
                              },
                              child: const Text(
                                '😂',
                                style: TextStyle(
                                  fontSize: 20,
                                  decoration: TextDecoration.none,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 1.5),

                            GestureDetector(
                              onTap: () {
                                Navigator.pop(dialogContext);
                                if (selectedEvents.isNotEmpty) {
                                  room.sendReaction(
                                    selectedEvents.first.eventId,
                                    '😮',
                                  );
                                  clearSelectedEvents();
                                }
                              },
                              child: const Text(
                                '😮',
                                style: TextStyle(
                                  fontSize: 20,
                                  decoration: TextDecoration.none,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 1.5),

                            // GestureDetector(
                            //   onTap: () {
                            //     Navigator.pop(dialogContext);
                            //     if (selectedEvents.isNotEmpty) {
                            //       room.sendReaction(selectedEvents.first.eventId, '😢');
                            //       clearSelectedEvents();
                            //     }
                            //   },
                            //   child: Text('😢', style: TextStyle(fontSize: 20, decoration: TextDecoration.none, color: Colors.white)),
                            // ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(dialogContext);
                                reactionEmojiPickerAction();
                              },
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xFFF3F3F3).withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Color(0xFFF3F3F3),
                                  size: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      width: 144,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: ShapeDecoration(
                        color: const Color(0xFF262845),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildActionItem('assets/images/icons/send (2).png',
                              L10n.of(context).reply, () {
                            Navigator.pop(dialogContext);
                            replyAction();
                          }),
                          _buildActionItem('assets/images/icons/copy.png',
                              L10n.of(context).copy, () {
                            Navigator.pop(dialogContext);
                            copyEventsAction();
                          }),
                          _buildActionItem('assets/images/icons/forward.png',
                              L10n.of(context).forward, () {
                            Navigator.pop(dialogContext);
                            forwardEventsAction();
                          }),
                          FutureBuilder<bool>(
                            future: selectedEvents.isNotEmpty
                                ? favoritesService
                                    .isFavorited(selectedEvents.first.eventId)
                                : Future.value(false),
                            builder: (context, snapshot) {
                              final isFavorited = snapshot.data ?? false;
                              return _buildActionItem(
                                  'assets/icons/favorite.png',
                                  isFavorited
                                      ? L10n.of(context).unfavorite
                                      : L10n.of(context).favorite, () {
                                Navigator.pop(dialogContext);
                                if (selectedEvents.isNotEmpty) {
                                  favoriteMessage(selectedEvents.first);
                                  clearSelectedEvents();
                                }
                              });
                            },
                          ),
                          // _buildActionItem('assets/images/icons/copy.png', 'Info', () {
                          //   Navigator.pop(dialogContext);
                          //   showEventInfo();
                          //   clearSelectedEvents();
                          // }),
                          if (canPinSelectedEvents && _canShowPinOption())
                            _buildActionItem(
                                'assets/images/icons/archive-tick.png',
                                room.pinnedEventIds
                                        .contains(selectedEvents.first.eventId)
                                    ? L10n.of(context).unpin
                                    : L10n.of(context).pin, () {
                              Navigator.pop(dialogContext);
                              pinEvent();
                            }),
                          // if (canEditSelectedEvents)
                          //   _buildActionItem('assets/images/icons/copy.png','Edit', () {
                          //     Navigator.pop(dialogContext);
                          //     editSelectedEventAction();
                          //   }),
                          if (canRedactSelectedEvents)
                            _buildActionItem('assets/images/icons/trash.png',
                                L10n.of(context).delete, () {
                              Navigator.pop(dialogContext);
                              redactEventsAction();
                            }),
                          _buildActionItem(
                              'assets/images/icons/info-circle.png',
                              L10n.of(context).report, () {
                            Navigator.pop(dialogContext);
                            reportEventAction();
                          }),
                        ],
                      ),
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

  Widget _buildActionItem(String imagePath, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              height: 20,
              width: 20,
              color: const Color(0xFFF3F3F3),
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                color: Color(0xFFF3F3F3),
                fontSize: 16,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleActionError(String action, String error) {
    // CustomSnackbar.show(
    //   context,
    //   title: L10n.of(context).error,
    //   message: L10n.of(context).actionFailed.replaceAll('{action}', action).replaceAll('{error}', error),
    //   type: SnackbarType.error,
    // );
  }

  void _validateAction(String action) {
    if (selectedEvents.isEmpty) {
      _handleActionError(action, L10n.of(context).noEventsSelected);
    }
  }

  void cancelReplyEventAction() => setState(() {
        if (editEvent != null) {
          sendController.text = pendingText;
          pendingText = '';
        }
        replyEvent = null;
        editEvent = null;
      });

  void _resetInputState() {
    setState(() {
      replyEvent = null;
      editEvent = null;
      pendingText = '';
      showEmojiPicker = false;
      _isReactionMode = false;
      showVoiceRecorder = false;
    });
  }

  void _cleanupState() {
    _resetInputState();
    selectedEvents.clear();
  }

  bool _canShowPinOption() {
    if (selectedEvents.isEmpty) return false;
    final event = selectedEvents.first;
    // Hide pin option if message is encrypted and not decrypted
    return event.type != EventTypes.Encrypted &&
        event.messageType != MessageTypes.BadEncrypted;
  }

  late final ValueNotifier<bool> _displayChatDetailsColumn;

  void toggleDisplayChatDetailsColumn() async {
    await AppSettings.displayChatDetailsColumn.setItem(
      Matrix.of(context).store,
      !_displayChatDetailsColumn.value,
    );
    _displayChatDetailsColumn.value = !_displayChatDetailsColumn.value;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return KeyboardDismissiblePopScope(
      focusNodes: [inputFocus],
      child: Row(
        children: [
          Expanded(
            child: NewChatView(this),
          ),
          ValueListenableBuilder(
            valueListenable: _displayChatDetailsColumn,
            builder: (context, displayChatDetailsColumn, _) =>
                !FluffyThemes.isThreeColumnMode(context) ||
                        room.membership != Membership.join ||
                        !displayChatDetailsColumn
                    ? const SizedBox(
                        height: double.infinity,
                        width: 0,
                      )
                    : Container(
                        width: FluffyThemes.columnWidth,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              width: 1,
                              color: theme.dividerColor,
                            ),
                          ),
                        ),
                        child: ChatDetails(
                          roomId: roomId,
                          embeddedCloseButton: IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: toggleDisplayChatDetailsColumn,
                          ),
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}
