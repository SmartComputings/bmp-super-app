import 'package:flutter/foundation.dart';

import '../../entities/subscription/payment_method_entity.dart';
import '../../repositories/subscription_repository.dart';
import '../../services/payment_service.dart';

/// Parameters for purchase subscription use case
class PurchaseSubscriptionParams {
  final String priceId;
  final String? paymentMethodId;
  final String? customerId;
  final List<PaymentMethodEntity> existingPaymentMethods;

  const PurchaseSubscriptionParams({
    required this.priceId,
    this.paymentMethodId,
    this.customerId,
    this.existingPaymentMethods = const [],
  });
}

/// Result of purchase subscription
sealed class PurchaseResult {
  const PurchaseResult();
}

class PurchaseSuccess extends PurchaseResult {
  const PurchaseSuccess();
}

class PurchaseCanceled extends PurchaseResult {
  const PurchaseCanceled();
}

class PurchaseFailed extends PurchaseResult {
  final String message;
  const PurchaseFailed(this.message);
}

class PurchaseAlreadyActive extends PurchaseResult {
  const PurchaseAlreadyActive();
}

/// Use case for purchasing a subscription
/// Orchestrates the entire purchase flow including:
/// 1. Create subscription on backend
/// 2. Initialize payment sheet with client secret
/// 3. Present payment sheet
/// 4. Handle result
class PurchaseSubscriptionUseCase {
  final SubscriptionRepository _repository;
  final PaymentService _paymentService;

  const PurchaseSubscriptionUseCase({
    required SubscriptionRepository repository,
    required PaymentService paymentService,
  })  : _repository = repository,
        _paymentService = paymentService;

  /// Execute the purchase flow
  Future<PurchaseResult> call(PurchaseSubscriptionParams params) async {
    try {
      if (kDebugMode) print('🛍️ Starting subscription purchase flow...');
      if (kDebugMode) print('🏷️ Price ID: ${params.priceId}');

      // Determine payment method to use
      String? paymentMethodToUse = params.paymentMethodId;

      // If no payment method provided, check for existing default
      if (paymentMethodToUse == null && params.existingPaymentMethods.isNotEmpty) {
        final defaultMethod = params.existingPaymentMethods.firstWhere(
          (m) => m.isDefault,
          orElse: () => params.existingPaymentMethods.first,
        );
        paymentMethodToUse = defaultMethod.stripePaymentMethodId;
        if (kDebugMode) print('💳 Using existing payment method: $paymentMethodToUse');
      }

      // Step 0: If payment method is provided, always attempt to attach it to ensure it's linked
      // Stripe attachment is idempotent for the same customer, but this solves out-of-sync cache issues
      if (params.paymentMethodId != null) {
        if (kDebugMode) {
          print('🔗 Step 0: Ensuring payment method attachment for ${params.paymentMethodId}...');
          print('🔗 Current local cache contains: ${params.existingPaymentMethods.map((m) => m.stripePaymentMethodId).toList()}');
        }

        // Even if it "exists" in cache, we attempt attachment to be safe if it's the one we're using
        if (kDebugMode) print('🔗 Calling repository.attachPaymentMethod to ensure server link...');
        final attachResult = await _repository.attachPaymentMethod(
          params.paymentMethodId!,
        );

        attachResult.fold(
          (error) {
            if (kDebugMode) print('⚠️ Note: Attachment attempt returned: $error (Often occurs if already attached, which is fine)');
          },
          (success) {
            if (kDebugMode) print('✅ Payment method attachment confirmed on server');
          },
        );
      }

      // Step 1: Create subscription on backend
      if (kDebugMode) {
        print('📡 Step 1: Creating subscription on backend...');
        print('💳 Payment Method ID: ${paymentMethodToUse ?? 'None'}');
      }
      final createResult = await _repository.createSubscription(
        priceId: params.priceId,
        paymentMethodId: paymentMethodToUse,
      );

      return await createResult.fold(
        (error) {
          if (kDebugMode) print('❌ Backend error: $error');
          return PurchaseFailed(error);
        },
        (response) async {
          if (kDebugMode) {
            print('✅ Subscription created on backend');
            print('🆔 Subscription ID: ${response.subscriptionId}');
            print('🟢 Status: ${response.status}');
          }

          // If status is active, no payment needed
          if (response.status == 'active') {
            if (kDebugMode) print('✅ Subscription already active!');
            return const PurchaseAlreadyActive();
          }

          // If status is trialing, no immediate payment needed
          if (response.status == 'trialing') {
            if (kDebugMode) print('✅ Subscription started in trial mode!');
            return const PurchaseSuccess();
          }

          // Step 2: Handle payment confirmation
          if (response.clientSecret != null) {
            // If we already have a paymentMethodId, confirm directly (no second card UI)
            if (paymentMethodToUse != null) {
              if (kDebugMode) print('💳 Step 2: Confirming payment with existing payment method...');
              return await _confirmWithPaymentMethod(
                clientSecret: response.clientSecret!,
                paymentMethodId: paymentMethodToUse,
              );
            }
            // No paymentMethodId — fallback to Payment Sheet
            return await _handlePaymentSheet(
              clientSecret: response.clientSecret!,
              customerId: params.customerId,
            );
          } else {
            if (kDebugMode) {
              print('⚠️ Backend did not return clientSecret (Status: ${response.status})');
            }
            return PurchaseFailed(
              'Backend did not return payment client secret for status: ${response.status}. Please contact support.',
            );
          }
        },
      );
    } catch (e) {
      if (kDebugMode) print('❌ Unexpected error: $e');
      return PurchaseFailed(e.toString());
    }
  }

  /// Confirm payment using an existing paymentMethodId (no card UI shown)
  /// Only 3D Secure popup may appear if required
  Future<PurchaseResult> _confirmWithPaymentMethod({
    required String clientSecret,
    required String paymentMethodId,
  }) async {
    try {
      final paymentResult = await _paymentService.confirmPayment(
        clientSecret,
        paymentMethodId: paymentMethodId,
      );

      if (paymentResult.isSuccess) {
        if (kDebugMode) print('✅ Payment confirmed successfully!');
        return const PurchaseSuccess();
      } else if (paymentResult.isCanceled) {
        if (kDebugMode) print('⚠️ Payment canceled');
        return const PurchaseCanceled();
      } else {
        if (kDebugMode) print('❌ Payment failed: ${paymentResult.errorMessage}');
        return PurchaseFailed(paymentResult.errorMessage ?? 'Payment failed');
      }
    } catch (e) {
      if (kDebugMode) print('❌ Payment confirmation error: $e');
      return PurchaseFailed(e.toString());
    }
  }

  Future<PurchaseResult> _handlePaymentSheet({
    required String clientSecret,
    String? customerId,
  }) async {
    try {
      if (kDebugMode) {
        print('🔐 Step 2: Initializing Payment Sheet...');
        print('🔑 Client Secret: ${clientSecret.substring(0, 20)}...');
      }

      await _paymentService.initPaymentSheet(
        clientSecret: clientSecret,
        customerId: customerId,
      );

      if (kDebugMode) print('📱 Step 3: Presenting Payment Sheet to user...');

      final paymentResult = await _paymentService.presentPaymentSheet();

      if (paymentResult.isSuccess) {
        if (kDebugMode) print('✅ Payment successful!');
        return const PurchaseSuccess();
      } else if (paymentResult.isCanceled) {
        if (kDebugMode) print('⚠️ User canceled payment');
        return const PurchaseCanceled();
      } else {
        if (kDebugMode) print('❌ Payment failed: ${paymentResult.errorMessage}');
        return PurchaseFailed(paymentResult.errorMessage ?? 'Payment failed');
      }
    } catch (e) {
      if (kDebugMode) print('❌ Stripe SDK error: $e');
      return PurchaseFailed(e.toString());
    }
  }
}
