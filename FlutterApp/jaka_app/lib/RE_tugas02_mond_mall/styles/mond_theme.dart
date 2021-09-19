import 'package:flutter/material.dart';
import 'package:jaka_app/RE_tugas02_mond_mall/styles/typos.dart';
import './colors.dart';

ThemeData mondTheme = _buildMondTheme();

ThemeData _buildMondTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: mondPriBlueOcean,
      secondary: mondSecRedVelvet,
    ),
    textTheme: mondTextTheme(),
  );
}
