import 'dart:ui';

import 'package:minesweeper/CORE/Helpers/emuns.dart';

class ThemeSelectionModel{
  final Color background;
  final Color primary;
  final bool isSelected;
  final AppTheme appTheme;

  ThemeSelectionModel(this.background, this.primary, this.isSelected, this.appTheme);

}