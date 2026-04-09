import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart' as widgets;

import '../data/models/subscription/registration_response.dart';
import '../domain/entities/subscription/feature_types.dart';
import '../domain/entities/subscription/invoice_entity.dart';
import '../domain/entities/subscription/payment_method_entity.dart';
import '../domain/entities/subscription/pricing_plan_entity.dart';
import '../domain/entities/subscription/subscription_entity.dart';
import '../domain/repositories/subscription_repository.dart';
import '../domain/services/payment_service.dart';
import '../domain/use_cases/subscription/cancel_subscription_use_case.dart';
import '../domain/use_cases/subscription/check_subscription_use_case.dart';
import '../domain/use_cases/subscription/load_invoices_use_case.dart';
import '../domain/use_cases/subscription/load_payment_methods_use_case.dart';
import '../domain/use_cases/subscription/load_pricing_plans_use_case.dart';
import '../domain/use_cases/subscription/purchase_subscription_use_case.dart';

/// State for subscription operations
enum SubscriptionState {
  initial,
  loading,
  loaded,
  purchasing,
  error,
}

/// Provider for managing subscription state
/// Uses use cases for business logic following Clean Architecture
class SubscriptionProvider extends ChangeNotifier {
  final SubscriptionRepository _repository;
  final PaymentService _paymentService;
  
  /// Flag to track if subscription check is pending (waiting for username)
  final bool _pendingSubscriptionCheck = false;

  // Use cases
  late final CheckSubscriptionUseCase _checkSubscription;
  late final LoadPricingPlansUseCase _loadPricingPlans;
  late final LoadPaymentMethodsUseCase _loadPaymentMethods;
  late final LoadInvoicesUseCase _loadInvoices;
  late final CancelSubscriptionUseCase _cancelSubscription;
  late final PurchaseSubscriptionUseCase _purchaseSubscription;

  SubscriptionProvider({
    required SubscriptionRepository repository,
    required PaymentService paymentService,
  })  : _repository = repository,
        _paymentService = paymentService {
    // Initialize use cases
    _checkSubscription = CheckSubscriptionUseCase(_repository);
    _loadPricingPlans = LoadPricingPlansUseCase(_repository);
    _loadPaymentMethods = LoadPaymentMethodsUseCase(_repository);
    _loadInvoices = LoadInvoicesUseCase(_repository);
    _cancelSubscription = CancelSubscriptionUseCase(_repository);
    _purchaseSubscription = PurchaseSubscriptionUseCase(
      repository: _repository,
      paymentService: _paymentService,
    );
  }
  

  // State
  SubscriptionState _state = SubscriptionState.initial;
  SubscriptionEntity? _subscription;
  List<PricingPlanEntity> _plans = [];
  List<PaymentMethodEntity> _paymentMethods = [];
  List<InvoiceEntity> _invoices = [];
  String? _errorMessage;
  String? _customerId;
  
  // Loading guards to prevent duplicate API calls
  bool _isLoadingPlans = false;
  bool _isLoadingPaymentMethods = false;
  bool _isLoadingSubscription = false;

  // Getters
  SubscriptionState get state => _state;
  SubscriptionEntity? get subscription => _subscription;
  List<PricingPlanEntity> get plans => _plans;
  List<PaymentMethodEntity> get paymentMethods => _paymentMethods;
  List<InvoiceEntity> get invoices => _invoices;
  String? get errorMessage => _errorMessage;
  bool get isLoading => _state == SubscriptionState.loading;
  bool get isPurchasing => _state == SubscriptionState.purchasing;

  /// Check if user has premium subscription
  bool get isPremium => _subscription?.isActive ?? false;

  /// Check if subscription is incomplete (payment pending)
  bool get isIncomplete => _subscription?.status.value == 'incomplete';

  /// Check if subscription is pending activation
  bool get isPendingActivation {
    if (!isIncomplete) return false;
    final createdAt = _subscription?.createdAt;
    if (createdAt == null) return false;
    return DateTime.now().difference(createdAt).inMinutes < 60;
  }

  /// Get incomplete subscription message
  String? get incompleteMessage {
    if (isPendingActivation) {
      return 'Your subscription is being activated. This may take a few moments.';
    }
    if (isIncomplete) {
      return 'Payment pending. Please complete your payment to activate subscription.';
    }
    return null;
  }

  /// Check if user has access to a specific feature
  bool hasAccess(FeatureType feature) {
    // Check if user has trial status
    final isTrial = _subscription?.status == SubscriptionStatus.trial;
    final result = feature.isFree || isPremium || isPendingActivation || isTrial;
    if (kDebugMode) {
      print('🔑 hasAccess check for ${feature.displayName}:');
      print('   isFree: ${feature.isFree}');
      print('   isPremium: $isPremium');
      print('   isTrial: $isTrial');
      print('   isPendingActivation: $isPendingActivation');
      print('   status: ${_subscription?.status}');
      print('   → Result: $result');
    }
    return result;
  }

  /// Load subscription status from server
  /// NOTE: Subscription status is now primarily set via setSubscriptionFromCheckUsername()
  /// from the check-username API response. This method is kept for backward compatibility
  /// but no longer calls /stripe/subscriptions.
  Future<void> checkSubscription({widgets.BuildContext? context}) async {
    // Subscription state is now set from check-username API via setSubscriptionFromCheckUsername()
    // This method is a no-op for feature access checks
    if (_state == SubscriptionState.loaded) {
      if (kDebugMode) print('✅ SubscriptionProvider: Subscription already loaded from check-username');
      return;
    }
    
    // If not loaded yet, mark as loaded with no subscription (will be updated by check-username)
    if (_state == SubscriptionState.initial) {
      if (kDebugMode) print('⏳ SubscriptionProvider: Waiting for check-username API to set subscription');
      // Don't call API - check-username will populate this
    }
  }

  /// Sets subscription state from check-username API response.
  /// This is the primary way to set subscription status now.
  /// 
  /// Called by EmailCheckHelper.verifyEmailStatus() after getting data from
  /// GET /customers/check-username/{username} API.
  /// 
  /// NOTE: If you get "Lookup failed" error, perform a full app restart (not hot reload)
  void setSubscriptionFromCheckUsername({
    String? stripeCustomerId,
    String? subscriptionStatus,
    String? subscriptionExpiresAt,
    String? stripeSubscriptionId,
  }) {
    try {
      // Parse subscription status string to enum
      final status = SubscriptionStatusX.fromString(subscriptionStatus);
      
      // Parse expiration date
      DateTime? expiresAt;
      if (subscriptionExpiresAt != null) {
        expiresAt = DateTime.tryParse(subscriptionExpiresAt);
      }
      
      _subscription = SubscriptionEntity(
        stripeCustomerId: stripeCustomerId,
        stripeSubscriptionId: stripeSubscriptionId,
        status: status,
        currentPeriodEnd: expiresAt,
      );
      _state = SubscriptionState.loaded;
      
      if (kDebugMode) {
        print('✅ SubscriptionProvider: Set from check-username - status: $subscriptionStatus, customerId: $stripeCustomerId, subscriptionId: $stripeSubscriptionId, expiresAt: $expiresAt');
      }
      
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print('❌ SubscriptionProvider.setSubscriptionFromCheckUsername error: $e');
      }
      _state = SubscriptionState.error;
      _errorMessage = 'Failed to set subscription: $e';
      notifyListeners();
    }
  }
  
  /// Fetch fresh subscription status from /stripe/subscriptions API.
  /// This API returns stripe_subscription_id which is needed for cancel/reactivate.
  /// Returns the subscription entity with full data including stripe_subscription_id.
  Future<SubscriptionEntity?> fetchFreshSubscriptionStatus() async {
    if (kDebugMode) {
      print('🔄 fetchFreshSubscriptionStatus: Calling /stripe/subscriptions API...');
    }
    
    final result = await _checkSubscription();
    
    return result.fold(
      (error) {
        if (kDebugMode) print('❌ Error fetching subscription: $error');
        return null;
      },
      (subscription) {
        if (subscription != null) {
          // Update cached subscription with fresh data
          _subscription = subscription;
          _state = SubscriptionState.loaded;
          notifyListeners();
          
          if (kDebugMode) {
            print('✅ Fresh subscription fetched:');
            print('   ID: ${subscription.stripeSubscriptionId}');
            print('   Status: ${subscription.status.value}');
            print('   Customer: ${subscription.stripeCustomerId}');
          }
        }
        return subscription;
      },
    );
  }
  
  Future<void> _loadSubscriptionWithUsername(String username) async {
    _isLoadingSubscription = true;
    _state = SubscriptionState.loading;
    _errorMessage = null;

    final result = await _checkSubscription();

    result.fold(
      (error) {
        _state = SubscriptionState.error;
        _errorMessage = error;
        if (kDebugMode) print('❌ Error checking subscription: $error');
      },
      (subscription) {
        _subscription = subscription;
        _state = SubscriptionState.loaded;
        if (kDebugMode) {
          if (subscription == null) {
            print('✅ No active subscription');
          } else {
            print('✅ Subscription status: ${subscription.status.value}');
          }
        }
      },
    );

    _isLoadingSubscription = false;
    notifyListeners();
  }

  /// Load pricing plans
  Future<void> loadPricingPlans({bool forceRefresh = false}) async {
    // Guard against concurrent calls
    if (_isLoadingPlans) {
      if (kDebugMode) print('⏳ Already loading pricing plans, skipping');
      return;
    }
    
    // Skip if already loaded (unless force refresh)
    if (!forceRefresh && _plans.isNotEmpty) {
      if (kDebugMode) print('✅ Pricing plans already cached (${_plans.length} plans)');
      return;
    }
    
    _isLoadingPlans = true;
    
    try {
      final result = await _loadPricingPlans();

      result.fold(
        (error) {
          _errorMessage = error;
          if (kDebugMode) print('❌ Error loading plans: $error');
        },
        (plans) {
          _plans = plans;
          if (kDebugMode) print('✅ Loaded ${plans.length} pricing plans');
        },
      );
    } finally {
      _isLoadingPlans = false;
    }

    notifyListeners();
  }

  /// Load payment methods
  Future<void> loadPaymentMethods({bool forceRefresh = false}) async {
    // Guard against concurrent calls
    if (_isLoadingPaymentMethods) {
      if (kDebugMode) print('⏳ Already loading payment methods, skipping');
      return;
    }
    
    // Skip if already loaded (unless force refresh)
    if (!forceRefresh && _paymentMethods.isNotEmpty) {
      if (kDebugMode) print('✅ Payment methods already cached');
      return;
    }
    
    _isLoadingPaymentMethods = true;
    
    try {
      final result = await _loadPaymentMethods();

      result.fold(
        (error) => _errorMessage = error,
        (methods) => _paymentMethods = methods,
      );
    } finally {
      _isLoadingPaymentMethods = false;
    }

    notifyListeners();
  }

  /// Load invoices
  Future<void> loadInvoices() async {
    final result = await _loadInvoices();

    result.fold(
      (error) => _errorMessage = error,
      (invoices) => _invoices = invoices,
    );

    notifyListeners();
  }

  /// Initiate registration & send OTP
  /// Returns RegistrationResponse on success, sets error message on failure
  Future<RegistrationResponse?> initiateRegistration({
    required String email,
    required String name,
    String? phone,
  }) async {
    if (kDebugMode) {
      print('');
      print('═══════════════════════════════════════════════════════════');
      print('🚀 PROVIDER: initiateRegistration CALLED');
      print('═══════════════════════════════════════════════════════════');
      print('   📧 Email: $email');
      print('   👤 Name: $name');
      print('   📱 Phone: $phone');
      print('───────────────────────────────────────────────────────────');
    }
    
    final result = await _repository.initiateRegistration(
      email: email,
      name: name,
      phone: phone,
    );

    return result.fold(
      (error) {
        if (kDebugMode) {
          print('❌ PROVIDER: initiateRegistration FAILED');
          print('   Error: $error');
          print('═══════════════════════════════════════════════════════════');
        }
        _errorMessage = error;
        notifyListeners();
        return null;
      },
      (response) {
        if (kDebugMode) {
          print('✅ PROVIDER: initiateRegistration SUCCESS');
          print('   Session ID: ${response.sessionId}');
          print('   Masked Email: ${response.maskedEmail}');
          print('═══════════════════════════════════════════════════════════');
        }
        return response;
      },
    );
  }

  /// Verify OTP & create customer
  /// Returns true on success, false on failure
  Future<bool> verifyAndCreateCustomer({
    required String sessionId,
    required String otp,
  }) async {
    if (kDebugMode) {
      print('');
      print('═══════════════════════════════════════════════════════════');
      print('🚀 PROVIDER: verifyAndCreateCustomer CALLED');
      print('═══════════════════════════════════════════════════════════');
      print('   🔐 Session ID: $sessionId');
      print('   🔢 OTP: ***');
      print('───────────────────────────────────────────────────────────');
    }
    
    final result = await _repository.verifyAndCreateCustomer(
      sessionId: sessionId,
      otp: otp,
    );

    return result.fold(
      (error) {
        if (kDebugMode) {
          print('❌ PROVIDER: verifyAndCreateCustomer FAILED');
          print('   Error: $error');
          print('═══════════════════════════════════════════════════════════');
        }
        _errorMessage = error;
        notifyListeners();
        return false;
      },
      (customerId) {
        _customerId = customerId;
        if (kDebugMode) {
          print('✅ PROVIDER: verifyAndCreateCustomer SUCCESS');
          print('   Customer ID: $customerId');
          print('═══════════════════════════════════════════════════════════');
        }
        return true;
      },
    );
  }

  /// Attach a payment method to the current customer
  Future<bool> attachPaymentMethod(String paymentMethodId) async {
    _state = SubscriptionState.loading;
    _errorMessage = null;
    notifyListeners();

    final result = await _repository.attachPaymentMethod(paymentMethodId);

    return result.fold(
      (error) {
        _state = SubscriptionState.error;
        _errorMessage = error;
        notifyListeners();
        return false;
      },
      (paymentMethod) {
        // Refresh payment methods list
        loadPaymentMethods(forceRefresh: true);
        return true;
      },
    );
  }

  /// Purchase subscription using Payment Sheet
  Future<PaymentResult> purchaseWithPaymentSheet({
    required String priceId,
    String? paymentMethodId,
  }) async {
    _state = SubscriptionState.purchasing;
    _errorMessage = null;
    notifyListeners();

    final result = await _purchaseSubscription(
      PurchaseSubscriptionParams(
        priceId: priceId,
        paymentMethodId: paymentMethodId,
        customerId: _customerId,
        existingPaymentMethods: _paymentMethods,
      ),
    );

    PaymentResult paymentResult;

    switch (result) {
      case PurchaseSuccess():
        // Fetch fresh subscription from API
        final freshSub = await fetchFreshSubscriptionStatus();
        if (freshSub != null && freshSub.isActive) {
          _subscription = freshSub;
          _state = SubscriptionState.loaded;
          if (kDebugMode) print('✅ Subscription activated: ${freshSub.status.value}');
        }
        await loadPaymentMethods();
        paymentResult = PaymentResult.success;

      case PurchaseAlreadyActive():
        _state = SubscriptionState.loaded;
        await fetchFreshSubscriptionStatus();
        paymentResult = PaymentResult.success;

      case PurchaseCanceled():
        _state = SubscriptionState.loaded;
        paymentResult = PaymentResult.canceled;

      case PurchaseFailed(:final message):
        _state = SubscriptionState.error;
        _errorMessage = message;
        paymentResult = PaymentResult.failed(message);
    }

    notifyListeners();
    return paymentResult;
  }

  /// Cancel subscription
  Future<bool> cancelSubscription({bool cancelAtPeriodEnd = true}) async {
    if (_subscription?.stripeSubscriptionId == null) return false;

    _state = SubscriptionState.loading;
    notifyListeners();

    final result = await _cancelSubscription(
      subscriptionId: _subscription!.stripeSubscriptionId!,
      cancelAtPeriodEnd: cancelAtPeriodEnd,
    );

    return result.fold(
      (error) {
        _state = SubscriptionState.error;
        _errorMessage = error;
        notifyListeners();
        return false;
      },
      (subscription) {
        _subscription = subscription;
        _state = SubscriptionState.loaded;
        notifyListeners();
        return true;
      },
    );
  }

  /// Reactivate canceled subscription
  Future<bool> reactivateSubscription() async {
    if (_subscription?.stripeSubscriptionId == null) return false;

    _state = SubscriptionState.loading;
    notifyListeners();

    final result = await _repository.reactivateSubscription(
      _subscription!.stripeSubscriptionId!,
    );

    return result.fold(
      (error) {
        _state = SubscriptionState.error;
        _errorMessage = error;
        notifyListeners();
        return false;
      },
      (subscription) {
        _subscription = subscription;
        _state = SubscriptionState.loaded;
        notifyListeners();
        return true;
      },
    );
  }

  /// Handle FCM notification for subscription updates
  void handleFcmNotification(Map<String, dynamic> data) {
    final eventType = data['event_type'] as String?;

    switch (eventType) {
      case 'customer.subscription.updated':
        if (kDebugMode) print('📱 FCM: Subscription updated');
        checkSubscription();
        break;
      case 'invoice.payment_succeeded':
        if (kDebugMode) print('📱 FCM: Payment succeeded');
        checkSubscription();
        loadInvoices();
        break;
      case 'invoice.payment_failed':
        if (kDebugMode) print('📱 FCM: Payment failed');
        _errorMessage = 'Payment failed. Please update your payment method.';
        notifyListeners();
        break;
      case 'customer.subscription.trial_will_end':
        if (kDebugMode) print('📱 FCM: Trial ending soon');
        checkSubscription();
        break;
    }
  }

  /// Clear subscription data (on logout)
  Future<void> clearSubscription() async {
    await _repository.clearLocalSubscription();
    _subscription = null;
    _plans = [];
    _paymentMethods = [];
    _invoices = [];
    _customerId = null;
    _state = SubscriptionState.initial;
    notifyListeners();
  }

  /// Clear error message
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
