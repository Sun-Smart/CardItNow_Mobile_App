import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppGlobal {
  Brightness get brightness => Brightness.dark;
  bool get isDark => brightness == Brightness.dark;
}
