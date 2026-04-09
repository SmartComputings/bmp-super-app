import 'package:bmp/features/chat/story_section/services/favorites_service.dart';
import 'package:bmp/shared/utils/app_loading_widget.dart';
import 'package:bmp/shared/utils/snackbar.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/localization/l10n.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late FavoritesService favoritesService;
  List<Map<String, dynamic>> favorites = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    favoritesService = FavoritesService(Matrix.of(context).client);
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    try {
      final favs = await favoritesService.getFavorites();
      setState(() {
        favorites = favs;
        loading = false;
      });
    } catch (e) {
      setState(() {
        loading = false;
      });
    }
  }

Future<void> _removeFavorite(String eventId) async {
  try {
    await favoritesService.removeFavorite(eventId);
    await _loadFavorites(); // Refresh list

    CustomSnackbar.show(
      context,
      title: L10n.of(context).success,
      message: L10n.of(context).removedFromFavorites,
      type: SnackbarType.success,
    );
  } catch (e) {
    CustomSnackbar.show(
      context,
      title: L10n.of(context).error,
      message: '${L10n.of(context).error} ${L10n.of(context).errorWithMessage(e.toString())}',
      type: SnackbarType.error,
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context).favorites),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: loading
          ? AppLoadingWidget()
          : favorites.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.star_border, size: 64, color: Colors.grey),
                      const SizedBox(height: 16),
                      Text(
                        L10n.of(context).noFavoritesYet,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        L10n.of(context).starMessagesToAddFavorites,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: favorites.length,
                  itemBuilder: (context, index) {
                    final favorite = favorites[index];
                    final roomId = favorite['room_id'] as String;
                    final eventId = favorite['event_id'] as String;
                    final timestamp = favorite['timestamp'] as int?;
                    
                    final room = Matrix.of(context).client.getRoomById(roomId);
                    final roomName = room?.getLocalizedDisplayname() ?? L10n.of(context).unknownRoom;
                    
                    return ListTile(
                      leading: const Icon(Icons.star, color: Colors.amber),
                      title: Text(roomName),
                      subtitle: Text(
                        timestamp != null
                            ? DateTime.fromMillisecondsSinceEpoch(timestamp)
                                .toString()
                                .split('.')[0]
                            : L10n.of(context).unknownTime,
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_outline),
                        tooltip: L10n.of(context).delete,
                        onPressed: () => _removeFavorite(eventId),
                      ),
                      onTap: () {
                        // Navigate to the message in chat
                        context.go('/mainMenuScreen/rooms/$roomId?event=$eventId');
                      },
                    );
                  },
                ),
    );
  }
}