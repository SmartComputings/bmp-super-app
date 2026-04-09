import '../../../domain/entities/subscription/payment_method_entity.dart';
import '../../models/subscription/payment_method_model.dart';

/// Mapper for PaymentMethod model <-> entity conversions
/// Centralizes all mapping logic following Clean Architecture principles
abstract class PaymentMethodMapper {
  /// Convert JSON from API to PaymentMethodModel
  static PaymentMethodModel fromJson(Map<String, dynamic> json) {
    // Try both naming conventions
    final id = json['stripe_payment_method_id'] ?? json['id'];
    
    if (id == null) {
      throw Exception('Payment method ID is missing from response: $json');
    }

    return PaymentMethodModel(
      stripePaymentMethodId: id.toString(),
      cardBrand: json['card_brand'] as String? ?? 'unknown',
      cardLast4: json['card_last4'] as String? ?? '****',
      isDefault: (json['is_default'] == 1) || (json['is_default'] == true),
      expMonth: json['exp_month'] as int?,
      expYear: json['exp_year'] as int?,
    );
  }

  /// Convert PaymentMethodModel to PaymentMethodEntity
  static PaymentMethodEntity toEntity(PaymentMethodModel model) {
    return PaymentMethodEntity(
      stripePaymentMethodId: model.stripePaymentMethodId,
      cardBrand: model.cardBrand,
      cardLast4: model.cardLast4,
      isDefault: model.isDefault,
      expMonth: model.expMonth,
      expYear: model.expYear,
    );
  }

  /// Convert PaymentMethodEntity to PaymentMethodModel
  static PaymentMethodModel fromEntity(PaymentMethodEntity entity) {
    return PaymentMethodModel(
      stripePaymentMethodId: entity.stripePaymentMethodId,
      cardBrand: entity.cardBrand,
      cardLast4: entity.cardLast4,
      isDefault: entity.isDefault,
      expMonth: entity.expMonth,
      expYear: entity.expYear,
    );
  }

  /// Convert PaymentMethodModel to JSON for caching
  static Map<String, dynamic> toJson(PaymentMethodModel model) {
    return {
      'stripe_payment_method_id': model.stripePaymentMethodId,
      'card_brand': model.cardBrand,
      'card_last4': model.cardLast4,
      'is_default': model.isDefault ? 1 : 0,
      'exp_month': model.expMonth,
      'exp_year': model.expYear,
    };
  }
}
