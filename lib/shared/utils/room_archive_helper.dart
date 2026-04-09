import 'package:matrix/matrix.dart';

class RoomArchiveHelper {
  static const String _archiveType = 'com.bmp.archived';

  static Future<void> archiveRoom(Room room) async {
    await room.client.setAccountDataPerRoom(
      room.client.userID!,
      room.id,
      _archiveType,
      {
        'archived': true,
        'archived_at': DateTime.now().millisecondsSinceEpoch,
      },
    );
  }

  static Future<void> unarchiveRoom(Room room) async {
    await room.client.setAccountDataPerRoom(
      room.client.userID!,
      room.id,
      _archiveType,
      {
        'archived': false,
      },
    );
  }

  static bool isArchived(Room room) {
    final accountData = room.roomAccountData[_archiveType];
    return accountData?.content['archived'] == true;
  }

  static bool isRoomArchived(Room room) {
    return isArchived(room);
  }

  static List<Room> getArchivedRooms(Client client) {
    return client.rooms.where((room) => isArchived(room)).toList();
  }

  static List<Room> getActiveRooms(Client client) {
    return client.rooms.where((room) => !isArchived(room)).toList();
  }

  static Future<void> clearAllArchived(Client client) async {
    final archivedRooms = getArchivedRooms(client);
    for (final room in archivedRooms) {
      await unarchiveRoom(room);
    }
  }
}