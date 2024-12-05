class APIEndpoint {
  // static String get baseUrl => '192.168.0.103:8000';
  static String get baseUrl => 'growupadmin.centrictech.net';
  // static String get baseUrl => '3.109.32.169:81';

  // ---------------- Dashboard --------------------
  static String get dashboardListingUrl => '/api/dashboard-chart';

  //Graphs Apis
  static String get topContributorUrl => '/api/dashboard/top-contributions';

  static String get topGiftingsUrl => '/api/dashboard/top-gifts';

  static String get activeUsersUrl => '/api/dashboard/active-users';

  static String get totalUserUrl => '/api/analytics-reports/percentage-users';

  static String get contributionFrequencyUrl =>
      '/api/analytics-reports/contribution-frequency';

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

  //--------------- Details ---------------------
  static String get userParentDetailsUrl => '/api/gifts/details';

  static String get giftsUrl => '/api/gifts';

  static String get userBenefeciaryUrl => '/api/users-benefeciaries';

  static String get giftDetailsPayoutUrl => '/api/gift-payouts';

  static String get userBeneficiariesUrl => '/api/users-benefeciaries';

  static String get getActivityUrl => '/api/activity';

  static String get getGiftContributorUrl => '/api/gift-contributor';

  static String get changeGiftStatusUrl => '/api/gifts/change-status';

  static String get parentDetailUrl => '/api/users';

  static String get exportExcelUrl => '/api/users/exportExcel';

  static String get exportGiftExcelUrl => '/api/gifts/excel-listing';

  static String get exportPayoutExcelUrl => '/api/payouts/excel-listing';

  static String get exportContributionExcelUrl =>
      '/api/contributions/excel-listing';
}
