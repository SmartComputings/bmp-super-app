import 'dart:async';

import 'package:bmp/core/config/themes.dart';
import 'package:bmp/features/auth_onboarding/forgot_password/forgot_password.dart';
import 'package:bmp/features/auth_onboarding/signup/account_type_selection_screen.dart';
import 'package:bmp/features/auth_onboarding/signup/signup.dart';
import 'package:bmp/features/chat/archive/archive.dart';
import 'package:bmp/features/chat/blocked_users_list.dart';
import 'package:bmp/features/chat/chat/chat.dart';
import 'package:bmp/features/chat/chat_access_settings/chat_access_settings_controller.dart';
import 'package:bmp/features/chat/chat_details/chat_details.dart';
import 'package:bmp/features/chat/chat_encryption_settings/chat_encryption_settings.dart';
import 'package:bmp/features/chat/chat_list/chat_bottom_nav_bar.dart';
import 'package:bmp/features/chat/chat_list/chat_list.dart';
import 'package:bmp/features/chat/chat_members/chat_members.dart';
import 'package:bmp/features/chat/chat_permissions_settings/chat_permissions_settings.dart';
import 'package:bmp/features/chat/chat_search/chat_search_page.dart';
import 'package:bmp/features/chat/device_settings/device_settings.dart';
import 'package:bmp/features/chat/dialer/widgets/call_history/calls_history_screen.dart';
import 'package:bmp/features/chat/email_verification/email_verification.dart';
import 'package:bmp/features/chat/invitation_selection/invitation_selection.dart';
import 'package:bmp/features/chat/main_menu/main_menu_screen.dart';
import 'package:bmp/features/chat/manage_account_page.dart';
import 'package:bmp/features/chat/new_group/new_group.dart';
import 'package:bmp/features/chat/new_private_chat/new_private_chat.dart';
import 'package:bmp/features/chat/registration_complete/registration_complete.dart';
import 'package:bmp/features/chat/settings/settings.dart';
import 'package:bmp/features/chat/settings_3pid/settings_3pid.dart';
import 'package:bmp/features/chat/settings_chat/settings_chat.dart';
import 'package:bmp/features/chat/settings_emotes/settings_emotes.dart';
import 'package:bmp/features/chat/settings_homeserver/settings_homeserver.dart';
import 'package:bmp/features/chat/settings_ignore_list/settings_ignore_list.dart';
import 'package:bmp/features/chat/settings_multiple_emotes/settings_multiple_emotes.dart';
import 'package:bmp/features/chat/settings_notifications/settings_notifications.dart';
import 'package:bmp/features/chat/settings_password/settings_password.dart';
import 'package:bmp/features/chat/settings_security/settings_security.dart';
import 'package:bmp/features/chat/settings_style/settings_style.dart';
import 'package:bmp/features/chat/story_section/models/chat/story_model.dart';
import 'package:bmp/features/chat/story_section/story_creation_page.dart';
import 'package:bmp/features/chat/story_section/story_details_page.dart';
import 'package:bmp/features/chat/story_section/story_viewer_page.dart';
import 'package:bmp/shared/domain/entities/subscription/feature_types.dart';
import 'package:bmp/shared/utils/app_loading_widget.dart';
import 'package:bmp/shared/utils/empty_state/pages/done_screen.dart';
import 'package:bmp/shared/widgets/config_viewer.dart';
import 'package:bmp/shared/widgets/layouts/empty_page.dart';
import 'package:bmp/shared/widgets/layouts/two_column_layout.dart';
import 'package:bmp/shared/widgets/log_view.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:bmp/features/support/presentation/pages/support_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matrix/matrix.dart';

// import '../../features/auth_onboarding/onBoardingScreens/Screens/WelecomeScreens/welcome_screen.dart';
import '../../features/auth_onboarding/app_update_required_screen.dart';
import '../../features/auth_onboarding/login_welcome/login_welcome_screen.dart';
import '../../features/auth_onboarding/onBoardingScreens/Screens/IntroVideoScreen.dart';
import '../../features/auth_onboarding/onBoardingScreens/Screens/OnBoardingScreen/onboarding_screen.dart';
import '../../features/auth_onboarding/onBoardingScreens/Screens/SplashScreen.dart';
import '../../features/auth_onboarding/onBoardingScreens/Screens/coming_soon_screen.dart';
import '../../features/auth_onboarding/onBoardingScreens/phone_auth_flow/enter_phone_number.dart';
import '../../features/chat/settings_blocket_user_list/settings_block_user_list.dart';
abstract class AppRoutes {
  static FutureOr<String?> loggedInRedirect(
    BuildContext context,
    GoRouterState state,
  ) {
    try {
      return Matrix.of(context)
              .widget
              .clients
              .any((client) => client.isLogged())
          ? '/onboarding'
          : null;
    } catch (e) {
      Logs().w('Error in loggedInRedirect, defaulting to null', e);
      return null;
    }
  }

  static FutureOr<String?> loggedOutRedirect(
    BuildContext context,
    GoRouterState state,
  ) {
    try {
      // Try to get MatrixState, but handle provider not found gracefully
      MatrixState? matrixState;
      try {
        matrixState = Matrix.of(context);
      } catch (e) {
        // Provider not available, redirect to home
        return '/welcome';
      }

      final hasLoggedInClient =
          matrixState.widget.clients.any((client) => client.isLogged());

      if (hasLoggedInClient) {
        return null; // User is logged in, allow access
      } else {
        // User is not logged in, redirect to home/login
        if (state.fullPath == '/enter_phone' ||
            state.fullPath == '/welcome') {
          return null; // Already on login or welcome page
        }
        return '/welcome'; // Redirect to welcome page
      }
    } catch (e) {
      Logs().w('Error in loggedOutRedirect, defaulting to /home', e);
      return '/home';
    }
  }

  AppRoutes();

  static final List<RouteBase> routes = [
    GoRoute(
      path: '/',
      redirect: (context, state) => '/IntroVideo',
    ),
    GoRoute(
      path: '/IntroVideo',
      pageBuilder: (context, state) => defaultPageBuilder(
        context,
        state,
        const IntroVideoScreen(),
      ),
    ),
    GoRoute(
      path: '/SplashScreen',
      pageBuilder: (context, state) => defaultPageBuilder(
        context,
        state,
        const SplashScreen(),
      ),
    ),
    GoRoute(
      path: '/welcome',
      pageBuilder: (context, state) => defaultPageBuilder(
        context,
        state,
        const LoginWelcomeScreen(),
      ),
    ),
    GoRoute(
      path: '/app-update-required',
      pageBuilder: (context, state) => defaultPageBuilder(
        context,
        state,
        const AppUpdateRequiredScreen(),
      ),
    ),
    GoRoute(
      path: '/enter_phone',
      pageBuilder: (context, state) {
        final isLogin = state.uri.queryParameters['isLogin'] == 'true';
        return defaultPageBuilder(
          context,
          state,
          EnterPhoneNumberScreen(isLogin: isLogin),
        );
      },
    ),
    GoRoute(
      path: '/mainMenuScreen',
      pageBuilder: (context, state) => defaultPageBuilder(
        context,
        state,
        const MainMenuScreen(),
      ),
      routes: [
        GoRoute(
          path: 'support',
          pageBuilder: (context, state) => defaultPageBuilder(
            context,
            state,
            const SupportPage(),
          ),
        ),
        GoRoute(
          path: '/settings',
          redirect: loggedOutRedirect,
          pageBuilder: (context, state) => defaultPageBuilder(
            context,
            state,
            const Settings(),
          ),
        ),
        GoRoute(
          path: '/coming-soon',
          pageBuilder: (context, state) => defaultPageBuilder(
            context,
            state,
            ComingSoonScreen(
              featureName: (state.extra as Map<String, dynamic>?)?['feature'],
            ),
          ),
        ),
        GoRoute(
          path: 'wallet',
          pageBuilder: (context, state) => defaultPageBuilder(
            context,
            state,
            const ComingSoonScreen(featureName: 'Wallet'),
          ),
          redirect: loggedOutRedirect,
        ),
        ShellRoute(
          pageBuilder: (context, state, child) => noTransitionPageBuilder(
            context,
            state,
            FluffyThemes.isColumnMode(context) &&
                    state.fullPath
                            ?.startsWith('/mainMenuScreen/rooms/settings') ==
                        false
                ? TwoColumnLayout(
                    mainView: ChatList(
                      activeChat: state.pathParameters['roomid'],
                      displayNavigationRail: state.path
                              ?.startsWith('/mainMenuScreen/rooms/settings') !=
                          true,
                    ),
                    sideView: child,
                  )
                : child,
          ),
          routes: [
            GoRoute(
              path: 'rooms',
              redirect: loggedOutRedirect,
              pageBuilder: (context, state) => defaultPageBuilder(
                context,
                state,
                FluffyThemes.isColumnMode(context)
                    ? const EmptyPage()
                    : const ChatBottomNavBar(),
              ),
              routes: [
                GoRoute(
                  path: 'wallet',
                  pageBuilder: (context, state) => defaultPageBuilder(
                    context,
                    state,
                    const ComingSoonScreen(featureName: 'Wallet'),
                  ),
                  redirect: loggedOutRedirect,
                ),
                GoRoute(
                  path: 'archive',
                  pageBuilder: (context, state) => defaultPageBuilder(
                    context,
                    state,
                    const Archive(),
                  ),
                  routes: [
                    GoRoute(
                      path: ':roomid',
                      pageBuilder: (context, state) => defaultPageBuilder(
                        context,
                        state,
                        ChatPage(
                          roomId: state.pathParameters['roomid']!,
                          eventId: state.uri.queryParameters['event'],
                        ),
                      ),
                      redirect: loggedOutRedirect,
                    ),
                  ],
                  redirect: loggedOutRedirect,
                ),
                GoRoute(
                  path: 'customers',
                  pageBuilder: (context, state) => defaultPageBuilder(
                    context,
                    state,
                    const ComingSoonScreen(featureName: 'Customers'),
                  ),
                  redirect: loggedOutRedirect,
                ),
                GoRoute(
                  path: 'settings',
                  pageBuilder: (context, state) => defaultPageBuilder(
                    context,
                    state,
                    const Settings(),
                  ),
                  redirect: loggedOutRedirect,
                  routes: [
                        GoRoute(
                          path: 'notifications',
                          pageBuilder: (context, state) => defaultPageBuilder(
                            context,
                            state,
                            const SettingsNotifications(),
                          ),
                          redirect: loggedOutRedirect,
                        ),
                        GoRoute(
                          path: 'style',
                          pageBuilder: (context, state) => defaultPageBuilder(
                            context,
                            state,
                            const SettingsStyle(),
                          ),
                          redirect: loggedOutRedirect,
                        ),
                        GoRoute(
                          path: 'devices',
                          pageBuilder: (context, state) => defaultPageBuilder(
                            context,
                            state,
                            const DevicesSettings(),
                          ),
                          redirect: loggedOutRedirect,
                        ),
                        GoRoute(
                          path: 'chat',
                          pageBuilder: (context, state) => defaultPageBuilder(
                            context,
                            state,
                            const SettingsChat(),
                          ),
                          routes: [
                            GoRoute(
                              path: 'emotes',
                              pageBuilder: (context, state) =>
                                  defaultPageBuilder(
                                context,
                                state,
                                const EmotesSettings(),
                              ),
                            ),
                          ],
                          redirect: loggedOutRedirect,
                        ),
                        GoRoute(
                          path: 'addaccount',
                          redirect: loggedOutRedirect,
                          pageBuilder: (context, state) {
                            return defaultPageBuilder(
                              context,
                              state,
                              FutureBuilder<Client>(
                                future: Matrix.of(context).getLoginClient(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return const EnterPhoneNumberScreen();
                                  }
                                  return const Center(
                                    child: AppLoadingWidget(),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                        GoRoute(
                          path: 'homeserver',
                          pageBuilder: (context, state) {
                            return defaultPageBuilder(
                              context,
                              state,
                              const SettingsHomeserver(),
                            );
                          },
                          redirect: loggedOutRedirect,
                        ),
                        GoRoute(
                          path: 'security',
                          redirect: loggedOutRedirect,
                          pageBuilder: (context, state) => defaultPageBuilder(
                            context,
                            state,
                            const SettingsSecurity(),
                          ),
                          routes: [
                            GoRoute(
                              path: 'password',
                              pageBuilder: (context, state) {
                                return defaultPageBuilder(
                                  context,
                                  state,
                                  const SettingsPassword(),
                                );
                              },
                              redirect: loggedOutRedirect,
                            ),
                            GoRoute(
                              path: 'ignorelist',
                              pageBuilder: (context, state) {
                                return defaultPageBuilder(
                                  context,
                                  state,
                                  SettingsIgnoreList(
                                    initialUserId: state.extra?.toString(),
                                  ),
                                );
                              },
                              redirect: loggedOutRedirect,
                            ),
                            GoRoute(
                              path: 'userBlockedList',
                              pageBuilder: (context, state) {
                                return defaultPageBuilder(
                                  context,
                                  state,
                                  SettingsBlockedUserList(
                                    initialUserId: state.extra?.toString(),
                                  ),
                                );
                              },
                              redirect: loggedOutRedirect,
                            ),
                            GoRoute(
                              path: '3pid',
                              pageBuilder: (context, state) =>
                                  defaultPageBuilder(
                                context,
                                state,
                                const Settings3Pid(),
                              ),
                              redirect: loggedOutRedirect,
                            ),
                            GoRoute(
                              path: 'blockedusers',
                              pageBuilder: (context, state) =>
                                  defaultPageBuilder(
                                context,
                                state,
                                const BlockedUsersList(),
                              ),
                              redirect: loggedOutRedirect,
                            ),
                          ],
                        ),

                      ],
                ),
                GoRoute(
                  path: 'newprivatechat',
                  pageBuilder: (context, state) => defaultPageBuilder(
                    context,
                    state,
                    const NewPrivateChat(),
                  ),
                  redirect: loggedOutRedirect,
                ),
                GoRoute(
                  path: 'newgroup',
                  pageBuilder: (context, state) => defaultPageBuilder(
                    context,
                    state,
                    const NewGroup(),
                  ),
                  redirect: loggedOutRedirect,
                ),
                GoRoute(
                  path: 'newspace',
                  pageBuilder: (context, state) => defaultPageBuilder(
                    context,
                    state,
                    const NewGroup(createGroupType: CreateGroupType.space),
                  ),
                  redirect: loggedOutRedirect,
                ),
                GoRoute(
                  path: ':roomid',
                  pageBuilder: (context, state) => defaultPageBuilder(
                    context,
                    state,
                    ChatPage(
                      roomId: state.pathParameters['roomid']!,
                      eventId: state.uri.queryParameters['event'],
                    ),
                  ),
                  redirect: loggedOutRedirect,
                  routes: [
                    GoRoute(
                      path: 'details',
                      pageBuilder: (context, state) => defaultPageBuilder(
                        context,
                        state,
                        ChatDetails(roomId: state.pathParameters['roomid']!),
                      ),
                      redirect: loggedOutRedirect,
                      routes: [
                        GoRoute(
                          path: 'access',
                          pageBuilder: (context, state) => defaultPageBuilder(
                            context,
                            state,
                            ChatAccessSettings(
                              roomId: state.pathParameters['roomid']!,
                            ),
                          ),
                          redirect: loggedOutRedirect,
                        ),
                        GoRoute(
                          path: 'members',
                          pageBuilder: (context, state) => defaultPageBuilder(
                            context,
                            state,
                            ChatMembersPage(
                              roomId: state.pathParameters['roomid']!,
                            ),
                          ),
                          redirect: loggedOutRedirect,
                        ),
                        GoRoute(
                          path: 'permissions',
                          pageBuilder: (context, state) => defaultPageBuilder(
                            context,
                            state,
                            const ChatPermissionsSettings(),
                          ),
                          redirect: loggedOutRedirect,
                        ),
                        GoRoute(
                          path: 'emotes',
                          pageBuilder: (context, state) => defaultPageBuilder(
                            context,
                            state,
                            const EmotesSettings(),
                          ),
                          redirect: loggedOutRedirect,
                        ),
                        GoRoute(
                          path: 'multiple_emotes',
                          pageBuilder: (context, state) => defaultPageBuilder(
                            context,
                            state,
                            const MultipleEmotesSettings(),
                          ),
                          redirect: loggedOutRedirect,
                        ),
                      ],
                    ),
                    GoRoute(
                      path: 'search',
                      pageBuilder: (context, state) => defaultPageBuilder(
                        context,
                        state,
                        ChatSearchPage(roomId: state.pathParameters['roomid']!),
                      ),
                      redirect: loggedOutRedirect,
                    ),
                    GoRoute(
                      path: 'encryption',
                      pageBuilder: (context, state) => defaultPageBuilder(
                        context,
                        state,
                        const ChatEncryptionSettings(),
                      ),
                      redirect: loggedOutRedirect,
                    ),
                    GoRoute(
                      path: 'invite',
                      pageBuilder: (context, state) => defaultPageBuilder(
                        context,
                        state,
                        InvitationSelection(
                          roomId: state.pathParameters['roomid']!,
                        ),
                      ),
                      redirect: loggedOutRedirect,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) => defaultPageBuilder(
        context,
        state,
        FutureBuilder<Client>(
          future: Matrix.of(context).getLoginClient(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const EnterPhoneNumberScreen();
            }
            return const Center(child: AppLoadingWidget());
          },
        ),
      ),
    ),
    GoRoute(
      path: '/verify-email',
      pageBuilder: (context, state) => defaultPageBuilder(
        context,
        state,
        EmailVerification(
          clientSecret: state.uri.queryParameters['client_secret'],
          sid: state.uri.queryParameters['sid'],
          token: state.uri.queryParameters['token'],
        ),
      ),
    ),

    GoRoute(
      path: '/settings',
      redirect: loggedOutRedirect,
      pageBuilder: (context, state) => defaultPageBuilder(
        context,
        state,
        const Settings(),
      ),
      routes: [
        GoRoute(
          path: 'notifications',
          pageBuilder: (context, state) => defaultPageBuilder(
            context,
            state,
            const SettingsNotifications(),
          ),
          redirect: loggedOutRedirect,
        ),
        GoRoute(
          path: 'style',
          pageBuilder: (context, state) => defaultPageBuilder(
            context,
            state,
            const SettingsStyle(),
          ),
          redirect: loggedOutRedirect,
        ),
        GoRoute(
          path: 'devices',
          pageBuilder: (context, state) => defaultPageBuilder(
            context,
            state,
            const DevicesSettings(),
          ),
          redirect: loggedOutRedirect,
        ),
        GoRoute(
          path: 'chat',
          pageBuilder: (context, state) => defaultPageBuilder(
            context,
            state,
            const SettingsChat(),
          ),
          redirect: loggedOutRedirect,
        ),
        GoRoute(
          path: 'security',
          pageBuilder: (context, state) => defaultPageBuilder(
            context,
            state,
            const SettingsSecurity(),
          ),
          redirect: loggedOutRedirect,
        ),
        GoRoute(
          path: '/CallsScreen',
          pageBuilder: (context, state) => defaultPageBuilder(
            context,
            state,
            const CallsScreen(),
          ),
        ),

      ],
    ),
    GoRoute(
      path: '/_matrix/client/v3/register/email/submitToken',
      redirect: (context, state) {
        final clientSecret = state.uri.queryParameters['client_secret'];
        final sid = state.uri.queryParameters['sid'];
        final token = state.uri.queryParameters['token'];
        if (clientSecret != null && sid != null && token != null) {
          return '/verify-email?client_secret=$clientSecret&sid=$sid&token=$token';
        }
        return '/home';
      },
    ),
    GoRoute(
      path: '/email/verify',
      redirect: (context, state) {
        final clientSecret = state.uri.queryParameters['client_secret'];
        final sid = state.uri.queryParameters['sid'];
        final token = state.uri.queryParameters['token'];
        if (clientSecret != null && sid != null && token != null) {
          return '/verify-email?client_secret=$clientSecret&sid=$sid&token=$token';
        }
        return '/home';
      },
    ),
    GoRoute(
      path: '/_matrix/client/unstable/registration/email/submit_token',
      redirect: (context, state) {
        final clientSecret = state.uri.queryParameters['client_secret'];
        final sid = state.uri.queryParameters['sid'];
        final token = state.uri.queryParameters['token'];
        if (clientSecret != null && sid != null && token != null) {
          return '/verify-email?client_secret=$clientSecret&sid=$sid&token=$token';
        }
        return '/home';
      },
    ),
    // GoRoute(
    //   path: '/welcome',
    //   pageBuilder: (context, state) => defaultPageBuilder(
    //     context,
    //     state,
    //     const WelcomeScreen(),
    //   ),
    // ),
    GoRoute(
      path: '/onboarding',
      pageBuilder: (context, state) {
        final initialPage =
            int.tryParse(state.uri.queryParameters['page'] ?? '0') ?? 0;
        return defaultPageBuilder(
          context,
          state,
          OnBoardingScreen(initialPage: initialPage),
        );
      },
      routes: [
        GoRoute(
          path: 'login',
          pageBuilder: (context, state) => defaultPageBuilder(
            context,
            state,
            const EnterPhoneNumberScreen(),
          ),
        ),
        GoRoute(
          path: 'rooms',
          redirect: loggedOutRedirect,
          pageBuilder: (context, state) => defaultPageBuilder(
            context,
            state,
            const ChatBottomNavBar(),
          ),
        ),
        GoRoute(
          path: 'wallet',
          pageBuilder: (context, state) => defaultPageBuilder(
            context,
            state,
            const ComingSoonScreen(featureName: 'Wallet'),
          ),
          redirect: loggedOutRedirect,
        ),
      ],
    ),

    GoRoute(
      path: '/home',
      pageBuilder: (context, state) {
        return defaultPageBuilder(
          context,
          state,
          FutureBuilder<Client>(
            future: Matrix.of(context).getLoginClient(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const EnterPhoneNumberScreen();
              }
              return const Center(child: AppLoadingWidget());
            },
          ),
        );
      },
      redirect: loggedInRedirect,
      routes: [
        GoRoute(
          path: 'login',
          pageBuilder: (context, state) {
            return defaultPageBuilder(
              context,
              state,
              FutureBuilder<Client>(
                future: Matrix.of(context).getLoginClient(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return const EnterPhoneNumberScreen();
                  }
                  return const AppLoadingWidget();
                },
              ),
            );
          },
          redirect: loggedInRedirect,
        ),
        GoRoute(
          path: 'forgot-password',
          pageBuilder: (context, state) => defaultPageBuilder(
            context,
            state,
            ForgotPassword(
              client: (state.extra as Map<String, dynamic>)['client'] as Client,
              initialEmail:
                  (state.extra as Map<String, dynamic>)['email'] as String,
            ),
          ),
        ),
        GoRoute(
          path: 'account-type',
          pageBuilder: (context, state) => defaultPageBuilder(
            context,
            state,
            const AccountTypeSelectionScreen(),
          ),
          redirect: loggedInRedirect,
        ),
        GoRoute(
          path: 'signup',
          pageBuilder: (context, state) => defaultPageBuilder(
            context,
            state,
            Signup(client: state.extra as Client),
          ),
          redirect: loggedInRedirect,
        ),
        GoRoute(
          path: 'verify-email',
          pageBuilder: (context, state) => defaultPageBuilder(
            context,
            state,
            EmailVerification(
              clientSecret: state.uri.queryParameters['client_secret'],
              sid: state.uri.queryParameters['sid'],
              token: state.uri.queryParameters['token'],
            ),
          ),
        ),
        GoRoute(
          path: 'registration-complete',
          pageBuilder: (context, state) => defaultPageBuilder(
            context,
            state,
            const RegistrationComplete(),
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/logs',
      pageBuilder: (context, state) => defaultPageBuilder(
        context,
        state,
        const LogViewer(),
      ),
    ),
    GoRoute(
      path: '/configs',
      pageBuilder: (context, state) => defaultPageBuilder(
        context,
        state,
        const ConfigViewer(),
      ),
    ),
    GoRoute(
      path: '/customers/create',
      redirect: (context, state) async {
        final loggedOutResult = await loggedOutRedirect(context, state);
        if (loggedOutResult != null) return loggedOutResult;
        return '/rooms/customers/create';
      },
    ),
    GoRoute(
      path: '/customers/:id',
      redirect: (context, state) async {
        final loggedOutResult = await loggedOutRedirect(context, state);
        if (loggedOutResult != null) return loggedOutResult;
        return '/rooms/customers/${state.pathParameters['id']}';
      },
    ),
    GoRoute(
      path: '/done',
      pageBuilder: (context, state) => defaultPageBuilder(
        context,
        state,
        DoneScreen(
          returnRoute: state.uri.queryParameters['returnRoute'],
        ),
      ),
    ),
    GoRoute(
      path: '/rooms/:roomid',
      redirect: (context, state) async {
        final loggedOutResult = await loggedOutRedirect(context, state);
        if (loggedOutResult != null) return loggedOutResult;

        final roomId = state.pathParameters['roomid']!;
        final event = state.uri.queryParameters['event'];
        return event != null
            ? '/mainMenuScreen/rooms/$roomId?event=$event'
            : '/mainMenuScreen/rooms/$roomId';
      },
    ),
    //Story
    GoRoute(
      path: '/story',
      redirect: loggedOutRedirect,
      routes: [
        GoRoute(
          path: 'create',
          pageBuilder: (context, state) => defaultPageBuilder(
            context,
            state,
            const StoryCreationPage(),
          ),
          redirect: loggedOutRedirect,
        ),
        GoRoute(
          path: 'viewer',
          pageBuilder: (context, state) {
            final extra = state.extra as Map<String, dynamic>;
            return defaultPageBuilder(
              context,
              state,
              StoryViewerPage(
                userStories: extra['userStories'] as UserStories,
                isOwn: extra['isOwn'] as bool,
              ),
            );
          },
          redirect: loggedOutRedirect,
        ),
        GoRoute(
          path: 'details',
          pageBuilder: (context, state) => defaultPageBuilder(
            context,
            state,
            StoryDetailsPage(
              story: state.extra as Story,
            ),
          ),
          redirect: loggedOutRedirect,
        ),
      ],
    ),
    GoRoute(
      path: '/link',
      redirect: (context, state) => '/mainMenuScreen/rooms',
    ),
  ];

  static Page noTransitionPageBuilder(
    BuildContext context,
    GoRouterState state,
    Widget child,
  ) =>
      NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: child,
      );

  static Page defaultPageBuilder(
    BuildContext context,
    GoRouterState state,
    Widget child,
  ) =>
      FluffyThemes.isColumnMode(context)
          ? noTransitionPageBuilder(context, state, child)
          : MaterialPage(
              key: state.pageKey,
              restorationId: state.pageKey.value,
              child: child,
            );
}
