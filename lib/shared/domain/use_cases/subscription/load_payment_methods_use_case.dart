import 'package:fpdart/fpdart.dart';

import '../../entities/subscription/payment_method_entity.dart';
import '../../repositories/subscription_repository.dart';

/// Use case for loading saved payment methods
class LoadPaymentMethodsUseCase {
  final SubscriptionRepository _repository;

  const LoadPaymentMethodsUseCase(this._repository);

  /// Execute the use case
  /// Returns list of saved payment methods
  Future<Either<String, List<PaymentMethodEntity>>> call() async {
    return await _repository.getPaymentMethods();
  }
}
