import 'package:hive/hive.dart';
import 'package:equatable/equatable.dart';

part 'check_username_model.g.dart';

/// Hive model for CheckUsername data
/// Stores all customer data from check-username API endpoint
/// TypeId: 14 (registered in HiveTypeIds.checkUsernameModel)
@HiveType(typeId: 14)
class CheckUsernameModel extends Equatable {
  @HiveField(0)
  final bool existsField;

  @HiveField(1)
  final bool hasCustomerField;

  @HiveField(2)
  final String? customerIdField;

  @HiveField(3)
  final String? emailField;

  @HiveField(4)
  final String? firstNameField;

  @HiveField(5)
  final String? lastNameField;

  @HiveField(6)
  final String? phoneField;

  @HiveField(7)
  final String? subscriptionStatusField;

  @HiveField(8)
  final DateTime? subscriptionExpiresAtField;

  @HiveField(9)
  final bool hasPayCryptoField;

  @HiveField(10)
  final String? paycryptoJsonField; // Stored as JSON string

  @HiveField(11)
  final bool pinSetField;

  @HiveField(12)
  final DateTime cachedAtField;

  @HiveField(13)
  final String? statusField;

  @HiveField(14)
  final String? typeField;

  @HiveField(15)
  final String? endorsementsJsonField; // Stored as JSON string list

  @HiveField(16)
  final String? stripeCustomerIdField;

  const CheckUsernameModel({
    required this.existsField,
    required this.hasCustomerField,
    this.customerIdField,
    this.emailField,
    this.firstNameField,
    this.lastNameField,
    this.phoneField,
    this.subscriptionStatusField,
    this.subscriptionExpiresAtField,
    required this.hasPayCryptoField,
    this.paycryptoJsonField,
    required this.pinSetField,
    required this.cachedAtField,
    this.statusField,
    this.typeField,
    this.endorsementsJsonField,
    this.stripeCustomerIdField,
  });

  @override
  List<Object?> get props => [
        existsField,
        hasCustomerField,
        customerIdField,
        emailField,
        firstNameField,
        lastNameField,
        phoneField,
        subscriptionStatusField,
        subscriptionExpiresAtField,
        hasPayCryptoField,
        paycryptoJsonField,
        paycryptoJsonField,
        pinSetField,
        statusField,
        typeField,
        endorsementsJsonField,
        stripeCustomerIdField,
      ];
}
