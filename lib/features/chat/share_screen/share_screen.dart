import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/auth_onboarding/widgets/UnderlineWidget.dart';
import 'package:bmp/shared/utils/app_loading_widget.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/widgets/keyboard_dismissible_popscope.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';

class ShareScreen extends StatefulWidget {
  const ShareScreen({super.key});

  @override
  State<ShareScreen> createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  List<Room> _allRooms = [];
  List<Room> _filteredRooms = [];
  final Set<String> _selectedRoomIds = {};
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadRooms();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  Future<void> _loadRooms() async {
    final client = Matrix.of(context).client;
    final rooms = client.rooms
        .where((room) =>
            room.canSendDefaultMessages &&
            !room.isSpace &&
            room.membership == Membership.join,)
        .toList();
    setState(() {
      _allRooms = rooms;
      _filteredRooms = rooms;
      _loading = false;
    });
  }

  void _filterRooms(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredRooms = _allRooms;
      } else {
        _filteredRooms = _allRooms
            .where((room) => room
                .getLocalizedDisplayname()
                .toLowerCase()
                .contains(query.toLowerCase()),)
            .toList();
      }
    });
  }

  void _toggleSelection(String roomId) {
    setState(() {
      if (_selectedRoomIds.contains(roomId)) {
        _selectedRoomIds.remove(roomId);
      } else {
        _selectedRoomIds.add(roomId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissiblePopScope(
      focusNodes: [_searchFocusNode],
      child: Scaffold(
      backgroundColor: const Color(0xFF8B8DB8),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.center,
              radius: 1.2,
              colors: [
                Color(0xCC1F267E),
                Color(0x99131EBF),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0x7F7216BF),
                blurRadius: 40,
                offset: Offset(0, -20),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height:context.screenHeight*0.02),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        L10n.of(context).share,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          fontFamily: 'Neometric',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.3),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.close, color: Colors.white, size: 17),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: context.screenWidth*0.88,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: UnderlineWidget(),),),
                       SizedBox(height: context.screenHeight*0.01,), 

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 15),
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                         
                      decoration: BoxDecoration(
                        gradient: const RadialGradient(
                          center: Alignment.center,
                          radius: 1.5,
                          colors: [
                            Color(0xFF7E24F9),
                            Color(0x7F7216BF),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              L10n.of(context).contactSearch,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Work Sans',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              height: 48,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color: const Color(0x7F050926),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Row(
                                children: [
                                  Image.asset("assets/icons/search_icon.png",
                                      height: 16, width: 16,),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: TextField(
                                      controller: _searchController,
                                      focusNode: _searchFocusNode,
                                      onChanged: _filterRooms,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: 'Work Sans',
                                        fontWeight: FontWeight.w400,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: L10n.of(context).search,
                                        hintStyle: const TextStyle(
                                          color: Color.fromRGBO(255, 255, 255, 0.5),
                                          fontSize: 14,
                                          fontFamily: 'Work Sans',
                                          fontWeight: FontWeight.w400,
                                        ),
                                        border: InputBorder.none,
                                        isDense: true,
                                        contentPadding: EdgeInsets.zero,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: context.screenHeight*0.5,
                              child: _loading
                                  ? AppLoadingWidget()
                                  : _filteredRooms.isEmpty
                                      ? Center(
                                          child: Text(
                                            L10n.of(context).noChatsFound,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: 'Work Sans',
                                            ),
                                          ),
                                        )
                                      : ListView.builder(
                                          itemCount: _filteredRooms.length,
                                          itemBuilder: (context, index) {
                                            final room = _filteredRooms[index];
                                            return Padding(
                                              padding: const EdgeInsets.only(bottom: 6),
                                              child: _buildRoomItem(room),
                                            );
                                          },
                                        ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () => Navigator.of(context).pop(),
                                      child: Container(
                                        height: 61,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.white, width: 1),
                                          borderRadius: BorderRadius.circular(24),
                                        ),
                                        child: Center(
                                          child: Text(
                                            L10n.of(context).cancel,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily: 'Work Sans',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 21),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: _selectedRoomIds.isEmpty
                                          ? null
                                          : () {
                                              Navigator.of(context).pop(_selectedRoomIds.toList());
                                            },
                                      child: Container(
                                        height: 61,
                                        decoration: BoxDecoration(
                                          color: _selectedRoomIds.isEmpty
                                              ? const Color(0xff3976F8).withOpacity(0.5)
                                              : const Color(0xFF3976F8),
                                          borderRadius: BorderRadius.circular(24),
                                        ),
                                        child: Center(
                                          child: Text(
                                            _selectedRoomIds.isEmpty 
                                ? L10n.of(context).accept
                                : '${L10n.of(context).accept} (${_selectedRoomIds.length})',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily: 'Work Sans',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),),
                      ),
                
            ),
            ],
            ),
          ),
        ),
      ),),);
    
  }

  Widget _buildRoomItem(Room room) {
    final displayName = room.getLocalizedDisplayname();
    final isSelected = _selectedRoomIds.contains(room.id);
    final avatarUrl = room.avatar;

    Widget avatar;
    if (avatarUrl != null) {
      avatar = Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(avatarUrl.toString()),
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
      final initials = displayName.trim().isNotEmpty
          ? displayName.trim().split(' ').where((s) => s.isNotEmpty).map((s) => s[0]).take(2).join().toUpperCase()
          : '?';
      avatar = Container(
        width: 48,
        height: 48,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromRGBO(255, 255, 255, 0.2),
        ),
        child: Center(
          child: Text(
            initials,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => _toggleSelection(room.id),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xff1F267E).withValues(alpha: 0.32),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            avatar,
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                displayName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFF3976F8)
                    : const Color.fromRGBO(255, 255, 255, 0.2),
                borderRadius: BorderRadius.circular(6),
              ),
              child: isSelected
                  ? const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
