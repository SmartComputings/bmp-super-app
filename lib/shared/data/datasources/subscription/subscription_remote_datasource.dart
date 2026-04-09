import 'package:flutter/foundation.dart';

import '../../../../../core/config/api_config/shared_api_config.dart';
import '../../../../../core/network/api_client.dart';
import '../../mapper/subscription/subscription_mappers.dart';
import '../../models/subscription/invoice_model.dart';
import '../../models/subscription/payment_method_model.dart';
import '../../models/subscription/pricing_plan_model.dart';
import '../../models/subscription/registration_response.dart';
import '../../models/subscription/subscription_model.dart';

/// Remote datasource for Stripe subscription APIs
/// All 9 API endpoints are implemented here
abstract class SubscriptionRemoteDataSource {
  /// GET /stripe/subscriptions - Check subscription status
  Future<SubscriptionModel?> getSubscriptionStatus();

  /// GET /stripe/prices - Get pricing plans
  Future<List<PricingPlanModel>> getPricingPlans();

  /// POST /stripe/customers/register - Initiate registration & send OTP
  Future<RegistrationResponse> initiateRegistration({
    required String email,
    required String name,
    String? phone,
  });

  /// POST /stripe/customers/verify - Verify OTP & create customer
  Future<String> verifyAndCreateCustomer({
    required String sessionId,
    required String otp,
  });

  /// POST /stripe/payment-methods - Attach payment method
  Future<PaymentMethodModel> attachPaymentMethod(String paymentMethodId);

  /// GET /stripe/payment-methods - Get saved payment methods
  Future<List<PaymentMethodModel>> getPaymentMethods();

  /// POST /stripe/subscriptions - Create subscription
  /// Returns (subscriptionId, status, clientSecret?)
  Future<({String subscriptionId, String status, String? clientSecret})> createSubscription({
    required String priceId,
    String? paymentMethodId,
  });

  /// POST /stripe/subscriptions/{id}/cancel - Cancel subscription
  Future<SubscriptionModel> cancelSubscription({
    required String subscriptionId,
    bool cancelAtPeriodEnd = true,
  });

  /// POST /stripe/subscriptions/{id}/reactivate - Reactivate subscription
  Future<SubscriptionModel> reactivateSubscription(String subscriptionId);

  /// GET /stripe/invoices - Get invoices
  Future<List<InvoiceModel>> getInvoices();
}

class SubscriptionRemoteDataSourceImpl implements SubscriptionRemoteDataSource {
  @override
  Future<SubscriptionModel?> getSubscriptionStatus() async {
    try {
      if (kDebugMode) print('📡 Checking subscription status...');

      final response = await ApiClient.request(
        path: SharedApiConfig.getSubscriptionStatus,
        method: 'GET',
        includeRsa: true,
      );

      if (kDebugMode) {
        print('📥 Response received:');
        print('   Success: ${response.success}');
        print('   Status: ${response.status}');
      }

      if (response.success && response.data != null) {
        if (kDebugMode) {
          print('📦 Full response.data: ${response.data}');
          print('📦 response.data keys: ${response.data.keys.toList()}');
        }
        
        // First check for single 'subscription' object (primary API response format)
        final subscription = response.data['subscription'];
        if (subscription != null) {
          final subMap = Map<String, dynamic>.from(subscription);
          if (kDebugMode) {
            print('📦 Subscription found (single):');
            print('   All keys: ${subMap.keys.toList()}');
            print('   stripe_subscription_id: ${subMap['stripe_subscription_id']}');
            print('   Status: ${subMap['status']}');
            print('   Current Period End: ${subMap['current_period_end']}');
          }
          return SubscriptionMapper.fromJson(subMap);
        }
        
        // Also check for 'subscriptions' array (alternative response format)
        final subscriptions = response.data['subscriptions'] as List?;
        
        if (subscriptions != null && subscriptions.isNotEmpty) {
          // Find the best subscription (prioritize active > trialing > incomplete)
          Map<String, dynamic>? bestSubscription;
          for (final sub in subscriptions) {
            final status = sub['status'] as String?;
            if (status == 'active' || status == 'trialing') {
              bestSubscription = Map<String, dynamic>.from(sub);
              break;
            } else bestSubscription ??= Map<String, dynamic>.from(sub);
          }
          
          if (bestSubscription != null) {
            if (kDebugMode) {
              print('📦 Subscription found (from array):');
              print('   All keys: ${bestSubscription.keys.toList()}');
              print('   stripe_subscription_id: ${bestSubscription['stripe_subscription_id']}');
              print('   Status: ${bestSubscription['status']}');
              print('   Current Period End: ${bestSubscription['current_period_end']}');
            }
            return SubscriptionMapper.fromJson(bestSubscription);
          }
        }
        
        if (kDebugMode) print('⚠️ No subscription found in response');
      }
      return null;
    } catch (e) {
      if (kDebugMode) print('❌ Error checking subscription: $e');
      rethrow;
    }
  }

  @override
  Future<List<PricingPlanModel>> getPricingPlans() async {
    try {
      if (kDebugMode) print('📡 Getting pricing plans...');

      final response = await ApiClient.request(
        path: SharedApiConfig.getPricingPlans,
        method: 'GET',
        includeRsa: true,
      );

      if (kDebugMode) {
        print('📥 Response received:');
        print('   Success: ${response.success}');
        print('   Status: ${response.status}');
      }

      if (response.success && response.data != null) {
        final prices = response.data['prices'] as List?;
        if (prices != null) {
          if (kDebugMode) {
            print('📦 Found ${prices.length} pricing plans:');
            for (var i = 0; i < prices.length; i++) {
              final price = prices[i];
              print('   Plan ${i + 1}:');
              print('      ID: ${price['id']}');
              print('      Amount: ${price['unit_amount']}');
              print('      Currency: ${price['currency']}');
              print('      Interval: ${price['recurring']?['interval']}');
            }
          }
          return prices
              .map((p) =>
                  PricingPlanMapper.fromJson(Map<String, dynamic>.from(p)),)
              .toList();
        }
      }
      return [];
    } catch (e) {
      if (kDebugMode) print('❌ Error getting pricing plans: $e');
      rethrow;
    }
  }

  @override
  Future<RegistrationResponse> initiateRegistration({
    required String email,
    required String name,
    String? phone,
  }) async {
    try {
      final payload = {
        'email': email,
        'name': name,
        if (phone != null && phone.isNotEmpty) 'phone': phone,
      };
      
      if (kDebugMode) {
        print('');
        print('═══════════════════════════════════════════════════════════');
        print('📡 API CALL: INITIATE REGISTRATION');
        print('═══════════════════════════════════════════════════════════');
        print('🔗 Endpoint: POST /stripe/customers/register');
        print('📤 Payload: $payload');
        print('───────────────────────────────────────────────────────────');
      }

      final response = await ApiClient.request(
        path: SharedApiConfig.initiateRegistration,
        method: 'POST',
        data: payload,
        includeRsa: true,
      );

      if (kDebugMode) {
        print('📥 RESPONSE:');
        print('   ✓ Success: ${response.success}');
        print('   ✓ Status: ${response.status}');
        print('   ✓ Message: ${response.message ?? 'N/A'}');
        print('   ✓ Full Data: ${response.data}');
        print('═══════════════════════════════════════════════════════════');
        print('');
      }

      if (response.success && response.data != null) {
        if (kDebugMode) print('✅ Registration initiated, OTP sent');
        return RegistrationResponse.fromJson(response.data);
      }
      
      // Extract error message
      var errorMessage = 'Failed to initiate registration';
      if (response.data != null) {
        final message = response.data['message'] ?? response.message;
        if (message != null && message.toString().isNotEmpty) {
          errorMessage = message.toString();
        }
      }
      
      if (kDebugMode) print('❌ Registration failed: $errorMessage');
      throw Exception(errorMessage);
    } catch (e) {
      if (kDebugMode) print('❌ Error initiating registration: $e');
      rethrow;
    }
  }

  @override
  Future<String> verifyAndCreateCustomer({
    required String sessionId,
    required String otp,
  }) async {
    try {
      final payload = {
        'sessionId': sessionId,
        'otp': otp,
      };
      
      if (kDebugMode) {
        print('');
        print('═══════════════════════════════════════════════════════════');
        print('📡 API CALL: VERIFY OTP & CREATE CUSTOMER');
        print('═══════════════════════════════════════════════════════════');
        print('🔗 Endpoint: POST /stripe/customers/verify');
        print('📤 Payload: {sessionId: $sessionId, otp: ***}');
        print('───────────────────────────────────────────────────────────');
      }

      final response = await ApiClient.request(
        path: SharedApiConfig.verifyCustomer,
        method: 'POST',
        data: payload,
        includeRsa: true,
      );

      if (kDebugMode) {
        print('📥 RESPONSE:');
        print('   ✓ Success: ${response.success}');
        print('   ✓ Status: ${response.status}');
        print('   ✓ Message: ${response.message ?? 'N/A'}');
        print('   ✓ Full Data: ${response.data}');
        print('═══════════════════════════════════════════════════════════');
        print('');
      }

      if (response.success && response.data != null) {
        final customerId = response.data['customerId'] as String?;
        if (customerId != null) {
          if (kDebugMode) print('✅ Customer created: $customerId');
          return customerId;
        }
      }
      
      // Extract error message
      var errorMessage = 'Verification failed';
      if (response.data != null) {
        final message = response.data['message'] ?? response.message;
        if (message != null && message.toString().isNotEmpty) {
          errorMessage = message.toString();
        }
      }
      
      if (kDebugMode) print('❌ Verification failed: $errorMessage');
      throw Exception(errorMessage);
    } catch (e) {
      if (kDebugMode) print('❌ Error verifying OTP: $e');
      rethrow;
    }
  }

  @override
  Future<PaymentMethodModel> attachPaymentMethod(String paymentMethodId) async {
    try {
      if (kDebugMode) print('📡 Attaching payment method...');

      final response = await ApiClient.request(
        path: SharedApiConfig.paymentMethods,
        method: 'POST',
        data: {'paymentMethodId': paymentMethodId},
        includeRsa: true,
      );

      if (response.success && response.data != null) {
        final paymentMethod = response.data['paymentMethod'];
        if (paymentMethod != null) {
          return PaymentMethodMapper.fromJson(
              Map<String, dynamic>.from(paymentMethod),);
        }
      }
      throw Exception('Failed to attach payment method');
    } catch (e) {
      if (kDebugMode) print('❌ Error attaching payment method: $e');
      rethrow;
    }
  }

  @override
  Future<List<PaymentMethodModel>> getPaymentMethods() async {
    try {
      if (kDebugMode) print('📡 Getting payment methods...');

      final response = await ApiClient.request(
        path: SharedApiConfig.paymentMethods,
        method: 'GET',
        includeRsa: true,
      );

      if (kDebugMode) {
        print('📥 Payment Methods Response:');
        print('   Success: ${response.success}');
        print('   Status: ${response.status}');
      }

      if (response.success && response.data != null) {
        final methods = response.data['paymentMethods'] as List?;
        if (methods != null) {
          if (kDebugMode) {
            print('📦 Found ${methods.length} payment method(s):');
            for (var i = 0; i < methods.length; i++) {
              final method = methods[i];
              print('   Method ${i + 1}:');
              print('      Payment Method ID: ${method['stripe_payment_method_id']}');
              print('      Card Brand: ${method['card_brand']}');
              print('      Card Last 4: ${method['card_last4']}');
              print('      Is Default: ${method['is_default']}');
            }
          }
          return methods
              .map((m) =>
                  PaymentMethodMapper.fromJson(Map<String, dynamic>.from(m)),)
              .toList();
        }
      }
      return [];
    } catch (e) {
      if (kDebugMode) print('❌ Error getting payment methods: $e');
      rethrow;
    }
  }

  @override
  Future<({String subscriptionId, String status, String? clientSecret})> createSubscription({
    required String priceId,
    String? paymentMethodId,
  }) async {
    try {
      if (kDebugMode) print('📡 Creating subscription...');

      final data = {'priceId': priceId};
      if (paymentMethodId != null) {
        data['paymentMethodId'] = paymentMethodId;
      }

      final response = await ApiClient.request(
        path: SharedApiConfig.createSubscription,
        method: 'POST',
        data: data,
        includeRsa: true,
      );

      if (kDebugMode) {
        print('📥 Response received:');
        print('   Success: ${response.success}');
        print('   Status: ${response.status}');
        print('   📦 FULL Response Data: ${response.data}');
      }

      if (response.success && response.data != null) {
        if (kDebugMode) {
          print('🔑 Available keys in response.data: ${response.data.keys.toList()}');
        }
        
        final subscription = response.data['subscription'];
        final rootClientSecret = response.data['clientSecret'];
        
        if (kDebugMode) {
          print('🔐 Root level clientSecret: $rootClientSecret');
        }
        
        if (subscription != null) {
          if (kDebugMode) {
            print('📦 Subscription object:');
            print('   ID: ${subscription['id']}');
            print('   Status: ${subscription['status']}');
            print('   Client Secret: ${subscription['clientSecret'] ?? 'null'}');
          }

          // Get client secret from nested structure if available
          var clientSecret = subscription['clientSecret'] as String?;
          if (clientSecret == null) {
            final latestInvoice = subscription['latest_invoice'];
            if (latestInvoice != null) {
              final paymentIntent = latestInvoice['payment_intent'];
              if (paymentIntent != null) {
                clientSecret = paymentIntent['client_secret'] as String?;
                if (kDebugMode) print('   Client Secret (from invoice): $clientSecret');
              }
            }
          }

          return (
            subscriptionId: (subscription['id'] ?? '').toString(),
            status: (subscription['status'] ?? 'unknown').toString(),
            clientSecret: clientSecret,
          );
        }
      }
      throw Exception('Failed to create subscription');
    } catch (e) {
      if (kDebugMode) print('❌ Error creating subscription: $e');
      rethrow;
    }
  }

  @override
  Future<SubscriptionModel> cancelSubscription({
    required String subscriptionId,
    bool cancelAtPeriodEnd = true,
  }) async {
    try {
      if (kDebugMode) {
        print('');
        print('═══════════════════════════════════════════════════════════');
        print('📡 API CALL: CANCEL SUBSCRIPTION');
        print('═══════════════════════════════════════════════════════════');
        print('🔗 Endpoint: POST /stripe/subscriptions/$subscriptionId/cancel');
        print('📤 Payload: {cancelAtPeriodEnd: $cancelAtPeriodEnd}');
        print('───────────────────────────────────────────────────────────');
      }

      final response = await ApiClient.request(
        path: SharedApiConfig.cancelSubscription(subscriptionId),
        method: 'POST',
        data: {'cancelAtPeriodEnd': cancelAtPeriodEnd},
        includeRsa: true,
      );

      if (kDebugMode) {
        print('📥 RESPONSE:');
        print('   ✓ Success: ${response.success}');
        print('   ✓ Status: ${response.status}');
        print('   ✓ Message: ${response.message ?? 'N/A'}');
        print('   ✓ Full Data: ${response.data}');
        print('═══════════════════════════════════════════════════════════');
        print('');
      }

      if (response.success && response.data != null) {
        final subscription = response.data['subscription'];
        if (subscription != null) {
          if (kDebugMode) print('✅ Subscription cancelled successfully');
          return SubscriptionMapper.fromJson(
              Map<String, dynamic>.from(subscription),);
        }
      }
      throw Exception('Failed to cancel subscription');
    } catch (e) {
      if (kDebugMode) print('❌ Error canceling subscription: $e');
      rethrow;
    }
  }

  @override
  Future<SubscriptionModel> reactivateSubscription(
      String subscriptionId,) async {
    try {
      if (kDebugMode) {
        print('');
        print('═══════════════════════════════════════════════════════════');
        print('📡 API CALL: REACTIVATE SUBSCRIPTION');
        print('═══════════════════════════════════════════════════════════');
        print('🔗 Endpoint: POST /stripe/subscriptions/$subscriptionId/reactivate');
        print('───────────────────────────────────────────────────────────');
      }

      final response = await ApiClient.request(
        path: SharedApiConfig.reactivateSubscription(subscriptionId),
        method: 'POST',
        includeRsa: true,
      );

      if (kDebugMode) {
        print('📥 RESPONSE:');
        print('   ✓ Success: ${response.success}');
        print('   ✓ Status: ${response.status}');
        print('   ✓ Message: ${response.message ?? 'N/A'}');
        print('   ✓ Full Data: ${response.data}');
        print('═══════════════════════════════════════════════════════════');
        print('');
      }

      if (response.success && response.data != null) {
        final subscription = response.data['subscription'];
        if (subscription != null) {
          if (kDebugMode) print('✅ Subscription reactivated successfully');
          return SubscriptionMapper.fromJson(
              Map<String, dynamic>.from(subscription),);
        }
      }
      throw Exception('Failed to reactivate subscription');
    } catch (e) {
      if (kDebugMode) print('❌ Error reactivating subscription: $e');
      rethrow;
    }
  }

  @override
  Future<List<InvoiceModel>> getInvoices() async {
    try {
      if (kDebugMode) print('📡 Getting invoices...');

      final response = await ApiClient.request(
        path: SharedApiConfig.getInvoices,
        method: 'GET',
        includeRsa: true,
      );

      if (response.success && response.data != null) {
        final invoices = response.data['invoices'] as List?;
        if (invoices != null) {
          return invoices
              .map((i) => InvoiceMapper.fromJson(Map<String, dynamic>.from(i)))
              .toList();
        }
      }
      return [];
    } catch (e) {
      if (kDebugMode) print('❌ Error getting invoices: $e');
      rethrow;
    }
  }
}
