import '../../../domain/entities/subscription/payment_method_entity.dart';

/// Data model for payment method.
/// Use PaymentMethodMapper for JSON parsing and entity conversion.
class PaymentMethodModel extends PaymentMethodEntity {
  const PaymentMethodModel({
    required super.stripePaymentMethodId,
    required super.cardBrand,
    required super.cardLast4,
    super.isDefault,
    super.expMonth,
    super.expYear,
  });
}

