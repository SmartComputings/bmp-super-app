import 'dart:convert';

import '../../domain/entities/check_username_entity.dart';
import '../models/check_username_model.dart';

/// Mapper for CheckUsername model <-> entity conversions
/// Centralizes all mapping logic following Clean Architecture principles
abstract class CheckUsernameMapper {
  /// Parse DateTime from string (ISO format)
  static DateTime? _parseDateTime(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;
    if (value is String) return DateTime.tryParse(value);
    return null;
  }

  /// Parse bool safely
  static bool _parseBool(dynamic value, {bool defaultValue = false}) {
    if (value == null) return defaultValue;
    if (value is bool) return value;
    if (value is int) return value != 0;
    if (value is String) return value.toLowerCase() == 'true' || value == '1';
    return defaultValue;
  }

  /// Convert JSON from API to CheckUsernameModel
  static CheckUsernameModel fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return CheckUsernameModel(
        existsField: false,
        hasCustomerField: false,
        hasPayCryptoField: false,
        pinSetField: false,
        cachedAtField: DateTime.now(),
      );
    }

    // Handle nested "data" field from API response
    final data = json.containsKey('data') ? json['data'] as Map<String, dynamic>? : json;
    if (data == null) {
      return CheckUsernameModel(
        existsField: false,
        hasCustomerField: false,
        hasPayCryptoField: false,
        pinSetField: false,
        cachedAtField: DateTime.now(),
      );
    }

    // Extract paycrypto as JSON string
    String? paycryptoJson;
    if (data['paycrypto'] != null) {
      paycryptoJson = jsonEncode(data['paycrypto']);
    }

    return CheckUsernameModel(
      existsField: _parseBool(data['exists']),
      hasCustomerField: _parseBool(data['hasCustomer']),
      customerIdField: data['customerId'] as String?,
      emailField: data['email'] as String?,
      firstNameField: data['firstName'] as String?,
      lastNameField: data['lastName'] as String?,
      phoneField: data['phone'] as String?,
      subscriptionStatusField: data['subscriptionStatus'] as String?,
      subscriptionExpiresAtField: _parseDateTime(data['subscriptionExpiresAt']),
      hasPayCryptoField: _parseBool(data['hasPayCrypto']),
      paycryptoJsonField: paycryptoJson,
      pinSetField: _parseBool(data['pinSet']),
      cachedAtField: DateTime.now(),
      stripeCustomerIdField: data['stripeCustomerId'] as String?,
      );
  }

  /// Convert CheckUsernameModel to CheckUsernameEntity
  static CheckUsernameEntity toEntity(CheckUsernameModel model) {
    // Parse paycrypto from JSON string
    Map<String, dynamic>? paycrypto;
    if (model.paycryptoJsonField != null) {
      try {
        paycrypto = jsonDecode(model.paycryptoJsonField!) as Map<String, dynamic>;
      } catch (_) {
        paycrypto = null;
      }
    }

    return CheckUsernameEntity(
      exists: model.existsField,
      hasCustomer: model.hasCustomerField,
      customerId: model.customerIdField,
      email: model.emailField,
      firstName: model.firstNameField,
      lastName: model.lastNameField,
      phone: model.phoneField,
      subscriptionStatus: model.subscriptionStatusField,
      subscriptionExpiresAt: model.subscriptionExpiresAtField,
      hasPayCrypto: model.hasPayCryptoField,
      paycrypto: paycrypto,
      pinSet: model.pinSetField,
      cachedAt: model.cachedAtField,
      stripeCustomerId: model.stripeCustomerIdField,
      status: model.statusField,
      type: model.typeField,
      endorsements: _parseEndorsements(model.endorsementsJsonField),
    );
  }

  /// Convert CheckUsernameEntity to CheckUsernameModel
  static CheckUsernameModel fromEntity(CheckUsernameEntity entity) {
    // Convert paycrypto to JSON string
    String? paycryptoJson;
    if (entity.paycrypto != null) {
      paycryptoJson = jsonEncode(entity.paycrypto);
    }

    return CheckUsernameModel(
      existsField: entity.exists,
      hasCustomerField: entity.hasCustomer,
      customerIdField: entity.customerId,
      emailField: entity.email,
      firstNameField: entity.firstName,
      lastNameField: entity.lastName,
      phoneField: entity.phone,
      subscriptionStatusField: entity.subscriptionStatus,
      subscriptionExpiresAtField: entity.subscriptionExpiresAt,
      hasPayCryptoField: entity.hasPayCrypto,
      paycryptoJsonField: paycryptoJson,
      pinSetField: entity.pinSet,
      cachedAtField: entity.cachedAt,
      stripeCustomerIdField: entity.stripeCustomerId,
      statusField: entity.status,
      typeField: entity.type,
      endorsementsJsonField: _endorsementsToJson(entity.endorsements),
    );
  }

  /// Convert CheckUsernameModel to JSON for debugging/logging
  static Map<String, dynamic> toJson(CheckUsernameModel model) {
    return {
      'exists': model.existsField,
      'hasCustomer': model.hasCustomerField,
      'customerId': model.customerIdField,
      'email': model.emailField,
      'firstName': model.firstNameField,
      'lastName': model.lastNameField,
      'phone': model.phoneField,
      'subscriptionStatus': model.subscriptionStatusField,
      'subscriptionExpiresAt': model.subscriptionExpiresAtField?.toIso8601String(),
      'hasPayCrypto': model.hasPayCryptoField,
      'paycrypto': model.paycryptoJsonField,
      'pinSet': model.pinSetField,
      'cachedAt': model.cachedAtField.toIso8601String(),
      'stripeCustomerId': model.stripeCustomerIdField,
      'status': model.statusField,
      'type': model.typeField,
      'endorsements': model.endorsementsJsonField,
    };
  }

  /// Parse endorsements from JSON string
  static List<EndorsementEntity>? _parseEndorsements(String? jsonString) {
    if (jsonString == null) return null;
    try {
      final List<dynamic> list = jsonDecode(jsonString);
      return list.map((e) {
        if (e is Map<String, dynamic>) {
          return EndorsementEntity(
            name: e['name']?.toString() ?? '',
            status: e['status']?.toString() ?? '',
            requirements: e['requirements'] as Map<String, dynamic>?,
          );
        }
        return const EndorsementEntity(name: '', status: '');
      }).toList();
    } catch (_) {
      return null;
    }
  }

  /// Convert endorsements to JSON string
  static String? _endorsementsToJson(List<EndorsementEntity>? endorsements) {
    if (endorsements == null) return null;
    try {
      final list = endorsements.map((e) => {
        'name': e.name,
        'status': e.status,
        'requirements': e.requirements,
      }).toList();
      return jsonEncode(list);
    } catch (_) {
      return null;
    }
  }
}
