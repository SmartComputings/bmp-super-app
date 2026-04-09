import 'package:hive/hive.dart';

import '../models/check_username_model.dart';

/// Abstract interface for local data source
abstract class CheckUsernameLocalDataSource {
  Future<CheckUsernameModel?> getCachedData(String username);
  Future<void> cacheData(String username, CheckUsernameModel model);
  Future<void> invalidateCache(String username);
  Future<void> clearAllCache();
}

/// Implementation using Hive for local caching
class CheckUsernameLocalDataSourceImpl implements CheckUsernameLocalDataSource {
  static const String _boxName = 'check_username_cache';

  Future<Box<CheckUsernameModel>> _getBox() async {
    try {
      if (!Hive.isBoxOpen(_boxName)) {
        return await Hive.openBox<CheckUsernameModel>(_boxName);
      }
      return Hive.box<CheckUsernameModel>(_boxName);
    } catch (e) {
      // Box is corrupted (unknown typeId, incompatible data, etc.)
      // Delete and recreate the box
      print('⚠️ CheckUsernameLocalDataSource: Box corrupted, recreating... Error: $e');
      try {
        await Hive.deleteBoxFromDisk(_boxName);
      } catch (_) {
        // Ignore deletion errors
      }
      return await Hive.openBox<CheckUsernameModel>(_boxName);
    }
  }

  @override
  Future<CheckUsernameModel?> getCachedData(String username) async {
    try {
      final box = await _getBox();
      return box.get(username);
    } catch (e) {
      // Log error but don't crash - cache miss is acceptable
      return null;
    }
  }

  @override
  Future<void> cacheData(String username, CheckUsernameModel model) async {
    try {
      final box = await _getBox();
      await box.put(username, model);
    } catch (e) {
      // Log error but don't crash - cache failure is acceptable
    }
  }

  @override
  Future<void> invalidateCache(String username) async {
    try {
      final box = await _getBox();
      await box.delete(username);
    } catch (e) {
      // Ignore errors
    }
  }

  @override
  Future<void> clearAllCache() async {
    try {
      final box = await _getBox();
      await box.clear();
    } catch (e) {
      // Ignore errors
    }
  }

  /// Static method to clear all cache (can be called from FCM handlers without provider)
  static Future<void> clearAllCacheStatic() async {
    try {
      const boxName = 'check_username_cache';
      if (Hive.isBoxOpen(boxName)) {
        await Hive.box<CheckUsernameModel>(boxName).clear();
      } else {
        final box = await Hive.openBox<CheckUsernameModel>(boxName);
        await box.clear();
      }
      print('🗑️ CheckUsernameLocalDataSource: All cache cleared (static)');
    } catch (e) {
      print('⚠️ CheckUsernameLocalDataSource: Failed to clear cache: $e');
    }
  }
}
