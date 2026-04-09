import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../domain/services/payment_service.dart';

/// Stripe implementation of PaymentService
class StripePaymentServiceImpl implements PaymentService {
  /// Get Stripe publishable key from .env
  static String get publishableKey {
    final key = dotenv.env['STRIPE_PUBLIC_KEY']?.trim();
    if (key == null || key.isEmpty) {
      throw Exception('STRIPE_PUBLIC_KEY not found or empty in .env file');
    }
    return key;
  }

  /// Initialize Stripe SDK
  static Future<void> initialize() async {
    try {
      final key = publishableKey;
      if (!key.startsWith('pk_test_') && !key.startsWith('pk_live_')) {
        throw Exception('Invalid Stripe key format. Must start with pk_test_ or pk_live_');
      }
      Stripe.publishableKey = key;
      await Stripe.instance.applySettings();
      if (kDebugMode) print('✅ Stripe SDK initialized with key: ${key.substring(0, 20)}...');
    } catch (e) {
      if (kDebugMode) print('❌ Stripe initialization failed: $e');
      rethrow;
    }
  }

  @override
  Future<void> initPaymentSheet({
    required String clientSecret,
    String? customerId,
    String? ephemeralKey,
    String merchantDisplayName = 'Be Mind Power',
  }) async {
    try {
      if (kDebugMode) {
        print('🔧 Initializing Payment Sheet...');
        print('   Client Secret: ${clientSecret.substring(0, 20)}...');
        print('   Customer ID: ${customerId ?? 'null'}');
      }

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          customerId: customerId,
          customerEphemeralKeySecret: ephemeralKey,
          merchantDisplayName: merchantDisplayName,
          style: ThemeMode.system,
          appearance: const PaymentSheetAppearance(
            colors: PaymentSheetAppearanceColors(
              primary: Color(0xFF6366F1),
            ),
            shapes: PaymentSheetShape(
              borderRadius: 12,
            ),
          ),
        ),
      );

      if (kDebugMode) print('✅ Payment Sheet initialized successfully');
    } catch (e) {
      if (kDebugMode) print('❌ Error initializing payment sheet: $e');
      rethrow;
    }
  }

  @override
  Future<PaymentResult> presentPaymentSheet() async {
    try {
      if (kDebugMode) {
        print('📱 Presenting Payment Sheet...');
        print('💳 Waiting for user to enter card details...');
      }

      await Stripe.instance.presentPaymentSheet();

      if (kDebugMode) {
        print('✅ Payment Sheet completed successfully!');
        print('🎉 Card details entered and validated');
        print('🔐 Payment method created by Stripe SDK');
        print('✅ Payment Intent confirmed');
      }
      return PaymentResult.success;
    } on StripeException catch (e) {
      if (e.error.code == FailureCode.Canceled) {
        if (kDebugMode) {
          print('⚠️ Payment canceled by user');
          print('🚫 User closed the payment sheet');
        }
        return PaymentResult.canceled;
      }
      if (kDebugMode) {
        print('❌ Stripe error occurred:');
        print('   Error Code: ${e.error.code}');
        print('   Error Message: ${e.error.message}');
        print('   Decline Code: ${e.error.declineCode ?? 'null'}');
      }
      return PaymentResult.failed(e.error.message);
    } catch (e) {
      if (kDebugMode) {
        print('❌ Payment error: $e');
      }
      return PaymentResult.failed(e.toString());
    }
  }

  @override
  Future<PaymentResult> confirmPayment(String clientSecret, {String? paymentMethodId}) async {
    try {
      if (kDebugMode) {
        print('🔐 Confirming payment...');
        if (paymentMethodId != null) print('💳 Using payment method: $paymentMethodId');
      }

      await Stripe.instance.confirmPayment(
        paymentIntentClientSecret: clientSecret,
        data: paymentMethodId != null
            ? PaymentMethodParams.cardFromMethodId(
                paymentMethodData: PaymentMethodDataCardFromMethod(
                  paymentMethodId: paymentMethodId,
                ),
              )
            : null,
      );

      if (kDebugMode) print('✅ Payment confirmed');
      return PaymentResult.success;
    } on StripeException catch (e) {
      if (e.error.code == FailureCode.Canceled) {
        return PaymentResult.canceled;
      }
      return PaymentResult.failed(e.error.message);
    } catch (e) {
      return PaymentResult.failed(e.toString());
    }
  }

  @override
  Future<String?> createPaymentMethod() async {
    try {
      final paymentMethod = await Stripe.instance.createPaymentMethod(
        params: const PaymentMethodParams.card(
          paymentMethodData: PaymentMethodData(),
        ),
      );
      return paymentMethod.id;
    } catch (e) {
      if (kDebugMode) print('❌ Error creating payment method: $e');
      return null;
    }
  }
}
