import 'package:shared_preferences/shared_preferences.dart';

import '../Helpers/Constants.dart';

class ThemePrefs{
  static Future<String> getSavedThemeKey() async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.getString(Constants.THEME_KEY) ?? "sah";
  }
}