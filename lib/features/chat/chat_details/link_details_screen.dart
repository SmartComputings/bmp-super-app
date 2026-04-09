// import 'package:flutter/material.dart';

// class LinkTabWidget extends StatelessWidget {
//   const LinkTabWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return _buildLinkTab();
//   }

//   Widget _buildLinkTab() {
//     final links = [
//       {'title': 'Jabarano Coffee', 'url': 'https://g.co/jabarano'},
//       {'title': 'Documentation', 'url': 'bit.ly/doc'},
//     ];

//     return Padding(
//       padding: const EdgeInsets.only(left: 6, right: 6, top: 16),
//       child: Container(
//         decoration: BoxDecoration(
//           color: const Color(0xff1F252D),
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: ListView.builder(
//           padding: const EdgeInsets.only(left: 6, right: 6, top: 6),
//           itemCount: links.length,
//           itemBuilder: (context, index) {
//             final link = links[index];
//             return Container(
//               margin: const EdgeInsets.only(bottom: 6),
//               decoration: BoxDecoration(
//                 color: const Color(0XFF190d40),
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(6),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 6),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             link['title']!,
//                             style: const TextStyle(
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16,
//                               color: Colors.white,
//                             ),
//                           ),
//                           const SizedBox(height: 4),
//                           Text(
//                             link['url']!,
//                             style: TextStyle(
//                               color: Colors.blue.shade400,
//                               fontSize: 14,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 10, right: 10),
//                       child: Container(
//                         padding: const EdgeInsets.only(left: 4),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20),
//                           boxShadow: [
//                             BoxShadow(
//                               color: const Color(0XFF0e0a32),
//                               blurRadius: 10,
//                               offset: const Offset(0, 2),
//                             ),
//                           ],
//                         ),
//                         child: Container(
//                           padding: const EdgeInsets.only(
//                               left: 12, right: 12, top: 10, bottom: 10),
//                           decoration: BoxDecoration(
//                             color: const Color(0XFF0e0a32),
//                             borderRadius: BorderRadius.circular(12),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: const Color(0XFF0e0a32),
//                                 blurRadius: 10,
//                                 offset: const Offset(0, 2),
//                               ),
//                             ],
//                           ),
//                           child: Row(
//                             children: [
//                               Image.asset(
//                                 "assets/icons/location_icon.png",
//                                 height: 28,
//                                 width: 28,
//                               ),
//                               const SizedBox(width: 12),
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       link['title']!,
//                                       style: const TextStyle(
//                                         fontWeight: FontWeight.w600,
//                                         fontSize: 16,
//                                       ),
//                                     ),
//                                     const SizedBox(height: 4),
//                                     Text(
//                                       link['url']!,
//                                       style: TextStyle(
//                                         color: Colors.blue.shade400,
//                                         fontSize: 14,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               // Optional open link icon
//                               // IconButton(
//                               //   icon: Icon(Icons.open_in_new, color: Colors.grey.shade600),
//                               //   onPressed: () {},
//                               // ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

