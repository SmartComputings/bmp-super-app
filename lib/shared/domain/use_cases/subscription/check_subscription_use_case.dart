import 'package:fpdart/fpdart.dart';

import '../../entities/subscription/subscription_entity.dart';
import '../../repositories/subscription_repository.dart';

/// Use case for checking user's current subscription status
class CheckSubscriptionUseCase {
  final SubscriptionRepository _repository;

  const CheckSubscriptionUseCase(this._repository);

  /// Execute the use case
  /// Returns the current subscription or null if no subscription exists
  Future<Either<String, SubscriptionEntity?>> call() async {
    return await _repository.getSubscriptionStatus();
  }
}
