import 'package:flutter/material.dart';
import 'package:minesweeper/CORE/Helpers/emuns.dart';

class ColorData{
  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;
  final Color accent;
  final Color misc;
  final AppTheme appTheme;

  ColorData(this.primaryColor, this.secondaryColor, this.backgroundColor, this.accent, this.misc, this.appTheme);
}