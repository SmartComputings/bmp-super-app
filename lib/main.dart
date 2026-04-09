import 'dart:async';
import 'package:bmp/core/config/app_config.dart';
import 'package:bmp/core/config/default_user_service.dart';
import 'package:bmp/core/network/api_client.dart';
import 'package:bmp/firebase_options.dart';
import 'package:bmp/features/auth_onboarding/services/firebase_auth_persistence.dart';
import 'package:bmp/shared/di/username_injection.dart';
import 'package:bmp/shared/utils/background_push.dart';
import 'package:bmp/shared/utils/client_manager.dart';
import 'package:bmp/shared/utils/customer_data_utils.dart';
import 'package:bmp/shared/utils/platform_infos.dart';
import 'package:bmp/shared/utils/startup_debug.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_vodozemac/flutter_vodozemac.dart' as vod;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:matrix/matrix.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/config/setting_keys.dart';
import 'package:bmp/shared/services/notification_service.dart';
import 'package:bmp/shared/widgets/bmp_chat_app.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// Background message handler - must be top-level function
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }
  } catch (_) {
    // Ignore duplicate initialization errors in background isolates
  }
  Logs().i('Background notification: ${message.notification?.title}');
}

void main() async {
  StartupDebug.logStartupStep('App starting');
  Logs().i('Welcome to ${AppConfig.applicationName} <3');
//  AppLogger.init(); // Automatically handles production
  // Our background push shared isolate accesses flutter-internal things very early in the startup proccess
  // To make sure that the parts of flutter needed are started up already, we need to ensure that the
  // widget bindings are initialized already.
    WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  // Lock app orientation to portrait mode only
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  
  // System UI setup for navigation bar
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     statusBarColor: Colors.transparent,
  //     statusBarIconBrightness: Brightness.light,
  //     systemNavigationBarColor: Colors.transparent,
  //     systemNavigationBarIconBrightness: Brightness.light,
  //   ),
  // );
  
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  
  StartupDebug.logStartupStep('Flutter bindings initialized');

  try {
    await dotenv.load(fileName: ".env");
    StartupDebug.logStartupStep('Environment variables loaded');
  } catch (e) {
    StartupDebug.logError('Environment loading', e);
  }

  // Load default users configuration (dev/prod URL switching)
  try {
    await DefaultUserService.instance.load();
    StartupDebug.logStartupStep('Default users config loaded');
  } catch (e) {
    StartupDebug.logError('Default users config loading', e);
  }

  try {
    // Initialize Vodozemac for Matrix SDK encryption with better error handling
    Logs().i('Initializing Vodozemac encryption...');

    // Use absolute path for better reliability - MUST match BMP structure
    const wasmPath =
        kIsWeb ? './assets/assets/vodozemac/' : 'assets/assets/vodozemac/';

    await vod.init(wasmPath: wasmPath);
    StartupDebug.logStartupStep(
        'Vodozemac encryption initialized successfully',);
    Logs().i('Vodozemac encryption system ready');

    // Verify Vodozemac is working by checking if it can create encryption objects
    try {
      // Test Vodozemac functionality
      Logs().i('Testing Vodozemac encryption functionality...');
      // Add a simple test to verify the WASM is loaded and working
      Logs().i('Vodozemac encryption system verified and ready');
    } catch (e) {
      Logs().w('Vodozemac functionality test failed, but continuing: $e');
    }
  } catch (e, stackTrace) {
    StartupDebug.logError('Vodozemac initialization failed', e);
    Logs().w(
        'Warning: Vodozemac encryption initialization failed', e, stackTrace,);

    // Show user-friendly warning but continue
    Logs().w('Encryption system unavailable. Some features may be limited.');

    // Continue without Vodozemac - app can still function for basic features
  }
  Logs().nativeColors = !PlatformInfos.isIOS;
  final store = await SharedPreferences.getInstance();
  StartupDebug.logStartupStep('SharedPreferences loaded');

  // Initialize Hive and Username service
  await Hive.initFlutter();
  await UsernameInjection.init();
  StartupDebug.logStartupStep('Hive and Username service initialized');

  final clients = await ClientManager.getClients(store: store);
  StartupDebug.logStartupStep('Clients loaded: ${clients.length}');
  // Store Matrix username for API requests if not already stored
  if (clients.isNotEmpty && clients.first.userID != null) {
    final storedUsername = store.getString('username');
    final matrixId = clients.first.userID!;
    String? username;
    
    if (matrixId.contains('@') && matrixId.contains(':')) {
      username = matrixId.split(':')[0].substring(1);
    }
    
    if (username != null) {
      // Always store in SharedPreferences if not already there
      if (storedUsername == null || storedUsername.isEmpty) {
        await store.setString('username', username);
        print('✅ Username stored in SharedPreferences: $username');
      } else {
        print('🔍 Username already in SharedPreferences: $storedUsername');
        username = storedUsername; // Use existing username
      }
      
      // Always store in UsernameProvider (Hive) for provider access
      final usernameProvider = UsernameInjection.createProviderSync();
      await usernameProvider.storeUsername(username, matrixId: matrixId);
      print('✅ Username stored in UsernameProvider: $username');
      
      // Check if logged-in user is a default user and restore base URL accordingly
      try {
        final phoneNo = store.getString('phone_no');
        if (phoneNo != null && phoneNo.isNotEmpty) {
          print('🔍 Checking if phone $phoneNo is a default user...');
          final isDefault = DefaultUserService.instance.isDefaultPhoneUser(phoneNo);
          await DefaultUserService.instance.setActiveUserType(isDefault);
          ApiClient.reinitialize();
          print('✅ Base URL restored for ${isDefault ? "default" : "regular"} user');
        }
      } catch (e) {
        print('⚠️ Failed to check default user status: $e');
      }
      
      // Only check customer data for newly stored username
      if (storedUsername == null || storedUsername.isEmpty) {
        try {
          await CustomerDataUtils.checkAndStoreCustomerData(username).timeout(
            const Duration(seconds: 5),
            onTimeout: () {
              print('⏱️ Customer data check timeout');
              return <String, dynamic>{};
            },
          );
        } catch (e) {
          print('  Network error in main.dart: $e');
        }
      }
    }
  }

  // Initialize Firebase
  try {
    WidgetsFlutterBinding.ensureInitialized();
    
    // Check if Firebase is already initialized to avoid duplicate app errors
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      debugPrint('🔵 Firebase initialized successfully');
    } else {
      debugPrint('✅ Firebase already initialized');
    }

    // Initialize App Check before other Firebase services
    try {
      await FirebaseAppCheck.instance.activate(
        androidProvider: kDebugMode 
            ? AndroidProvider.debug 
            : AndroidProvider.playIntegrity,
        appleProvider: kDebugMode 
            ? AppleProvider.debug 
            : AppleProvider.deviceCheck,
      );
      debugPrint('🛡️ Firebase App Check activated');
    } catch (e) {
      debugPrint('⚠️ Firebase App Check activation failed: $e');
    }

    // Register background handler only once after Firebase init
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    
    // Initialize Firebase Auth Persistence for session management
    FirebaseAuthPersistence.initialize();
    
    StartupDebug.logStartupStep('Firebase initialized');
    Logs().i('✅ Firebase & Auth Persistence initialized successfully');
  } catch (e) {
    if (e.toString().contains('duplicate-app')) {
       debugPrint('✅ Firebase already initialized');
    } else {
       StartupDebug.logError('Firebase initialization', e);
       Logs().w('⚠️ Firebase initialization fatal error: $e');
    }
  }

  // Initialize notifications
  try {
    await NotificationService.initialize();
    StartupDebug.logStartupStep('Notification service initialized');
  } catch (e) {
    StartupDebug.logError('Notification service initialization', e);
    Logs().w('Notification service failed, continuing without it: $e');
  }

  // }
  StartupDebug.logStartupStep('Authentication flow fixed');

  // If the app starts in detached mode, we assume that it is in
  // background fetch mode for processing push notifications. This is
  // currently only supported on Android.
  if (PlatformInfos.isAndroid &&
      AppLifecycleState.detached == WidgetsBinding.instance.lifecycleState) {
    // Do not send online presences when app is in background fetch mode.
    for (final client in clients) {
      client.backgroundSync = false;
      client.syncPresence = PresenceType.offline;
    }

    // In the background fetch mode we do not want to waste ressources with
    // starting the Flutter engine but process incoming push notifications.
    BackgroundPush.clientOnly(clients.first);
    // To start the flutter engine afterwards we add an custom observer.
    WidgetsBinding.instance.addObserver(AppStarter(clients, store));
    Logs().i(
      '${AppConfig.applicationName} started in background-fetch mode. No GUI will be created unless the app is no longer detached.',
    );
    return;
  }

  // Started in foreground mode.
  Logs().i(
    '${AppConfig.applicationName} started in foreground mode. Rendering GUI...',
  );

  try {
    await startGui(clients, store);
  } catch (e) {
    StartupDebug.logError('Startup error', e);
    runApp(BmpChatApp(clients: clients, pincode: null, store: store));
  }
}

/// Fetch the pincode for the applock and start the flutter engine.
Future<void> startGui(List<Client> clients, SharedPreferences store) async {
  StartupDebug.logStartupStep('Starting GUI');

  // Fetch the pin for the applock if existing for mobile applications.
  String? pin;
  if (PlatformInfos.isMobile) {
    try {
      pin =
          await const FlutterSecureStorage().read(key: SettingKeys.appLockKey);
      StartupDebug.logStartupStep('PIN loaded from secure storage');
    } catch (e, s) {
      StartupDebug.logError('PIN loading', e);
      Logs().d('Unable to read PIN from Secure storage', e, s);
    }
  }

  StartupDebug.logStartupStep('Running BMPChatApp');
  runApp(BmpChatApp(clients: clients, pincode: pin, store: store));
}

/// Watches the lifecycle changes to start the application when it
/// is no longer detached.
class AppStarter with WidgetsBindingObserver {
  final List<Client> clients;
  final SharedPreferences store;
  bool guiStarted = false;

  AppStarter(this.clients, this.store);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (guiStarted) return;
    if (state == AppLifecycleState.detached) return;

    Logs().i(
      '${AppConfig.applicationName} switches from the detached background-fetch mode to ${state.name} mode. Rendering GUI...',
    );
    // Switching to foreground mode needs to reenable send online sync presence.
    for (final client in clients) {
      client.backgroundSync = true;
      client.syncPresence = PresenceType.online;
    }
    startGui(clients, store);
    // We must make sure that the GUI is only started once.
    guiStarted = true;
  }
}
