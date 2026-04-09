import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/entities/check_username_entity.dart';
import '../../domain/repositories/check_username_repository.dart';
import '../datasources/check_username_local_datasource.dart';
import '../datasources/check_username_remote_datasource.dart';
import '../mapper/check_username_mapper.dart';
import '../models/check_username_model.dart';

/// Repository implementation with cache-first strategy
class CheckUsernameRepositoryImpl implements CheckUsernameRepository {
  final CheckUsernameLocalDataSource _localDataSource;
  final CheckUsernameRemoteDataSource _remoteDataSource;

  /// Cache TTL - 5 minutes
  static const Duration _cacheTtl = Duration(minutes: 5);

  CheckUsernameRepositoryImpl({
    required CheckUsernameLocalDataSource localDataSource,
    required CheckUsernameRemoteDataSource remoteDataSource,
  })  : _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource;

  @override
  Future<Either<String, CheckUsernameEntity>> checkUsername(
    String username, {
    bool forceRefresh = false,
  }) async {
    try {
      if(username.isEmpty){
        
      }
      // If not forcing refresh, try cache first
      if (!forceRefresh) {
        final cached = await _localDataSource.getCachedData(username);
        if (cached != null && !_isCacheExpired(cached)) {
          if (kDebugMode) {
            print('✅ CheckUsernameRepository: Cache HIT for $username');
          }
          return Right(CheckUsernameMapper.toEntity(cached));
        }
      }

      // Fetch from API
      if (kDebugMode) {
        print('🌐 CheckUsernameRepository: Fetching from API for $username');
      }

      final model = await _remoteDataSource.checkUsername(username);

      // Cache the result
      await _localDataSource.cacheData(username, model);

      if (kDebugMode) {
        print('💾 CheckUsernameRepository: Cached data for $username');
      }

      return Right(CheckUsernameMapper.toEntity(model));
    } catch (e) {
      if (kDebugMode) {
        print('❌ CheckUsernameRepository: Error - $e');
      }

      // On error, try to return cached data
      final cached = await _localDataSource.getCachedData(username);
      if (cached != null) {
        if (kDebugMode) {
          print('⚠️ CheckUsernameRepository: Returning stale cache on error');
        }
        return Right(CheckUsernameMapper.toEntity(cached));
      }

      return Left(e.toString());
    }
  }

  @override
  Future<CheckUsernameEntity?> getCachedData(String username) async {
    final cached = await _localDataSource.getCachedData(username);
    if (cached != null) {
      return CheckUsernameMapper.toEntity(cached);
    }
    return null;
  }

  @override
  Future<void> invalidateCache(String username) async {
    await _localDataSource.invalidateCache(username);
  }

  @override
  Future<void> clearAllCache() async {
    await _localDataSource.clearAllCache();
  }

  /// Check if cached data has expired
  bool _isCacheExpired(CheckUsernameModel cached) {
    return DateTime.now().difference(cached.cachedAtField) > _cacheTtl;
  }
}
