import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Helpers/emuns.dart';
import '../Models/ColorData.dart';

mixin ColorsData {
  static final ColorData deepPurple = ColorData(
    const Color(0xff3500d3),
    const Color(0xff282828),
    const Color(0xff0c0032),
    const Color(0xff1c0f4d),
    const Color(0xff190062),
    AppTheme.deepPurple,
  );

  static final ColorData contemporaryRed = ColorData(
      const Color(0xff950740),
      const Color(0xff6f2232),
      const Color(0xff1a1a1d),
      const Color(0xffc3073f),
      const Color(0xff4e4e50),
      AppTheme.contemporaryRed);
  static final ColorData electricBlue = ColorData(
      const Color(0xff66fcf1),
      const Color(0xff45a29e),
      const Color(0xff0b0c10),
      const Color(0xffc5c6c7),
      const Color(0xff1f2833),
      AppTheme.electricBlue);
  static final ColorData corporateGreen = ColorData(
      const Color(0xff4f4a41),
      const Color(0xff6e6658),
      const Color(0xff88bdbc),
      const Color(0xff254e58),
      const Color(0xff112d32),
      AppTheme.corporateGreen);
  static final ColorData darkGarden = ColorData(
      const Color(0xff86c232),
      const Color(0xff61892f),
      const Color(0xff222629),
      const Color(0xff474b4f),
      const Color(0xff6b6e70),
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
