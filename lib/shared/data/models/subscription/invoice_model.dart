import '../../../domain/entities/subscription/invoice_entity.dart';

/// Data model for invoice.
/// Use InvoiceMapper for JSON parsing and entity conversion.
class InvoiceModel extends InvoiceEntity {
  const InvoiceModel({
    required super.stripeInvoiceId,
    required super.amountDue,
    required super.status,
    super.invoicePdf,
    super.hostedInvoiceUrl,
    super.currency,
    super.createdAt,
    super.paidAt,
  });
}

