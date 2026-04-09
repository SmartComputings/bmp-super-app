import 'dart:ui';

import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/chat/contacts_screen/process_chat_screen.dart';
import 'package:bmp/shared/utils/app_loading_widget.dart';
import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/bg_gradient_theme.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/constants/position_constants.dart';
import 'package:bmp/shared/widgets/avatar.dart';
import 'package:bmp/shared/widgets/keyboard_dismissible_popscope.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

enum ActiveFilter {
  allContacts,
  recentContacts,
  groups,
}

class _ContactsScreenState extends State<ContactsScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  List<Room> _allRooms = [];
  List<Room> _filteredRooms = [];
  bool _loading = true;
  ActiveFilter _activeFilter = ActiveFilter.allContacts;

  @override
  void initState() {
    super.initState();
    _loadContacts();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  Future<void> _loadContacts() async {
    final client = Matrix.of(context).client;
    final rooms = client.rooms
        .where(
          (room) => room.membership == Membership.join,
        )
        .toList();
    setState(() {
      _allRooms = rooms;
      _filteredRooms = rooms;
      _loading = false;
    });
  }

  void _filterContacts(String query) {
    setState(() {
      List<Room> baseRooms = _allRooms;
      
      // Apply active filter first
      switch (_activeFilter) {
        case ActiveFilter.allContacts:
          baseRooms = _allRooms;
          break;
        case ActiveFilter.recentContacts:
          baseRooms = _allRooms.where((room) => room.isUnread).toList();
          break;
        case ActiveFilter.groups:
          baseRooms = _allRooms.where((room) => !room.isDirectChat).toList();
          break;
      }
      
      // Then apply search query
      if (query.isEmpty) {
        _filteredRooms = baseRooms;
      } else {
        _filteredRooms = baseRooms
            .where(
              (room) => room
                  .getLocalizedDisplayname()
                  .toLowerCase()
                  .contains(query.toLowerCase()),
            )
            .toList();
      }
    });
  }

  String _getFilterTitle() {
    switch (_activeFilter) {
      case ActiveFilter.allContacts:
        return L10n.of(context).allContacts;
      case ActiveFilter.recentContacts:
        return L10n.of(context).recentContacts;
      case ActiveFilter.groups:
        return L10n.of(context).group;
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissiblePopScope(
      focusNodes: [_searchFocusNode],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Positioned.fill(
              child: Container(color: const Color(0xFF1B1C30)),
            ),
            const BgGradientTheme(
              position: ShapePosition.center,
              width: 681,
              height: 681,
              color: Color(0xFF4754FF),
              opacity: 0.6,
            ),
            const BgGradientTheme(
              position: ShapePosition.bottomFull,
              height: 300,
              colors: [Color(0xFF1B1C30), Color(0xFFA912BF)],
              opacity: 0.8,
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 85, sigmaY: 85),
                child: Container(color: Colors.transparent),
              ),
            ),
            Positioned.fill(
              child: Opacity(
                opacity: 0.6,
                child: Image.asset(
                  'assets/chat_icons/patron 1.png',
                  fit: BoxFit.cover,
                  color: const Color(0xFF7216BF),
                  colorBlendMode: BlendMode.modulate,
                ),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.all(16),
                    clipBehavior: Clip.antiAlias,
                    decoration: const ShapeDecoration(
                      color: Color(0x7F131EBF),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFF131EBF)),
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: Image.asset(
                                ImageAssets.arrowLeft,
                                height: 40,
                                width: 40,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                L10n.of(context).newMessage,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Neometric',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(width: 40),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Container(
                          height: 48,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: ShapeDecoration(
                            color: const Color(0x7F050926),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/icons/search-normal (1).png',
                                width: 16,
                                height: 16,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  controller: _searchController,
                                  focusNode: _searchFocusNode,
                                  onChanged: _filterContacts,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: L10n.of(context).searchContact,
                                    hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.64),
                                      fontSize: 14,
                                      fontFamily: 'Work Sans',
                                      fontWeight: FontWeight.w400,
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.zero,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _getFilterTitle(),
                          style: const TextStyle(
                            color: Color(0xFFF3F7F8),
                            fontSize: 16,
                            fontFamily: 'Neometric',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        _buildFilterMenu(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: _loading
                        ? AppLoadingWidget()
                        : _filteredRooms.isEmpty
                            ? Center(
                                child: Text(
                                  L10n.of(context).noContactsFound,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Work Sans',
                                  ),
                                ),
                              )
                            : ListView.builder(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                itemCount: _filteredRooms.length,
                                itemBuilder: (context, index) {
                                  final room = _filteredRooms[index];
                                  final isEven = index % 2 == 0;
                                  return _buildContactItem(room, isEven);
                                },
                              ),
                  ),
                ],
              ),
            ),
          ],
        ),
        //  bottomNavigationBar: Container(
        //     margin: EdgeInsets.fromLTRB(
        //       screenWidth * 0.05,
        //       0,
        //       screenWidth * 0.05,
        //       20,
        //     ),
        //     child: Stack(
        //       clipBehavior: Clip.none,
        //       children: [
        //         Container(
        //           height: screenHeight * 0.075,
        //           decoration: BoxDecoration(
        //             color: AppColors.bottomNavBarBg,
        //             borderRadius: BorderRadius.circular(35),
        //             boxShadow: [
        //               BoxShadow(
        //                 color: Colors.black.withOpacity(0.3),
        //                 blurRadius: 15,
        //                 offset: const Offset(0, 5),
        //               ),
        //             ],
        //           ),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //             children: [
        //               GestureDetector(
        //                 onTap: () => context.go('/rooms'),
        //                 child: Row(
        //                   children: [
        //                     Image.asset(
        //                       ImageAssets.chatDetailsMessage,
        //                       width: screenWidth * 0.06,
        //                       height: screenWidth * 0.06,
        //                     ),
        //                     const SizedBox(width: 8),
        //                     const Text(
        //                       'Chats',
        //                       style: TextStyle(
        //                         color: Colors.white54,
        //                         fontSize: 14,
        //                         fontWeight: FontWeight.w400,
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //               const SizedBox(width: 56),
        //               GestureDetector(
        //                 onTap: () {},
        //                 child: Row(
        //                   children: [
        //                     Image.asset(
        //                       ImageAssets.chatcall,
        //                       width: screenWidth * 0.06,
        //                       height: screenWidth * 0.06,
        //                     ),
        //                     const SizedBox(width: 8),
        //                     const Text(
        //                       'Calls',
        //                       style: TextStyle(
        //                         color: Colors.white54,
        //                         fontSize: 14,
        //                         fontWeight: FontWeight.w400,
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //         Positioned(
        //           top: -screenHeight * 0.025,
        //           left: 0,
        //           right: 0,
        //           child: Center(
        //             child: Container(
        //               width: screenHeight * 0.075,
        //               height: screenHeight * 0.075,
        //               decoration: const BoxDecoration(
        //                 shape: BoxShape.circle,
        //                 color: Color(0xFF3976F8),
        //               ),
        //               child: Padding(
        //                 padding: const EdgeInsets.all(15),
        //                 child: Container(
        //                   decoration: BoxDecoration(
        //                     borderRadius: BorderRadius.circular(10),
        //                     color: const Color(0xFF6F8DA1),
        //                   ),
        //                   child: const Icon(Icons.add, color: Colors.white, size: 25),
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
      ),
    );
  }

  Widget _buildFilterMenu() {
    return PopupMenuButton<ActiveFilter>(
      color: const Color(0xF2252844),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      position: PopupMenuPosition.under,
      offset: const Offset(0, 8),
      constraints: const BoxConstraints(
        minWidth: 0,
        maxWidth: double.infinity,
      ),
      onSelected: (filter) {
        setState(() {
          _activeFilter = filter;
          _applyFilter();
        });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            ImageAssets.chatDetailsFilter,
            width: 16,
            height: 16,
            color: Colors.white,
          ),
          const SizedBox(width: 6),
          Text(
            L10n.of(context).filter,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      itemBuilder: (context) => [
        _buildFilterMenuItem(ActiveFilter.allContacts, L10n.of(context).allContacts),
        _buildFilterMenuItem(ActiveFilter.recentContacts, L10n.of(context).recentContacts),
        _buildFilterMenuItem(ActiveFilter.groups, L10n.of(context).group),
      ],
    );
  }

  PopupMenuItem<ActiveFilter> _buildFilterMenuItem(
    ActiveFilter filter,
    String title,
  ) {
    final isSelected = _activeFilter == filter;
    return PopupMenuItem(
      value: filter,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color:
                    isSelected ? const Color(0xFF3976F8) : Colors.transparent,
                border: isSelected
                    ? null
                    : Border.all(color: Colors.white, width: 2),
                shape: BoxShape.circle,
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: const Color(0xF2252844),
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? const Color(0xFF3976F8) : Colors.white,
                fontSize: context.percentWidth*4,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _applyFilter() {
    setState(() {
      switch (_activeFilter) {
        case ActiveFilter.allContacts:
          _filteredRooms = _allRooms;
          break;
        case ActiveFilter.recentContacts:
          _filteredRooms = _allRooms.where((room) => room.isUnread).toList();
          break;
        case ActiveFilter.groups:
          _filteredRooms = _allRooms.where((room) => !room.isDirectChat).toList();
          break;
      }
    });
  }

  Widget _buildContactItem(Room room, bool isEven) {
    final displayName = room.getLocalizedDisplayname();
    final avatarUrl = room.avatar;
    final client = Matrix.of(context).client;
    final directChatMatrixID = room.directChatMatrixID;

    return FutureBuilder(
      future: directChatMatrixID != null
          ? client.getPresence(directChatMatrixID)
          : Future.value(null),
      builder: (context, snapshot) {
        String? userStatus;

        if (snapshot.hasData && snapshot.data != null) {
          final presence = snapshot.data!;
          userStatus = presence.statusMsg;
          // print('User displayName: $displayName status: $userStatus');
        }

        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    ProcessChatScreen(contactName: displayName),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 6),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: ShapeDecoration(
              color: isEven
                  ? const Color(0xFF202267)
                  : const Color(0xFF262845).withValues(alpha: 0.95),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            child: Row(
              children: [
                Avatar(
                  mxContent: avatarUrl,
                  name: displayName,
                  size: 48,
                  client: client,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        displayName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      // if (userStatus != null && userStatus.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          userStatus ?? 'Busy',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                            fontFamily: 'Work Sans',
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Widget _buildContactItem(Room room, bool isEven) {
  //   final displayName = room.getLocalizedDisplayname();
  //   final avatarUrl = room.avatar;
  //   final client = Matrix.of(context).client;
  //   final directChatMatrixID = room.directChatMatrixID;
  //   String? userStatus;

  //   if (directChatMatrixID != null) {
  //     final presence = client.presences[directChatMatrixID];
  //     userStatus = presence?.statusMsg;
  //   }

  //   return GestureDetector(
  //     onTap: () {
  //       Navigator.of(context).push(
  //         MaterialPageRoute(
  //           builder: (context) => ProcessChatScreen(contactName: displayName),
  //         ),
  //       );
  //     },
  //     child: Container(
  //       margin: const EdgeInsets.only(bottom: 6),
  //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
  //       decoration: ShapeDecoration(
  //         color: isEven
  //             ? const Color(0xFF202267)
  //             : const Color(0xFF262845).withValues(alpha: 0.95),
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(18),
  //         ),
  //       ),
  //       child: Row(
  //         children: [
  //           Avatar(
  //             mxContent: avatarUrl,
  //             name: displayName,
  //             size: 48,
  //             client: client,
  //           ),
  //           const SizedBox(width: 12),
  //           Expanded(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   displayName,
  //                   style: const TextStyle(
  //                     color: Colors.white,
  //                     fontSize: 16,
  //                     fontFamily: 'Montserrat',
  //                     fontWeight: FontWeight.w700,
  //                   ),
  //                 ),
  //                 if (userStatus != null && userStatus.isNotEmpty)
  //                   Padding(
  //                     padding: const EdgeInsets.only(top: 4),
  //                     child: Text(
  //                       userStatus,
  //                       style: const TextStyle(
  //                         color: Colors.white70,
  //                         fontSize: 12,
  //                         fontFamily: 'Work Sans',
  //                         fontWeight: FontWeight.w400,
  //                       ),
  //                       maxLines: 1,
  //                       overflow: TextOverflow.ellipsis,
  //                     ),
  //                   ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}