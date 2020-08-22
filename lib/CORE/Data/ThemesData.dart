import 'package:flutter/material.dart';
import 'package:minesweeper/CORE/Helpers/emuns.dart';
import 'package:minesweeper/CORE/Data/ColorsData.dart';

class ThemesData {
  static final ThemeData deepPurple = ThemeData(
    primaryColor: ColorsData.deepPurple.primaryColor,
    scaffoldBackgroundColor: ColorsData.deepPurple.backgroundColor,
    accentColor: ColorsData.deepPurple.accent,
    brightness: Brightness.dark,
    primarySwatch: Colors.deepPurple
  );

  static final ThemeData contemporaryRed = ThemeData(
    primaryColor: ColorsData.contemporaryRed.primaryColor,
    scaffoldBackgroundColor: ColorsData.contemporaryRed.backgroundColor,
    accentColor: ColorsData.contemporaryRed.accent,
    brightness: Brightness.dark,
    primarySwatch: Colors.red
  );

  static final ThemeData electricBlue = ThemeData(
    primaryColor: ColorsData.electricBlue.primaryColor,
    scaffoldBackgroundColor: ColorsData.electricBlue.backgroundColor,
    accentColor: ColorsData.electricBlue.accent,
    brightness: Brightness.dark,
    primarySwatch: Colors.blue
  );

  static final ThemeData corporateGreen = ThemeData(
    primaryColor: ColorsData.corporateGreen.primaryColor,
    scaffoldBackgroundColor: ColorsData.corporateGreen.backgroundColor,
    accentColor: ColorsData.corporateGreen.accent,
    brightness: Brightness.light,
    primarySwatch: Colors.green
  );

  static final ThemeData darkGarden = ThemeData(
    primaryColor: ColorsData.darkGarden.primaryColor,
    scaffoldBackgroundColor: ColorsData.darkGarden.backgroundColor,
    accentColor: ColorsData.darkGarden.accent,
    brightness: Brightness.dark,
    primarySwatch: Colors.lightGreen
  );

  static ThemeData getThemeDataFromKey(AppTheme key) {
    ThemeData top;
    switch (key) {
      case AppTheme.deepPurple:
        top = deepPurple;
        break;
      case AppTheme.contemporaryRed:
        top = contemporaryRed;
        break;
      case AppTheme.electricBlue:
        top = electricBlue;
        break;
      case AppTheme.corporateGreen:
        top = corporateGreen;
        break;
      case AppTheme.darkGarden:
        top = darkGarden;
        break;
      default:
        top = deepPurple;
        break;
    }
    return top;
  }
}
