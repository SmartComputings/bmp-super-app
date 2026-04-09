import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerIdFix {
  CustomerIdFix._();

  /// Force refresh customer ID from username check to fix state issues
  static Future<Either<String, String>> forceRefreshCustomerId(String username) async {
    // Finance module removed
    return left('Finance module removed');
  }
  
  /// Clear all customer data and force re-authentication
  static Future<Either<String, Unit>> clearCustomerData() async {
    try {
      debugPrint('🗑️ CustomerIdFix: Clearing all customer data');
      
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('customer_id');
      await prefs.remove('customer_data');
      
      debugPrint('✅ CustomerIdFix: Customer data cleared successfully');
      return right(unit);
    } catch (e) {
      debugPrint('❌ CustomerIdFix: Error clearing customer data: $e');
      return left('Failed to clear customer data: $e');
    }
  }
  
  /// Force clear all cached customer IDs and refresh
  static Future<Either<String, String>> forceClearAndRefresh(String username) async {
    // Finance module removed
    return left('Finance module removed');
  }
  
  /// Clear all provider caches (call this when switching accounts)
  static Either<String, Unit> clearAllProviderCaches(BuildContext context) {
    // Finance module removed, providers no longer exist
    return right(unit);
  }
}