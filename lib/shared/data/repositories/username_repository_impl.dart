import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import '../../domain/entities/username_entity.dart';
import '../../domain/repositories/username_repository.dart';
import '../../widgets/matrix.dart';
import '../datasources/username_local_datasource.dart';
import '../models/username_model.dart';

class UsernameRepositoryImpl implements UsernameRepository {
  final UsernameLocalDataSource localDataSource;
  final BuildContext? context;

  UsernameRepositoryImpl({
    required this.localDataSource,
    this.context,
  });

  @override
  Future<Either<String, UsernameEntity>> getUsername() async {
    try {
      // 1. Try Hive cache first
      final cachedModel = await localDataSource.getCachedUsername();
      if (cachedModel != null) {
        return Right(cachedModel.toEntity());
      }

      // 2. If not in cache, get from Matrix (remote)
      if (context != null) {
        return await getUsernameFromMatrix();
      }

      // 3. No context and no cache
      return const Left('No username found');
    } catch (e) {
      return Left('Failed to get username: $e');
    }
  }

  @override
  Future<Either<String, UsernameEntity>> getUsernameFromMatrix() async {
    try {
      if (context == null) {
        return const Left('Context not available');
      }

      final matrix = Matrix.of(context!);
      final userId = matrix.client.userID;

      if (userId == null || userId.isEmpty) {
        return const Left('Matrix user ID not available');
      }

      // Extract username from Matrix ID (@username:server.com)
      final username = userId.replaceFirst('@', '').split(':')[0];

      // Create entity
      final entity = UsernameEntity(
        username: username,
        matrixId: userId,
        lastUpdated: DateTime.now(),
      );

      // Cache it
      final model = UsernameModel.fromEntity(entity);
      await localDataSource.cacheUsername(model);

      return Right(entity);
    } catch (e) {
      return Left('Failed to get username from Matrix: $e');
    }
  }

  @override
  Future<Either<String, Unit>> storeUsername(
    String username, {
    String? matrixId,
  }) async {
    try {
      final model = UsernameModel(
        usernameField: username,
        matrixIdField: matrixId,
        lastUpdatedField: DateTime.now(),
      );

      await localDataSource.cacheUsername(model);
      return const Right(unit);
    } catch (e) {
      return Left('Failed to store username: $e');
    }
  }

  @override
  Future<Either<String, Unit>> clearUsername() async {
    try {
      await localDataSource.clearCachedUsername();
      return const Right(unit);
    } catch (e) {
      return Left('Failed to clear username: $e');
    }
  }

  @override
  Future<Either<String, Option<String>>> getStoredUsername() async {
    try {
      final cachedModel = await localDataSource.getCachedUsername();
      return Right(Option.fromNullable(cachedModel?.usernameField));
    } catch (e) {
      return Left('Failed to get stored username: $e');
    }
  }
}
