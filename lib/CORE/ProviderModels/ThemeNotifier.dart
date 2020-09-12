import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Data/ColorsData.dart';
import '../Data/ThemesData.dart';
import '../Helpers/emuns.dart';
import '../Models/ThemeSelectionModel.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData currentThemeData = ThemesData.darkGarden;
  ThemeSelectorState currentExpansionState = ThemeSelectorState.Closed;

  void setCurrentTheme(AppTheme appTheme) {
    currentThemeData = ThemesData.getThemeDataFromKey(appTheme);
    notifyListeners();
  }

  void toggleSelectorExpansionState() {
    if (currentExpansionState == ThemeSelectorState.Closed) {
      currentExpansionState = ThemeSelectorState.Expanded;
    } else {
      currentExpansionState = ThemeSelectorState.Closed;
    }
    notifyListeners();
  }

  List<ThemeSelectionModel> getAllThemesData() {
    final List<ThemeSelectionModel> list = [];
    ColorsData.getAllColor().forEach((element) {
      list.add(
        ThemeSelectionModel(
          background: element.backgroundColor,
          primary: element.primaryColor,
          isSelected: currentThemeData.primaryColor == element.primaryColor,
          appTheme: element.appTheme,
        ),
      );
    });
    return list;
  }
}
