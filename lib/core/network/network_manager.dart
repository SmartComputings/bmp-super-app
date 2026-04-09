import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../config/api_config.dart';
import '../errors/network_exception.dart';

class NetworkManager {
  static final Connectivity _connectivity = Connectivity();
  
  static Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      return !result.contains(ConnectivityResult.none);
    } catch (e) {
      return false;
    }
  }

  static Future<bool> hasInternetAccess() async {
    try {
      final uri = Uri.parse(ApiConfig.baseUrl);
      final result = await InternetAddress.lookup(uri.host);
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  static Future<void> checkConnection() async {
    if (!await isConnected()) {
      throw NetworkException('No internet connection', NetworkErrorType.noConnection);
    }
    
    if (!await hasInternetAccess()) {
      throw NetworkException('Slow internet connection', NetworkErrorType.slowConnection);
    }
  }

  static Stream<List<ConnectivityResult>> get onConnectivityChanged => 
      _connectivity.onConnectivityChanged;
}