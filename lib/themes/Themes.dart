import 'dart:ui';

import 'package:flutter/material.dart';

const MaterialColor white = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xffA8DAB5),
    100: const Color(0xffA8DAB5),
    200: const Color(0xffA8DAB5),
    300: const Color(0xffA8DAB5),
    400: const Color(0xffA8DAB5),
    500: const Color(0xffA8DAB5),
    600: const Color(0xffA8DAB5),
    700: const Color(0xffA8DAB5),
    800: const Color(0xffA8DAB5),
    900: const Color(0xffA8DAB5),
  },
);

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      //primarySwatch: white,
      primaryColor: isDarkTheme ? Colors.black : Colors.white,
      backgroundColor: isDarkTheme ? Colors.black : Color(0xffF1F5FB),
      indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
      //hintColor: isDarkTheme ? Color(0xff280C0B) : Color(0xffEECED3),
      highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
      focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      /*buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),*/
      appBarTheme: AppBarTheme(
          elevation: 0.0, color: isDarkTheme ? Colors.black : Colors.white),
      textTheme: TextTheme(
        headline1: TextStyle(color: isDarkTheme ? Colors.black : Colors.white),
        headline2: TextStyle(),
        headline3: TextStyle(),
        subtitle1: TextStyle(),
        bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      ),
    );
  }
}
