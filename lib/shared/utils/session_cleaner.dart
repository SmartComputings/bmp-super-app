import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Comprehensive session cleaner to remove all user data
class SessionCleaner {
  static const _secureStorage = FlutterSecureStorage();

  /// Clear ALL user data from all storage mechanisms
  static Future<void> clearAllUserData() async {
    print('🧹 SessionCleaner: Starting selective data cleanup (preserving important data)');
    
    await _clearSharedPreferencesSelective();
    await _clearSecureStorageSelective();
    await _clearHiveBoxesSelective();
    
    print('✅ SessionCleaner: Selective data cleanup finished');
  }

  /// Clear SharedPreferences selectively (preserve important data)
  static Future<void> _clearSharedPreferencesSelective() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      
      // Keys to PRESERVE (do NOT delete)
      const preserveKeys = {
        'customer_id',
        'customer_data',
        'app_locale', // Preserve user's language preference
        // Add any other keys you want to preserve
      };
      
      final keys = prefs.getKeys();
      print('🔍 Found ${keys.length} SharedPreferences keys');
      
      int removedCount = 0;
      for (final key in keys) {
        if (!preserveKeys.contains(key)) {
          await prefs.remove(key);
          removedCount++;
        }
      }
      
      print('✅ SharedPreferences: Removed $removedCount keys, preserved ${preserveKeys.length} keys');
    } catch (e) {
      print('❌ Failed to clear SharedPreferences: $e');
    }
  }

  /// Clear FlutterSecureStorage selectively
  static Future<void> _clearSecureStorageSelective() async {
    try {
      // Only clear auth-related keys, not all
      await _secureStorage.delete(key: 'jwt_token');
      await _secureStorage.delete(key: 'csrf_token');
      await _secureStorage.delete(key: 'security_token');
      await _secureStorage.delete(key: 'current_username');
      
      // DO NOT clear Matrix encryption recovery keys (ssss_recovery_key_*)
      // These should persist across logouts to decrypt old messages
      
      print('✅ FlutterSecureStorage: Cleared auth keys only (preserved recovery keys)');
    } catch (e) {
      print('❌ Failed to clear FlutterSecureStorage: $e');
    }
  }

  /// Clear Hive boxes selectively (only clear data, don't delete boxes)
  static Future<void> _clearHiveBoxesSelective() async {
    try {
      // Clear customer box but keep it open for next login
      final boxName = 'customer_box';
      
      if (Hive.isBoxOpen(boxName)) {
        final box = Hive.box(boxName);
        await box.clear();
        // Don't close the box - keep it open for reuse
        print('✅ Cleared $boxName (kept open)');
      }
      
      // Clear subscription box if exists
      const subBoxName = 'subscription_box';
      if (Hive.isBoxOpen(subBoxName)) {
        final box = Hive.box(subBoxName);
        await box.clear();
        print('✅ Cleared $subBoxName');
      }
      
      print('✅ Hive boxes cleared selectively');
    } catch (e) {
      print('❌ Failed to clear Hive boxes: $e');
    }
  }

  /// Clear only authentication-related data (lighter cleanup)
  /// Used before login to clear old session tokens
  static Future<void> clearAuthData() async {
    print('🧹 SessionCleaner: Clearing auth data only (keeping customer_id)');
    
    try {
      final prefs = await SharedPreferences.getInstance();
      
      // Auth & Security tokens only
      await prefs.remove('security_token');
      await prefs.remove('csrf_token');
      await prefs.remove('jwt_token');
      await prefs.remove('jwt_created_at');
      await prefs.remove('jwt_expires_at');
      await prefs.remove('jwt_refresh_at');
      await prefs.remove('csrf_token_expires_at');
      await prefs.remove('matrix_id');
      await prefs.remove('username');
      await prefs.remove('current_username');
      await prefs.remove('is_default_user'); // Clear flag so new login can set it correctly
      
      // Wallet cache (will be refreshed)
      await prefs.remove('cached_wallets');
      await prefs.remove('last_wallet_customer_id');
      
      // Secure storage tokens
      await _secureStorage.delete(key: 'current_username');
      await _secureStorage.delete(key: 'jwt_token');
      await _secureStorage.delete(key: 'csrf_token');
      
      // NOTE: We keep customer_id and customer_data for continuity
      // They will be refreshed after login if needed
      
      print('✅ Auth data cleared (customer_id preserved)');
    } catch (e) {
      print('❌ Failed to clear auth data: $e');
    }
  }
}
