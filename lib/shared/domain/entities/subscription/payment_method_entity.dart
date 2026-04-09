import 'package:equatable/equatable.dart';

/// Represents a saved payment method from Stripe
class PaymentMethodEntity extends Equatable {
  /// Stripe payment method ID (e.g., "pm_XXX")
  final String stripePaymentMethodId;

  /// Card brand (e.g., "visa", "mastercard")
  final String cardBrand;

  /// Last 4 digits of card (e.g., "4242")
  final String cardLast4;

  /// Whether this is the default payment method
  final bool isDefault;

  /// Card expiry month (1-12)
  final int? expMonth;

  /// Card expiry year (e.g., 2025)
  final int? expYear;

  const PaymentMethodEntity({
    required this.stripePaymentMethodId,
    required this.cardBrand,
    required this.cardLast4,
    this.isDefault = false,
    this.expMonth,
    this.expYear,
  });

  /// Get card brand icon name
  String get brandIcon {
    switch (cardBrand.toLowerCase()) {
      case 'visa':
        return 'visa';
      case 'mastercard':
        return 'mastercard';
      case 'amex':
        return 'amex';
      case 'discover':
        return 'discover';
      default:
        return 'credit_card';
    }
  }

  /// Get formatted card display (e.g., "Visa •••• 4242")
  String get displayName {
    final brand = cardBrand.isNotEmpty
        ? cardBrand[0].toUpperCase() + cardBrand.substring(1)
        : 'Card';
    return '$brand •••• $cardLast4';
  }

  /// Get expiry display (e.g., "12/25")
  String? get expiryDisplay {
    if (expMonth == null || expYear == null) return null;
    final month = expMonth.toString().padLeft(2, '0');
    final year = (expYear! % 100).toString().padLeft(2, '0');
    return '$month/$year';
  }

  /// Check if card is expired
  bool get isExpired {
    if (expMonth == null || expYear == null) return false;
    final now = DateTime.now();
    final expiry = DateTime(expYear!, expMonth! + 1, 0); // Last day of exp month
    return now.isAfter(expiry);
  }

  @override
  List<Object?> get props => [
        stripePaymentMethodId,
        cardBrand,
        cardLast4,
        isDefault,
        expMonth,
        expYear,
      ];
}
