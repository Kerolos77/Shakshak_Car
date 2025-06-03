import 'package:flutter/material.dart';

import '../resources/app_colors.dart';

class AppConstant {
/*  static String currentLanguage =
      Intl.getCurrentLocale() == 'en_US' ? 'en' : 'ar';
  */
  static String currentLanguage = 'ar';

  static String urlTemplate =
      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png";

  static const String kOnBoarding = 'onBoarding';
  static const String kRoleSelection = 'roleSelection';
  static const String kToken = 'token';
  static const String kRoleId = 'roleId';
  static const String kRegisterToken = 'registerToken';
  static const String kUserIdOtp = 'userIdOtp';
  static const String kCartBox = 'cartBox';
  static const String kCurrentLanguage = 'currentLanguage';
  static const String kHasArea = 'hasArea';
  static const String kHasService = 'hasService';

  static List<BoxShadow> shadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.12),
      offset: const Offset(0, 4),
      spreadRadius: -1,
      blurRadius: 10,
    )
  ];
  static List<BoxShadow> shadow2 = [
    BoxShadow(
      color: Colors.black.withOpacity(0.12),
      offset: const Offset(0, 1),
      spreadRadius: 0,
      blurRadius: 4,
    )
  ];

  static const List<Color> whiteLinearGradient = [
    AppColors.whiteColor,
    Colors.white
  ];

  static double screenHeight(context) => MediaQuery.sizeOf(context).height;

  static double screenWidth(context) => MediaQuery.sizeOf(context).width;

  static String? token;
  static String? otp;
}
