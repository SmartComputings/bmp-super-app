// import 'package:bmp/features/chat/chat_list/chat_list.dart';
// import 'package:flutter/material.dart';

// import '../../auth_onboarding/onBoardingScreens/Screens/OnBoardingScreen/widgets/DynamicHeader.dart';

// // enum SettingsAction {
// //   addAccount,
// //   newGroup,
// //   settings,
// //   myWallet,
// //   home,
// //   logout,
// // }

// class ChatListHeader extends StatelessWidget {
//   final ChatListController controller;
//   final bool globalSearch;

//   const ChatListHeader({
//     super.key,
//     required this.controller,
//     this.globalSearch = true,
//   });

//   // Future<void> _showLogoutConfirmation(BuildContext context) async {
//   //   final result = await showOkCancelAlertDialog(
//   //     context: context,
//   //     title: 'Logout',
//   //     message: 'Are you sure you want to logout?',
//   //     okLabel: 'Logout',
//   //     cancelLabel: 'Cancel',
//   //   );

//   //   if (result == OkCancelResult.ok) {
//   //     try {
//   //       final matrix = Matrix.of(context);

//   //       // Show loading dialog to prevent UI interactions during logout
//   //       await showFutureLoadingDialog(
//   //         context: context,
//   //         future: () async {
//   //           // Clear shared preferences data before logout
//   //           try {
//   //             final prefs = await SharedPreferences.getInstance();
//   //             await prefs.remove('cached_wallets');
//   //             await prefs.remove('customer_id');
//   //             print('🧹 DEBUG: SharedPreferences data cleared before logout');
//   //           } catch (e) {
//   //             print('⚠️ DEBUG: Failed to clear SharedPreferences data: $e');
//   //           }

//   //           // Logout the client
//   //           await matrix.client.logout();
//   //           return true;
//   //         },
//   //       );

//   //       // Navigate to login screen after successful logout
//   //       if (context.mounted) {
//   //         context.go('/home');
//   //       }
//   //     } catch (e) {
//   //       // If anything fails, ensure we're on login screen
//   //       if (context.mounted) {
//   //         context.go('/home');
//   //       }
//   //     }
//   //   }
//   // }

//   // void _handleMenuAction(SettingsAction action, BuildContext context) async {
//   //   switch (action) {
//   //     case SettingsAction.addAccount:
//   //       final consent = await showOkCancelAlertDialog(
//   //         context: context,
//   //         title: L10n.of(context).addAccount,
//   //         message: L10n.of(context).enableMultiAccounts,
//   //         okLabel: L10n.of(context).next,
//   //         cancelLabel: L10n.of(context).cancel,
//   //       );
//   //       if (consent != OkCancelResult.ok) return;
//   //       context.go('/rooms/settings/addaccount');
//   //       break;
//   //     case SettingsAction.newGroup:
//   //       context.go('/rooms/newgroup');
//   //       break;

//   //     case SettingsAction.settings:
//   //       context.go('/settings');
//   //       break;
//   //     // case SettingsAction.archive:
//   //     //   try {
//   //     //     context.go('/rooms/archive');
//   //     //   } catch (e) {
//   //     //     Logs().w('Failed to navigate to archive: $e');
//   //     //     // Fallback navigation
//   //     //     context.push('/rooms/archive');
//   //     //   }
//   //     //   break;

//   //     case SettingsAction.myWallet:
//   //       context.push('/rooms/wallet');
//   //       break;
//   //     case SettingsAction.home:
//   //       Navigator.push(
//   //         context,
//   //         MaterialPageRoute(
//   //           builder: (context) =>  OnBoardingScreen(),
//   //         ),
//   //       );
//   //       break;
//   //     case SettingsAction.logout:
//   //       debugPrint("=========logout========");
//   //       _showLogoutConfirmation(context);
//   //       break;
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return DynamicHeader(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: _SearchBarDelegate(
//           controller: controller,
//           theme: theme,
//         ).build(context, 0, false),
//       ),
//     );
//   }

//   // @override
//   // Size get preferredSize => const Size.fromHeight(72);
// }