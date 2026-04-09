import 'package:flutter/material.dart';

import '../data/datasources/check_username_local_datasource.dart';
import '../data/mapper/check_username_mapper.dart';
import '../domain/entities/check_username_entity.dart';
import '../domain/use_cases/check_username/check_username_use_case.dart';

/// Provider for CheckUsername with smart state management
/// - Only calls notifyListeners when data actually changes
/// - Handles app lifecycle for auto-refresh
/// - Provides loader state for UI
class CheckUsernameProvider extends ChangeNotifier with WidgetsBindingObserver {
  final CheckUsernameUseCase _useCase;

  CheckUsernameEntity? _data;
  bool _isLoading = false;
  String? _error;
  String? _currentUsername;

  CheckUsernameProvider({required CheckUsernameUseCase useCase})
      : _useCase = useCase {
    WidgetsBinding.instance.addObserver(this);
  }

  // ═══════════════════════════════════════════════════════════════════
  // GETTERS
  // ═══════════════════════════════════════════════════════════════════

  CheckUsernameEntity? get data => _data;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String? get currentUsername => _currentUsername;

  // Convenience getters
  bool get hasCustomer => _data?.hasCustomer ?? false;
  String? get customerId => _data?.customerId;
  String? get email => _data?.email;
  String? get firstName => _data?.firstName;
  String? get lastName => _data?.lastName;
  String? get phone => _data?.phone;
  String? get subscriptionStatus => _data?.subscriptionStatus;
  bool get isSubscriptionActive => _data?.isSubscriptionActive ?? false;
  bool get hasPayCrypto => _data?.hasPayCrypto ?? false;
  bool get pinSet => _data?.pinSet ?? false;

  // ═══════════════════════════════════════════════════════════════════
  // MAIN METHOD - Call this from widgets
  // ═══════════════════════════════════════════════════════════════════

  /// Check username and update state
  /// [forceRefresh] - Skip cache and fetch from API (shows loader)
  Future<void> checkUsername(String username,
      {bool forceRefresh = false}) async {
    _currentUsername = username;
    _error = null;

    // Show loader for forced refresh or initial load
    if (forceRefresh || _data == null) {
      _isLoading = true;
      notifyListeners();
    }

    final result = await _useCase(username, forceRefresh: forceRefresh);

    result.fold(
      (failure) {
        _error = failure;
        debugPrint('❌ CheckUsernameProvider: $failure');
      },
      (entity) {
        _updateData(entity);
      },
    );

    _isLoading = false;
    notifyListeners();
  }

  // ═══════════════════════════════════════════════════════════════════
  // SMART UPDATE - Only notify if data changed (Equatable comparison)
  // ═══════════════════════════════════════════════════════════════════

  void _updateData(CheckUsernameEntity newData) {
    final oldData = _data;

    // Check if subscription status changed (for special handling)
    if (oldData != null &&
        newData.subscriptionStatus != oldData.subscriptionStatus) {
      debugPrint(
        '⚠️ CheckUsernameProvider: Subscription status changed from ${oldData.subscriptionStatus} to ${newData.subscriptionStatus}',
      );
      if (newData.subscriptionStatus == 'expired' ||
          newData.subscriptionStatus == 'canceled') {
        _onSubscriptionStatusChanged(newData.subscriptionStatus!);
      }
    }

    // Only update and notify if data is different (Equatable comparison)
    if (_data != newData) {
      _data = newData;
      // notifyListeners() will be called by the caller
    }
  }

  /// Called when subscription status changes
  void _onSubscriptionStatusChanged(String newStatus) {
    debugPrint('🔔 Subscription status changed to: $newStatus');
    // This can be extended to show dialogs, trigger navigation, etc.
  }

  // ═══════════════════════════════════════════════════════════════════
  // APP LIFECYCLE - Refresh on resume
  // ═══════════════════════════════════════════════════════════════════

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && _currentUsername != null) {
      debugPrint('📱 CheckUsernameProvider: App resumed, refreshing data');
      checkUsername(_currentUsername!, forceRefresh: true);
    }
  }

  // ═══════════════════════════════════════════════════════════════════
  // CACHE MANAGEMENT
  // ═══════════════════════════════════════════════════════════════════

  /// Clear current data and reset state
  void clearData() {
    _data = null;
    _error = null;
    _currentUsername = null;
    notifyListeners();
  }

  // ═══════════════════════════════════════════════════════════════════
  // COMPATIBILITY METHODS (for legacy code)
  // ═══════════════════════════════════════════════════════════════════

  /// Get cached result as Map (legacy compatibility)
  Map<String, dynamic>? getCachedResult(String username) {
    if (_data == null || _currentUsername != username) return null;
    return {
      'hasCustomer': _data!.hasCustomer,
      'customerId': _data!.customerId,
      'stripeCustomerId': _data!.stripeCustomerId,
      'email': _data!.email,
      'firstName': _data!.firstName,
      'lastName': _data!.lastName,
      'phone': _data!.phone,
      'subscriptionStatus': _data!.subscriptionStatus,
      'subscriptionExpiresAt': _data!.subscriptionExpiresAt?.toIso8601String(),
      'hasPayCrypto': _data!.hasPayCrypto,
      'pinSet': _data!.pinSet,
    };
  }

  /// Cache result from Map (legacy compatibility)
  void cacheResult(String username, Map<String, dynamic> response) {
    // Convert Map to Entity via Model and Mapper
    final model = CheckUsernameMapper.fromJson(response);
    final entity = CheckUsernameMapper.toEntity(model);
    _currentUsername = username;
    _updateData(entity);
    notifyListeners();
  }

  /// Invalidate cache (clears both in-memory and Hive cache)
  Future<void> invalidateCache(String username) async {
    // Clear Hive cache via static method
    await CheckUsernameLocalDataSourceImpl.clearAllCacheStatic();

    // Clear in-memory data
    if (_currentUsername == username) {
      clearData();
    }
    debugPrint('🗑️ CheckUsernameProvider: Cache invalidated for $username');
  }

  /// Clear all cache (legacy compatibility)
  Future<void> clearAll() async {
    // Clear persistent storage/cache
    await CheckUsernameLocalDataSourceImpl.clearAllCacheStatic();
    // Clear in-memory state
    clearData();
    debugPrint(
        '🗑️ CheckUsernameProvider: All cache cleared (memory + persistent)');
  }

  // ═══════════════════════════════════════════════════════════════════
  // DISPOSE
  // ═══════════════════════════════════════════════════════════════════

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
