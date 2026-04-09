import 'package:fpdart/fpdart.dart';

import '../../entities/subscription/invoice_entity.dart';
import '../../repositories/subscription_repository.dart';

/// Use case for loading invoice history
class LoadInvoicesUseCase {
  final SubscriptionRepository _repository;

  const LoadInvoicesUseCase(this._repository);

  /// Execute the use case
  /// Returns list of invoices
  Future<Either<String, List<InvoiceEntity>>> call() async {
    return await _repository.getInvoices();
  }
}
