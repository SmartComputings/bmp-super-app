import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerDataUtils {
  static Future<Map<String, dynamic>?> getStoredCustomerData() async {
    final prefs = await SharedPreferences.getInstance();
    final customerDataString = prefs.getString('customer_data');
    
    if (customerDataString != null) {
      try {
        return jsonDecode(customerDataString);
      } catch (e) {
        print('❌ Failed to parse stored customer data: $e');
        return null;
      }
    }
    return null;
  }

  static Future<void> storeCustomerData(Map<String, dynamic> customerData) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('customer_data', jsonEncode(customerData));
    
    if (customerData['customerId'] != null) {
      final customerId = customerData['customerId'] as String;
      // Validate - don't store Stripe IDs (they start with 'cus_')
      if (customerId.startsWith('cus_')) {
        print('⚠️ CustomerDataUtils: Rejecting Stripe customer ID: $customerId');
        return;
      }
      await prefs.setString('customer_id', customerId);
    }
  }

  static Future<Map<String, dynamic>> checkAndStoreCustomerData(String username) async {
    // Finance module removed, stubbing out data check
    return {'hasCustomer': false};
  }

  static Future<void> clearCustomerData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('customer_data');
    await prefs.remove('customer_id');
  }

  static Future<String?> getCustomerId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('customer_id');
  }

  static Future<bool> hasCustomerData() async {
    final customerData = await getStoredCustomerData();
    return customerData?['hasCustomer'] == true;
  }
}