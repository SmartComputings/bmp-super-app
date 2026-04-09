import 'package:fpdart/fpdart.dart';

import '../../repositories/subscription_repository.dart';
import '../../entities/subscription/subscription_entity.dart';

/// Use case for canceling a subscription
class CancelSubscriptionUseCase {
  final SubscriptionRepository _repository;

  const CancelSubscriptionUseCase(this._repository);

  /// Execute the use case
  /// [subscriptionId] - Stripe subscription ID to cancel
  /// [cancelAtPeriodEnd] - If true, subscription remains active until period end
  Future<Either<String, SubscriptionEntity>> call({
    required String subscriptionId,
    bool cancelAtPeriodEnd = true,
  }) async {
    return await _repository.cancelSubscription(
      subscriptionId: subscriptionId,
      cancelAtPeriodEnd: cancelAtPeriodEnd,
    );
  }
}
