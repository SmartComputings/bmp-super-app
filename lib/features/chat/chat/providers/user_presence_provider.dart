import 'package:flutter/foundation.dart';
import 'package:matrix/matrix.dart';

class UserPresenceProvider extends ChangeNotifier {
  final Client client;
  final String userId;
  
  UserPresenceProvider(this.client, this.userId);

  CachedPresence? get presence => client.presences[userId];
}
