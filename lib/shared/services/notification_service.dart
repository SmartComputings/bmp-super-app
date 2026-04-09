import 'dart:convert';
import 'dart:io' show Platform;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:bmp/core/logs/app_logger.dart';
import 'package:bmp/core/config/app_config.dart';

// Background message handler
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  AppLogger.info('Background message: ${message.notification?.title}');
}

class NotificationService {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _localNotifications = FlutterLocalNotificationsPlugin();
  static GlobalKey<NavigatorState>? _navigatorKey;
  
  /// Stores the initial message if it arrives before the navigator key is ready.
  static RemoteMessage? _pendingInitialMessage;

  static Future<void> initialize() async {
    print('[NotificationService] initialize() started');
    
    // Initialize local notifications WITH tap callback
    await _localNotifications.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
        ),
      ),
      onDidReceiveNotificationResponse: _onLocalNotificationTapped,
    );

    // Create notification channel for Android
    if (Platform.isAndroid) {
      final androidPlugin = _localNotifications
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
      
      await androidPlugin?.createNotificationChannel(
        const AndroidNotificationChannel(
          AppConfig.pushNotificationsChannelId,
          'Push Notifications',
          description: 'Notifications for app events',
          importance: Importance.max, // Max importance for heads-up banners
          enableVibration: true,
          playSound: true,
          showBadge: true,
        ),
      );
    }

    // Set foreground notification options for iOS/MacOS
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // Request permission (FCM)
    final settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );
    print('[NotificationService] Permission status: ${settings.authorizationStatus}');

    // Get FCM token (on iOS, wait for APNS token first)
    String? token;
    if (Platform.isIOS) {
      String? apnsToken;
      for (int i = 0; i < 20; i++) {
        apnsToken = await _messaging.getAPNSToken();
        if (apnsToken != null) break;
        await Future.delayed(const Duration(milliseconds: 500));
      }
      if (apnsToken != null) {
        token = await _messaging.getToken();
      }
    } else {
      token = await _messaging.getToken();
    }
    print('[NotificationService] FCM Token: $token');
    AppLogger.info('FCM Token: $token');

    // Listen to foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      AppLogger.info('Foreground message: ${message.notification?.title}');
      _showLocalNotification(message);
    });

    // Handle notification tap when app is in background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      AppLogger.info('Background notification tapped: ${message.notification?.title}');
      _tryNavigate(message.data);
    });

    // Handle notification when app is terminated (cold start)
    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      AppLogger.info('App opened from terminated state: ${initialMessage.notification?.title}');
      _pendingInitialMessage = initialMessage;
      _tryNavigate(initialMessage.data);
    }
    
    print('[NotificationService] initialize() completed');
  }

  /// Called when the user taps a local notification (foreground notifications).
  static void _onLocalNotificationTapped(NotificationResponse response) {
    if (response.payload == null || response.payload!.isEmpty) return;

    try {
      final data = Map<String, dynamic>.from(jsonDecode(response.payload!));
      _tryNavigate(data);
    } catch (e) {
      AppLogger.error('Failed to parse local notification payload: $e');
    }
  }

  /// Attempts to navigate. If navigator key isn't ready yet, the data is stored
  /// and will be retried when [setupClickHandlers] is called.
  static void _tryNavigate(Map<String, dynamic> data) {
    if (_navigatorKey != null && _navigatorKey!.currentState != null) {
      _handleNotificationClick(data, _navigatorKey!);
    } else {
      print('[NotificationService] Navigator not ready yet');
    }
  }

  static Future<void> _showLocalNotification(RemoteMessage message) async {
    const androidDetails = AndroidNotificationDetails(
      AppConfig.pushNotificationsChannelId,
      'Push Notifications',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      icon: '@mipmap/ic_launcher',
    );
    
    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    
    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    final payload = jsonEncode(message.data);

    await _localNotifications.show(
      message.hashCode,
      message.notification?.title ?? 'New Message',
      message.notification?.body ?? 'You have a new message',
      details,
      payload: payload,
    );
  }

  static void setupClickHandlers(GlobalKey<NavigatorState> navigatorKey) {
    _navigatorKey = navigatorKey;

    if (_pendingInitialMessage != null) {
      Future.delayed(const Duration(milliseconds: 500), () {
        if (_pendingInitialMessage != null) {
          _handleNotificationClick(_pendingInitialMessage!.data, navigatorKey);
          _pendingInitialMessage = null;
        }
      });
    }
  }

  static void _handleNotificationClick(Map<String, dynamic> data, GlobalKey<NavigatorState> navigatorKey) {
    final action = data['action'];
    final screen = data['screen'];
    
    AppLogger.info('Handling Notification Action: $action, Screen: $screen');

    if (navigatorKey.currentState == null) {
        AppLogger.error('Navigator State is null');
        return;
    }

    switch (action) {
      case 'OPEN_PROFILE':
        _navigateToProfile(data, navigatorKey);
        break;
      case 'OPEN_HOME':
        _navigateToHome(navigatorKey);
        break;
      default:
        if (screen != null && screen.toString().isNotEmpty) {
          _navigateTo(navigatorKey, screen.toString(), extra: data);
        } else {
          AppLogger.warning('Unknown notification action: $action');
          _navigateToHome(navigatorKey);
        }
    }
  }

  static void _navigateToProfile(Map<String, dynamic> data, GlobalKey<NavigatorState> navigatorKey) {
     _navigateTo(navigatorKey, '/mainMenuScreen/wallet/manage-account');
  }

  static void _navigateToHome(GlobalKey<NavigatorState> navigatorKey) {
     _navigateTo(navigatorKey, '/mainMenuScreen');
  }

  static void _navigateTo(GlobalKey<NavigatorState> navigatorKey, String path, {Object? extra}) {
    final context = navigatorKey.currentContext;
    if (context != null) {
      GoRouter.of(context).push(path, extra: extra);
    } else {
      AppLogger.error('Navigation context is null, cannot navigate to $path');
    }
  }
}
