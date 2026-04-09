import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

import '../../../domain/entities/subscription/subscription_entity.dart';
import '../../../domain/entities/subscription/pricing_plan_entity.dart';
import '../../../domain/entities/subscription/payment_method_entity.dart';
import '../../../domain/entities/subscription/invoice_entity.dart';
import '../../../domain/repositories/subscription_repository.dart';
import '../../datasources/subscription/subscription_local_datasource.dart';
import '../../datasources/subscription/subscription_remote_datasource.dart';
import '../../mapper/subscription/subscription_mappers.dart';
import '../../models/subscription/registration_response.dart';

/// Repository implementation combining local & remote data sources
class SubscriptionRepositoryImpl implements SubscriptionRepository {
  final SubscriptionRemoteDataSource remoteDataSource;
  final SubscriptionLocalDataSource localDataSource;

  SubscriptionRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<String, SubscriptionEntity?>> getSubscriptionStatus() async {
    try {
      final subscription = await remoteDataSource.getSubscriptionStatus();
      
      if (subscription != null) {
        await localDataSource.cacheSubscription(subscription);
        return Right(SubscriptionMapper.toEntity(subscription));
      }
      
      await localDataSource.clearCachedSubscription();
      return const Right(null);
    } catch (e) {
      if (kDebugMode) print('❌ Repository error: $e');
      
      // On error, try cached data
      try {
        final cached = await localDataSource.getCachedSubscription();
        if (cached != null) {
          if (kDebugMode) print('⚠️ Using cached subscription due to error');
          return Right(SubscriptionMapper.toEntity(cached));
        }
      } catch (_) {}
      
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<PricingPlanEntity>>> getPricingPlans() async {
    try {
      final plans = await remoteDataSource.getPricingPlans();
      return Right(plans.map((p) => PricingPlanMapper.toEntity(p)).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, RegistrationResponse>> initiateRegistration({
    required String email,
    required String name,
    String? phone,
  }) async {
    try {
      if (kDebugMode) {
        print('');
        print('╔══════════════════════════════════════════════════════════');
        print('║ 🔄 REPOSITORY: initiateRegistration CALLED');
        print('╠══════════════════════════════════════════════════════════');
        print('║ 📧 Email: $email');
        print('║ 👤 Name: $name');
        print('║ 📱 Phone: $phone');
        print('╚══════════════════════════════════════════════════════════');
      }

      final response = await remoteDataSource.initiateRegistration(
        email: email,
        name: name,
        phone: phone,
      );
      
      if (kDebugMode) {
        print('✅ REGISTRATION INITIATED: OTP sent to ${response.maskedEmail}');
      }
      return Right(response);
    } catch (e) {
      if (kDebugMode) {
        print('❌ REPOSITORY ERROR: $e');
      }
      String errorMessage = e.toString();
      if (errorMessage.startsWith('Exception: ')) {
        errorMessage = errorMessage.substring(11);
      }
      return Left(errorMessage);
    }
  }

  @override
  Future<Either<String, String>> verifyAndCreateCustomer({
    required String sessionId,
    required String otp,
  }) async {
    try {
      if (kDebugMode) {
        print('');
        print('╔══════════════════════════════════════════════════════════');
        print('║ 🔄 REPOSITORY: verifyAndCreateCustomer CALLED');
        print('╠══════════════════════════════════════════════════════════');
        print('║ 🔐 SessionId: $sessionId');
        print('║ 🔢 OTP: ***');
        print('╚══════════════════════════════════════════════════════════');
      }

      final customerId = await remoteDataSource.verifyAndCreateCustomer(
        sessionId: sessionId,
        otp: otp,
      );
      
      await localDataSource.cacheCustomerId(customerId);
      
      if (kDebugMode) {
        print('✅ CUSTOMER CREATED: $customerId');
      }
      return Right(customerId);
    } catch (e) {
      if (kDebugMode) {
        print('❌ REPOSITORY ERROR: $e');
      }
      String errorMessage = e.toString();
      if (errorMessage.startsWith('Exception: ')) {
        errorMessage = errorMessage.substring(11);
      }
      return Left(errorMessage);
    }
  }
 @override
  Future<Either<String, PaymentMethodEntity>> attachPaymentMethod(
      String paymentMethodId) async {
    try {
      final paymentMethod =
          await remoteDataSource.attachPaymentMethod(paymentMethodId);
      return Right(PaymentMethodMapper.toEntity(paymentMethod));
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<PaymentMethodEntity>>> getPaymentMethods() async {
    try {
      final methods = await remoteDataSource.getPaymentMethods();
      return Right(methods.map((m) => PaymentMethodMapper.toEntity(m)).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, ({String subscriptionId, String status, String? clientSecret})>> createSubscription({
    required String priceId,
    String? paymentMethodId,
  }) async {
    try {
      final response = await remoteDataSource.createSubscription(
        priceId: priceId,
        paymentMethodId: paymentMethodId,
      );
      return Right(response);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, SubscriptionEntity>> cancelSubscription({
    required String subscriptionId,
    bool cancelAtPeriodEnd = true,
  }) async {
    try {
      final subscription = await remoteDataSource.cancelSubscription(
        subscriptionId: subscriptionId,
        cancelAtPeriodEnd: cancelAtPeriodEnd,
      );
      await localDataSource.cacheSubscription(subscription);
      return Right(SubscriptionMapper.toEntity(subscription));
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, SubscriptionEntity>> reactivateSubscription(
      String subscriptionId) async {
    try {
      final subscription =
          await remoteDataSource.reactivateSubscription(subscriptionId);
      await localDataSource.cacheSubscription(subscription);
      return Right(SubscriptionMapper.toEntity(subscription));
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<InvoiceEntity>>> getInvoices() async {
    try {
      final invoices = await remoteDataSource.getInvoices();
      return Right(invoices.map((i) => InvoiceMapper.toEntity(i)).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> saveSubscriptionLocally(
      SubscriptionEntity subscription) async {
    try {
      await localDataSource
          .cacheSubscription(SubscriptionMapper.fromEntity(subscription));
      return const Right(unit);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, SubscriptionEntity?>> getLocalSubscription() async {
    try {
      final cached = await localDataSource.getCachedSubscription();
      return Right(cached != null ? SubscriptionMapper.toEntity(cached) : null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> clearLocalSubscription() async {
    try {
      await localDataSource.clearCachedSubscription();
      return const Right(unit);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
