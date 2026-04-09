// import 'package:bmp/config/themes.dart';
// import 'package:bmp/l10n/l10n.dart';
// import 'package:bmp/shared/utils/percentage_size_ext.dart';
// import 'package:bmp/shared/widgets/adaptive_dialogs/show_ok_cancel_alert_dialog.dart';
// import 'package:bmp/shared/widgets/avatar.dart';
// import 'package:bmp/shared/widgets/future_loading_dialog.dart';
// import 'package:bmp/shared/widgets/matrix.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:matrix/matrix.dart';

// import 'package:bmp/shared/utils/bmp_share.dart';
// import '../../finance/data layer/services/auth_service.dart';
// import '../../finance/data layer/services/device_info_service.dart';
// import 'chat_list.dart';

// class ClientChooserButton extends StatelessWidget {
//   final ChatListController controller;

//   const ClientChooserButton(this.controller, {super.key});

// // class ClientChooserButton extends StatelessWidget {
// //   final ChatListController controller;

// //   const ClientChooserButton(this.controller, {super.key});

// //   List<PopupMenuEntry<Object>> _bundleMenuItems(BuildContext context) {
// //     final matrix = Matrix.of(context);
// //     final bundles = matrix.accountBundles.keys.toList()
// //       ..sort(
// //         (a, b) => a!.isValidMatrixId == b!.isValidMatrixId
// //             ? 0
// //             : a.isValidMatrixId && !b.isValidMatrixId
// //                 ? -1
// //                 : 1,
// //       );
// //     return <PopupMenuEntry<Object>>[
// //       const PopupMenuItem(
// //         value: SettingsAction.myWallet,
// //         child: Row(
// //           children: [
// //             Icon(Icons.account_balance_wallet_outlined),
// //             SizedBox(width: 18),
// //             Text('My Wallet'),
// //           ],
// //         ),
// //       ),
// //       const PopupMenuItem(
// //         value: SettingsAction.home,
// //         child: Row(
// //           children: [
// //             Icon(Icons.home_outlined),
// //             SizedBox(width: 18),
// //             Text('Home'),
// //           ],
// //         ),
// //       ),
// //       PopupMenuItem(
// //         value: SettingsAction.newGroup,
// //         child: Row(
// //           children: [
// //             const Icon(Icons.group_add_outlined),
// //             const SizedBox(width: 18),
// //             Text(L10n.of(context).createGroup),
// //           ],
// //         ),
// //       ),
// //       PopupMenuItem(
// //         value: SettingsAction.setStatus,
// //         child: Row(
// //           children: [
// //             const Icon(Icons.edit_outlined),
// //             const SizedBox(width: 18),
// //             Text(L10n.of(context).setStatus),
// //           ],
// //         ),
// //       ),
// //       PopupMenuItem(
// //         value: SettingsAction.invite,
// //         child: Row(
// //           children: [
// //             Icon(Icons.adaptive.share_outlined),
// //             const SizedBox(width: 18),
// //             Text(L10n.of(context).inviteContact),
// //           ],
// //         ),
// //       ),
// //       PopupMenuItem(
// //         value: SettingsAction.archive,
// //         child: Row(
// //           children: [
// //             const Icon(Icons.archive_outlined),
// //             const SizedBox(width: 18),
// //             Text(L10n.of(context).archive),
// //           ],
// //         ),
// //       ),
// //       PopupMenuItem(
// //         value: SettingsAction.settings,
// //         child: Row(
// //           children: [
// //             const Icon(Icons.settings_outlined),
// //             const SizedBox(width: 18),
// //             Text(L10n.of(context).settings),
// //           ],
// //         ),
// //       ),
// //       const PopupMenuDivider(),
// //       for (final bundle in bundles) ...[
// //         if (matrix.accountBundles[bundle]!.length != 1 ||
// //             matrix.accountBundles[bundle]!.single!.userID != bundle)
// //           PopupMenuItem(
// //             value: null,
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 Text(
// //                   bundle!,
// //                   style: TextStyle(
// //                     color: Theme.of(context).textTheme.titleMedium!.color,
// //                     fontSize: 14,
// //                   ),
// //                 ),
// //                 const Divider(height: 1),
// //               ],
// //             ),
// //           ),
// //         ...matrix.accountBundles[bundle]!
// //             .whereType<Client>()
// //             .where((client) => client.isLogged())
// //             .map(
// //               (client) => PopupMenuItem(
// //                 value: client,
// //                 child: FutureBuilder<Profile?>(
// //                   future: client.fetchOwnProfile(),
// //                   builder: (context, snapshot) => Row(
// //                     children: [
// //                       Avatar(
// //                         mxContent: snapshot.data?.avatarUrl,
// //                         name: snapshot.data?.displayName ??
// //                             client.userID!.localpart,
// //                         size: 32,
// //                       ),
// //                       const SizedBox(width: 12),
// //                       Expanded(
// //                         child: Text(
// //                           snapshot.data?.displayName ??
// //                               client.userID!.localpart!,
// //                           overflow: TextOverflow.ellipsis,
// //                         ),
// //                       ),
// //                       const SizedBox(width: 12),
// //                       IconButton(
// //                         icon: const Icon(Icons.edit_outlined),
// //                         onPressed: () => controller.editBundlesForAccount(
// //                           client.userID,
// //                           bundle,
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ),
// //       ],
// //       PopupMenuItem(
// //         value: SettingsAction.addAccount,
// //         child: Row(
// //           children: [
// //             const Icon(Icons.person_add_outlined),
// //             const SizedBox(width: 18),
// //             Text(L10n.of(context).addAccount),
// //           ],
// //         ),
// //       ),
// //       const PopupMenuItem(
// //         value: SettingsAction.logout,
// //         child: Row(
// //           children: [
// //             Icon(Icons.logout, color: Colors.red),
// //             SizedBox(width: 18),
// //             Text('Logout', style: TextStyle(color: Colors.red)),
// //           ],
// //         ),
// //       ),
// //     ];
// //   }

//   // List<PopupMenuEntry<Object>> _bundleMenuItems(BuildContext context) {
//   //   final matrix = Matrix.of(context);
//   //   final bundles = matrix.accountBundles.keys.toList()
//   //     ..sort(
//   //       (a, b) => a!.isValidMatrixId == b!.isValidMatrixId
//   //           ? 0
//   //           : a.isValidMatrixId && !b.isValidMatrixId
//   //               ? -1
//   //               : 1,
//   //     );
//   //   return <PopupMenuEntry<Object>>[
//   //     PopupMenuItem(
//   //       value: SettingsAction.myWallet,
//   //       child: Row(
//   //         children: [
//   //           const Icon(Icons.account_balance_wallet_outlined),
//   //           const SizedBox(width: 18),
//   //           Text(L10n.of(context).myWallet),
//   //         ],
//   //       ),
//   //     ),
//   //     PopupMenuItem(
//   //       value: SettingsAction.home,
//   //       child: Row(
//   //         children: [
//   //           const Icon(Icons.home_outlined),
//   //           const SizedBox(width: 18),
//   //           Text(L10n.of(context).home),
//   //         ],
//   //       ),
//   //     ),
//   //     PopupMenuItem(
//   //       value: SettingsAction.newGroup,
//   //       child: Row(
//   //         children: [
//   //           const Icon(Icons.group_add_outlined),
//   //           const SizedBox(width: 18),
//   //           Text(L10n.of(context).createGroup),
//   //         ],
//   //       ),
//   //     ),
//   //     PopupMenuItem(
//   //       value: SettingsAction.setStatus,
//   //       child: Row(
//   //         children: [
//   //           const Icon(Icons.edit_outlined),
//   //           const SizedBox(width: 18),
//   //           Text(L10n.of(context).setStatus),
//   //         ],
//   //       ),
//   //     ),
//   //     PopupMenuItem(
//   //       value: SettingsAction.invite,
//   //       child: Row(
//   //         children: [
//   //           Icon(Icons.adaptive.share_outlined),
//   //           const SizedBox(width: 18),
//   //           Text(L10n.of(context).inviteContact),
//   //         ],
//   //       ),
//   //     ),
//   //     PopupMenuItem(
//   //       value: SettingsAction.archive,
//   //       child: Row(
//   //         children: [
//   //           const Icon(Icons.archive_outlined),
//   //           const SizedBox(width: 18),
//   //           Text(L10n.of(context).archive),
//   //         ],
//   //       ),
//   //     ),
//   //     PopupMenuItem(
//   //       value: SettingsAction.settings,
//   //       child: Row(
//   //         children: [
//   //           const Icon(Icons.settings_outlined),
//   //           const SizedBox(width: 18),
//   //           Text(L10n.of(context).settings),
//   //         ],
//   //       ),
//   //     ),
//   //     const PopupMenuDivider(),
//   //     for (final bundle in bundles) ...[
//   //       if (matrix.accountBundles[bundle]!.length != 1 ||
//   //           matrix.accountBundles[bundle]!.single!.userID != bundle)
//   //         PopupMenuItem(
//   //           value: null,
//   //           child: Column(
//   //             crossAxisAlignment: CrossAxisAlignment.start,
//   //             mainAxisSize: MainAxisSize.min,
//   //             children: [
//   //               Text(
//   //                 bundle!,
//   //                 style: TextStyle(
//   //                   color: Theme.of(context).textTheme.titleMedium!.color,
//   //                   fontSize: 14,
//   //                 ),
//   //               ),
//   //               const Divider(height: 1),
//   //             ],
//   //           ),
//   //         ),
//   //       ...matrix.accountBundles[bundle]!
//   //           .whereType<Client>()
//   //           .where((client) => client.isLogged())
//   //           .map(
//   //             (client) => PopupMenuItem(
//   //               value: client,
//   //               child: FutureBuilder<Profile?>(
//   //                 future: client.fetchOwnProfile(),
//   //                 builder: (context, snapshot) => Row(
//   //                   children: [
//   //                     Avatar(
//   //                       mxContent: snapshot.data?.avatarUrl,
//   //                       name: snapshot.data?.displayName ??
//   //                           client.userID!.localpart,
//   //                       size: 32,
//   //                     ),
//   //                     const SizedBox(width: 12),
//   //                     Expanded(
//   //                       child: Text(
//   //                         snapshot.data?.displayName ??
//   //                             client.userID!.localpart!,
//   //                         overflow: TextOverflow.ellipsis,
//   //                       ),
//   //                     ),
//   //                     const SizedBox(width: 12),
//   //                     IconButton(
//   //                       icon: const Icon(Icons.edit_outlined),
//   //                       onPressed: () => controller.editBundlesForAccount(
//   //                         client.userID,
//   //                         bundle,
//   //                       ),
//   //                     ),
//   //                   ],
//   //                 ),
//   //               ),
//   //             ),
//   //           ),
//   //     ],
//   //     PopupMenuItem(
//   //       value: SettingsAction.addAccount,
//   //       child: Row(
//   //         children: [
//   //           const Icon(Icons.person_add_outlined),
//   //           const SizedBox(width: 18),
//   //           Text(L10n.of(context).addAccount),
//   //         ],
//   //       ),
//   //     ),
//   //     PopupMenuItem(
//   //       value: SettingsAction.logout,
//   //       child: Row(
//   //         children: [
//   //           const Icon(Icons.logout, color: Colors.red),
//   //           const SizedBox(width: 18),
//   //           Text(L10n.of(context).logout, style: const TextStyle(color: Colors.red)),
//   //         ],
//   //       ),
//   //     ),
//   //   ];
//   // }
// //   @override
// //   Widget build(BuildContext context) {
// //     final matrix = Matrix.of(context);

// //     var clientCount = 0;
// //     matrix.accountBundles.forEach((key, value) => clientCount += value.length);
// //     return FutureBuilder<Profile>(
// //       future: matrix.client.isLogged() ? matrix.client.fetchOwnProfile() : null,
// //       builder: (context, snapshot) => Material(
// //         clipBehavior: Clip.hardEdge,
// //         borderRadius: BorderRadius.circular(99),
// //         color: Colors.transparent,
// //         child: PopupMenuButton<Object>(
// //           popUpAnimationStyle: FluffyThemes.isColumnMode(context)
// //               ? AnimationStyle.noAnimation
// //               : null, // https://github.com/flutter/flutter/issues/167180
// //           onSelected: (o) => _clientSelected(o, context),
// //           itemBuilder: _bundleMenuItems,
// //           // itemBuilder: _bundleMenuItems,
// //           child: Center(
// //             child: Avatar(
// //               mxContent: snapshot.data?.avatarUrl,
// //               name:
// //                   snapshot.data?.displayName ?? matrix.client.userID?.localpart,
// //               size: context.percentHeight,
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Future<void> _showLogoutConfirmation(BuildContext context) async {
// //     final result = await showOkCancelAlertDialog(
// //       context: context,
// //       title: 'Logout',
// //       message: 'Are you sure you want to logout?',
// //       okLabel: 'Logout',
// //       cancelLabel: 'Cancel',
// //     );

//   // Future<void> _showLogoutConfirmation(BuildContext context) async {
//   //   final result = await showOkCancelAlertDialog(
//   //     context: context,
//   //     title: L10n.of(context).logout,
//   //     message: L10n.of(context).areYouSureYouWantToLogout,
//   //     okLabel: L10n.of(context).logout,
//   //     cancelLabel: L10n.of(context).cancel,
//   //   );
// //     if (result == OkCancelResult.ok) {
// //       try {
// //         final matrix = Matrix.of(context);
//   @override
//   Widget build(BuildContext context) {
//     final matrix = Matrix.of(context);

//     var clientCount = 0;
//     matrix.accountBundles.forEach((key, value) => clientCount += value.length);
//     return FutureBuilder<Profile>(
//       future: matrix.client.isLogged() ? matrix.client.fetchOwnProfile() : null,
//       builder: (context, snapshot) => Material(
//         clipBehavior: Clip.hardEdge,
//         borderRadius: BorderRadius.circular(99),
//         color: Colors.transparent,
//         child: PopupMenuButton<Object>(
//           popUpAnimationStyle: FluffyThemes.isColumnMode(context)
//               ? AnimationStyle.noAnimation
//               : null,
//           onSelected: (o) => _clientSelected(o, context),
//           itemBuilder: _bundleMenuItems,
//           child: Center(
//             child: Avatar(
//               mxContent: snapshot.data?.avatarUrl,
//               name:
//                   snapshot.data?.displayName ?? matrix.client.userID?.localpart,
//               size: context.percentHeight,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> _showLogoutConfirmation(BuildContext context) async {
//     final result = await showOkCancelAlertDialog(
//       context: context,
//       title: L10n.of(context).logout,
//       message: L10n.of(context).areYouSureYouWantToLogout,
//       okLabel: L10n.of(context).logout,
//       cancelLabel: L10n.of(context).cancel,
//     );

//     if (result == OkCancelResult.ok) {
//       try {
//         final matrix = Matrix.of(context);

//         await showFutureLoadingDialog(
//           context: context,
//           future: () async {
//             try {
//               debugPrint("========logout========");
//               final deviceId = await DeviceInfoService.getDeviceId();
//               if (deviceId != null) {
//                 await AuthService.logout(context: context, deviceId: deviceId, username: matrix.client.userID!);
//               }
//             } catch (_) {}
            
//             await matrix.client.logout();
//             return true;
//           },
//         );

//         if (context.mounted) {
//           context.go('/home');
//         }
//       } catch (e) {
//         if (context.mounted) {
//           context.go('/home');
//         }
//       }
//     }
//   }

//   void _clientSelected(
//     Object object,
//     BuildContext context,
//   ) async {
//     if (object is Client) {
//       controller.setActiveClient(object);
//     } else if (object is String) {
//       controller.setActiveBundle(object);
//     } else if (object is SettingsAction) {
//       switch (object) {
//         case SettingsAction.addAccount:
//           final consent = await showOkCancelAlertDialog(
//             context: context,
//             title: L10n.of(context).addAccount,
//             message: L10n.of(context).enableMultiAccounts,
//             okLabel: L10n.of(context).next,
//             cancelLabel: L10n.of(context).cancel,
//           );
//           if (consent != OkCancelResult.ok) return;
//           context.go('/rooms/settings/addaccount');
//           break;
//         case SettingsAction.newGroup:
//           context.go('/rooms/newgroup');
//           break;
//         case SettingsAction.invite:
//           BmpShare.shareInviteLink(context);
//           break;
//         case SettingsAction.settings:
//           context.go('/settings');
//           break;
//         case SettingsAction.archive:
//           context.go('/rooms/archive');
//           break;
//         case SettingsAction.setStatus:
//           controller.setStatus();
//           break;
//         case SettingsAction.myWallet:
//           context.push('/rooms/wallet');
//           break;
//         case SettingsAction.home:
//           context.go('/mainMenuScreen');
//           break;
//         case SettingsAction.logout:
//           debugPrint("===========logout===========");
//           await _showLogoutConfirmation(context);
//           break;
//       }
//     }
//   }
// }

// enum SettingsAction {
//   addAccount,
//   newGroup,
//   setStatus,
//   invite,
//   settings,
//   archive,
//   myWallet,
//   home,
//   logout,
// }

