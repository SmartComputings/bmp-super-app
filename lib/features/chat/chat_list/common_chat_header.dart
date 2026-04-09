// import 'package:bmp/shared/utils/percentage_size_ext.dart';
// import 'package:flutter/material.dart';
// import 'package:bmp/features/chat/chat_list/chat_list.dart';
// import 'package:bmp/features/chat/chat_list/chat_list_header.dart';

// class CommonChatHeader extends StatelessWidget {
//   final ChatListController? controller;
//   final String? title;
//   final bool showSearchBar;
//   final bool showHeader;
//   final Widget? customContent;

//   const CommonChatHeader({
//     super.key,
//     this.controller,
//     this.title,
//     this.showSearchBar = true,
//     this.showHeader = true,
//     this.customContent,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     final theme = Theme.of(context);

//     return Container(
//       padding: EdgeInsets.symmetric(
//         horizontal: screenWidth * 0.02,
//         vertical: screenHeight * 0.015,
//       ),
//       margin: EdgeInsets.symmetric(horizontal: context.percentWidth * 3.5),
//       decoration: BoxDecoration(
//         color: const Color(0xFF131EBF),
//         borderRadius: BorderRadius.circular(screenWidth * 0.02),
//       ),
//       child: Column(
//         children: [
//           if (showHeader && controller != null && !controller!.isSearchMode)
//             ChatListHeader(controller: controller!),
//           if (showSearchBar && controller != null)
//             _SearchBarDelegate(
//               controller: controller!,
//               theme: theme,
//             ).build(context, 0, false),
//           if (customContent != null) customContent!,
//           if (title != null && !showSearchBar)
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 title!,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

// class _SearchBarDelegate extends SliverPersistentHeaderDelegate {
//   final ChatListController controller;
//   final ThemeData theme;

//   _SearchBarDelegate({
//     required this.controller,
//     required this.theme,
//   });

//   @override
//   double get minExtent => controller.isSearchMode ? 64.0 : 72.0;

//   @override
//   double get maxExtent => controller.isSearchMode ? 64.0 : 72.0;

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return TextField(
//       controller: controller.searchController,
//       focusNode: controller.searchFocusNode,
//       textInputAction: TextInputAction.search,
//       textAlignVertical: TextAlignVertical.center,
//       style: const TextStyle(
//         fontSize: 15,
//         color: Colors.white,
//         height: 1.2,
//       ),
//       onChanged: (text) => controller.onSearchEnter(
//         text,
//         globalSearch: true,
//       ),
//       onTap: () {
//         if (!controller.isSearchMode) {
//           controller.startSearch();
//         }
//       },
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: const Color(0xFF05092680).withOpacity(0.8),
//         border: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.white.withOpacity(0.2),
//             width: 1,
//           ),
//           borderRadius: BorderRadius.circular(25),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.white.withOpacity(0.2),
//             width: 1,
//           ),
//           borderRadius: BorderRadius.circular(25),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: const Color(0xFF4A5BF6),
//             width: 1,
//           ),
//           borderRadius: BorderRadius.circular(25),
//         ),
//         contentPadding: const EdgeInsets.symmetric(
//           horizontal: 20,
//           vertical: 14,
//         ),
//         hintText: 'Search',
//         hintStyle: TextStyle(
//           color: Colors.white.withOpacity(0.6),
//           fontSize: 16,
//           fontWeight: FontWeight.normal,
//         ),
//         prefixIcon: controller.isSearchMode
//             ? IconButton(
//                 icon: const Icon(Icons.arrow_back),
//                 onPressed: controller.cancelSearch,
//                 color: Colors.white.withOpacity(0.7),
//               )
//             : Icon(
//                 Icons.search_rounded,
//                 color: Colors.white.withOpacity(0.7),
//                 size: 22,
//               ),
//         suffixIcon: controller.searchController.text.isNotEmpty
//             ? controller.isSearching
//                 ? Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: SizedBox(
//                       width: 20,
//                       height: 20,
//                       child: CircularProgressIndicator(
//                         strokeWidth: 2,
//                         valueColor: AlwaysStoppedAnimation<Color>(
//                           const Color(0xFF4A5BF6),
//                         ),
//                       ),
//                     ),
//                   )
//                 : IconButton(
//                     icon: Icon(
//                       Icons.clear_rounded,
//                       color: Colors.white.withOpacity(0.7),
//                       size: 20,
//                     ),
//                     onPressed: controller.cancelSearch,
//                     splashRadius: 20,
//                   )
//             : null,
//       ),
//     );
//   }

//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
//     return true;
//   }
// }
