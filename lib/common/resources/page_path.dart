class PagePath {
  /// Unauthenticated Routes
  static const String slash = '/';
  static const String splash = '/splash';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = 'forgotPassword';
  static const String otp = 'otp';
  static const String createNewPassword = 'createNewPassword';
  static const String onboarding = '/onboarding';
  static const String privacyAndPolicy = '/privacyAndPolicy';

  ///======= Authenticated Routes ===========

  /// HOME
  static const String homeScreen = '/homeScreen';
}

extension ContextExtensionss on String {
  String get toRoute => '/$this';
}
