import 'package:get_storage/get_storage.dart';

class DarkThemePreference {
  static const THEME_STATUS = "THEMESTATUS";

  setDarkTheme(bool value) async {
    GetStorage().write(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    return GetStorage().read(THEME_STATUS) ?? false;
  }
}