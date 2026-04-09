import 'dart:ui';

import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/chat/new_group/widgets/contact_item.dart';
import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/bg_gradient_theme.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/constants/position_constants.dart';
import 'package:bmp/shared/widgets/keyboard_dismissible_popscope.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';

import '../../../shared/utils/app_loading_widget.dart';

enum ActiveFilter {
  allContacts,
  recentContacts,
  groups,
}

class AddContactGroup extends StatefulWidget {
  final List<Room>? preSelectedRooms;
  final Set<String>? excludeUserIds;

  const AddContactGroup({super.key, this.preSelectedRooms, this.excludeUserIds});

  @override
  State<AddContactGroup> createState() => _AddContactGroupState();
}

class _AddContactGroupState extends State<AddContactGroup> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  List<Room> _allRooms = [];
  List<Room> _filteredRooms = [];
  final List<Room> _selectedRooms = [];
  bool _loading = true;
  ActiveFilter _activeFilter = ActiveFilter.allContacts;

  @override
  void initState() {
    super.initState();
    if (widget.preSelectedRooms != null) {
      _selectedRooms.addAll(widget.preSelectedRooms!);
    }
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
    final excludeIds = widget.excludeUserIds;
    var rooms = client.rooms
        .where(
          (room) => room.isDirectChat && room.membership == Membership.join,
        )
        .toList();

    // Filter out contacts whose user IDs are in the exclude set
    if (excludeIds != null && excludeIds.isNotEmpty) {
      rooms = rooms.where((room) {
        final directChatMatrixId = room.directChatMatrixID;
        return directChatMatrixId == null || !excludeIds.contains(directChatMatrixId);
      }).toList();
    }

    setState(() {
      _allRooms = rooms;
      _filteredRooms = rooms;
      _loading = false;
    });
  }

  void _filterContacts(String query) {
    setState(() {
      var rooms = _allRooms;

      switch (_activeFilter) {
        case ActiveFilter.allContacts:
          rooms = _allRooms;
          break;
        case ActiveFilter.recentContacts:
          rooms = _allRooms.where((room) => room.isUnread).toList();
          break;
        case ActiveFilter.groups:
          rooms = [];
          break;
      }

      if (query.isEmpty) {
        _filteredRooms = rooms;
      } else {
        _filteredRooms = rooms
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

  void _applyFilter() {
    _filterContacts(_searchController.text);
  }

  void _toggleContact(String roomId) {
    setState(() {
      final room = _allRooms.firstWhere((r) => r.id == roomId);
      if (_selectedRooms.any((r) => r.id == roomId)) {
        _selectedRooms.removeWhere((r) => r.id == roomId);
      } else {
        _selectedRooms.add(room);
      }
    });
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
            Positioned.fill(
              child: Container(
                color: const Color(0xFF1B1C30),
              ),
            ),
            BgGradientTheme(
              position: ShapePosition.center,
              width: context.screenWidth * 1.8,
              height: context.screenHeight * 0.85,
              color: const Color(0xFF4754FF),
              opacity: 0.6,
            ),
            BgGradientTheme(
              position: ShapePosition.center,
              width: context.screenWidth * 0.65,
              height: context.screenHeight * 0.7,
              color: const Color(0xFF4754FF),
              opacity: 0.8,
            ),
            BgGradientTheme(
              position: ShapePosition.bottomRight,
              height: context.screenHeight * 0.33,
              width: context.screenWidth * 0.65,
              colors: const [Color(0xFF1B1C30), Color(0xFFA912BF)],
              opacity: 0.9,
            ),
            BgGradientTheme(
              position: ShapePosition.center,
              width: context.screenWidth * 0.65,
              height: context.screenHeight * 0.65,
              color: const Color(0xFF4754FF),
              opacity: 0.8,
            ),
            BgGradientTheme(
              position: ShapePosition.bottomLeft,
              height: context.screenHeight * 0.25,
              width: context.screenWidth * 0.2,
              color: const Color.fromARGB(255, 0, 0, 0),
              opacity: 0.8,
            ),
            BgGradientTheme(
              position: ShapePosition.bottomRight,
              height: context.screenHeight * 0.19,
              color: const Color(0xFF1B1C30),
              opacity: 0.8,
            ),
            BgGradientTheme(
              position: ShapePosition.bottomCenter,
              height: context.screenHeight * 0.12,
              color: const Color(0xFF1B1C30),
              opacity: 0.8,
            ),
            BgGradientTheme(
              position: ShapePosition.topLeft,
              width: context.screenWidth * 0.4,
              height: context.screenHeight * 0.25,
              color: Colors.black,
              opacity: 0.5,
            ),
            BgGradientTheme(
              position: ShapePosition.topRight,
              width: context.screenWidth * 0.4,
              height: context.screenHeight * 0.25,
              color: Colors.black,
              opacity: 0.5,
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 85, sigmaY: 85),
                child: Container(color: Colors.transparent),
              ),
            ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 85, sigmaY: 85),
              child: Container(color: Colors.transparent),
            ),
          ),
          // Positioned.fill(
          //   child: Opacity(
          //     opacity: 0.6,
          //     child: Image.asset(
          //       'assets/chat_icons/patron 1.png',
          //       fit: BoxFit.cover,
          //       color: const Color(0xFF7216BF),
          //       colorBlendMode: BlendMode.modulate,
          //     ),
          //   ),
          // ),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.all(16),
                  clipBehavior: Clip.antiAlias,
                  decoration: const ShapeDecoration(
                    color: Color(0x7FA912BF),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFA912BF)),
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
                              L10n.of(context).addContacts,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0xFFFCFCFC),
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
                          ?  Center(
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
                                // final isEven = index % 2 == 0;
                                final isSelected =
                                    _selectedRooms.any((r) => r.id == room.id);
                                return buildContactItem(
                                  context,
                                  room,
                                  isSelected,
                                  () => _toggleContact(room.id),
                                );
                              },
                            ),
                ),
                if (_selectedRooms.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 101,
                      vertical: 20,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(_selectedRooms);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3976F8),
                        minimumSize: const Size(200, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child:  Text(
                        L10n.of(context).done,
                        style: const TextStyle(
                          color: Color(0xFFFCFCFC),
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    ),
    );
  }

  Widget _buildFilterMenu() {
    return PopupMenuButton<ActiveFilter>(
      color: const Color(0xF2252844),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      position: PopupMenuPosition.under,
      offset: const Offset(0, 8),
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
              fontFamily: 'Work Sans',
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
                          color: Color(0xFF170328),
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
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
