import 'package:equatable/equatable.dart';

/// Entity for CheckUsername API response
/// Contains all user/customer data from check-username endpoint
class CheckUsernameEntity extends Equatable {
  final bool exists;
  final bool hasCustomer;
  final String? customerId;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? subscriptionStatus;
  final DateTime? subscriptionExpiresAt;
  final bool hasPayCrypto;
  final Map<String, dynamic>? paycrypto;
  final bool pinSet;
  final DateTime cachedAt;
  
  // Stripe customer ID (from stripeCustomerId in API response)
  final String? stripeCustomerId;
  
  // New fields for full customer data
  final String? status;
  final String? type;
  final List<EndorsementEntity>? endorsements;

  const CheckUsernameEntity({
    required this.exists,
    required this.hasCustomer,
    this.customerId,
    this.email,
    this.firstName,
    this.lastName,
    this.phone,
    this.subscriptionStatus,
    this.subscriptionExpiresAt,
    required this.hasPayCrypto,
    this.paycrypto,
    required this.pinSet,
    required this.cachedAt,
    this.stripeCustomerId,
    this.status,
    this.type,
    this.endorsements,
  });

  /// Check if subscription is active
  bool get isSubscriptionActive => subscriptionStatus == 'active';

  /// Check if subscription has expired
  bool get isSubscriptionExpired {
    if (subscriptionExpiresAt == null) return true;
    return DateTime.now().isAfter(subscriptionExpiresAt!);
  }

  /// Create empty entity (for initial state)
  factory CheckUsernameEntity.empty() {
    return CheckUsernameEntity(
      exists: false,
      hasCustomer: false,
      hasPayCrypto: false,
      pinSet: false,
      cachedAt: DateTime.now(),
    );
  }

  @override
  List<Object?> get props => [
        exists,
        hasCustomer,
        customerId,
        email,
        firstName,
        lastName,
        phone,
        subscriptionStatus,
        subscriptionExpiresAt,
        hasPayCrypto,
        paycrypto,
        pinSet,
        stripeCustomerId,
        status,
        type,
        endorsements,
      ];

  @override
  String toString() {
    return 'CheckUsernameEntity(exists: $exists, hasCustomer: $hasCustomer, '
        'customerId: $customerId, status: $status, endorsements: ${endorsements?.length})';
  }
}

class EndorsementEntity extends Equatable {
  final String name;
  final String status;
  // We can add requirements here if needed, keeping it simple for now as Map
  final Map<String, dynamic>? requirements;

  const EndorsementEntity({
    required this.name,
    required this.status,
    this.requirements,
  });

  @override
  List<Object?> get props => [name, status, requirements];
}
