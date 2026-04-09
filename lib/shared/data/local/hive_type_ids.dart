/// Hive Type IDs for local storage adapters
/// Centralized to prevent collisions
class HiveTypeIds {
  HiveTypeIds._();

  /// Subscription model type ID
  static const int subscriptionModel = 10;

  /// Pricing plan model type ID (if needed)
  static const int pricingPlanModel = 11;

  /// Payment method model type ID (if needed)
  static const int paymentMethodModel = 12;

  /// Invoice model type ID (if needed)
  static const int invoiceModel = 13;

  /// CheckUsername model type ID
  static const int checkUsernameModel = 14;

  // Add other type IDs here as needed
  // Always increment from the last used ID
}
