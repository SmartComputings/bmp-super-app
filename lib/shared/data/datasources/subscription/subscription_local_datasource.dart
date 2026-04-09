import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../../../../core/config/api_config/shared_local_config.dart';
import '../../mapper/subscription/subscription_mappers.dart';
import '../../models/subscription/subscription_model.dart';

/// Local datasource for subscription data using Hive
abstract class SubscriptionLocalDataSource {
  /// Get cached subscription from local storage
  Future<SubscriptionModel?> getCachedSubscription();

  /// Cache subscription to local storage
  Future<void> cacheSubscription(SubscriptionModel subscription);

  /// Clear cached subscription
  Future<void> clearCachedSubscription();

  /// Get cached customer ID
  Future<String?> getCachedCustomerId();

  /// Cache customer ID
  Future<void> cacheCustomerId(String customerId);

  /// Dispose resources (close Hive box)
  Future<void> dispose();
}

class SubscriptionLocalDataSourceImpl implements SubscriptionLocalDataSource {
  Box<dynamic>? _box;

  Future<Box<dynamic>> get box async {
    _box ??= await Hive.openBox(SharedLocalConfig.subscriptionBoxName);
    return _box!;
  }

  @override
  Future<void> dispose() async {
    await _box?.close();
    _box = null;
    if (kDebugMode) print('✅ Subscription local datasource disposed');
  }

  @override
  Future<SubscriptionModel?> getCachedSubscription() async {
    try {
      final b = await box;
      final data = b.get(SharedLocalConfig.subscriptionKey);
      if (data == null) return null;

      if (data is SubscriptionModel) {
        return data;
      } else if (data is Map) {
        return SubscriptionMapper.fromJson(Map<String, dynamic>.from(data));
      }
      return null;
    } catch (e) {
      if (kDebugMode) print('❌ Error getting cached subscription: $e');
      return null;
    }
  }

  @override
  Future<void> cacheSubscription(SubscriptionModel subscription) async {
    try {
      final b = await box;
      await b.put(SharedLocalConfig.subscriptionKey, SubscriptionMapper.toJson(subscription));
      if (kDebugMode) print('✅ Subscription cached successfully');
    } catch (e) {
      if (kDebugMode) print('❌ Error caching subscription: $e');
    }
  }

  @override
  Future<void> clearCachedSubscription() async {
    try {
      final b = await box;
      await b.delete(SharedLocalConfig.subscriptionKey);
      await b.delete(SharedLocalConfig.customerIdKey);
      if (kDebugMode) print('✅ Cached subscription cleared');
    } catch (e) {
      if (kDebugMode) print('❌ Error clearing cached subscription: $e');
    }
  }

  @override
  Future<String?> getCachedCustomerId() async {
    try {
      final b = await box;
      return b.get(SharedLocalConfig.customerIdKey) as String?;
    } catch (e) {
      if (kDebugMode) print('❌ Error getting cached customer ID: $e');
      return null;
    }
  }

  @override
  Future<void> cacheCustomerId(String customerId) async {
    try {
      final b = await box;
      await b.put(SharedLocalConfig.customerIdKey, customerId);
      if (kDebugMode) print('✅ Customer ID cached successfully');
    } catch (e) {
      if (kDebugMode) print('❌ Error caching customer ID: $e');
    }
  }
}
