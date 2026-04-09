// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:badges/badges.dart' as badges;


// class ChatBottomNavigation extends StatelessWidget {
//   final int selectedIndex;
//   final Function(int) onTabSelected;
//   final VoidCallback? onCenterButtonPressed;

//   const ChatBottomNavigation({
//     super.key,
//     required this.selectedIndex,
//     required this.onTabSelected,
//     this.onCenterButtonPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;

//     return Padding(
//       padding: const EdgeInsets.only(top: 90),
//       child: Container(
//         margin: EdgeInsets.fromLTRB(
//           screenWidth * 0.05,
//           0,
//           screenWidth * 0.05,
//           screenHeight * 0.1,
//         ),
//         child: Stack(
//           clipBehavior: Clip.none,
//           children: [
//             Container(
//               height: screenHeight * 0.08,
//               decoration: ShapeDecoration(

//                 gradient:  const RadialGradient(
//                   center: Alignment.bottomCenter, // center of the button
//                   radius: 1, // how far the gradient spreads
//                   colors: [
//                     Color(0xFF202267),
//                     Color(0xFF202267),

//                   ],
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(100),
//                   side: BorderSide(
//                     color:                    Color(0xFF202267), // Border color
//                     width: 1.0, // Border thickness
//                   ),
//                 ),
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: GestureDetector(
//                       onTap: () => onTabSelected(0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset(
//                             'assets/images/message.png',
//                             width: screenHeight * 0.025,
//                             height: screenHeight * 0.025,
//                             color: selectedIndex == 0 ? Color(0xff3976F8) : Colors.grey.shade600,
//                           ),

//                           SizedBox(width: screenWidth * 0.02),
//                           badges.Badge(
//                             position: badges.BadgePosition.topEnd(top: -40, end: 16),
//                             showBadge: true,
//                             badgeContent: Text(
//                               '2',
//                               style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w400),
//                             ),
//                             badgeStyle: badges.BadgeStyle(
//                               badgeColor: Color(0xff3976F8),
//                               padding: EdgeInsets.all(8),
//                               shape: badges.BadgeShape.circle,
//                             ),
//                             child: Text(
//                               'Chats',
//                               style: GoogleFonts.montserrat(
//                                 decoration: TextDecoration.none,
//                                 color: selectedIndex == 0 ? Color(0xff3976F8) : Colors.grey.shade500,
//                                 fontSize: 14,
//                                 height: 1.0,
//                                 fontWeight: selectedIndex == 0 ? FontWeight.bold : FontWeight.w800,
//                                 shadows: selectedIndex == 0
//                                     ? [
//                                   Shadow(
//                                     color: Colors.white.withOpacity(0.3),
//                                     blurRadius: 2,
//                                   ),
//                                 ]
//                                     : null,
//                               ),
//                             ),
//                           )

//                         ],
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: GestureDetector(
//                       onTap: () => onTabSelected(1),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset(
//                             'assets/images/call.png',
//                             width: screenHeight * 0.025,
//                             height: screenHeight * 0.025,
//                             color: selectedIndex == 1 ? Color(0x3DF2FBF9) : Color(0x3D78909C),
//                           ),
//                           SizedBox(width: screenWidth * 0.02),
//                           badges.Badge(
//                             position: badges.BadgePosition.topEnd(top: -40, end: 4),
//                             showBadge: true, // Set to false to hide
//                             badgeContent: Text(
//                               '1', // Badge count
//                               style: TextStyle(color: Colors.white, fontSize: 10,fontWeight: FontWeight.w400),
//                             ),
//                             badgeStyle: badges.BadgeStyle(
//                               badgeColor: Color(0xff3976F8),
//                               padding: EdgeInsets.all(8),

//                               shape: badges.BadgeShape.circle,
//                             ),
//                             child: Text(
//                               'Calls',
//                               style: TextStyle(
//                                 decoration: TextDecoration.none,
//                                 fontSize: 14,
//                                 color: selectedIndex == 1 ? Color(0x3DF2FBF9) : Color(0x3D78909C),
//                                 height: 1.0,
//                                 fontFamily: 'Montserrat',
//                                 fontWeight: selectedIndex == 1 ? FontWeight.bold : FontWeight.w800,
//                                 shadows: selectedIndex == 1
//                                     ? [
//                                   Shadow(
//                                     color: Colors.white.withOpacity(0.3),
//                                     blurRadius: 2,
//                                   ),
//                                 ]
//                                     : null,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),                ],
//               ),
//             ),
//             Positioned(
//               top: -screenHeight * 0.04,
//               left: 0,
//               right: 0,
//               child: Center(
//                 child: GestureDetector(
//                   onTap: onCenterButtonPressed,
//                   child: Container(
//                     // width: screenHeight * 0.075,
//                     // height: screenHeight * 0.075,
//                     // decoration: const BoxDecoration(
//                     //   color: Color(0xFF3976F8),
//                     //   shape: BoxShape.circle,
//                     //   boxShadow: [
//                     //     BoxShadow(
//                     //       color: Color(0x4C1929FF),
//                     //       blurRadius: 12,
//                     //       offset: Offset(0, 4),
//                     //     )
//                     //   ],
//                     // ),
//                       child: Image.asset("assets/images/plusicon.png")

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