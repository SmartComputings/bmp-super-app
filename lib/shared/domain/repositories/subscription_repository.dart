import 'package:fpdart/fpdart.dart';

import '../../data/models/subscription/registration_response.dart';
import '../entities/subscription/subscription_entity.dart';
import '../entities/subscription/pricing_plan_entity.dart';
import '../entities/subscription/payment_method_entity.dart';
import '../entities/subscription/invoice_entity.dart';

/// Abstract repository for subscription operations
/// All methods return Either<String, T> where String is error message
abstract class SubscriptionRepository {
  /// Check current subscription status
  /// GET /api/stripe/subscriptions
  Future<Either<String, SubscriptionEntity?>> getSubscriptionStatus();

  /// Get available pricing plans
  /// GET /api/stripe/prices
  Future<Either<String, List<PricingPlanEntity>>> getPricingPlans();

  /// Initiate registration & send OTP
  /// POST /api/stripe/customers/register
  Future<Either<String, RegistrationResponse>> initiateRegistration({
    required String email,
    required String name,
    String? phone,
  });

  /// Verify OTP & create customer
  /// POST /api/stripe/customers/verify
  Future<Either<String, String>> verifyAndCreateCustomer({
    required String sessionId,
    required String otp,
  });

  /// Attach a payment method to customer
  /// POST /api/stripe/payment-methods
  Future<Either<String, PaymentMethodEntity>> attachPaymentMethod(
    String paymentMethodId,
  );

  /// Get saved payment methods
  /// GET /api/stripe/payment-methods
  Future<Either<String, List<PaymentMethodEntity>>> getPaymentMethods();

  /// Create a subscription
  /// POST /api/stripe/subscriptions
  /// Returns (subscriptionId, status, clientSecret?)
  Future<Either<String, ({String subscriptionId, String status, String? clientSecret})>> createSubscription({
    required String priceId,
    String? paymentMethodId,
  });

  /// Cancel subscription
  /// POST /api/stripe/subscriptions/{id}/cancel
  Future<Either<String, SubscriptionEntity>> cancelSubscription({
    required String subscriptionId,
    bool cancelAtPeriodEnd = true,
  });

  /// Reactivate canceled subscription
  /// POST /api/stripe/subscriptions/{id}/reactivate
  Future<Either<String, SubscriptionEntity>> reactivateSubscription(
    String subscriptionId,
  );

  /// Get invoices/payment history
  /// GET /api/stripe/invoices
  Future<Either<String, List<InvoiceEntity>>> getInvoices();

  /// Save subscription to local storage
  Future<Either<String, Unit>> saveSubscriptionLocally(
    SubscriptionEntity subscription,
  );

  /// Get subscription from local storage
  Future<Either<String, SubscriptionEntity?>> getLocalSubscription();

  /// Clear local subscription data
  Future<Either<String, Unit>> clearLocalSubscription();
}
