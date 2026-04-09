import 'package:bmp/core/network/api_client.dart';
import 'package:bmp/core/config/api_config.dart';

/// Shared service for customer-related API calls needed by subscriptions and other features
class CustomerSharedService {
  /// Calls GET /customers/check-username/{username} API
  static Future<Map<String, dynamic>> checkUsername(String username) async {
    try {
      final response = await ApiClient.request(
        path: ApiConfig.checkUsernameUrl(username),
        method: 'GET',
        includeRsa: true,
      );
      
      if (response.success && response.data != null) {
        return Map<String, dynamic>.from(response.data);
      }
      
      throw Exception('Failed to check username: ${response.message ?? 'Unknown error'}');
    } catch (e) {
      rethrow;
    }
  }
}
