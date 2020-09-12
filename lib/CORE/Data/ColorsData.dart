import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Helpers/emuns.dart';
import '../Models/ColorData.dart';

class ColorsData {
  static final ColorData deepPurple = ColorData(
      Color(0xff3500d3),
      Color(0xff282828),
      Color(0xff0c0032),
      Color(0xff1c0f4d),
      Color(0xff190062),
      AppTheme.deepPurple);

  static final ColorData contemporaryRed = ColorData(
      Color(0xff950740),
      Color(0xff6f2232),
      Color(0xff1a1a1d),
      Color(0xffc3073f),
      Color(0xff4e4e50),
      AppTheme.contemporaryRed);
  static final ColorData electricBlue = ColorData(
      Color(0xff66fcf1),
      Color(0xff45a29e),
      Color(0xff0b0c10),
      Color(0xffc5c6c7),
      Color(0xff1f2833),
      AppTheme.electricBlue);
  static final ColorData corporateGreen = ColorData(
      Color(0xff4f4a41),
      Color(0xff6e6658),
      Color(0xff88bdbc),
      Color(0xff254e58),
      Color(0xff112d32),
      AppTheme.corporateGreen);
  static final ColorData darkGarden = ColorData(
      Color(0xff86c232),
      Color(0xff61892f),
      Color(0xff222629),
      Color(0xff474b4f),
      Color(0xff6b6e70),
      AppTheme.darkGarden);

  static List<ColorData> getAllColor() {
    return [
      deepPurple,
      contemporaryRed,
      electricBlue,
      corporateGreen,
      darkGarden
    ];
  }
}
