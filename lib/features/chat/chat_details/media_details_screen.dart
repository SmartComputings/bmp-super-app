// import 'package:flutter/material.dart';

// class MediaTabWidget extends StatelessWidget {
//   const MediaTabWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return _buildMediaTab();
//   }

//   Widget _buildMediaTab() {
//     final mediaItems = [
//       'https://images.unsplash.com/photo-1497366216548-37526070297c?w=400',
//       'https://images.unsplash.com/photo-1497366811353-6870744d04b2?w=400',
//       'https://images.unsplash.com/photo-1542744173-8e7e53415bb0?w=400',
//       'https://images.unsplash.com/photo-1522071820081-009f0129c71c?w=400',
//       'https://images.unsplash.com/photo-1497215728101-856f4ea42174?w=400',
//       'https://images.unsplash.com/photo-1524758631624-e2822e304c36?w=400',
//       'https://images.unsplash.com/photo-1497366754035-f200968a6e72?w=400',
//       'https://images.unsplash.com/photo-1531973576160-7125cd663d86?w=400',
//       'https://images.unsplash.com/photo-1556761175-b413da4baf72?w=400',
//       'https://images.unsplash.com/photo-1553877522-43269d4ea984?w=400',
//       'https://images.unsplash.com/photo-1497366412874-3415097a27e7?w=400',
//       'https://images.unsplash.com/photo-1504384308090-c894fdcc538d?w=400',
//       'https://images.unsplash.com/photo-1557804506-669a67965ba0?w=400',
//       'https://images.unsplash.com/photo-1519389950473-47ba0277781c?w=400',
//       'https://images.unsplash.com/photo-1497032628192-86f99bcd76bc?w=400',
//       'https://images.unsplash.com/photo-1547480053-7d174f67b557?w=400',
//     ];

//     return Padding(
//       padding: const EdgeInsets.only(left: 6, right: 6, top: 16),
//       child: Container(
//         decoration: BoxDecoration(
//           color: const Color(0xff1F252D),
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: GridView.builder(
//           padding: const EdgeInsets.all(6),
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 4,
//             crossAxisSpacing: 8,
//             mainAxisSpacing: 8,
//           ),
//           itemCount: mediaItems.length,
//           itemBuilder: (context, index) {
//             return ClipRRect(
//               borderRadius: BorderRadius.circular(8),
//               child: Image.network(
//                 mediaItems[index],
//                 fit: BoxFit.cover,
//                 loadingBuilder: (context, child, loadingProgress) {
//                   if (loadingProgress == null) return child;
//                   return Container(
//                     color: Colors.grey.shade300,
//                     child: const Center(
//                       child: CircularProgressIndicator(strokeWidth: 2),
//                     ),
//                   );
//                 },
//                 errorBuilder: (context, error, stackTrace) {
//                   return Container(
//                     color: Colors.grey.shade300,
//                     child: const Icon(Icons.error),
//                   );
//                 },
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
