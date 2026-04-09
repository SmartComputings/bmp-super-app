/// Result of a payment operation
enum PaymentResultStatus {
  success,
  canceled,
  failed,
}

/// Payment result from payment service
class PaymentResult {
  final PaymentResultStatus status;
  final String? errorMessage;

  const PaymentResult._({
    required this.status,
    this.errorMessage,
  });

  static const success = PaymentResult._(status: PaymentResultStatus.success);
  static const canceled = PaymentResult._(status: PaymentResultStatus.canceled);

  factory PaymentResult.failed(String? message) => PaymentResult._(
        status: PaymentResultStatus.failed,
        errorMessage: message,
      );

  bool get isSuccess => status == PaymentResultStatus.success;
  bool get isCanceled => status == PaymentResultStatus.canceled;
  bool get isFailed => status == PaymentResultStatus.failed;
}

/// Abstract payment service interface
/// Allows for different payment implementations (Stripe, etc.)
abstract class PaymentService {
  /// Initialize the payment sheet with client secret
  Future<void> initPaymentSheet({
    required String clientSecret,
    String? customerId,
    String? ephemeralKey,
    String merchantDisplayName = 'Be Mind Power',
  });

  /// Present the payment sheet to the user
  /// Returns PaymentResult indicating success, cancellation, or failure
  Future<PaymentResult> presentPaymentSheet();

  /// Confirm payment with client secret (for 3D Secure)
  /// If paymentMethodId is provided, uses the existing payment method
  Future<PaymentResult> confirmPayment(String clientSecret, {String? paymentMethodId});

  /// Create a payment method from card details
  Future<String?> createPaymentMethod();
}
