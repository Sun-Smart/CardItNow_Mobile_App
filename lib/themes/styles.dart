import 'package:cardit/main.dart';
import 'package:cardit/themes/theme_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class Styles {
  static final themeChange =  themeChangeProvider;
  static Color get colorBackgroundBlock =>
      themeChange.darkTheme ? const Color(0xff000000) : const Color(0xffffffff);
  static Color get colorBackgroundwhite =>
      themeChange.darkTheme ? const Color(0xffffffff) : const Color(0xff000000);
  static Color get blockcolortext =>
      themeChange.darkTheme ? const Color(0xff000000) : const Color(0xffffffff);
  static Color get whitecolortext =>
      themeChange.darkTheme ? const Color(0xffffffff) : const Color(0xff000000);
       static Color get whitecustomlable =>
      themeChange.darkTheme ? const Color(0xffffffff) : HexColor('#505050');
  /*
  static Color get colorSectionTitle =>
      Styles.themeData(themeChangeProvider.darkTheme, context) ? const Color(0xff333333) : const Color(0xffe5e5e5);

  static Color get colorItemBackground =>
      AppGlobal().isDark ? const Color(0xff000000) : const Color(0xffffffff);

  static Color get colorItemDetailBackground =>
      AppGlobal().isDark ? const Color(0xff1f1f1f) : const Color(0xffefefef);

  static Color get colorListDivider =>
      AppGlobal().isDark ? const Color(0xff333333) : const Color(0xffe5e5e5);

  static Color get colorUnitText =>
      AppGlobal().isDark ? const Color(0xffffffff) : const Color(0xff000000);*/
}
