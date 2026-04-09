import 'package:fpdart/fpdart.dart';

import '../../entities/subscription/pricing_plan_entity.dart';
import '../../repositories/subscription_repository.dart';

/// Use case for loading available pricing plans
class LoadPricingPlansUseCase {
  final SubscriptionRepository _repository;

  const LoadPricingPlansUseCase(this._repository);

  /// Execute the use case
  /// Returns list of available pricing plans
  Future<Either<String, List<PricingPlanEntity>>> call() async {
    return await _repository.getPricingPlans();
  }
}
