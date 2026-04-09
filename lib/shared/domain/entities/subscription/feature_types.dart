/// Feature types for the application
/// Chat is FREE, all other features require subscription
enum FeatureType {
  /// Chat feature - Always FREE
  chat,

  /// Finance/Wallet feature - Requires subscription
  finance,

  /// Marketplace feature - Requires subscription
  marketplace,

  /// Apps feature - Requires subscription
  apps,

  /// Communities feature - Requires subscription
  communities,

  /// Music feature - Requires subscription
  music,

  /// Mental Health feature - Requires subscription
  mentalHealth,

  /// AI Finance feature - Requires subscription
  aiFinance,

  /// Nutrition feature - Requires subscription
  nutrition,
}

/// Extension to check if a feature is free
extension FeatureTypeX on FeatureType {
  /// Returns true if this feature is free (only chat is free)
  bool get isFree => this == FeatureType.chat;

  /// Returns true if this feature requires subscription
  bool get requiresSubscription => !isFree;

  /// Get display name for the feature
  String get displayName {
    switch (this) {
      case FeatureType.chat:
        return 'Chat';
      case FeatureType.finance:
        return 'Finance';
      case FeatureType.marketplace:
        return 'Marketplace';
      case FeatureType.apps:
        return 'Apps';
      case FeatureType.communities:
        return 'Communities';
      case FeatureType.music:
        return 'Music';
      case FeatureType.mentalHealth:
        return 'Mental Health';
      case FeatureType.aiFinance:
        return 'AI Finance';
      case FeatureType.nutrition:
        return 'Nutrition';
    }
  }

  /// Get icon for the feature
  String get iconName {
    switch (this) {
      case FeatureType.chat:
        return 'chat';
      case FeatureType.finance:
        return 'wallet';
      case FeatureType.marketplace:
        return 'shopping_bag';
      case FeatureType.apps:
        return 'apps';
      case FeatureType.communities:
        return 'people';
      case FeatureType.music:
        return 'music_note';
      case FeatureType.mentalHealth:
        return 'psychology';
      case FeatureType.aiFinance:
        return 'auto_graph';
      case FeatureType.nutrition:
        return 'restaurant';
    }
  }
}
