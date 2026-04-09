import 'package:bmp/features/chat/story_section/services/favorites_service.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/app_loading_widget.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/utils/snackbar.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:flutter/material.dart';

class FavoriteContent extends StatefulWidget {
  final Function() onFavoriteSelected;
  
  const FavoriteContent({super.key, required this.onFavoriteSelected});

  @override
  State<FavoriteContent> createState() => _FavoriteContentState();
}

class _FavoriteContentState extends State<FavoriteContent> {
  late FavoritesService _favoritesService;
  List<Map<String, dynamic>> _favorites = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initFavorites();
  }

  void _initFavorites() async {
    try {
      final client = Matrix.of(context).client;
      _favoritesService = FavoritesService(client);
      await _loadFavorites();
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _loadFavorites() async {
    try {
      final favorites = await _favoritesService.getFavorites();
      
      // Get actual message content for each favorite
      final favoritesWithContent = <Map<String, dynamic>>[];
      
      for (final favorite in favorites) {
        final roomId = favorite['room_id'];
        final eventId = favorite['event_id'];
        
        if (roomId != null && eventId != null) {
          try {
            final client = Matrix.of(context).client;
            final room = client.getRoomById(roomId);
            
            if (room != null) {
              // Try to get the event from the room
              final event = await room.getEventById(eventId);
              
              if (event != null) {
                favoritesWithContent.add({
                  'room_id': roomId,
                  'event_id': eventId,
                  'content': event.body,
                  'room_name': room.displayname,
                  'sender': event.senderFromMemoryOrFallback.displayName ?? event.senderId,
                  'timestamp': favorite['timestamp'],
                });
              }
            }
          } catch (e) {
            // If we can't get the event, add it with basic info
            favoritesWithContent.add({
              'room_id': roomId,
              'event_id': eventId,
              'content': L10n.of(context).messageContentUnavailable,
              'room_name': roomId,
              'sender': L10n.of(context).unknown,
              'timestamp': favorite['timestamp'],
            });
          }
        }
      }
      
      if (mounted) {
        setState(() {
          _favorites = favoritesWithContent;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _removeFavorite(String eventId) async {
    if (eventId.isEmpty) return;
    
    try {
      await _favoritesService.removeFavorite(eventId);
      await _loadFavorites();
     if (mounted) {
  CustomSnackbar.show(
    context,
    title: L10n.of(context).success,
    message: L10n.of(context).removedFromFavorites,
    type: SnackbarType.success,
  );
}
} catch (e) {
  if (mounted) {
    CustomSnackbar.show(
      context,
      title: L10n.of(context).error,
      message: '${L10n.of(context).error} ${e.toString()}',
      type: SnackbarType.error,
    );
  
}

    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: context.screenHeight * 0.4275,
            padding: EdgeInsets.all(context.screenWidth * 0.015),
            decoration: ShapeDecoration(
              color: const Color(0x33858188),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(context.screenWidth * 0.045),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                 Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    L10n.of(context).favorites,
                    style: const TextStyle(
                      color: Color(0xFFA8A6A5),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                
                // Favorites list
                Expanded(
                  child: _isLoading
                      ? const Center(child: AppLoadingWidget())
                      : _favorites.isEmpty
                          ? Center(
                              child: Text(
                                L10n.of(context).noFavoritesYet,
                                style: const TextStyle(
                                  color: Colors.white54,
                                  fontSize: 14,
                                ),
                              ),
                            )
                          : ListView.builder(
                              itemCount: _favorites.length,
                              itemBuilder: (context, index) {
                                final favorite = _favorites[index];
                                final content = favorite['content']?.toString() ?? L10n.of(context).favoriteMessage;
                                final roomName = favorite['room_name']?.toString() ?? L10n.of(context).unknownRoom;
                                final sender = favorite['sender']?.toString() ?? L10n.of(context).unknown;
                                final eventId = favorite['event_id']?.toString() ?? '';
                                
                                return Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                                  decoration: BoxDecoration(
                                    color: const Color(0xCC000000),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: ListTile(
                                    leading: Container(
                                      width: 28,
                                      height: 28,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFFFD700),
                                        borderRadius: BorderRadius.all(Radius.circular(6)),
                                      ),
                                      child: const Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    ),
                                    title: Text(
                                      content,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    subtitle: Text(
                                      '$sender • $roomName',
                                      style: const TextStyle(
                                        color: Colors.white54,
                                        fontSize: 12,
                                      ),
                                    ),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.delete, color: Colors.red, size: 20),
                                      onPressed: () => _removeFavorite(eventId),
                                    ),
                                  ),
                                );
                              },
                            ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}