/// Shared API configuration for subscription endpoints
class SharedApiConfig {
  // Subscription endpoints
  static const String getSubscriptionStatus = '/stripe/subscriptions';
  static const String getPricingPlans = '/stripe/prices';
  static const String initiateRegistration = '/stripe/customers/register';
  static const String verifyCustomer = '/stripe/customers/verify';
  static const String paymentMethods = '/stripe/payment-methods';
  static const String createSubscription = '/stripe/subscriptions';
  static const String getInvoices = '/stripe/invoices';
  
  static String cancelSubscription(String subscriptionId) =>
      '/stripe/subscriptions/$subscriptionId/cancel';
  
  static String reactivateSubscription(String subscriptionId) =>
      '/stripe/subscriptions/$subscriptionId/reactivate';
}
