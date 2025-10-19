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
  static const String chargeWalletUrl = 'user/charge_wallet';
  static const String withdrawRequestUrl = 'user/withdraw_request';

  // rides
  static const String getUserRidesUrl = 'order/old-for-user';

  //faqs
  static const String getFaqsUrl = 'faqs';

  //contact us
  static const String getContactUsUrl = 'contact-us';
  static const String writeUsUrl = 'write_us';

  //contact us
  static const String getStaticPagesUrl = 'pages';

  //user home
  static const String getCaptionsUrl = 'captions';
  static const String getServicesUrl = 'services/incity';

  //driver registration
  static const String driverRegistrationUrl = 'driver/registration';
  static const String driverToggleOnlineUrl = 'user/toggle_online';

  // chat
  static const String sendMessageUrl = 'send/chat';

  // offer
  static const String acceptOfferUrl = 'order/accept';
  static const String cancelOrderUrl = 'order/cancel';
}
