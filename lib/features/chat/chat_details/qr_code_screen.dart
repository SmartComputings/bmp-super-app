// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:matrix/matrix.dart';
// import 'package:pretty_qr_code/pretty_qr_code.dart';
// import 'package:bmp/config/app_config.dart';
// import 'package:bmp/config/themes.dart';
// import 'package:bmp/features/auth_onboarding/widgets/bg_gradient_theme.dart';
// import 'package:bmp/shared/widgets/avatar.dart';
// import 'package:bmp/shared/widgets/mxc_image_viewer.dart';
// import 'package:bmp/shared/widgets/matrix.dart';
// import 'package:bmp/l10n/l10n.dart';
// import 'package:bmp/shared/utils/matrix_sdk_extensions/matrix_locals.dart';

// class QrCodeScreen extends StatefulWidget {
//   final String roomId;
//   final bool embeddedMode;

//   const QrCodeScreen({
//     Key? key,
//     required this.roomId,
//     this.embeddedMode = false,
//   }) : super(key: key);

//   @override
//   State<QrCodeScreen> createState() => _QrCodeScreenState();
// }

// class _QrCodeScreenState extends State<QrCodeScreen> {
//   bool isMyQrSelected = true;

//   @override
//   Widget build(BuildContext context) {
//     final room = Matrix.of(context).client.getRoomById(widget.roomId);
//     final theme = Theme.of(context);

//     if (room == null) {
//       return const Scaffold(
//         body: Center(child: Text('Room not found')),
//       );
//     }

//     final roomAvatar = room.avatar;
//     final displayName =
//         room.getLocalizedDisplayname(MatrixLocals(L10n.of(context)));
//     final inviteLink = 'https://be-mindpower.net/#/${widget.roomId}';

//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Positioned.fill(
//               child: Container(
//                 color: const Color.fromRGBO(71, 84, 255, 0.6),
//               ),
//             ),
//             const BgGradientTheme(
//               position: ShapePosition.topFull,
//               height: 200,
//               gradient: LinearGradient(
//                 colors: [Color(0xFF4754FF), Color(0xFFA912BF)],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//             const BgGradientTheme(
//               position: ShapePosition.bottomFull,
//               height: 250,
//               gradient: LinearGradient(
//                 colors: [Color(0xFFA912BF), Color(0xFF000000)],
//                 stops: [0.3, 1.0],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//               ),
//             ),
//             const BgGradientTheme(
//               position: ShapePosition.center,
//               width: 681,
//               height: 681,
//               color: Color(0xFF4754FF),
//               opacity: 0.6,
//             ),
//             BgGradientTheme(
//               position: ShapePosition.bottomRight,
//               width: 150,
//               height: 250,
//               colors: const [Color(0xFFA912BF), Colors.black],
//               opacity: 0.8,
//             ),
//             BgGradientTheme(
//               position: ShapePosition.bottomLeft,
//               width: 120,
//               height: 150,
//               color: Colors.black,
//               opacity: 0.8,
//             ),
//             Positioned.fill(
//               child: BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 85, sigmaY: 85),
//                 child: Container(color: Colors.transparent),
//               ),
//             ),
//             Align(
//               alignment: Alignment.topCenter,
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
//                 child: Container(
//                   height: 620,
//                   decoration: BoxDecoration(
//                     color: const Color(0xff4d2299),
//                     borderRadius: BorderRadius.circular(24),
//                     boxShadow: const [
//                       BoxShadow(
//                         color: Color(0xFF1B1C30),
//                         blurRadius: 16,
//                         spreadRadius: 0,
//                         offset: Offset(0, 0),
//                       ),
//                     ],
//                     border: Border.all(color: const Color(0xff7216BF)),
//                   ),
//                   child: Align(
//                     alignment: Alignment.topCenter,
//                     child: Container(
//                       height: 280,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         color: const Color(0xff4d2299),
//                         borderRadius: BorderRadius.circular(24),
//                         boxShadow: const [
//                           BoxShadow(
//                             color: Color(0xFF1B1C30),
//                             blurRadius: 16,
//                             spreadRadius: 0,
//                             offset: Offset(0, 0),
//                           ),
//                         ],
//                         border: Border.all(color: const Color(0xff7216BF)),
//                       ),
//                       child: Stack(
//                         clipBehavior: Clip.none,
//                         children: [
//                           ClipRRect(
//                             borderRadius: const BorderRadius.only(
//                               topLeft: Radius.circular(24),
//                               topRight: Radius.circular(24),
//                               bottomLeft: Radius.circular(8),
//                               bottomRight: Radius.circular(8),
//                             ),
//                             child: Image.asset(
//                               "assets/bluebg.png",
//                               height: 144,
//                               width: double.infinity,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           Positioned(
//                             top: 16,
//                             left: 16,
//                             child: GestureDetector(
//                               onTap: () => Navigator.pop(context),
//                               child: Image.asset(
//                                 ImageAssets.arrowLeft,
//                                 height: 40,
//                                 width: 40,
//                               ),
//                             ),
//                           ),
//                           Positioned(
//                             top: 70,
//                             left: 0,
//                             right: 0,
//                             child: Column(
//                               children: [
//                                 Hero(
//                                   tag: widget.embeddedMode
//                                       ? 'embedded_content_banner'
//                                       : 'content_banner',
//                                   child: Avatar(
//                                     mxContent: room.avatar,
//                                     name: displayName,
//                                     size: Avatar.defaultSize * 2.5,
//                                     onTap: roomAvatar != null
//                                         ? () => showDialog(
//                                               context: context,
//                                               builder: (_) =>
//                                                   MxcImageViewer(roomAvatar),
//                                             )
//                                         : null,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 12),
//                                 Text(
//                                   displayName,
//                                   style: const TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 const Text(
//                                   "+62 81234567890",
//                                   style: TextStyle(
//                                     color: Color(0xffF3F7F8),
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 62, vertical: 110),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     ConstrainedBox(
//                       constraints: const BoxConstraints(
//                         maxWidth: FluffyThemes.columnWidth,
//                       ),
//                       child: PrettyQrView.data(
//                         data: inviteLink,
//                         decoration: PrettyQrDecoration(
//                           shape: PrettyQrSmoothSymbol(
//                             roundFactor: 1,
//                             color: theme.colorScheme.onPrimaryContainer,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 8.0),
//                     SelectableText(
//                       widget.roomId.contains(':')
//                           ? widget.roomId.split(':')[0]
//                           : widget.roomId,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: theme.colorScheme.onPrimaryContainer,
//                         fontSize: 12,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 12,
//             ),
//             Positioned(
//               bottom: 30,
//               right: 100,
//               child: GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     isMyQrSelected = false;
//                   });
//                 },
//                 child: Container(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
//                   decoration: BoxDecoration(
//                     color: isMyQrSelected
//                         ? const Color(0xFF1B1C30)
//                         : const Color(0xff1929FF),
//                     boxShadow: const [
//                       BoxShadow(
//                         color: Color(0xFF1929FF),
//                         blurRadius: 10,
//                         spreadRadius: -1,
//                         offset: Offset(0, 0),
//                       ),
//                     ],
//                     border: Border.all(color: const Color(0xff05092680)),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: const Text(
//                     "Scan QR",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               bottom: 30,
//               right: 10,
//               child: GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     isMyQrSelected = true;
//                   });
//                 },
//                 child: Container(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
//                   decoration: BoxDecoration(
//                     color: isMyQrSelected
//                         ? const Color(0xff1929FF)
//                         : const Color(0xFF1B1C30),
//                     boxShadow: const [
//                       BoxShadow(
//                         color: Color(0xFF1B1C30),
//                         blurRadius: 10,
//                         spreadRadius: -1,
//                         offset: Offset(0, 0),
//                       ),
//                     ],
//                     border: Border.all(color: const Color(0xff05092680)),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: const Text(
//                     "My QR",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
