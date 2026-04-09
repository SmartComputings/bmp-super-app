import '../../../core/config/api_config.dart';
import '../../../core/network/api_client.dart';
import '../mapper/check_username_mapper.dart';
import '../models/check_username_model.dart';

/// Abstract interface for remote data source
abstract class CheckUsernameRemoteDataSource {
  Future<CheckUsernameModel> checkUsername(String username);
}

/// Implementation using ApiClient for API calls
class CheckUsernameRemoteDataSourceImpl implements CheckUsernameRemoteDataSource {
  @override
  Future<CheckUsernameModel> checkUsername(String username) async {
    print('\n🔍 ===== CHECK-USERNAME API CALL =====');
    print('📍 Endpoint: ${ApiConfig.checkUsernameUrl(username)}');
    print('🔧 Method: GET');
    print('=====================================\n');
    
    final response = await ApiClient.request(
      path: ApiConfig.checkUsernameUrl(username),
      method: 'GET',
      includeRsa: true,
    );

    if (response.success && response.data != null) {
      return CheckUsernameMapper.fromJson(response.data as Map<String, dynamic>);
    } else {
      throw Exception(response.message ?? 'Failed to check username');
    }
  }
}
