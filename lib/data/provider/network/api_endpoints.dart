class APIEndpoint {
  static String get baseUrl => '192.168.0.125:8000';
  // ---------------- Dashboard --------------------
  static String get dashboardListingUrl => '/api/dashboard-chart';
  // ---------------- Authorization --------------------
  static String get loginUrl => '/api/auth/login';
  static String get verifyOtpUrl => '/api/auth/verify-otp';
  static String get forgotPasswordUrl => '/api/auth/forgot-password';
  static String get generateOtpUrl => '/api/auth/regenerate-otp';
  static String get updatePasswordUrl => '/api/auth/update-password';

  //===============AUTHENTICATED ROUTES=====================
  static String get userParentTableUrl => '/api/users/Parent';
  static String get userContributorTableUrl => '/api/users/Contributor';
  static String get giftingTableUrl => '/api/gifts/listing';
  static String get payoutTableUrl => '/api/payouts';
  static String get contributionTableUrl => '/api/contributions';
  //
}
