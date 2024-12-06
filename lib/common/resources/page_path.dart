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

//Dashboard Routes
  static const String dashboard = '/dashboard';
  static const String userParents = '/userParents';
  static const String parentDetails = 'parentDetails';
  static const String giftDetails = '/giftDetails';
  static const String userContributor = '/userContributor';
  static const String contributorDetails = 'contributorDetails';
  static const String giftings = '/giftings';
  static const String contrbutions = '/contributors';
  static const String payouts = '/payouts';
  static const String analytics = '/analytics';
}

extension ContextExtensionss on String {
  String get toRoute => '/$this';
}
