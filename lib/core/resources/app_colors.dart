import 'package:flutter/material.dart';

class AppColors {
/*
  static const primaryColor = Color(0xffC4204A);
  static const primaryLightColor = Color(0xffe89dad);

*/
/*  static const secondaryColor = Color(0xff1784AD);
  static const secondaryLightColor = Color(0xffACD1D6);*/ /*

  static const secondaryColor = Color(0xffC4204A);
  static const secondaryLightColor = Color(0xffe89dad);
*/

  static const primaryColor = Color(0xffC382ED);
  static const primaryLightColor = Color(0xffe2d0ef);

/*  static const secondaryColor = Color(0xff1784AD);
  static const secondaryLightColor = Color(0xffACD1D6);*/
  static const secondaryColor = Color(0xffC382ED);
  static const secondaryLightColor = Color(0xffe2d0ef);

  static const darkGreyColor = Color(0xff5C5F62);
  static const lightGreyColor = Color(0xffE5E7EB);
  static const borderColor = Color(0xffCED4E2);
  static const greyColor = Color(0xff999999);
  static const scaffoldColor = Color(0xffF9F9F9);

  static const whiteColor = Color(0xffFCF7F4);
  static const blackColor = Colors.black;
  static List<Color> linearPrimarySecondaryColor = [
    whiteColor,
    primaryColor.withAlpha(200),
    secondaryColor,
  ];

  static const redColor = Color(0xffF83838);

  // DARK MODE COLORS
  static const darkBackground = Color(0xFF181A20); // main background
  static const darkSurface = Color(0xFF23262F); // containers, cards
  static const darkPrimary = Color(0xFF8F5FE8); // accent/primary
  static const darkSecondary = Color(0xFF5C5F62); // secondary accent
  static const darkText = Color(0xFFF5F6FA); // main text
  static const darkTextSecondary = Color(0xFFB0B3B8); // secondary text

  // ThemeData for light and dark themes
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.light,
      surfaceContainerHighest: Color(0xFFF3F4F6), // light grey for containers
    ),
    fontFamily: 'Cairo',
    appBarTheme: const AppBarTheme(
      backgroundColor: whiteColor,
      foregroundColor: blackColor,
      iconTheme: IconThemeData(color: blackColor),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: blackColor),
      bodyMedium: TextStyle(color: blackColor),
      bodySmall: TextStyle(color: blackColor),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: darkBackground,
    primaryColor: darkPrimary,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: darkPrimary,
      onPrimary: darkText,
      secondary: darkSecondary,
      onSecondary: darkText,
      surface: darkSurface,
      onSurface: darkText,
      surfaceContainerHighest: Color(0xFF42454C), // dark grey for containers
      error: redColor,
      onError: Colors.white,
    ),
    fontFamily: 'Cairo',
    appBarTheme: const AppBarTheme(
      backgroundColor: darkSurface,
      foregroundColor: darkText,
      iconTheme: IconThemeData(color: darkText),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: darkText),
      bodyMedium: TextStyle(color: darkText),
      bodySmall: TextStyle(color: darkTextSecondary),
      titleLarge: TextStyle(color: darkText),
      titleMedium: TextStyle(color: darkText),
      titleSmall: TextStyle(color: darkTextSecondary),
      labelLarge: TextStyle(color: darkText),
      labelMedium: TextStyle(color: darkTextSecondary),
      labelSmall: TextStyle(color: darkTextSecondary),
    ),
    cardColor: darkSurface,
    dialogBackgroundColor: darkSurface,
    canvasColor: darkBackground,
    dividerColor: darkSecondary,
    iconTheme: const IconThemeData(color: darkText),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: darkSurface,
      filled: true,
      hintStyle: TextStyle(color: darkTextSecondary),
      labelStyle: TextStyle(color: darkText),
      border: OutlineInputBorder(),
    ),
  );
}
