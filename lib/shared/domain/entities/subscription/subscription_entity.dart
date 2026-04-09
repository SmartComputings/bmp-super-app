import 'package:equatable/equatable.dart';

/// Subscription status enum
enum SubscriptionStatus {
  /// Active subscription
  active,

  /// Inactive/No subscription
  inactive,

  /// Trial period (no module access)
  trial,

  /// Subscription canceled
  canceled,

  /// Subscription expired
  expired,

  /// Payment incomplete/pending
  incomplete,

  /// Payment past due
  pastDue,
}

/// Extension to parse subscription status from string
extension SubscriptionStatusX on SubscriptionStatus {
  /// Convert to string for API
  String get value {
    switch (this) {
      case SubscriptionStatus.active:
        return 'active';
      case SubscriptionStatus.inactive:
        return 'inactive';
      case SubscriptionStatus.trial:
        return 'trial';
      case SubscriptionStatus.canceled:
        return 'cancelled';
      case SubscriptionStatus.expired:
        return 'expired';
      case SubscriptionStatus.incomplete:
        return 'incomplete';
      case SubscriptionStatus.pastDue:
        return 'past_due';
    }
  }

  /// Parse from string (matches API response: 'active', 'expired', 'cancelled', 'trial')
  static SubscriptionStatus fromString(String? value) {
    switch (value?.toLowerCase()) {
      case 'active':
        return SubscriptionStatus.active;
      case 'trial':
      case 'trialing':
        return SubscriptionStatus.trial;
      case 'cancelled':
      case 'canceled':
        return SubscriptionStatus.canceled;
      case 'expired':
        return SubscriptionStatus.expired;
      case 'incomplete':
        return SubscriptionStatus.incomplete;
      case 'past_due':
        return SubscriptionStatus.pastDue;
      default:
        return SubscriptionStatus.inactive;
    }
  }
}

/// Subscription entity representing user's subscription status
class SubscriptionEntity extends Equatable {
  /// Stripe subscription ID
  final String? stripeSubscriptionId;

  /// Current subscription status
  final SubscriptionStatus status;

  /// When the current billing period ends
  final DateTime? currentPeriodEnd;

  /// Whether subscription will be canceled at period end
  final bool cancelAtPeriodEnd;

  /// When the subscription was cancelled (if applicable)
  final DateTime? canceledAt;

  /// Customer ID from Stripe
  final String? stripeCustomerId;

  /// Created at timestamp
  final DateTime? createdAt;

  const SubscriptionEntity({
    this.stripeSubscriptionId,
    this.status = SubscriptionStatus.inactive,
    this.currentPeriodEnd,
    this.cancelAtPeriodEnd = false,
    this.canceledAt,
    this.stripeCustomerId,
    this.createdAt,
  });

  /// Check if subscription is currently active (ONLY active status, NOT trialing)
  /// Trial users should NOT have access to premium modules
  bool get isActive => status == SubscriptionStatus.active;

  /// Check if user is in trial period (no module access)
  bool get isTrialing => status == SubscriptionStatus.trial;

  /// Check if subscription has expired
  bool get isExpired {
    if (currentPeriodEnd == null) return true;
    return DateTime.now().isAfter(currentPeriodEnd!);
  }

  /// Days remaining in current period
  int get daysRemaining {
    if (currentPeriodEnd == null) return 0;
    final difference = currentPeriodEnd!.difference(DateTime.now());
    return difference.inDays > 0 ? difference.inDays : 0;
  }

  /// Empty subscription (no active subscription)
  static const empty = SubscriptionEntity(
    status: SubscriptionStatus.inactive,
  );

  @override
  List<Object?> get props => [
        stripeSubscriptionId,
        status,
        currentPeriodEnd,
        cancelAtPeriodEnd,
        canceledAt,
        stripeCustomerId,
        createdAt,
      ];
}
