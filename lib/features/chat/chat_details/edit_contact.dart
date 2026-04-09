// import 'dart:ui';

// import 'package:bmp/features/auth_onboarding/widgets/bg_gradient_theme.dart';
// import 'package:flutter/material.dart';
// import 'package:matrix/matrix.dart';
// import 'package:bmp/shared/widgets/avatar.dart';
// import 'package:bmp/shared/widgets/mxc_image_viewer.dart';
// import 'package:bmp/shared/widgets/matrix.dart';
// import 'package:bmp/l10n/l10n.dart';
// import 'package:bmp/shared/utils/matrix_sdk_extensions/matrix_locals.dart';

// class EditContact extends StatelessWidget {
//   final String roomId;
//   final bool embeddedMode;

//   const EditContact({
//     Key? key,
//     required this.roomId,
//     this.embeddedMode = false,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final room = Matrix.of(context).client.getRoomById(roomId);

//     if (room == null) {
//       return Scaffold(
//         body: Center(
//           child: Text('Room not found'),
//         ),
//       );
//     }

//     final roomAvatar = room.avatar;
//     final displayname = room.getLocalizedDisplayname(
//       MatrixLocals(L10n.of(context)),
//     );

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
//               colors: [Color(0xFFA912BF), Colors.black],
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
//                 padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
//                 child: Container(
//                   height: 420,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: const Color(0xff4d2299),
//                     borderRadius: BorderRadius.circular(24),
//                     boxShadow: [
//                       BoxShadow(
//                         color: const Color(0xFF1B1C30),
//                         blurRadius: 16,
//                         spreadRadius: 0,
//                         offset: const Offset(0, 0),
//                       ),
//                     ],
//                     border: Border.all(color: Color(0xff7216BF)),
//                   ),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(
//                                 left: 10, top: 10, bottom: 10),
//                             child: GestureDetector(
//                               onTap: () => Navigator.pop(context),
//                               child: Image.asset(
//                                 "assets/icons/close-circle.png",
//                                 height: 40,
//                                 width: 40,
//                               ),
//                             ),
//                           ),
//                           const Expanded(
//                             child: Center(
//                               child: Text(
//                                 "Edit Contact",
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 40),
//                         ],
//                       ),
//                       Stack(
//                         clipBehavior: Clip.none,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(
//                                 left: 6, right: 6, top: 10),
//                             child: Align(
//                               alignment: Alignment.topCenter,
//                               child: ClipRRect(
//                                 borderRadius: const BorderRadius.only(
//                                   topLeft: Radius.circular(24),
//                                   topRight: Radius.circular(24),
//                                   bottomLeft: Radius.circular(8),
//                                   bottomRight: Radius.circular(8),
//                                 ),
//                                 child: Image.asset(
//                                   "assets/bluebg.png",
//                                   height: 144,
//                                   width: double.infinity,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                           ),

//                           // ✅ Profile Avatar & Form (WITH HERO)
//                           Positioned(
//                             top: 70,
//                             left: 0,
//                             right: 0,
//                             child: Column(
//                               children: [
//                                 Hero(
//                                   tag: embeddedMode
//                                       ? 'embedded_content_banner'
//                                       : 'content_banner',
//                                   child: Avatar(
//                                     mxContent: room.avatar,
//                                     name: displayname,
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
//                                 const Text(
//                                   "+62 81234567890",
//                                   style: TextStyle(
//                                       color: Color(0xffF3F7F8),
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 const SizedBox(height: 10),
//                                 const Padding(
//                                   padding: EdgeInsets.only(left: 16),
//                                   child: Align(
//                                     alignment: Alignment.topLeft,
//                                     child: Text(
//                                       "Name",
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.w400,
//                                         fontSize: 14,
//                                         color: Color(0xffF3F7F8),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 16, vertical: 8),
//                                   child: TextFormField(
//                                     initialValue: displayname,
//                                     style: const TextStyle(
//                                       color: Color(0xffF3F7F8),
//                                     ),
//                                     decoration: InputDecoration(
//                                       hintText: "Enter name",
//                                       hintStyle: const TextStyle(
//                                         color: Color(0xffF3F7F8),
//                                         fontSize: 14,
//                                       ),
//                                       filled: true,
//                                       fillColor: const Color(0xff2b1562),
//                                       contentPadding:
//                                           const EdgeInsets.symmetric(
//                                         vertical: 12,
//                                         horizontal: 16,
//                                       ),
//                                       border: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(30),
//                                         borderSide: BorderSide.none,
//                                       ),
//                                     ),
//                                     onChanged: (value) {},
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),

//             // ✅ Save Button
//             Positioned(
//               left: 10,
//               right: 10,
//               bottom: 20,
//               child: GestureDetector(
//                 onTap: () async {
//                   // TODO: Save changes logic
//                   // Example: await room.setName(newName);
//                   Navigator.pop(context);
//                 },
//                 child: Container(
//                   height: 48,
//                   decoration: BoxDecoration(
//                     color: const Color(0xff3976F8),
//                     borderRadius: BorderRadius.circular(30),
//                     boxShadow: [
//                       BoxShadow(
//                         color: const Color(0xFF1929FF).withOpacity(0.8),
//                         blurRadius: 10,
//                         spreadRadius: -1,
//                         offset: const Offset(0, 0),
//                       ),
//                     ],
//                   ),
//                   child: const Center(
//                     child: Text(
//                       "Save Change",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                       ),
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
