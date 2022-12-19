import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import '../services/appglobal.dart';

abstract class Styles {
  static Color get colorSectionTitle =>
      AppGlobal().isDark ? const Color(0xff333333) : const Color(0xffe5e5e5);

  static Color get colorItemBackground =>
      AppGlobal().isDark ? const Color(0xff000000) : const Color(0xffffffff);

  static Color get colorItemDetailBackground =>
      AppGlobal().isDark ? const Color(0xff1f1f1f) : const Color(0xffefefef);

  static Color get colorListDivider =>
      AppGlobal().isDark ? const Color(0xff333333) : const Color(0xffe5e5e5);

  static Color get colorUnitText =>
      AppGlobal().isDark ? const Color(0xffffffff) : const Color(0xff000000);
}
