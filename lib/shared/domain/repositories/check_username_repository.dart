import 'package:fpdart/fpdart.dart';
import '../entities/check_username_entity.dart';

/// Abstract repository for CheckUsername operations
/// Following clean architecture - domain layer only defines interface
abstract class CheckUsernameRepository {
  /// Check username and get customer data
  /// Returns Either<Failure message, Entity>
  Future<Either<String, CheckUsernameEntity>> checkUsername(
    String username, {
    bool forceRefresh = false,
  });

  /// Get cached data without API call
  Future<CheckUsernameEntity?> getCachedData(String username);

  /// Invalidate cache for a username
  Future<void> invalidateCache(String username);

  /// Clear all cached data
  Future<void> clearAllCache();
}
