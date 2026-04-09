import 'package:fpdart/fpdart.dart';

import '../../entities/check_username_entity.dart';
import '../../repositories/check_username_repository.dart';

/// Use case for checking username and getting customer data
/// Single responsibility: orchestrate the checkUsername operation
class CheckUsernameUseCase {
  final CheckUsernameRepository _repository;

  const CheckUsernameUseCase(this._repository);

  /// Execute the use case
  /// [username] - The username to check
  /// [forceRefresh] - Skip cache and fetch from API
  Future<Either<String, CheckUsernameEntity>> call(
    String username, {
    bool forceRefresh = false,
  }) async {
    return await _repository.checkUsername(
      username,
      forceRefresh: forceRefresh,
    );
  }
}

/// Use case for getting cached data only
class GetCachedCheckUsernameUseCase {
  final CheckUsernameRepository _repository;

  const GetCachedCheckUsernameUseCase(this._repository);

  /// Get cached data without API call
  Future<CheckUsernameEntity?> call(String username) async {
    return await _repository.getCachedData(username);
  }
}

/// Use case for invalidating cache
class InvalidateCheckUsernameCacheUseCase {
  final CheckUsernameRepository _repository;

  const InvalidateCheckUsernameCacheUseCase(this._repository);

  /// Invalidate cache for a username
  Future<void> call(String username) async {
    await _repository.invalidateCache(username);
  }
}
