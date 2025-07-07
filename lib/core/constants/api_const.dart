class ApiConstant {
  static const String baseUrl = 'https://shakshak.net/api/v1/';

  // auth
  static const String getCountriesUrl = 'user/country';
  static const String getCitiesUrl = 'user/city';
  static const String signupUrl = 'auth/signup';
  static const String loginUrl = 'auth/send_otp';
  static const String verifyOtpUrl = 'login';
  static const String sendOTP = 'auth/send_otp';
  static const String verifyOTP = 'auth/verify_otp';
  static const String getProfileUrl = 'user/profile';
  static const String updateProfileUrl = 'user/profile/update';

  // wallet
  static const String getWalletTransactionsUrl = 'user/transactions';
}
