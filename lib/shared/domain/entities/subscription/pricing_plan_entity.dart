import 'package:equatable/equatable.dart';

/// Represents a pricing plan from Stripe
class PricingPlanEntity extends Equatable {
  /// Stripe price ID (e.g., "price_XXX")
  final String stripePriceId;

  /// Amount in cents (e.g., 2999 = $29.99)
  final int unitAmount;

  /// Currency code (e.g., "usd")
  final String currency;

  /// Recurring interval (e.g., "month", "year")
  final String recurringInterval;

  /// Plan nickname/name (e.g., "Monthly Premium Plan")
  final String? nickname;

  /// Whether this plan is active
  final bool isActive;

  const PricingPlanEntity({
    required this.stripePriceId,
    required this.unitAmount,
    required this.currency,
    required this.recurringInterval,
    this.nickname,
    this.isActive = true,
  });

  /// Get formatted price (e.g., "$29.99")
  String get formattedPrice {
    final amount = unitAmount / 100;
    final symbol = _getCurrencySymbol(currency);
    return '$symbol${amount.toStringAsFixed(2)}';
  }

  /// Get display interval (e.g., "month" -> "Monthly")
  String get displayInterval {
    switch (recurringInterval.toLowerCase()) {
      case 'month':
        return 'Monthly';
      case 'year':
        return 'Yearly';
      case 'week':
        return 'Weekly';
      case 'day':
        return 'Daily';
      default:
        return recurringInterval;
    }
  }

  /// Get full display text (e.g., "$29.99/month")
  String get fullDisplayPrice {
    return '$formattedPrice/${recurringInterval.toLowerCase()}';
  }

  /// Get currency symbol
  static String _getCurrencySymbol(String currency) {
    switch (currency.toLowerCase()) {
      case 'usd':
        return '\$';
      case 'eur':
        return '€';
      case 'gbp':
        return '£';
      case 'inr':
        return '₹';
      default:
        return currency.toUpperCase();
    }
  }

  @override
  List<Object?> get props => [
        stripePriceId,
        unitAmount,
        currency,
        recurringInterval,
        nickname,
        isActive,
      ];
}
