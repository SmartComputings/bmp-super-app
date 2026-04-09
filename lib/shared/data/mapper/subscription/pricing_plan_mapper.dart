import '../../../domain/entities/subscription/pricing_plan_entity.dart';
import '../../models/subscription/pricing_plan_model.dart';

/// Mapper for PricingPlan model <-> entity conversions
/// Centralizes all mapping logic following Clean Architecture principles
abstract class PricingPlanMapper {
  /// Convert JSON from API to PricingPlanModel
  static PricingPlanModel fromJson(Map<String, dynamic> json) {
    final recurring = json['recurring'] as Map<String, dynamic>?;
    return PricingPlanModel(
      stripePriceId: json['id'] as String,
      unitAmount: json['unit_amount'] as int,
      currency: json['currency'] as String? ?? 'usd',
      recurringInterval: recurring?['interval'] as String? ?? 'month',
      nickname: json['nickname'] as String?,
      isActive: json['active'] as bool? ?? true,
    );
  }

  /// Convert PricingPlanModel to PricingPlanEntity
  static PricingPlanEntity toEntity(PricingPlanModel model) {
    return PricingPlanEntity(
      stripePriceId: model.stripePriceId,
      unitAmount: model.unitAmount,
      currency: model.currency,
      recurringInterval: model.recurringInterval,
      nickname: model.nickname,
      isActive: model.isActive,
    );
  }

  /// Convert PricingPlanEntity to PricingPlanModel
  static PricingPlanModel fromEntity(PricingPlanEntity entity) {
    return PricingPlanModel(
      stripePriceId: entity.stripePriceId,
      unitAmount: entity.unitAmount,
      currency: entity.currency,
      recurringInterval: entity.recurringInterval,
      nickname: entity.nickname,
      isActive: entity.isActive,
    );
  }

  /// Convert PricingPlanModel to JSON for caching
  static Map<String, dynamic> toJson(PricingPlanModel model) {
    return {
      'stripe_price_id': model.stripePriceId,
      'unit_amount': model.unitAmount,
      'currency': model.currency,
      'recurring_interval': model.recurringInterval,
      'nickname': model.nickname,
      'active': model.isActive,
    };
  }
}
