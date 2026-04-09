import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../data/datasources/username_local_datasource.dart';
import '../data/models/username_model.dart';
import '../data/repositories/username_repository_impl.dart';
import '../domain/repositories/username_repository.dart';
import '../domain/usecases/get_username_usecase.dart';
import '../domain/usecases/store_username_usecase.dart';
import '../providers/username_provider.dart';

class UsernameInjection {
  static bool _isInitialized = false;

  /// Initialize Hive and register adapters
  static Future<void> init() async {
    if (_isInitialized) return;

    // Register Hive adapter for UsernameModel
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(UsernameModelAdapter());
    }

    _isInitialized = true;
  }

  /// Create UsernameProvider with all dependencies (synchronous)
  static UsernameProvider createProviderSync({BuildContext? context}) {
    // Data Source (only Hive)
    final localDataSource = UsernameLocalDataSourceImpl();

    // Repository
    final repository = UsernameRepositoryImpl(
      localDataSource: localDataSource,
      context: context,
    );

    // Use Cases
    final getUsernameUseCase = GetUsernameUseCase(repository);
    final storeUsernameUseCase = StoreUsernameUseCase(repository);

    // Provider
    return UsernameProvider(
      getUsernameUseCase: getUsernameUseCase,
      storeUsernameUseCase: storeUsernameUseCase,
    );
  }

  /// Create UsernameProvider with all dependencies (async - for backward compatibility)
  static Future<UsernameProvider> createProvider({BuildContext? context}) async {
    await init();
    return createProviderSync(context: context);
  }

  /// Create repository directly (for services that don't use provider)
  static Future<UsernameRepository> createRepository({BuildContext? context}) async {
    await init();

    final localDataSource = UsernameLocalDataSourceImpl();

    return UsernameRepositoryImpl(
      localDataSource: localDataSource,
      context: context,
    );
  }

  /// Get username directly from Hive (for static classes without BuildContext)
  /// This is useful for ApiClient, SecurityService etc.
  static Future<String?> getUsername() async {
    try {
      await init();
      final box = await Hive.openBox<UsernameModel>('username_box');
      final usernameModel = box.get('current_username');
      return usernameModel?.username;
    } catch (e) {
      debugPrint('⚠️ UsernameInjection.getUsername error: $e');
      return null;
    }
  }

  /// Get username synchronously if box is already open
  /// Returns null if not available
  static String? getUsernameSync() {
    try {
      if (!Hive.isBoxOpen('username_box')) {
        // Try to open box synchronously if not open
        debugPrint('⚠️ Username box not open, attempting async open...');
        return null;
      }
      final box = Hive.box<UsernameModel>('username_box');
      final usernameModel = box.get('current_username');
      final username = usernameModel?.username;
      if (username != null) {
        debugPrint('✅ UsernameInjection.getUsernameSync: $username');
      } else {
        debugPrint('⚠️ UsernameInjection.getUsernameSync: No username found');
      }
      return username;
    } catch (e) {
      debugPrint('⚠️ UsernameInjection.getUsernameSync error: $e');
      return null;
    }
  }
}
