import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../data/datasources/subscription/subscription_local_datasource.dart';
import '../data/datasources/subscription/subscription_remote_datasource.dart';
import '../data/models/subscription/subscription_model.dart';
import '../data/repositories/subscription/subscription_repository_impl.dart';
import '../data/services/subscription/stripe_payment_service.dart';
import '../domain/repositories/subscription_repository.dart';
import '../domain/services/payment_service.dart';
import '../providers/subscription_provider.dart';

/// Dependency injection for subscription feature
class SubscriptionInjection {
  static bool _isInitialized = false;

  /// Initialize Hive and register adapters
  static Future<void> init() async {
    if (_isInitialized) return;

    // Register Hive adapter for SubscriptionModel
    if (!Hive.isAdapterRegistered(10)) {
      Hive.registerAdapter(SubscriptionModelAdapter());
    }

    // Initialize Stripe SDK
    await StripePaymentServiceImpl.initialize();

    _isInitialized = true;
    debugPrint('✅ SubscriptionInjection initialized');
  }

  /// Create PaymentService instance
  static PaymentService createPaymentService() {
    return StripePaymentServiceImpl();
  }

  /// Create SubscriptionProvider with all dependencies (synchronous after init)
  static SubscriptionProvider createProviderSync() {
    // Data Sources
    final localDataSource = SubscriptionLocalDataSourceImpl();
    final remoteDataSource = SubscriptionRemoteDataSourceImpl();

    // Repository
    final repository = SubscriptionRepositoryImpl(
      localDataSource: localDataSource,
      remoteDataSource: remoteDataSource,
    );

    // Payment Service
    final paymentService = createPaymentService();

    // Provider
    return SubscriptionProvider(
      repository: repository,
      paymentService: paymentService,
    );
  }

  /// Create SubscriptionProvider with all dependencies (async)
  static Future<SubscriptionProvider> createProvider() async {
    await init();
    return createProviderSync();
  }

  /// Create repository directly
  static Future<SubscriptionRepository> createRepository() async {
    await init();

    final localDataSource = SubscriptionLocalDataSourceImpl();
    final remoteDataSource = SubscriptionRemoteDataSourceImpl();

    return SubscriptionRepositoryImpl(
      localDataSource: localDataSource,
      remoteDataSource: remoteDataSource,
    );
  }
}
