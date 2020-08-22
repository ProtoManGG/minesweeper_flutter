import 'package:minesweeper/CORE/Helpers/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemePrefs{
  static Future<String> getSavedThemeKey() async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.getString(Constants.THEME_KEY) ?? "sah";
  }
}