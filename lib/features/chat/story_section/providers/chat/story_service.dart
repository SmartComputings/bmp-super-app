import 'dart:async';
import 'dart:io';
import 'package:bmp/features/chat/story_section/models/chat/story_model.dart';
import 'package:flutter/foundation.dart';
import 'package:matrix/matrix.dart';

class StoryService extends ChangeNotifier {
  final Client _client;
  final StreamController<List<UserStories>> _storiesController = StreamController.broadcast();
  Timer? _cleanupTimer;
  List<UserStories>? _cachedStories;
  
  static const String storyEventType = 'm.story';
  static const String storyViewEventType = 'm.story.view';
  static const String storyRoomType = 'm.story_room';

  StoryService(this._client) {
    _initializeService();
  }

  Stream<List<UserStories>> get storiesStream => _storiesController.stream;

  // Force reload stories (for navigation)
  Future<void> forceReloadStories() async {
    _cachedStories = null;
    await _loadStories();
  }

  void _initializeService() {
    // Only reload stories periodically, not on every sync
    _client.onSync.stream.listen((_) {
      Future.delayed(const Duration(seconds: 2), () => _loadStories());
    });
    _startCleanupTimer();
    _loadStories();
  }

  void _startCleanupTimer() {
    _cleanupTimer = Timer.periodic(const Duration(minutes: 30), (_) {
      _cleanupExpiredStories();
    });
  }

  Future<void> _loadStories() async {
    try {
      // Wait for client to be ready
      if (_client.userID == null) {
        debugPrint('Client not ready, skipping story load');
        return;
      }
      
      // Return cached stories immediately if available, then load fresh
      if (_cachedStories != null) {
        _storiesController.add(_cachedStories!);
      }
      
      final allStories = <UserStories>[];
      final myStories = await _getMyStories();
      // Always add myStories so "My Story" widget appears
      allStories.add(myStories);

      final contactStories = await _getContactStories();
      allStories.addAll(contactStories);

      _cachedStories = allStories;
      _storiesController.add(allStories);
    } catch (e) {
      debugPrint('Error loading stories: $e');
    }
  }

  Future<UserStories> _getMyStories() async {
    final myRoom = await _getOrCreateStoryRoom();
    final storyEvents = await _getStoryEvents(myRoom);
    
    final stories = storyEvents
        .map((event) => Story.fromMatrixEvent(event, isOwn: true))
        .where((story) => !story.isExpired)
        .toList();

    // Load views for each story from all direct chat rooms
    final storiesWithViews = <Story>[];
    for (final story in stories) {
      final views = <StoryView>[];
      
      debugPrint('🔍 Loading views for MY story ${story.id}');
      
      // Check all direct chat rooms for views of this story
      final directChats = _client.rooms.where((r) => 
        r.isDirectChat && 
        r.getState('m.room.create')?.content['type'] != storyRoomType
      );
      
      debugPrint('🔍 Checking ${directChats.length} direct chat rooms for views');
      
      for (final room in directChats) {
        try {
          final storyViews = await _getStoryViews(room, story.id);
          views.addAll(storyViews);
          debugPrint('🔍 Room ${room.id}: found ${storyViews.length} views');
        } catch (e) {
          debugPrint('🔍 Error checking room ${room.id}: $e');
        }
      }
      
      debugPrint('🔍 Total views found for story ${story.id}: ${views.length}');
      
      storiesWithViews.add(Story(
        id: story.id,
        userId: story.userId,
        displayName: story.displayName,
        avatarUrl: story.avatarUrl,
        content: story.content,
        timestamp: story.timestamp,
        expiresAt: story.expiresAt,
        privacy: story.privacy,
        views: views,
        isOwn: story.isOwn,
      ));
    }

    // Get user's avatar from Matrix client
    Uri? userAvatar;
    try {
      // Try to get avatar from any room the user is in
      for (final room in _client.rooms) {
        final userEvent = room.getState('m.room.member', _client.userID!);
        if (userEvent?.content['avatar_url'] != null) {
          final avatarUrl = userEvent!.content['avatar_url'];
          if (avatarUrl is String) {
            userAvatar = Uri.parse(avatarUrl);
            // debugPrint('Found user avatar: $userAvatar');
            break;
          }
        }
      }
      if (userAvatar == null) {
        debugPrint('No user avatar found in any room');
      }
    } catch (e) {
      debugPrint('Error getting user avatar: $e');
    }

    // Remove debug spam
    // debugPrint('Creating UserStories with avatarUrl: $userAvatar');
    
    return UserStories(
      userId: _client.userID!,
      displayName: _client.userID!.split(':').first,
      avatarUrl: userAvatar,
      stories: storiesWithViews,
      isOwn: true,
    );
  }

  Future<List<UserStories>> _getContactStories() async {
    final contactStories = <UserStories>[];
    final directChats = _client.rooms.where((room) => 
      room.isDirectChat && 
      room.getState('m.room.create')?.content['type'] != storyRoomType
    );

    for (final room in directChats) {
      if (room.directChatMatrixID == null) continue;
      if (_client.ignoredUsers.contains(room.directChatMatrixID)) continue;

      try {
        // Look for story events directly in the direct chat room
        final storyEvents = await _getStoryEvents(room);
        final stories = storyEvents
            .where((event) => event.senderId != _client.userID) // Exclude own stories
            .map((event) => Story.fromMatrixEvent(event))
            .where((story) => !story.isExpired)
            .toList();

        // Load views for each story to check if current user has viewed them
        final storiesWithViews = <Story>[];
        for (final story in stories) {
          final views = await _getStoryViews(room, story.id);
          storiesWithViews.add(Story(
            id: story.id,
            userId: story.userId,
            displayName: story.displayName,
            avatarUrl: story.avatarUrl,
            content: story.content,
            timestamp: story.timestamp,
            expiresAt: story.expiresAt,
            privacy: story.privacy,
            views: views,
            isOwn: story.isOwn,
          ));
        }

        if (storiesWithViews.isNotEmpty) {
          contactStories.add(UserStories(
            userId: room.directChatMatrixID!,
            displayName: room.getLocalizedDisplayname(),
            avatarUrl: room.avatar,
            stories: storiesWithViews,
          ));
        }
      } catch (e) {
        debugPrint('Error loading stories for ${room.directChatMatrixID}: $e');
      }
    }

    return contactStories;
  }

  Future<Room> _getOrCreateStoryRoom() async {
    try {
      // Find existing story room
      final existingRooms = _client.rooms.where(
        (room) => room.getState('m.room.create')?.content['type'] == storyRoomType,
      ).toList();
      
      if (existingRooms.isNotEmpty) {
        // If multiple story rooms exist, use the first one and clean up others
        if (existingRooms.length > 1) {
          debugPrint('Found ${existingRooms.length} story rooms, cleaning up duplicates');
          for (int i = 1; i < existingRooms.length; i++) {
            try {
              await existingRooms[i].leave();
              await existingRooms[i].forget();
            } catch (e) {
              debugPrint('Error cleaning up duplicate story room: $e');
            }
          }
        }
        return existingRooms.first;
      }
    } catch (e) {
      debugPrint('Error finding existing story room: $e');
    }
    
    try {
      debugPrint('Creating new story room');
      // Create new story room
      final roomId = await _client.createRoom(
        preset: CreateRoomPreset.privateChat,
        creationContent: {'type': storyRoomType},
        name: 'My Stories',
        topic: 'Personal stories room',
        visibility: Visibility.private,
      );
      return _client.getRoomById(roomId)!;
    } catch (e) {
      debugPrint('Error creating story room: $e');
      rethrow;
    }
  }

  Future<Room?> _getContactStoryRoom(String userId) async {
    try {
      // Simplified approach - try to find existing room
      final rooms = _client.rooms.where((room) => 
        room.name?.contains('$userId:stories') == true
      ).toList();
      
      if (rooms.isNotEmpty) {
        return rooms.first;
      }
    } catch (e) {
      debugPrint('Error finding contact story room: $e');
    }
    return null;
  }

  Future<List<Event>> _getStoryEvents(Room room) async {
    final timeline = await room.getTimeline();
    return timeline.events
        .where((event) => event.type == storyEventType)
        .where((event) => !event.redacted)
        .toList();
  }

  Future<List<StoryView>> _getStoryViews(Room room, String storyId) async {
    final timeline = await room.getTimeline();
    final viewEvents = timeline.events
        .where((event) => event.type == storyViewEventType)
        .where((event) => event.content['story_id'] == storyId)
        .toList();
    
    debugPrint('👀 Found ${viewEvents.length} view events for story $storyId in room ${room.id}');
    
    return viewEvents.map((event) => StoryView.fromMatrixEvent(event)).toList();
  }

  Future<String> createTextStory({
    required String text,
    String backgroundColor = '#6B46C1',
    String textColor = '#FFFFFF',
    StoryPrivacy privacy = StoryPrivacy.contacts,
  }) async {
    final room = await _getOrCreateStoryRoom();
    final content = StoryContent.text(
      text: text,
      backgroundColor: backgroundColor,
      textColor: textColor,
    );

    final eventData = {
      'type': content.type.name,
      'text': content.text,
      'background_color': content.backgroundColor,
      'text_color': content.textColor,
      'privacy': privacy.name,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    };

    final eventId = await room.sendEvent(eventData, type: storyEventType);

    // Share story to direct chat rooms
    await _shareStoryToContacts(eventData);

    _loadStories();
    return eventId ?? '';
  }

  Future<String> createMediaStory({
    required File mediaFile,
    required StoryType type,
    String? caption,
    StoryPrivacy privacy = StoryPrivacy.contacts,
  }) async {
    final room = await _getOrCreateStoryRoom();
    
    // Upload media to Matrix
    final response = await _client.uploadContent(
      await mediaFile.readAsBytes(),
      filename: mediaFile.path.split('/').last,
      contentType: type == StoryType.image ? 'image/jpeg' : 'video/mp4',
    );

    final content = type == StoryType.image
        ? StoryContent.image(mediaUrl: response, caption: caption)
        : StoryContent.video(mediaUrl: response, caption: caption);

    final eventData = {
      'type': content.type.name,
      'media_url': content.mediaUrl.toString(),
      'caption': content.caption,
      'privacy': privacy.name,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    };

    final eventId = await room.sendEvent(eventData, type: storyEventType);

    // Share story to direct chat rooms
    await _shareStoryToContacts(eventData);

    _loadStories();
    return eventId ?? '';
  }

  Future<void> viewStory(String storyId, String storyOwnerId) async {
    if (storyOwnerId == _client.userID) return; // Don't view own stories

    try {
      debugPrint('📖 Recording view for story $storyId by ${_client.userID}');
      
      // Find the direct chat room with the story owner
      final directChat = _client.rooms.firstWhere(
        (room) => room.isDirectChat && room.directChatMatrixID == storyOwnerId,
      );

      debugPrint('📖 Found direct chat room: ${directChat.id}');

      // Check if user already viewed this story
      final existingViews = await _getStoryViews(directChat, storyId);
      final alreadyViewed = existingViews.any((view) => view.userId == _client.userID);
      
      debugPrint('📖 Existing views: ${existingViews.length}, already viewed: $alreadyViewed');
      debugPrint('📖 Existing viewer IDs: ${existingViews.map((v) => v.userId).toList()}');
      
      if (alreadyViewed) {
        debugPrint('📖 User already viewed this story, skipping');
        return;
      }

      // Send view event to the direct chat room
      await directChat.sendEvent({
        'story_id': storyId,
        'viewer_id': _client.userID,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      }, type: storyViewEventType);
      
      debugPrint('📖 View event sent successfully');
      
      // Reload stories to update view status
      _loadStories();
    } catch (e) {
      debugPrint('❌ Error viewing story: $e');
    }
  }

  Future<void> deleteStory(String storyId) async {
    try {
      debugPrint('🗑️ Deleting story $storyId from all locations');
      
      // Delete from story room
      final myRoom = await _getOrCreateStoryRoom();
      await myRoom.redactEvent(storyId, reason: 'Story deleted');
      debugPrint('🗑️ Deleted from story room');
      
      // Delete from all direct chat rooms where it was shared
      final directChats = _client.rooms.where((room) => 
        room.isDirectChat && 
        room.getState('m.room.create')?.content['type'] != storyRoomType
      );
      
      for (final room in directChats) {
        try {
          // Find and delete the story event in this room
          final timeline = await room.getTimeline();
          final storyEvent = timeline.events.firstWhere(
            (event) => event.type == storyEventType && event.eventId == storyId,
            orElse: () => throw Exception('Story not found'),
          );
          
          await room.redactEvent(storyEvent.eventId, reason: 'Story deleted');
          debugPrint('🗑️ Deleted from direct chat room ${room.id}');
        } catch (e) {
          debugPrint('🗑️ Story not found in room ${room.id}: $e');
        }
      }
      
      debugPrint('🗑️ Story deletion complete');
      _loadStories();
    } catch (e) {
      debugPrint('Error deleting story: $e');
    }
  }

  Future<void> replyToStory(String storyId, String storyOwnerId, String message) async {
    try {
      final directChat = _client.rooms.firstWhere(
        (room) => room.isDirectChat && room.directChatMatrixID == storyOwnerId,
      );

      await directChat.sendTextEvent(
        message,
        inReplyTo: Event(
          eventId: storyId,
          senderId: storyOwnerId,
          type: storyEventType,
          room: directChat,
          content: {'body': 'Story'},
          originServerTs: DateTime.now(),
        ),
      );
    } catch (e) {
      debugPrint('Error replying to story: $e');
    }
  }

  Future<void> _shareStoryToContacts(Map<String, dynamic> eventData) async {
    try {
      final directChats = _client.rooms.where((room) => 
        room.isDirectChat && 
        room.getState('m.room.create')?.content['type'] != storyRoomType
      );

      for (final room in directChats) {
        if (room.directChatMatrixID == null) continue;
        if (_client.ignoredUsers.contains(room.directChatMatrixID)) continue;

        try {
          await room.sendEvent(eventData, type: storyEventType);
        } catch (e) {
          debugPrint('Error sharing story to ${room.directChatMatrixID}: $e');
        }
      }
    } catch (e) {
      debugPrint('Error sharing story to contacts: $e');
    }
  }

  Future<void> _cleanupExpiredStories() async {
    try {
      final room = await _getOrCreateStoryRoom();
      final storyEvents = await _getStoryEvents(room);
      
      for (final event in storyEvents) {
        final story = Story.fromMatrixEvent(event);
        if (story.isExpired) {
          await room.redactEvent(event.eventId, reason: 'Expired story');
        }
      }
      
      _loadStories();
    } catch (e) {
      debugPrint('Error cleaning up expired stories: $e');
    }
  }

  // Get fresh viewers for a specific story (for story owner)
  Future<List<StoryView>> getStoryViewers(String storyId) async {
    final views = <StoryView>[];
    
    debugPrint('👁️ Getting viewers for story $storyId');
    
    // Check all direct chat rooms for views of this story
    final directChats = _client.rooms.where((r) => 
      r.isDirectChat && 
      r.getState('m.room.create')?.content['type'] != storyRoomType
    );
    
    debugPrint('👁️ Checking ${directChats.length} direct chat rooms');
    
    for (final room in directChats) {
      try {
        final storyViews = await _getStoryViews(room, storyId);
        views.addAll(storyViews);
        debugPrint('👁️ Room ${room.id}: found ${storyViews.length} views');
      } catch (e) {
        debugPrint('👁️ Error checking room ${room.id}: $e');
      }
    }
    
    debugPrint('👁️ Total fresh views found: ${views.length}');
    return views;
  }

  @override
  void dispose() {
    _cleanupTimer?.cancel();
    _storiesController.close();
    super.dispose();
  }
}