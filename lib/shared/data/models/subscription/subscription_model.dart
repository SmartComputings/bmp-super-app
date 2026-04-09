import 'package:hive/hive.dart';

import '../../../domain/entities/subscription/subscription_entity.dart';

part 'subscription_model.g.dart';

/// Data model for subscription with Hive support for local caching.
/// Use SubscriptionMapper for JSON parsing and entity conversion.
@HiveType(typeId: 10)
class SubscriptionModel extends SubscriptionEntity {
  @HiveField(0)
  final String? stripeSubscriptionIdField;

  @HiveField(1)
  final String statusField;

  @HiveField(2)
  final DateTime? currentPeriodEndField;

  @HiveField(3)
  final bool cancelAtPeriodEndField;

  @HiveField(4)
  final String? stripeCustomerIdField;

  @HiveField(5)
  final DateTime? createdAtField;

  @HiveField(6)
  final DateTime? canceledAtField;

  SubscriptionModel({
    this.stripeSubscriptionIdField,
    required this.statusField,
    this.currentPeriodEndField,
    this.cancelAtPeriodEndField = false,
    this.stripeCustomerIdField,
    this.createdAtField,
    this.canceledAtField,
  }) : super(
          stripeSubscriptionId: stripeSubscriptionIdField,
          status: SubscriptionStatusX.fromString(statusField),
          currentPeriodEnd: currentPeriodEndField,
          cancelAtPeriodEnd: cancelAtPeriodEndField,
          canceledAt: canceledAtField,
          stripeCustomerId: stripeCustomerIdField,
          createdAt: createdAtField,
        );

  /// Override props to include model-specific fields for proper equality comparison
  @override
  List<Object?> get props => [
        stripeSubscriptionIdField,
        statusField,
        currentPeriodEndField,
        cancelAtPeriodEndField,
        stripeCustomerIdField,
        createdAtField,
        canceledAtField,
      ];
}

