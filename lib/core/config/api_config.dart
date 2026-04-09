import 'default_user_service.dart';

/// Centralized API configuration for the entire application
class ApiConfig {
  /// Base URL for all API endpoints.
  /// • Default/test users → dev URL from default_users.json
  /// • All other users → CUSTOMER_API_BASE_URL from .env
  static String get baseUrl {
    return DefaultUserService.instance.getBaseUrl();
  }

  /// Security endpoints
  static String get generateTokenUrl => '$baseUrl/security/generate-token';
  static String get csrfTokenUrl => '$baseUrl/security/csrf-token';
  // static String get generateSignatureUrl =>
  //     '$baseUrl/security/generate-signature';

  /// Authentication endpoints
  static String get authLoginUrl => '$baseUrl/auth/login';
  static String get authRefreshUrl => '$baseUrl/auth/refresh';
  static String get authLogoutUrl => '$baseUrl/auth/logout';
  // new send otp to phone number api,, is using the custom base url for now later will be replaced with the baseurl
  static String get signupOtpUrl => "$baseUrl/auth/phone";
  static String get verifyOtpUrl => '$baseUrl/auth/phone/verify';
  static String get firebaseVerifyUrl => '$baseUrl/auth/phone/firebase-verify';
  static String checkUsernamePhoneUrl(String username) =>
      '$baseUrl/auth/username/$username/check';
  static String linkPhoneUrl(String username) =>
      '$baseUrl/auth/username/$username/link-phone';
  static String get checkPhoneUrl => '$baseUrl/new-auth/register/check-phone';
  static String usernameAvailabilityUrl(String username) =>
      '$baseUrl/auth/username-availability/$username';
  static String get initiateEmailRegisterUrl =>
      '$baseUrl/new-auth/register/initiate-email';
  static String get verifyEmailRegisterUrl =>
      '$baseUrl/new-auth/register/verify-email';
  static String get initiateEmailLoginUrl =>
      '$baseUrl/new-auth/login/email/initiate';
  static String get verifyEmailLoginUrl =>
      '$baseUrl/new-auth/login/email/verify';
  static String get initiateEmailLinkUrl =>
      '$baseUrl/new-auth/link/email/initiate';
  static String get verifyEmailLinkUrl => '$baseUrl/new-auth/link/email/verify';
  // the correct url is below one
  //'$baseUrl/_matrix/client/r0/login/phone/send_otp';

  /// OTP endpoints
  static String otpSendUrl(String username) =>
      '$baseUrl/username/$username/otp/send';
  static String otpVerifyUrl(String username) =>
      '$baseUrl/username/$username/otp/verify';

  /// Customer endpoints
  static String customersUrl(String username) => '$baseUrl/customers/$username';
  static String checkUsernameUrl(String username) =>
      '$baseUrl/customers/check-username/$username';
  static String customerKycUrl(String customerId) =>
      '$baseUrl/customers/$customerId/kyc_link';
  static String customerAcceptTermsUrl(String customerId) =>
      '$baseUrl/customers/$customerId/accept_terms';
  static String customerPinUrl(String customerId) =>
      '$baseUrl/pin/customers/$customerId/pin';
  static String customerPinVerifyUrl(String customerId) =>
      '$baseUrl/pin/customers/$customerId/pin/verify';
  static String customerOtpSendUrl(String customerId) =>
      '$baseUrl/otp/customers/$customerId/transaction-otp/send';
  static String customerOtpVerifyUrl(String customerId) =>
      '$baseUrl/otp/customers/$customerId/transaction-otp/verify';

  /// Wallet endpoints
  static String customerWalletsUrl(String customerId) =>
      '$baseUrl/customers/$customerId/wallets';

  /// User wallet endpoints
  static String userWalletsUrl(String username) =>
      '$baseUrl/user/$username/wallets';

  /// Transfer endpoints
  static String get transfersUrl => '$baseUrl/transfers';

  /// Email transfer endpoints
  static String get sendMoneyByEmail => '$baseUrl/transfers/send-by-email';
  static String get inviteUser => '$baseUrl/transfers/invite-user';
  static String get validateRecipient => '$baseUrl/transfers/validate-recipient';

  /// External account endpoints
  static String customerExternalAccountsUrl(String customerId) =>
      '$baseUrl/customers/$customerId/external_accounts';
  static String customerExternalAccountUrl(
          String customerId, String externalAccountId) =>
      '$baseUrl/customers/$customerId/external_accounts/$externalAccountId';
  static String deleteExternalAccountUrl(
          String customerId, String externalAccountId) =>
      '$baseUrl/customers/$customerId/external_accounts/$externalAccountId';

  /// Virtual account endpoints
  static String customerVirtualAccountsUrl(String customerId) =>
      '$baseUrl/customers/$customerId/virtual_accounts';

  /// Liquidation endpoints
  static String customerLiquidationAddressesUrl(String customerId) =>
      '$baseUrl/customers/$customerId/liquidation_addresses';

  /// Transfer history endpoints
  static String customerTransfersUrl(String customerId) =>
      '$baseUrl/customers/$customerId/transfers';

  /// Countries endpoints
  static String get countriesUrl => '$baseUrl/countries';
  static String countryUrl(String countryCode) =>
      '$baseUrl/countries/$countryCode';
  static String countryStatesUrl(String countryCode) =>
      '$baseUrl/countries/$countryCode/states';

  /// KYC completion callback URL
  static String get kycCompleteUrl {
    final domain = baseUrl.replaceAll('/api', '').replaceAll('apis.', 'app.');
    return '$domain/kyc-complete';
  }

  /// Support endpoints
  static String get supportTicketUrl => '$baseUrl/support/request';
}
