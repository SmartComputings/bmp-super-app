import '../../../domain/entities/subscription/invoice_entity.dart';
import '../../models/subscription/invoice_model.dart';

/// Mapper for Invoice model <-> entity conversions
/// Centralizes all mapping logic following Clean Architecture principles
abstract class InvoiceMapper {
  /// Convert JSON from API to InvoiceModel
  static InvoiceModel fromJson(Map<String, dynamic> json) {
    return InvoiceModel(
      stripeInvoiceId: json['stripe_invoice_id'] as String,
      amountDue: json['amount_due'] as int? ?? 0,
      status: InvoiceStatusX.fromString(json['status'] as String?),
      invoicePdf: json['invoice_pdf'] as String?,
      hostedInvoiceUrl: json['hosted_invoice_url'] as String?,
      currency: json['currency'] as String? ?? 'usd',
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'] as String)
          : null,
      paidAt: json['paid_at'] != null
          ? DateTime.tryParse(json['paid_at'] as String)
          : null,
    );
  }

  /// Convert InvoiceModel to InvoiceEntity
  static InvoiceEntity toEntity(InvoiceModel model) {
    return InvoiceEntity(
      stripeInvoiceId: model.stripeInvoiceId,
      amountDue: model.amountDue,
      status: model.status,
      invoicePdf: model.invoicePdf,
      hostedInvoiceUrl: model.hostedInvoiceUrl,
      currency: model.currency,
      createdAt: model.createdAt,
      paidAt: model.paidAt,
    );
  }

  /// Convert InvoiceEntity to InvoiceModel
  static InvoiceModel fromEntity(InvoiceEntity entity) {
    return InvoiceModel(
      stripeInvoiceId: entity.stripeInvoiceId,
      amountDue: entity.amountDue,
      status: entity.status,
      invoicePdf: entity.invoicePdf,
      hostedInvoiceUrl: entity.hostedInvoiceUrl,
      currency: entity.currency,
      createdAt: entity.createdAt,
      paidAt: entity.paidAt,
    );
  }

  /// Convert InvoiceModel to JSON for caching
  static Map<String, dynamic> toJson(InvoiceModel model) {
    return {
      'stripe_invoice_id': model.stripeInvoiceId,
      'amount_due': model.amountDue,
      'status': model.status.name,
      'invoice_pdf': model.invoicePdf,
      'hosted_invoice_url': model.hostedInvoiceUrl,
      'currency': model.currency,
      'created_at': model.createdAt?.toIso8601String(),
      'paid_at': model.paidAt?.toIso8601String(),
    };
  }
}
