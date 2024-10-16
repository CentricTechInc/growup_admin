class APIEndpoint {
  // TODO: Update the server URL
  static String get baseUrl => 'UPDATE_SERVER_URL_HERE';
  // ---------------- Authorization --------------------
  static String get loginUrl => '/api/Authenticate/login';
  static String get registerUrl => '/api/Authenticate/register';
  static String get registerOTpVerificationUrl =>
      '/api/Authenticate/OTPVerify';
  static String get generateOtpUrl => '/api/Authenticate/OtpGenerator';
  static String get forgotPasswordUrl => '/api/Vendor/vendor/ForgetPassword';
  static String get forgotOtpVerificationUrl =>
      '/api/Authenticate/OTPVerify';
  static String get resetPasswordUrl => '/api/Authenticate/forgot-password';
  static String get changePasswordUrl => '/api/Authenticate/change-password';
}
