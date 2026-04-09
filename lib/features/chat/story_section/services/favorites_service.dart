import 'package:matrix/matrix.dart';

class FavoritesService {
  static const String _accountDataType = 'm.favorites';
  
  final Client client;
  
  FavoritesService(this.client);
  
  /// Add a message to favorites
  Future<void> addFavorite(String roomId, String eventId) async {
    final favorites = await getFavorites();
    
    // Check if already favorited
    if (favorites.any((fav) => fav['event_id'] == eventId)) {
      return;
    }
    
    favorites.add({
      'room_id': roomId,
      'event_id': eventId,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    });
    
    await client.setAccountData(client.userID!, _accountDataType, {
      'favorites': favorites,
    });
  }
  
  /// Remove a message from favorites
  Future<void> removeFavorite(String eventId) async {
    final favorites = await getFavorites();
    favorites.removeWhere((fav) => fav['event_id'] == eventId);
    
    await client.setAccountData(client.userID!, _accountDataType, {
      'favorites': favorites,
    });
  }
  
  /// Get all favorites
  Future<List<Map<String, dynamic>>> getFavorites() async {
    try {
      final accountData = await client.getAccountData(client.userID!, _accountDataType);
      if (accountData != null && accountData['favorites'] is List) {
        final favoritesList = accountData['favorites'] as List;
        return List<Map<String, dynamic>>.from(favoritesList);
      }
    } catch (e) {
      // No favorites found or error
    }
    return [];
  }
  
  /// Check if a message is favorited
  Future<bool> isFavorited(String eventId) async {
    final favorites = await getFavorites();
    return favorites.any((fav) => fav['event_id'] == eventId);
  }
}