import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../di/username_injection.dart';
import '../providers/username_provider.dart';

class UsernameHelper {
  static const String defaultUsername = '';
  
  static Future<String> getUsername(BuildContext context, {bool redirectToLogin = false}) async {
    // PRIORITY 1: Try UsernameProvider first (state in memory)
    try {
      final usernameProvider = context.read<UsernameProvider>();
      if (usernameProvider.username != null && usernameProvider.username!.isNotEmpty) {
        debugPrint('✅ UsernameHelper: Using username from provider: ${usernameProvider.username}');
        return usernameProvider.username!;
      }
      
      // Try fetching from provider
      await usernameProvider.getUsername();
      if (usernameProvider.username != null && usernameProvider.username!.isNotEmpty) {
        debugPrint('✅ UsernameHelper: Fetched username from provider: ${usernameProvider.username}');
        return usernameProvider.username!;
      }
    } catch (e) {
      debugPrint('⚠️ UsernameHelper: Failed to read from provider: $e');
    }
    
    // PRIORITY 2: Use UsernameInjection.getUsername() directly from Hive
    try {
      final username = await UsernameInjection.getUsername();
      if (username != null && username.isNotEmpty) {
        debugPrint('✅ UsernameHelper: Using username from UsernameInjection: $username');
        return username;
      }
    } catch (e) {
      debugPrint('⚠️ UsernameHelper: Failed to read from UsernameInjection: $e');
    }
    
    // PRIORITY 3: Fallback to repository (legacy) - LAST RESORT
    final repository = await UsernameInjection.createRepository(context: context);
    final result = await repository.getUsername();
    final username = result.fold(
      (_) => defaultUsername,
      (entity) => entity.username,
    );
    
    if (username.isNotEmpty && username != defaultUsername) {
      debugPrint('⚠️ UsernameHelper: Using fallback username from repository: $username');
    }
    
    // Redirect to login if username is empty and redirectToLogin is true
    if (redirectToLogin && (username.isEmpty || username == defaultUsername)) {
      context.go('/home');
      return defaultUsername;
    }
    
    return username;
  }
}
