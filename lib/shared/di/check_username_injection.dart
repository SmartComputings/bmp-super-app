import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../data/datasources/check_username_local_datasource.dart';
import '../data/datasources/check_username_remote_datasource.dart';
import '../data/models/check_username_model.dart';
import '../data/repositories/check_username_repository_impl.dart';
import '../domain/repositories/check_username_repository.dart';
import '../domain/use_cases/check_username/check_username_use_case.dart';
import '../providers/check_username_provider.dart';

/// Dependency injection for CheckUsername feature
class CheckUsernameInjection {
  static bool _isInitialized = false;

  /// Initialize Hive and register adapters
  static Future<void> init() async {
    if (_isInitialized) return;

    // Register Hive adapter for CheckUsernameModel
    if (!Hive.isAdapterRegistered(14)) {
      Hive.registerAdapter(CheckUsernameModelAdapter());
    }

    _isInitialized = true;
    debugPrint('✅ CheckUsernameInjection initialized');
  }

  /// Create CheckUsernameProvider with all dependencies (synchronous after init)
  static CheckUsernameProvider createProviderSync() {
    // Data Sources
    final localDataSource = CheckUsernameLocalDataSourceImpl();
    final remoteDataSource = CheckUsernameRemoteDataSourceImpl();

    // Repository
    final repository = CheckUsernameRepositoryImpl(
      localDataSource: localDataSource,
      remoteDataSource: remoteDataSource,
    );

    // Use Case
    final useCase = CheckUsernameUseCase(repository);

    // Provider
    return CheckUsernameProvider(useCase: useCase);
  }

  /// Create CheckUsernameProvider with all dependencies (async)
  static Future<CheckUsernameProvider> createProvider() async {
    await init();
    return createProviderSync();
  }

  /// Create repository directly (for testing or other uses)
  static Future<CheckUsernameRepository> createRepository() async {
    await init();

    final localDataSource = CheckUsernameLocalDataSourceImpl();
    final remoteDataSource = CheckUsernameRemoteDataSourceImpl();

    return CheckUsernameRepositoryImpl(
      localDataSource: localDataSource,
      remoteDataSource: remoteDataSource,
    );
  }
}
