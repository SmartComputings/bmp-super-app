// import 'package:bmp/core/localization/l10n.dart';
// import 'package:bmp/shared/widgets/keyboard_dismissible_popscope.dart';
// import 'package:bmp/shared/widgets/matrix.dart';
// import 'package:bmp/shared/widgets/qr_code_viewer.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:matrix/matrix.dart';
// import 'package:pretty_qr_code/pretty_qr_code.dart';

// class StartNewChatScreen extends StatefulWidget {
//   const StartNewChatScreen({super.key});

//   @override
//   State<StartNewChatScreen> createState() => _StartNewChatScreenState();
// }

// class _StartNewChatScreenState extends State<StartNewChatScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   final FocusNode _searchFocusNode = FocusNode();
//   Future<List<Profile>>? _searchResponse;

//   @override
//   void dispose() {
//     _searchController.dispose();
//     _searchFocusNode.dispose();
//     super.dispose();
//   }

//   void _searchUsers([String? query]) async {
//     final client = Matrix.of(context).client;
//     final searchQuery = query ?? _searchController.text.trim();
    
//     if (searchQuery.isEmpty) {
//       setState(() {
//         _searchResponse = null;
//       });
//       return;
//     }

//     setState(() {
//       _searchResponse = client.searchUserDirectory(searchQuery, limit: 20).then((response) => response.results);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final client = Matrix.of(context).client;
//     final userId = client.userID!;
//     final theme = Theme.of(context);

//     return KeyboardDismissiblePopScope(
//       focusNodes: [_searchFocusNode],
//       child: Opacity(
//         opacity: 0.96,
//         child: Container(
//           width: 402,
//           height: 874,
//           clipBehavior: Clip.antiAlias,
//           decoration: const BoxDecoration(
//             color: Color(0xFF1B1C30),
//           ),
//           child: Stack(
//             children: [
//               // Background circles
//               Positioned(
//                 left: -31,
//                 top: 257,
//                 child: SizedBox(
//                   width: 441,
//                   height: 436,
//                   child: Stack(
//                     children: [
//                       Positioned(
//                         left: -133,
//                         top: -341,
//                         child: Opacity(
//                           opacity: 0.70,
//                           child: SizedBox(
//                             width: 707.60,
//                             height: 1117,
//                             child: Stack(
//                               children: [
//                                 Positioned(
//                                   left: 85,
//                                   top: 220,
//                                   child: Container(
//                                     width: 539,
//                                     height: 589,
//                                     decoration: const ShapeDecoration(
//                                       color: Color(0x994754FF),
//                                       shape: OvalBorder(side: BorderSide(width: 1)),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: -8,
//                 top: 349,
//                 child: Container(
//                   width: 446,
//                   height: 446,
//                   decoration: const ShapeDecoration(
//                     color: Color(0x994754FF),
//                     shape: OvalBorder(),
//                   ),
//                 ),
//               ),
              
//               // Main content
//               Positioned(
//                 left: 14,
//                 top: 50,
//                 child: SizedBox(
//                   width: 374,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       const SizedBox(height: 10),
                      
//                       // Search header
//                       Container(
//                         width: 402,
//                         padding: const EdgeInsets.only(
//                           top: 10,
//                           left: 10,
//                           right: 10,
//                           bottom: 16,
//                         ),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               width: double.infinity,
//                               padding: const EdgeInsets.all(16),
//                               clipBehavior: Clip.antiAlias,
//                               decoration: const ShapeDecoration(
//                                 color: Color(0x7F131EBF),
//                                 shape: RoundedRectangleBorder(
//                                   side: BorderSide(
//                                     width: 1,
//                                     color: Color(0xFF131EBF),
//                                   ),
//                                   borderRadius: BorderRadius.all(Radius.circular(18)),
//                                 ),
//                               ),
//                               child: Stack(
//                                 children: [
//                                   Positioned(
//                                     left: 0,
//                                     top: 0,
//                                     child: Container(
//                                       width: 382,
//                                       height: 136,
//                                       decoration: const ShapeDecoration(
//                                         color: Color(0xFF2A2F35),
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.all(Radius.circular(17)),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Column(
//                                     children: [
//                                       // Header
//                                       SizedBox(
//                                         width: double.infinity,
//                                         height: 40,
//                                         child: Stack(
//                                           children: [
//                                             Positioned(
//                                               left: 0,
//                                               top: 0,
//                                               child: GestureDetector(
//                                                 onTap: () => context.pop(),
//                                                 child: const SizedBox(
//                                                   width: 40,
//                                                   height: 40,
//                                                   child: Icon(Icons.arrow_back, color: Colors.white),
//                                                 ),
//                                               ),
//                                             ),
//                                              Positioned(
//                                               left: 116,
//                                               top: 10,
//                                               child: Text(
//                                                 L10n.of(context).newMessage,
//                                                 textAlign: TextAlign.center,
//                                                 style: const TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 16,
//                                                   fontFamily: 'Neometric',
//                                                   fontWeight: FontWeight.w600,
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
                                      
//                                       const SizedBox(height: 16),
                                      
//                                       // Search field
//                                       Container(
//                                         width: double.infinity,
//                                         height: 48,
//                                         padding: const EdgeInsets.symmetric(horizontal: 16),
//                                         decoration: const ShapeDecoration(
//                                           color: Color(0x7F050926),
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius: BorderRadius.all(Radius.circular(100)),
//                                           ),
//                                         ),
//                                         child: Row(
//                                           mainAxisSize: MainAxisSize.min,
//                                           mainAxisAlignment: MainAxisAlignment.center,
//                                           crossAxisAlignment: CrossAxisAlignment.center,
//                                           children: [
//                                             const Icon(Icons.search, color: Colors.white, size: 16),
//                                             const SizedBox(width: 10),
//                                             Expanded(
//                                               child: TextField(
//                                                 controller: _searchController,
//                                                 focusNode: _searchFocusNode,
//                                                 onChanged: _searchUsers,
//                                                 style: const TextStyle(color: Colors.white),
//                                                 decoration: InputDecoration(
//                                                   hintText: L10n.of(context).searchUsers,
//                                                   hintStyle: TextStyle(
//                                                     color: Colors.white.withValues(alpha: 0.64),
//                                                     fontSize: 14,
//                                                     fontFamily: 'Work Sans',
//                                                     fontWeight: FontWeight.w400,
//                                                   ),
//                                                   border: InputBorder.none,
//                                                   contentPadding: EdgeInsets.zero,
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
                      
//                       const SizedBox(height: 10),
                      
//                       // Content based on search state
//                       _searchResponse == null
//                           ? _buildDefaultView(context, userId, theme)
//                           : _buildSearchResults(context, theme),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildDefaultView(BuildContext context, String userId, ThemeData theme) {
//     return Column(
//       children: [
//         // User ID display
//         SizedBox(
//           width: 334,
//           child: Text(
//             L10n.of(context).yourGlobalUsernameIs(userId.split(':')[0].substring(1)),
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               color: Color(0xFFC6D4DB),
//               fontSize: 14,
//               fontFamily: 'Work Sans',
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//         ),
        
//         const SizedBox(height: 20),
        
//         // Invitation link
//         _buildActionItem(
//           color: const Color(0xFF3976F8),
//           title: L10n.of(context).invitationLink,
//           subtitle: L10n.of(context).sendLinkToChat,
//           onTap: () {}, // TODO: Implement invite link
//         ),
        
//         const SizedBox(height: 20),
        
//         // Create Group
//         _buildActionItem(
//           color: const Color(0xFF5F18BF),
//           title: L10n.of(context).createGroup,
//           subtitle: L10n.of(context).createGroupChat,
//           onTap: () => context.go('/mainMenuScreen/rooms/newgroup'),
//         ),
        
//         const SizedBox(height: 20),
        
//         // Scan QR
//         _buildActionItem(
//           color: const Color(0xFFEF5DA8),
//           shadowColor: const Color(0xFFA912BF),
//           title: L10n.of(context).scanQRCode,
//           subtitle: L10n.of(context).scanQRCodeDescription,
//           onTap: () {}, // TODO: Implement QR scanner
//         ),
        
//         const SizedBox(height: 30),
        
//         // QR Code display
//         GestureDetector(
//           onTap: () => showQrCodeViewer(context, userId),
//           child: Container(
//             width: 233,
//             height: 233,
//             clipBehavior: Clip.antiAlias,
//             decoration: const ShapeDecoration(
//               color: Color(0xFF1B1C30),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(25)),
//               ),
//             ),
//             child: Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(16),
//                 border: Border.all(color: const Color(0xFF5F18BF), width: 3),
//               ),
//               child: PrettyQrView.data(
//                 data: 'https://server.be-mindpower.net/#/$userId',
//                 decoration: PrettyQrDecoration(
//                   shape: PrettyQrSmoothSymbol(
//                     roundFactor: 1,
//                     color: const Color(0xFF5F18BF),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
  
//   Widget _buildActionItem({
//     required Color color,
//     Color? shadowColor,
//     required String title,
//     required String subtitle,
//     required VoidCallback onTap,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Column(
//         children: [
//           Container(
//             width: 79.30,
//             height: 97.50,
//             padding: const EdgeInsets.symmetric(horizontal: 2.60),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   width: 70.20,
//                   height: 70.20,
//                   decoration: ShapeDecoration(
//                     color: color,
//                     shape: const RoundedRectangleBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(1300)),
//                     ),
//                     shadows: [
//                       BoxShadow(
//                         color: shadowColor ?? color,
//                         blurRadius: 20.80,
//                         offset: const Offset(0, 0),
//                         spreadRadius: 0,
//                       ),
//                     ],
//                   ),
//                   child: const Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       // Icon placeholder
//                       SizedBox(
//                         width: 33.80,
//                         height: 33.80,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Text(
//             title,
//             style: const TextStyle(
//               color: Color(0xFFFCFCFC),
//               fontSize: 16,
//               fontFamily: 'Montserrat',
//               fontWeight: FontWeight.w700,
//             ),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             subtitle,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 12,
//               fontFamily: 'Poppins',
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSearchResults(BuildContext context, ThemeData theme) {
//     return Expanded(
//       child: FutureBuilder<List<Profile>>(
//         future: _searchResponse,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator(color: Colors.white));
//           }
          
//           if (snapshot.hasError) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Icon(Icons.error, color: Colors.red, size: 64),
//                   const SizedBox(height: 16),
//                   Text(
//                     L10n.of(context).errorSearchingUsers,
//                     style: const TextStyle(color: Colors.white),
//                   ),
//                   const SizedBox(height: 16),
//                   ElevatedButton(
//                     onPressed: () => _searchUsers(),
//                     child: Text(L10n.of(context).tryAgain),
//                   ),
//                 ],
//               ),
//             );
//           }
          
//           final results = snapshot.data ?? [];
          
//           if (results.isEmpty) {
//             return  Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Icon(Icons.search_off, color: Colors.white54, size: 64),
//                   const SizedBox(height: 16),
//                   Text(
//                     L10n.of(context).noUsersFound,
//                     style: const TextStyle(color: Colors.white),
//                   ),
//                 ],
//               ),
//             );
//           }
          
//           return ListView.builder(
//             itemCount: results.length,
//             itemBuilder: (context, index) {
//               final user = results[index];
//               return Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//                 decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: ListTile(
//                   leading: CircleAvatar(
//                     backgroundColor: const Color(0xFF5F18BF),
//                     child: Text(
//                       (user.displayName ?? user.userId).substring(0, 1).toUpperCase(),
//                       style: const TextStyle(color: Colors.white),
//                     ),
//                   ),
//                   title: Text(
//                     user.displayName ?? user.userId.split(':')[0].substring(1),
//                     style: const TextStyle(color: Colors.white),
//                   ),
//                   subtitle: Text(
//                     '@${user.userId.split(':')[0].substring(1)}',
//                     style: TextStyle(color: Colors.white.withOpacity(0.7)),
//                   ),
//                   onTap: () {
//                     // TODO: Start chat with user
//                     context.pop();
//                   },
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }


// }
