import 'dart:async';
import 'dart:convert';

import 'package:bmp/core/localization/l10n.dart';

import 'package:bmp/shared/utils/account_bundles.dart';
import 'package:bmp/shared/utils/auth_fix.dart';
import 'package:bmp/shared/utils/auto_encryption_setup.dart';
import 'package:bmp/shared/utils/background_push.dart';
import 'package:bmp/shared/utils/client_download_content_extension.dart';
import 'package:bmp/shared/utils/client_manager.dart';
import 'package:bmp/shared/utils/init_with_restore.dart';
import 'package:bmp/shared/utils/matrix_sdk_extensions/matrix_file_extension.dart';
import 'package:bmp/shared/utils/matrix_sdk_extensions/matrix_locals.dart';
import 'package:bmp/shared/utils/platform_infos.dart';
import 'package:bmp/features/chat/voip/voip.dart';
import 'package:bmp/shared/widgets/adaptive_dialogs/show_ok_cancel_alert_dialog.dart';
import 'package:bmp/shared/widgets/adaptive_dialogs/show_text_input_dialog.dart';
import 'package:bmp/shared/widgets/bmp_chat_app.dart';
import 'package:bmp/shared/widgets/future_loading_dialog.dart';
import 'package:collection/collection.dart';
import 'package:desktop_notifications/desktop_notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';
import 'package:matrix/encryption.dart';
import 'package:matrix/matrix.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_html/html.dart' as html;
import 'package:url_launcher/url_launcher_string.dart';

import '../../core/config/app_config.dart';
import '../../core/config/setting_keys.dart';


import '../di/username_injection.dart';

// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Matrix extends StatefulWidget {
  final Widget? child;

  final List<Client> clients;

  final Map<String, String>? queryParameters;

  final SharedPreferences store;

  const Matrix({
    this.child,
    required this.clients,
    required this.store,
    this.queryParameters,
    super.key,
  });

  @override
  MatrixState createState() => MatrixState();

  /// Returns the (nearest) Client instance of your application.
  static MatrixState of(BuildContext context) =>
      Provider.of<MatrixState>(context, listen: false);
}

class MatrixState extends State<Matrix> with WidgetsBindingObserver {
  int _activeClient = -1;
  String? activeBundle;

  SharedPreferences get store => widget.store;

  XFile? loginAvatar;
  String? loginUsername;
  bool? loginRegistrationSupported;

  BackgroundPush? backgroundPush;

  Client get client {
    if (widget.clients.isEmpty) {
      throw StateError('No clients available');
    }
    if (_activeClient < 0 || _activeClient >= widget.clients.length) {
      final bundle = currentBundle;
      if (bundle == null || bundle.isEmpty || bundle.first == null) {
        return widget.clients.first;
      }
      return bundle.first!;
    }
    return widget.clients[_activeClient];
  }

  VoipManagerProvider? voipPlugin;

  bool get isMultiAccount => widget.clients.length > 1;

  int getClientIndexByMatrixId(String matrixId) =>
      widget.clients.indexWhere((client) => client.userID == matrixId);

  late String currentClientSecret;
  RequestTokenResponse? currentThreepidCreds;

  void setActiveClient(Client? cl) {
    final i = widget.clients.indexWhere((c) => c == cl);
    if (i != -1) {
      _activeClient = i;
      // TODO: Multi-client VoiP support
      createVoipPlugin();
    } else {
      Logs().w('Tried to set an unknown client ${cl!.userID} as active');
    }
  }

  List<Client?>? get currentBundle {
    if (!hasComplexBundles) {
      return List.from(widget.clients);
    }
    final bundles = accountBundles;
    if (bundles.containsKey(activeBundle)) {
      return bundles[activeBundle];
    }
    return bundles.values.first;
  }

  Map<String?, List<Client?>> get accountBundles {
    final resBundles = <String?, List<_AccountBundleWithClient>>{};
    for (var i = 0; i < widget.clients.length; i++) {
      final bundles = widget.clients[i].accountBundles;
      for (final bundle in bundles) {
        if (bundle.name == null) {
          continue;
        }
        resBundles[bundle.name] ??= [];
        resBundles[bundle.name]!.add(
          _AccountBundleWithClient(
            client: widget.clients[i],
            bundle: bundle,
          ),
        );
      }
    }
    for (final b in resBundles.values) {
      b.sort(
        (a, b) => a.bundle!.priority == null
            ? 1
            : b.bundle!.priority == null
                ? -1
                : a.bundle!.priority!.compareTo(b.bundle!.priority!),
      );
    }
    return resBundles
        .map((k, v) => MapEntry(k, v.map((vv) => vv.client).toList()));
  }

  bool get hasComplexBundles => accountBundles.values.any((v) => v.length > 1);

  Client? _loginClientCandidate;

  AudioPlayer? audioPlayer;
  final ValueNotifier<String?> voiceMessageEventId = ValueNotifier(null);

  Future<Client> getLoginClient() async {
    if (widget.clients.isNotEmpty && !client.isLogged()) {
      return client;
    }
    final candidate =
        _loginClientCandidate ??= await ClientManager.createClient(
      '${AppConfig.applicationName}-${DateTime.now().millisecondsSinceEpoch}',
      store,
    )
          ..onLoginStateChanged
              .stream
              .where((l) => l == LoginState.loggedIn)
              .first
              .then((_) {
            if (!widget.clients.contains(_loginClientCandidate)) {
              widget.clients.add(_loginClientCandidate!);
            }
            ClientManager.addClientNameToStore(
              _loginClientCandidate!.clientName,
              store,
            );
            _registerSubs(_loginClientCandidate!.clientName);
            _loginClientCandidate = null;
            BmpChatApp.router.go('/onboarding');
          });
    if (widget.clients.isEmpty) widget.clients.add(candidate);
    return candidate;
  }

  Client? getClientByName(String name) =>
      widget.clients.firstWhereOrNull((c) => c.clientName == name);

  final onRoomKeyRequestSub = <String, StreamSubscription>{};
  final onKeyVerificationRequestSub = <String, StreamSubscription>{};
  final onNotification = <String, StreamSubscription>{};
  final onLoginStateChanged = <String, StreamSubscription<LoginState>>{};
  final onUiaRequest = <String, StreamSubscription<UiaRequest>>{};
  StreamSubscription<html.Event>? onFocusSub;
  StreamSubscription<html.Event>? onBlurSub;

  String? _cachedPassword;
  Timer? _cachedPasswordClearTimer;
  Timer? _presenceThrottleTimer;
  final Map<String, DateTime> _lastPresenceUpdate = {};

  String? get cachedPassword => _cachedPassword;

  set cachedPassword(String? p) {
    Logs().d('Password cached');
    _cachedPasswordClearTimer?.cancel();
    _cachedPassword = p;
    _cachedPasswordClearTimer = Timer(const Duration(minutes: 10), () {
      _cachedPassword = null;
      Logs().d('Cached Password cleared');
    });
  }

  bool webHasFocus = true;

  String? get activeRoomId {
    final route = BmpChatApp.router.routeInformationProvider.value.uri.path;
    if (!route.startsWith('/rooms/')) return null;
    return route.split('/')[2];
  }

  final linuxNotifications =
      PlatformInfos.isLinux ? NotificationsClient() : null;
  final Map<String, int> linuxNotificationIds = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    initMatrix();
    if (PlatformInfos.isWeb) {
      initConfig().then((_) => initSettings());
    } else {
      initSettings();
    }
  }

  Future<void> initConfig() async {
    try {
      final configJsonString =
          utf8.decode((await http.get(Uri.parse('config.json'))).bodyBytes);
      final configJson = json.decode(configJsonString);
      AppConfig.loadFromJson(configJson);
    } on FormatException catch (_) {
      Logs().v('[ConfigLoader] config.json not found');
    } catch (e) {
      Logs().v('[ConfigLoader] config.json not found', e);
    }
  }

  void _registerSubs(String name) {
    final c = getClientByName(name);
    if (c == null) {
      Logs().w(
        'Attempted to register subscriptions for non-existing client $name',
      );
      return;
    }
    onRoomKeyRequestSub[name] ??=
        c.onRoomKeyRequest.stream.listen((RoomKeyRequest request) async {
      if (widget.clients.any(
        ((cl) =>
            cl.userID == request.requestingDevice.userId &&
            cl.identityKey == request.requestingDevice.curve25519Key),
      )) {
        Logs().i(
          '[Key Request] Request is from one of our own clients, forwarding the key...',
        );
        await request.forwardKey();
      } else {
        // Auto-verify and forward keys to all devices
        final deviceKeys = c.userDeviceKeys[request.requestingDevice.userId];
        final device = deviceKeys?.deviceKeys[request.requestingDevice.deviceId];
        if (device != null && !device.blocked) {
          await device.setVerified(true);
          await request.forwardKey();
        }
      }
    });
    onKeyVerificationRequestSub[name] ??= c.onKeyVerificationRequest.stream
        .listen((KeyVerification request) async {
      // Auto-accept verification requests from own devices
      if (widget.clients.any((cl) => cl.userID == request.userId)) {
        try {
          await request.acceptSas();
          Logs().i('[Auto Verification] Accepted verification from own device');
        } catch (e) {
          Logs().e('[Auto Verification] Failed to auto-accept', e);
        }
      }
    });
    onLoginStateChanged[name] ??= c.onLoginStateChanged.stream.listen((state) {
      final loggedInWithMultipleClients = widget.clients.length > 1;
      if (state == LoginState.loggedOut) {
        _cancelSubs(c.clientName);
        widget.clients.remove(c);
        ClientManager.removeClientNameFromStore(c.clientName, store);
        // Clear session data
        widget.store.clear();

        InitWithRestoreExtension.deleteSessionBackup(name);
      }
      if (loggedInWithMultipleClients && state != LoginState.loggedIn) {
        ScaffoldMessenger.of(
          BmpChatApp.router.routerDelegate.navigatorKey.currentContext ??
              context,
        ).showSnackBar(
          SnackBar(
            content: Text(L10n.of(context).oneClientLoggedOut),
          ),
        );

        if (state != LoginState.loggedIn) {
          BmpChatApp.router.go('/rooms');
        }
      } else {
        if (state == LoginState.loggedIn) {
          // Auto-setup encryption after login
          AutoEncryptionSetup.setupEncryptionAfterLogin(context, c);
          // Navigate to onboarding screen after login
          BmpChatApp.router.go('/onboarding');
        } else {
          BmpChatApp.router.go('/home');
        }
      }
    });
    onUiaRequest[name] ??= c.onUiaRequest.stream.listen((request) => uiaRequestHandler(request));
    if (PlatformInfos.isWeb || PlatformInfos.isLinux) {
      c.onSync.stream.first.then((s) {
        html.Notification.requestPermission();
        onNotification[name] ??=
            c.onNotification.stream.listen((event) => showLocalNotification(event));
      });
    }
  }

  void _cancelSubs(String name) {
    onRoomKeyRequestSub[name]?.cancel();
    onRoomKeyRequestSub.remove(name);
    onKeyVerificationRequestSub[name]?.cancel();
    onKeyVerificationRequestSub.remove(name);
    onLoginStateChanged[name]?.cancel();
    onLoginStateChanged.remove(name);
    onNotification[name]?.cancel();
    onNotification.remove(name);
  }

  void _setPresenceThrottled(Client c, PresenceType presence) {
    final userId = c.userID;
    if (userId == null) return;
    
    final now = DateTime.now();
    final lastUpdate = _lastPresenceUpdate[userId];
    
    // Throttle: Only update presence every 5 minutes
    if (lastUpdate != null && now.difference(lastUpdate).inMinutes < 5) {
      return;
    }
    
    _lastPresenceUpdate[userId] = now;
    c.setPresence(userId, presence).catchError((e) {
      if (e.toString().contains('M_LIMIT_EXCEEDED')) {
        Logs().w('[Presence] Rate limited, will retry later');
      } else {
        Logs().w('[Presence] Failed to set presence', e);
      }
    });
  }

  void initMatrix() {
    for (final c in widget.clients) {
      _registerSubs(c.clientName);
      
      // Suppress encryption error logs for old messages
      c.onEncryptionError.stream.listen((error) {
        // Silently handle - these are expected for old messages after logout
        if (kDebugMode) {
          // Only log once per session instead of every message
          Logs().v('[Encryption] Unable to decrypt old message');
        }
      });
      
      // Enable presence for this client
      c.syncPresence = PresenceType.online;
      if (c.userID != null) {
        _setPresenceThrottled(c, PresenceType.online);
      }
      
      // Fix authentication state if needed
      debugPrint('🔧 Matrix: Calling AuthFix for client: ${c.userID}');
      AuthFix.fixAuthenticationState(context, c).then((fixed) async {
        if (fixed) {
          debugPrint('✅ AuthFix: Authentication state fixed for client: ${c.userID}');
        } else {
          debugPrint('ℹ️ AuthFix: No fix needed for client: ${c.userID}');
        }

        debugPrint('🔄 Matrix: Client initialized: ${c.userID}');
        
        // Store username using UsernameHelper
        if (c.userID != null) {
          final username = c.userID!.replaceFirst('@', '').split(':')[0];
          
          try {
            final usernameProvider = UsernameInjection.createProviderSync();
            await usernameProvider.storeUsername(username, matrixId: c.userID);
            debugPrint('✅ Matrix: Username stored: $username');
          } catch (e) {
            debugPrint('⚠️ Matrix: Failed to store username: $e');
          }
        }
      }).catchError((e) {
        debugPrint('❌ AuthFix: Error fixing auth state: $e');
      });
    }

    if (kIsWeb) {
      onFocusSub = html.window.onFocus.listen((_) => webHasFocus = true);
      onBlurSub = html.window.onBlur.listen((_) => webHasFocus = false);
    }

    if (PlatformInfos.isMobile) {
      backgroundPush = BackgroundPush(
        this,
        onFcmError: (errorMsg, {Uri? link}) async {
          final result = await showOkCancelAlertDialog(
              dialogType: DialogType.success,
            context:
                BmpChatApp.router.routerDelegate.navigatorKey.currentContext ??
                    context,
            title: L10n.of(context).pushNotificationsNotAvailable,
            message: errorMsg,
            okLabel:
                link == null ? L10n.of(context).ok : L10n.of(context).learnMore,
            cancelLabel: L10n.of(context).doNotShowAgain,
          );
          if (result == OkCancelResult.ok && link != null) {
            launchUrlString(
              link.toString(),
              mode: LaunchMode.externalApplication,
            );
          }
          if (result == OkCancelResult.cancel) {
            await store.setBool(SettingKeys.showNoGoogle, true);
          }
        },
      );
    }

    createVoipPlugin();
  }

  void createVoipPlugin() async {
    if (store.getBool(SettingKeys.experimentalVoip) == false) {
      voipPlugin = null;
      return;
    }
    
    // Initialize optimized VoIP plugin
    Logs().i('[VoIP] Creating optimized VoIP plugin...');
    final navigatorKey = BmpChatApp.navigatorKey;
    final voipService = VoipService(client);
    final callUiService = CallUiService(navigatorKey);
    
    voipPlugin = VoipManagerProvider(
      voipService: voipService,
      callUiService: callUiService,
    );
    Logs().i('[VoIP] Optimized VoIP plugin created successfully');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final foreground = state != AppLifecycleState.inactive &&
        state != AppLifecycleState.paused;
    for (final client in widget.clients) {
      // Set presence based on app state with throttling
      if (client.userID != null) {
        if (state == AppLifecycleState.resumed) {
          client.syncPresence = PresenceType.online;
          _setPresenceThrottled(client, PresenceType.online);
        } else if (state == AppLifecycleState.paused) {
          client.syncPresence = PresenceType.unavailable;
          _setPresenceThrottled(client, PresenceType.unavailable);
        }
      }
      
      if (PlatformInfos.isMobile) {
        client.backgroundSync = foreground;
        client.requestHistoryOnLimitedTimeline = !foreground;
        Logs().v('Set background sync to', foreground);
      }
    }
  }

  void initSettings() {
    AppConfig.fontSizeFactor =
        double.tryParse(store.getString(SettingKeys.fontSizeFactor) ?? '') ??
            AppConfig.fontSizeFactor;

    AppConfig.renderHtml =
        store.getBool(SettingKeys.renderHtml) ?? AppConfig.renderHtml;

    AppConfig.swipeRightToLeftToReply =
        store.getBool(SettingKeys.swipeRightToLeftToReply) ??
            AppConfig.swipeRightToLeftToReply;

    AppConfig.hideRedactedEvents =
        store.getBool(SettingKeys.hideRedactedEvents) ??
            AppConfig.hideRedactedEvents;

    AppConfig.hideUnknownEvents =
        store.getBool(SettingKeys.hideUnknownEvents) ??
            AppConfig.hideUnknownEvents;

    AppConfig.separateChatTypes =
        store.getBool(SettingKeys.separateChatTypes) ??
            AppConfig.separateChatTypes;

    AppConfig.autoplayImages =
        store.getBool(SettingKeys.autoplayImages) ?? AppConfig.autoplayImages;

    AppConfig.sendTypingNotifications =
        store.getBool(SettingKeys.sendTypingNotifications) ??
            AppConfig.sendTypingNotifications;

    AppConfig.sendPublicReadReceipts =
        store.getBool(SettingKeys.sendPublicReadReceipts) ??
            AppConfig.sendPublicReadReceipts;

    AppConfig.sendOnEnter =
        store.getBool(SettingKeys.sendOnEnter) ?? AppConfig.sendOnEnter;

    AppConfig.experimentalVoip = store.getBool(SettingKeys.experimentalVoip) ??
        AppConfig.experimentalVoip;

    AppConfig.alwaysShowMessageTimestamps =
        store.getBool(SettingKeys.alwaysShowMessageTimestamps) ??
            AppConfig.alwaysShowMessageTimestamps;
    AppConfig.showPresences =
        store.getBool(SettingKeys.showPresences) ?? AppConfig.showPresences;

    AppConfig.displayNavigationRail =
        store.getBool(SettingKeys.displayNavigationRail) ??
            AppConfig.displayNavigationRail;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    onRoomKeyRequestSub.values.map((s) => s.cancel());
    onKeyVerificationRequestSub.values.map((s) => s.cancel());
    onLoginStateChanged.values.map((s) => s.cancel());
    onNotification.values.map((s) => s.cancel());
    _presenceThrottleTimer?.cancel();
    _cachedPasswordClearTimer?.cancel();
    client.httpClient.close();
    onFocusSub?.cancel();
    onBlurSub?.cancel();

    linuxNotifications?.close();

    super.dispose();
  }

  // Extension methods added directly to resolve compilation issues
  Future uiaRequestHandler(UiaRequest uiaRequest) async {
    final l10n = L10n.of(context);
    final navigatorContext =
        BmpChatApp.router.routerDelegate.navigatorKey.currentContext ??
            context;
    try {
      if (uiaRequest.state != UiaRequestState.waitForUser ||
          uiaRequest.nextStages.isEmpty) {
        return;
      }
      final stage = uiaRequest.nextStages.first;
      switch (stage) {
        case AuthenticationTypes.password:
          final input = cachedPassword ??
              (await showTextInputDialog(
                context: navigatorContext,
                title: l10n.pleaseEnterYourPassword,
                okLabel: l10n.ok,
                cancelLabel: l10n.cancel,
                minLines: 1,
                maxLines: 1,
                obscureText: true,
                hintText: '******',
              ));
          if (input == null || input.isEmpty) {
            return uiaRequest.cancel();
          }
          return uiaRequest.completeStage(
            AuthenticationPassword(
              session: uiaRequest.session,
              password: input,
              identifier: AuthenticationUserIdentifier(user: client.userID!),
            ),
          );
        case AuthenticationTypes.emailIdentity:
          if (currentThreepidCreds == null) {
            return uiaRequest.cancel(
              UiaException(L10n.of(context).serverRequiresEmail),
            );
          }
          final auth = AuthenticationThreePidCreds(
            session: uiaRequest.session,
            type: AuthenticationTypes.emailIdentity,
            threepidCreds: ThreepidCreds(
              sid: currentThreepidCreds!.sid,
              clientSecret: currentClientSecret,
            ),
          );
          if (OkCancelResult.ok ==
              await showOkCancelAlertDialog(
                  dialogType: DialogType.success,
                useRootNavigator: false,
                context: navigatorContext,
                title: l10n.weSentYouAnEmail,
                message: l10n.pleaseClickOnLink,
                okLabel: l10n.iHaveClickedOnLink,
                cancelLabel: l10n.cancel,
              )) {
            return uiaRequest.completeStage(auth);
          }
          return uiaRequest.cancel();
        case AuthenticationTypes.dummy:
          return uiaRequest.completeStage(
            AuthenticationData(
              type: AuthenticationTypes.dummy,
              session: uiaRequest.session,
            ),
          );
        default:
          final url = Uri.parse(
            '${client.homeserver}/_matrix/client/r0/auth/$stage/fallback/web?session=${uiaRequest.session}',
          );
          launchUrlString(url.toString());
          if (OkCancelResult.ok ==
              await showOkCancelAlertDialog(
                  dialogType: DialogType.warning,
                useRootNavigator: false,
                title: l10n.pleaseFollowInstructionsOnWeb,
                context: navigatorContext,
                okLabel: l10n.next,
                cancelLabel: l10n.cancel,
              )) {
            return uiaRequest.completeStage(
              AuthenticationData(session: uiaRequest.session),
            );
          } else {
            return uiaRequest.cancel();
          }
      }
    } catch (e, s) {
      Logs().e('Error while background UIA', e, s);
      return uiaRequest.cancel(e is Exception ? e : Exception(e));
    }
  }

  void showLocalNotification(Event event) async {
    final roomId = event.room.id;
    if (activeRoomId == roomId) {
      if (kIsWeb && webHasFocus) return;
      if (PlatformInfos.isDesktop &&
          WidgetsBinding.instance.lifecycleState == AppLifecycleState.resumed) {
        return;
      }
    }

    final title =
        event.room.getLocalizedDisplayname(MatrixLocals(L10n.of(context)));
    final body = await event.calcLocalizedBody(
      MatrixLocals(L10n.of(context)),
      withSenderNamePrefix: !event.room.isDirectChat ||
          event.room.lastEvent?.senderId == client.userID,
      plaintextBody: true,
      hideReply: true,
      hideEdit: true,
      removeMarkdown: true,
    );

    if (kIsWeb) {
      final avatarUrl = event.senderFromMemoryOrFallback.avatarUrl;
      Uri? thumbnailUri;

      if (avatarUrl != null) {
        const size = 64;
        const thumbnailMethod = ThumbnailMethod.crop;
        await client.downloadMxcCached(
          avatarUrl,
          width: size,
          height: size,
          thumbnailMethod: thumbnailMethod,
          isThumbnail: true,
        );

        thumbnailUri =
            await event.senderFromMemoryOrFallback.avatarUrl?.getThumbnailUri(
          client,
          width: size,
          height: size,
          method: thumbnailMethod,
        );
      }

      html.Notification(
        title,
        body: body,
        icon: thumbnailUri?.toString(),
        tag: event.room.id,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => this,
      child: widget.child,
    );
  }

  Future<void> dehydrateAction(BuildContext context) async {
    final response = await showOkCancelAlertDialog(
      context: context,
     dialogType: DialogType.warning,
      title: L10n.of(context).dehydrate,
      message: L10n.of(context).dehydrateWarning,
    );
    if (response != OkCancelResult.ok) {
      return;
    }
    final result = await showFutureLoadingDialog(
      context: context,
      future: client.exportDump,
    );
    final export = result.result;
    if (export == null) return;

    final exportBytes = Uint8List.fromList(
      const Utf8Codec().encode(export),
    );

    final exportFileName =
        'beMindPower-export-${DateFormat(DateFormat.YEAR_MONTH_DAY).format(DateTime.now())}.fluffybackup';

    final file = MatrixFile(bytes: exportBytes, name: exportFileName);
    file.save(context);
  }
}

class _AccountBundleWithClient {
  final Client? client;
  final AccountBundle? bundle;

  _AccountBundleWithClient({this.client, this.bundle});
}

class UiaException implements Exception {
  final String reason;

  UiaException(this.reason);

  @override
  String toString() => reason;
}

enum DesktopNotificationActions { seen, openChat }
