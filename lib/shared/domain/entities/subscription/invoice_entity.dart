import 'package:equatable/equatable.dart';

/// Invoice status enum
enum InvoiceStatus {
  paid,
  open,
  draft,
  uncollectible,
  void_,
}

/// Extension for invoice status
extension InvoiceStatusX on InvoiceStatus {
  static InvoiceStatus fromString(String? value) {
    switch (value?.toLowerCase()) {
      case 'paid':
        return InvoiceStatus.paid;
      case 'open':
        return InvoiceStatus.open;
      case 'draft':
        return InvoiceStatus.draft;
      case 'uncollectible':
        return InvoiceStatus.uncollectible;
      case 'void':
        return InvoiceStatus.void_;
      default:
        return InvoiceStatus.draft;
    }
  }
}

/// Represents an invoice from Stripe
class InvoiceEntity extends Equatable {
  /// Stripe invoice ID (e.g., "in_XXX")
  final String stripeInvoiceId;

  /// Amount due in cents
  final int amountDue;

  /// Invoice status
  final InvoiceStatus status;

  /// PDF download URL
  final String? invoicePdf;

  /// Hosted invoice URL (for web viewing)
  final String? hostedInvoiceUrl;

  /// Currency code
  final String currency;

  /// Invoice created date
  final DateTime? createdAt;

  /// Invoice paid date
  final DateTime? paidAt;

  const InvoiceEntity({
    required this.stripeInvoiceId,
    required this.amountDue,
    required this.status,
    this.invoicePdf,
    this.hostedInvoiceUrl,
    this.currency = 'usd',
    this.createdAt,
    this.paidAt,
  });

  /// Get formatted amount (e.g., "$29.99")
  String get formattedAmount {
    final amount = amountDue / 100;
    final symbol = _getCurrencySymbol(currency);
    return '$symbol${amount.toStringAsFixed(2)}';
  }

  /// Get status display text
  String get statusDisplay {
    switch (status) {
      case InvoiceStatus.paid:
        return 'Paid';
      case InvoiceStatus.open:
        return 'Open';
      case InvoiceStatus.draft:
        return 'Draft';
      case InvoiceStatus.uncollectible:
        return 'Uncollectible';
      case InvoiceStatus.void_:
        return 'Void';
    }
  }

  /// Check if invoice is paid
  bool get isPaid => status == InvoiceStatus.paid;

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
        stripeInvoiceId,
        amountDue,
        status,
        invoicePdf,
        hostedInvoiceUrl,
        currency,
        createdAt,
        paidAt,
      ];
}
