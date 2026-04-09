// import 'package:flutter/material.dart';

// class GroupTabWidget extends StatelessWidget {
//   const GroupTabWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return _buildGroupTab();
//   }

//   Widget _buildGroupTab() {
//     final chats = [
//       {
//         'name': 'Chitzy Team',
//         'message': 'Floyd : Good luck team! 🔥',
//         'time': '09:30',
//         'unread': 1,
//       },
//     ];

//     return ListView.builder(
//       padding: const EdgeInsets.only(left: 6, right: 6, top: 16),
//       itemCount: chats.length,
//       itemBuilder: (context, index) {
//         final chat = chats[index];
//         return Container(
//           decoration: BoxDecoration(
//             color: const Color(0xff1F252D),
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(6.0),
//             child: Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: const Color(0XFF222588),
//                 borderRadius: BorderRadius.circular(16),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.05),
//                     blurRadius: 10,
//                     offset: const Offset(0, 2),
//                   ),
//                 ],
//               ),
//               child: Row(
//                 children: [
//                   Image.asset(
//                     "assets/icons/Profile_image.png",
//                     height: 48,
//                     width: 48,
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           chat['name'].toString(),
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 14,
//                             color: Color(0xffF3F7F8),
//                           ),
//                         ),
//                         const SizedBox(height: 4),
//                         Text(
//                           chat['message'].toString(),
//                           style: const TextStyle(
//                             color: Color(0xffF3F7F8),
//                             fontSize: 14,
//                           ),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ],
//                     ),
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Text(
//                         chat['time'].toString(),
//                         style: const TextStyle(
//                           color: Color(0xffC6D4DB),
//                           fontSize: 12,
//                         ),
//                       ),
//                       if ((chat['unread'] as int) > 0) ...[
//                         const SizedBox(height: 4),
//                         Container(
//                           padding: const EdgeInsets.all(6),
//                           decoration: BoxDecoration(
//                             color: Colors.blue.shade600,
//                             shape: BoxShape.circle,
//                           ),
//                           child: Text(
//                             '${chat['unread']}',
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 12,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
