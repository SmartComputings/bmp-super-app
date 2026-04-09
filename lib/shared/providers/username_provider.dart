import 'package:flutter/material.dart';
import '../domain/entities/username_entity.dart';
import '../domain/usecases/get_username_usecase.dart';
import '../domain/usecases/store_username_usecase.dart';

class UsernameProvider extends ChangeNotifier {
  final GetUsernameUseCase getUsernameUseCase;
  final StoreUsernameUseCase storeUsernameUseCase;

  UsernameProvider({
    required this.getUsernameUseCase,
    required this.storeUsernameUseCase,
  });

  UsernameEntity? _currentUsername;
  bool _isLoading = false;
  String? _error;

  UsernameEntity? get currentUsername => _currentUsername;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get hasUsername => _currentUsername != null;
  String? get username => _currentUsername?.username;

  /// Get username with full fallback chain
  Future<String?> getUsername() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await getUsernameUseCase.call();

    result.fold(
      (error) {
        _error = error;
        _currentUsername = null;
      },
      (entity) {
        _currentUsername = entity;
        _error = null;
      },
    );

    _isLoading = false;
    notifyListeners();

    return _currentUsername?.username;
  }

  /// Get username from Matrix client
  Future<String?> getUsernameFromMatrix() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await getUsernameUseCase.fromMatrix();

    result.fold(
      (error) => _error = error,
      (entity) {
        _currentUsername = entity;
        _error = null;
      },
    );

    _isLoading = false;
    notifyListeners();

    return _currentUsername?.username;
  }

  /// Get stored username (synchronous from cache)
  Future<String?> getStoredUsername() async {
    final result = await getUsernameUseCase.getStored();
    return result.fold(
      (_) => null,
      (option) => option.toNullable(),
    );
  }

  /// Store username manually
  Future<bool> storeUsername(String username, {String? matrixId}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await storeUsernameUseCase.call(username, matrixId: matrixId);

    final success = result.fold(
      (error) {
        _error = error;
        return false;
      },
      (_) {
        _currentUsername = UsernameEntity(
          username: username,
          matrixId: matrixId,
          lastUpdated: DateTime.now(),
        );
        _error = null;
        return true;
      },
    );

    _isLoading = false;
    notifyListeners();

    return success;
  }

  /// Clear username
  Future<bool> clearUsername() async {
    final result = await storeUsernameUseCase.clear();

    final success = result.fold(
      (error) {
        _error = error;
        return false;
      },
      (_) {
        _currentUsername = null;
        _error = null;
        return true;
      },
    );

    notifyListeners();
    return success;
  }

  /// Reset error state
  void clearError() {
    _error = null;
    notifyListeners();
  }
}
