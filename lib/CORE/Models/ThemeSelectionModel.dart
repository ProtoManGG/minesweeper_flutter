import 'dart:ui';

import 'package:flutter/foundation.dart';

import '../Helpers/emuns.dart';

class ThemeSelectionModel {
  final Color background;
  final Color primary;
  final bool isSelected;
  final AppTheme appTheme;

  ThemeSelectionModel({
    @required this.background,
    @required this.primary,
    @required this.isSelected,
    @required this.appTheme,
  });
}
