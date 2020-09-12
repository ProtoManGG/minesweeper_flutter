import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Data/ColorsData.dart';
import '../Data/ThemesData.dart';
import '../Helpers/emuns.dart';
import '../Models/ThemeSelectionModel.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData currentThemeData = ThemesData.darkGarden;
  ThemeSelectorState currentExpansionState = ThemeSelectorState.Closed;

  setCurrentTheme(AppTheme appTheme) {
    currentThemeData = ThemesData.getThemeDataFromKey(appTheme);
    notifyListeners();
  }

  toggleSelectorExpansionState() {
    if (currentExpansionState == ThemeSelectorState.Closed) {
      currentExpansionState = ThemeSelectorState.Expanded;
    } else {
      currentExpansionState = ThemeSelectorState.Closed;
    }
    notifyListeners();
  }

  List<ThemeSelectionModel> getAllThemesData() {
    List<ThemeSelectionModel> list = [];
    ColorsData.getAllColor().forEach((element) {
      list.add(ThemeSelectionModel(
          element.backgroundColor,
          element.primaryColor,
          currentThemeData.primaryColor == element.primaryColor,
      element.appTheme));
    });
    return list;
  }
}
