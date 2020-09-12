import 'dart:ui';

import '../Helpers/emuns.dart';

class ThemeSelectionModel{
  final Color background;
  final Color primary;
  final bool isSelected;
  final AppTheme appTheme;

  ThemeSelectionModel(this.background, this.primary, this.isSelected, this.appTheme);

}