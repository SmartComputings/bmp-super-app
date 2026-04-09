import 'package:hive/hive.dart';
import '../models/username_model.dart';

abstract class UsernameLocalDataSource {
  Future<UsernameModel?> getCachedUsername();
  Future<void> cacheUsername(UsernameModel username);
  Future<void> clearCachedUsername();
}

class UsernameLocalDataSourceImpl implements UsernameLocalDataSource {
  static const String _hiveBoxName = 'username_box';
  static const String _hiveKey = 'current_username';

  @override
  Future<UsernameModel?> getCachedUsername() async {
    try {
      final box = await Hive.openBox<UsernameModel>(_hiveBoxName);
      return box.get(_hiveKey);
    } catch (e) {
      throw Exception('Failed to get cached username: $e');
    }
  }

  @override
  Future<void> cacheUsername(UsernameModel username) async {
    try {
      final box = await Hive.openBox<UsernameModel>(_hiveBoxName);
      await box.put(_hiveKey, username);
    } catch (e) {
      throw Exception('Failed to cache username: $e');
    }
  }

  @override
  Future<void> clearCachedUsername() async {
    try {
      final box = await Hive.openBox<UsernameModel>(_hiveBoxName);
      await box.clear(); // Clear entire box
    } catch (e) {
      throw Exception('Failed to clear cached username: $e');
    }
  }
}
