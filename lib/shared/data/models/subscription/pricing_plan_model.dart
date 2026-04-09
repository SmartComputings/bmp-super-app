import '../../../domain/entities/subscription/pricing_plan_entity.dart';

/// Data model for pricing plan.
/// Use PricingPlanMapper for JSON parsing and entity conversion.
class PricingPlanModel extends PricingPlanEntity {
  const PricingPlanModel({
    required super.stripePriceId,
    required super.unitAmount,
    required super.currency,
    required super.recurringInterval,
    super.nickname,
    super.isActive,
  });
}

