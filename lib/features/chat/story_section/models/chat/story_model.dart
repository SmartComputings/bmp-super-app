import 'package:matrix/matrix.dart';

enum StoryType {
  text,
  image,
  video,
}

enum StoryPrivacy {
  contacts,
  close_friends,
  public,
}

class Story {
  final String id;
  final String userId;
  final String? displayName;
  final Uri? avatarUrl;
  final StoryContent content;
  final DateTime timestamp;
  final DateTime expiresAt;
  final StoryPrivacy privacy;
  final List<StoryView> views;
  final bool isOwn;

  Story({
    required this.id,
    required this.userId,
    this.displayName,
    this.avatarUrl,
    required this.content,
    required this.timestamp,
    required this.expiresAt,
    this.privacy = StoryPrivacy.contacts,
    List<StoryView>? views,
    this.isOwn = false,
  }) : views = views ?? [];

  bool get isExpired => DateTime.now().isAfter(expiresAt);
  bool get hasViews => views.isNotEmpty;
  int get viewCount => views.length;

  factory Story.fromMatrixEvent(Event event, {bool isOwn = false}) {
    final content = event.content;
    final timestamp = event.originServerTs;
    
    return Story(
      id: event.eventId,
      userId: event.senderId,
      displayName: event.senderFromMemoryOrFallback.displayName,
      avatarUrl: event.senderFromMemoryOrFallback.avatarUrl,
      content: StoryContent.fromJson(content),
      timestamp: timestamp,
      expiresAt: timestamp.add(const Duration(hours: 24)),
      privacy: StoryPrivacy.values.firstWhere(
        (p) => p.name == content['privacy'],
        orElse: () => StoryPrivacy.contacts,
      ),
      isOwn: isOwn,
    );
  }

  Map<String, dynamic> toJson() => {
    'type': content.type.name,
    'text': content.text,
    'media_url': content.mediaUrl?.toString(),
    'background_color': content.backgroundColor,
    'text_color': content.textColor,
    'privacy': privacy.name,
    'timestamp': timestamp.millisecondsSinceEpoch,
  };
}

class StoryContent {
  final StoryType type;
  final String? text;
  final Uri? mediaUrl;
  final String? backgroundColor;
  final String? textColor;
  final String? caption;

  StoryContent({
    required this.type,
    this.text,
    this.mediaUrl,
    this.backgroundColor,
    this.textColor,
    this.caption,
  });

  factory StoryContent.text({
    required String text,
    String backgroundColor = '#6B46C1',
    String textColor = '#FFFFFF',
  }) {
    return StoryContent(
      type: StoryType.text,
      text: text,
      backgroundColor: backgroundColor,
      textColor: textColor,
    );
  }

  factory StoryContent.image({
    required Uri mediaUrl,
    String? caption,
  }) {
    return StoryContent(
      type: StoryType.image,
      mediaUrl: mediaUrl,
      caption: caption,
    );
  }

  factory StoryContent.video({
    required Uri mediaUrl,
    String? caption,
  }) {
    return StoryContent(
      type: StoryType.video,
      mediaUrl: mediaUrl,
      caption: caption,
    );
  }

  factory StoryContent.fromJson(Map<String, dynamic> json) {
    final mediaUrlString = json['media_url'];
    Uri? mediaUrl;
    if (mediaUrlString != null) {
      try {
        mediaUrl = Uri.parse(mediaUrlString);
      } catch (e) {
        // Error parsing media URL
      }
    }
    
    return StoryContent(
      type: StoryType.values.firstWhere(
        (t) => t.name == json['type'],
        orElse: () => StoryType.text,
      ),
      text: json['text'],
      mediaUrl: mediaUrl,
      backgroundColor: json['background_color'],
      textColor: json['text_color'],
      caption: json['caption'],
    );
  }
}

class StoryView {
  final String userId;
  final String? displayName;
  final Uri? avatarUrl;
  final DateTime timestamp;

  StoryView({
    required this.userId,
    this.displayName,
    this.avatarUrl,
    required this.timestamp,
  });

  factory StoryView.fromMatrixEvent(Event event) {
    return StoryView(
      userId: event.senderId,
      displayName: event.senderFromMemoryOrFallback.displayName,
      avatarUrl: event.senderFromMemoryOrFallback.avatarUrl,
      timestamp: event.originServerTs,
    );
  }
}

class UserStories {
  final String userId;
  final String? displayName;
  final Uri? avatarUrl;
  final List<Story> stories;
  final bool isOwn;

  UserStories({
    required this.userId,
    this.displayName,
    this.avatarUrl,
    required this.stories,
    this.isOwn = false,
  });

  bool hasUnviewedStoriesFor(String currentUserId) {
    if (isOwn) return false; // Own stories don't have "unviewed" state
    return stories.any((story) => 
      !story.isExpired && !story.views.any((view) => view.userId == currentUserId)
    );
  }
  
  // This getter should be used with the current user's ID from outside
  // bool get hasUnviewedStories => hasUnviewedStoriesFor(currentUserId);

  List<Story> get activeStories => stories.where((story) => !story.isExpired).toList();
  
  Story? get latestStory => activeStories.isNotEmpty 
    ? activeStories.reduce((a, b) => a.timestamp.isAfter(b.timestamp) ? a : b)
    : null;
}