import 'package:bmp/core/config/app_config.dart';
import 'package:bmp/core/config/themes.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/auth_onboarding/providers/intro_video_provider.dart';
import 'package:bmp/features/chat/story_section/providers/chat/story_service.dart';
import 'package:bmp/shared/di/username_injection.dart';
import 'package:bmp/shared/di/subscription_injection.dart';
import 'package:bmp/shared/di/check_username_injection.dart';
import 'package:bmp/shared/providers/language_provider.dart';
import 'package:bmp/shared/providers/zone_color_provider.dart';
import 'package:bmp/shared/routes/routes.dart';
import 'package:bmp/shared/utils/custom_scroll_behaviour.dart';
import 'package:bmp/shared/utils/startup_debug.dart';
import 'package:bmp/shared/widgets/app_exit_dialogue.dart';
import 'package:bmp/shared/widgets/app_lock.dart';
import 'package:bmp/shared/widgets/theme_builder.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matrix/matrix.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upgrader/upgrader.dart';
import 'package:bmp/shared/services/notification_service.dart';
import 'package:bmp/shared/di/subscription_injection.dart';
// Logs import removed

import 'matrix.dart';

class BmpChatApp extends StatefulWidget {
  final Widget? testWidget;
  final List<Client> clients;
  final String? pincode;
  final SharedPreferences store;

  const BmpChatApp({
    super.key,
    this.testWidget,
    required this.clients,
    required this.store,
    this.pincode,
  });

  @override
  State<BmpChatApp> createState() => _BmpChatAppState();

  static GoRouter get router => _BmpChatAppState.router;
  static GlobalKey<NavigatorState> get navigatorKey =>
      _BmpChatAppState.navigatorKey;
}

class _BmpChatAppState extends State<BmpChatApp> {
  bool _showSplash = true;
  late final Upgrader _upgrader;

  @override
  void initState() {
    super.initState();
    _upgrader = Upgrader(
      debugLogging: false,
      debugDisplayAlways: false,
      minAppVersion: '2.0.0',
    );
    _hideSplashScreen();
    _initializeServices();
     // Initialize notification click handlers with the navigator key
    NotificationService.setupClickHandlers(navigatorKey);
  }

  Future<bool> _isUserLoggedIn() async {
    try {
      // Check if any client is logged in
      if (widget.clients.isNotEmpty) {
        return widget.clients.any((client) => client.isLogged());
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  void _initializeServices() {
    SubscriptionInjection.init();
  }



  void _hideSplashScreen() async {
    // await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      setState(() {
        _showSplash = false;
      });
    }
  }

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static GoRouter get router => _BmpChatAppState._router;
  static final GoRouter _router = GoRouter(
    navigatorKey: navigatorKey,
    routes: AppRoutes.routes,
    debugLogDiagnostics: false,
    errorBuilder: (context, state) {
      StartupDebug.logError('Router error', state.error);
      // Redirect to home for login-related errors
      if (state.uri.path.contains('login')) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _router.go('/home');
        });
      }
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              const Text('Navigation Error'),
              const SizedBox(height: 8),
              Text('Path: ${state.uri.path}'),
            ],
          ),
        ),
      );
    },
  );

  /// getInitialLink may rereturn the value multiple times if this view is
  /// opened multiple times for example if the user logs out after they logged
  /// in with qr code or magic link.
  static bool gotInitialLink = false;

  @override
  Widget build(BuildContext context) {
    StartupDebug.logStartupStep('Building BMP');

    // if (_showSplash) {
    //   return const MaterialApp(
    //     home: WelcomeScreen(),
    //     debugShowCheckedModeBanner: false,
    //   );
    // }

    return ChangeNotifierProvider(
      create: (_) => LanguageProvider(),
      child: ThemeBuilder(
        builder: (context, themeMode, primaryColor) {
          StartupDebug.logStartupStep('ThemeBuilder building');
          print('Building MaterialApp with themeMode BMP Chat App: $themeMode');
          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) async {
              if (didPop) return;

              final keyboardVisible =
                  MediaQuery.of(context).viewInsets.bottom > 0;
              if (keyboardVisible) {
                FocusManager.instance.primaryFocus?.unfocus();
                return;
              }

              // Check current route to see if we're at root level
              final currentLocation =
                  _router.routerDelegate.currentConfiguration.uri.path;
              final isAtRoot = currentLocation == '/home' ||
                  currentLocation == '/rooms' ||
                  currentLocation == '/onboarding' ||
                  currentLocation == '/';
              print('Current location: $currentLocation, isAtRoot: $isAtRoot');
              if (!isAtRoot) {
                final navigator =
                    _router.routerDelegate.navigatorKey.currentState;
                if (navigator != null && navigator.canPop()) {
                  navigator.pop();
                  return;
                }
              }
              // At root level - show exit dialogue
              await AppExitDialogue.show(context);
            },
            child: Consumer<LanguageProvider>(
              builder: (context, languageProvider, child) {
                return MaterialApp.router(
                  title: AppConfig.applicationName,
                  debugShowCheckedModeBanner: false,
                  restorationScopeId: 'app',
                  themeMode: themeMode,
                  theme: FluffyThemes.buildTheme(
                    context,
                    Brightness.light,
                    primaryColor,
                  ),
                  darkTheme: FluffyThemes.buildTheme(
                    context,
                    Brightness.dark,
                    primaryColor,
                  ),
                  scrollBehavior: CustomScrollBehavior(),
                  localizationsDelegates: L10n.localizationsDelegates,
                  supportedLocales: L10n.supportedLocales,
                  locale: languageProvider.currentLocale,
                  routerConfig: _router,
                  builder: (context, child) {
                    StartupDebug.logStartupStep(
                      'MaterialApp.router builder called',
                    );

                    return AppLockWidget(
                      pincode: widget.pincode,
                      clients: widget.clients,
                      child: MultiProvider(
                        providers: [
                          ChangeNotifierProvider(
                            create: (_) => UsernameInjection.createProviderSync(),
                          ),
                          ChangeNotifierProvider(
                            create: (_) => SubscriptionInjection.createProviderSync(),
                          ),
                          ChangeNotifierProvider(
                            create: (_) => CheckUsernameInjection.createProviderSync(),
                          ),
                          ChangeNotifierProvider(
                            create: (_) => IntroVideoProvider(),
                          ),
                          ChangeNotifierProvider(
                            create: (_) => ZoneColorProvider(),
                          ),
                        ],
                        child: Matrix(
                          clients: widget.clients,
                          store: widget.store,
                          child: ChangeNotifierProvider<StoryService>(
                            create: (context) {
                              final matrix = Matrix.of(context);
                              return StoryService(matrix.client);
                            },
                            child: UpgradeAlert(
                              upgrader: _upgrader,
                              child: widget.testWidget ?? child,
                            ),
                        ),
                      ),)
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
