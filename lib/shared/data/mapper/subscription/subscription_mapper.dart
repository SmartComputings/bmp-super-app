import '../../../domain/entities/subscription/subscription_entity.dart';
import '../../models/subscription/subscription_model.dart';

/// Mapper for Subscription model <-> entity conversions
/// Centralizes all mapping logic following Clean Architecture principles
abstract class SubscriptionMapper {
  /// Parse bool from int (0/1) or bool
  static bool _parseBool(dynamic value) {
    if (value == null) return false;
    if (value is bool) return value;
    if (value is int) return value != 0;
    if (value is String) return value.toLowerCase() == 'true' || value == '1';
    return false;
  }

  /// Parse DateTime from int (Unix timestamp) or String (ISO format)
  static DateTime? _parseDateTime(dynamic value) {
    if (value == null) return null;
    if (value is int) {
      // Unix timestamp in seconds
      return DateTime.fromMillisecondsSinceEpoch(value * 1000);
    }
    if (value is String) {
      return DateTime.tryParse(value);
    }
    return null;
  }

  /// Extract current period end from various possible field names
  static DateTime? _parseCurrentPeriodEnd(Map<String, dynamic> json) {
    final value = json['current_period_end'] ?? json['currentPeriodEnd'];
    return _parseDateTime(value);
  }

  /// Extract cancel at period end from various possible field names
  static bool _parseCancelAtPeriodEnd(Map<String, dynamic> json) {
    final value = json['cancel_at_period_end'] ?? json['cancelAtPeriodEnd'];
    return _parseBool(value);
  }

  /// Extract subscription ID from various possible field names
  static String? _parseSubscriptionId(Map<String, dynamic> json) {
    // Try different possible field names for subscription ID
    return json['stripe_subscription_id'] as String? ??
        json['subscriptionId'] as String? ??
        json['subscription_id'] as String? ??
        json['id'] as String?;
  }

  /// Extract customer ID from various possible field names
  static String? _parseCustomerId(Map<String, dynamic> json) {
    // Try different possible field names for customer ID
    return json['stripe_customer_id'] as String? ??
        json['customerId'] as String? ??
        json['customer_id'] as String? ??
        json['customer'] as String?;
  }

  /// Convert JSON from API to SubscriptionModel
  static SubscriptionModel fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return SubscriptionModel(statusField: 'inactive');
    }
    
    final subscriptionId = _parseSubscriptionId(json);
    final customerId = _parseCustomerId(json);
    
    // Debug logging in debug mode
    assert(() {
      print('🔍 SubscriptionMapper.fromJson:');
      print('   Raw JSON keys: ${json.keys.toList()}');
      print('   Parsed subscription ID: $subscriptionId');
      print('   Parsed customer ID: $customerId');
      return true;
    }());
    
    return SubscriptionModel(
      stripeSubscriptionIdField: subscriptionId,
      statusField: json['status'] as String? ?? 'inactive',
      currentPeriodEndField: _parseCurrentPeriodEnd(json),
      cancelAtPeriodEndField: _parseCancelAtPeriodEnd(json),
      stripeCustomerIdField: customerId,
      createdAtField: _parseDateTime(json['created_at'] ?? json['createdAt']),
      canceledAtField: _parseDateTime(json['canceled_at'] ?? json['canceledAt']),
    );
  }

  /// Convert SubscriptionModel to SubscriptionEntity
  static SubscriptionEntity toEntity(SubscriptionModel model) {
    return SubscriptionEntity(
      stripeSubscriptionId: model.stripeSubscriptionIdField,
      status: SubscriptionStatusX.fromString(model.statusField),
      currentPeriodEnd: model.currentPeriodEndField,
      cancelAtPeriodEnd: model.cancelAtPeriodEndField,
      canceledAt: model.canceledAtField,
      stripeCustomerId: model.stripeCustomerIdField,
      createdAt: model.createdAtField,
    );
  }

  /// Convert SubscriptionEntity to SubscriptionModel
  static SubscriptionModel fromEntity(SubscriptionEntity entity) {
    return SubscriptionModel(
      stripeSubscriptionIdField: entity.stripeSubscriptionId,
      statusField: entity.status.value,
      currentPeriodEndField: entity.currentPeriodEnd,
      cancelAtPeriodEndField: entity.cancelAtPeriodEnd,
      canceledAtField: entity.canceledAt,
      stripeCustomerIdField: entity.stripeCustomerId,
      createdAtField: entity.createdAt,
    );
  }

  /// Convert SubscriptionModel to JSON for caching
  static Map<String, dynamic> toJson(SubscriptionModel model) {
    return {
      'stripe_subscription_id': model.stripeSubscriptionIdField,
      'status': model.statusField,
      'current_period_end': model.currentPeriodEndField?.toIso8601String(),
      'cancel_at_period_end': model.cancelAtPeriodEndField,
      'canceled_at': model.canceledAtField?.toIso8601String(),
      'stripe_customer_id': model.stripeCustomerIdField,
      'created_at': model.createdAtField?.toIso8601String(),
    };
  }
}
