import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../di/check_username_injection.dart';

/// Utility class for syncing customer ID across services
/// Updated to use CheckUsername clean architecture
class CustomerIdSync {
  /// Sync customer ID to ensure consistency across all services
  /// Validates that the ID is a Bridge customer ID (not Stripe)
  static Future<void> syncCustomerId(String correctCustomerId) async {
    // Validate - Stripe IDs start with 'cus_', Bridge IDs don't
    if (correctCustomerId.startsWith('cus_')) {
      debugPrint('⚠️ CustomerIdSync: Rejecting Stripe customer ID: $correctCustomerId');
      return; // Don't store Stripe IDs
    }
    
    final prefs = await SharedPreferences.getInstance();
    final currentStoredId = prefs.getString('customer_id');

    if (currentStoredId != correctCustomerId) {
      debugPrint('🔄 CustomerIdSync: Updating customer ID from $currentStoredId to $correctCustomerId');
      await prefs.setString('customer_id', correctCustomerId);
      debugPrint('✅ CustomerIdSync: Customer ID updated successfully: $correctCustomerId');
    } else {
      debugPrint('✅ CustomerIdSync: Customer ID already correct: $correctCustomerId');
    }
  }
  
  /// Get the current stored customer ID (validates it's not a Stripe ID)
  static Future<String?> getCurrentCustomerId() async {
    final prefs = await SharedPreferences.getInstance();
    final customerId = prefs.getString('customer_id');
    
    // Validate - clear if it's a Stripe ID
    if (customerId != null && customerId.startsWith('cus_')) {
      debugPrint('⚠️ CustomerIdSync: Found invalid Stripe ID in cache, clearing: $customerId');
      await prefs.remove('customer_id');
      return null;
    }
    
    debugPrint('📋 CustomerIdSync: Retrieved customer ID: $customerId');
    return customerId;
  }
  
  /// Check username using clean architecture and sync customer ID if found
  /// Uses CheckUsernameRepository for proper caching
  static Future<String?> checkAndSyncCustomerId(String username) async {
    try {
      // Use the repository via DI
      final repository = await CheckUsernameInjection.createRepository();
      final result = await repository.checkUsername(username);
      
      return result.fold(
        (failure) {
          debugPrint('❌ CustomerIdSync: Error checking username: $failure');
          return null;
        },
        (entity) {
          final customerId = entity.customerId;
          
          if (customerId != null && customerId.isNotEmpty) {
            // Validate - don't sync Stripe IDs
            if (customerId.startsWith('cus_')) {
              debugPrint('⚠️ CustomerIdSync: Rejecting Stripe customer ID from API: $customerId');
              return null;
            }
            syncCustomerId(customerId);
            debugPrint('✅ CustomerIdSync: Found and synced customer ID: $customerId');
            return customerId;
          }
          return null;
        },
      );
    } catch (e) {
      debugPrint('❌ CustomerIdSync: Error checking username: $e');
      return null;
    }
  }
}