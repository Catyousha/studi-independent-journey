import 'package:flutter/material.dart';

TextTheme textThemeData(TextTheme base) {
  double _baseSize = 54;
  double _goldenRatio = 1.1618;
  return base.copyWith(
    headline1: base.headline1!.copyWith(
      color: Colors.black87,
      fontSize: _baseSize - (_goldenRatio * 2),
      fontWeight: FontWeight.w800,
    ),
    headline2: base.headline2!.copyWith(
      color: Colors.black87,
      fontSize: _baseSize - (_goldenRatio * 2),
      fontWeight: FontWeight.w800,
    ),
    headline3: base.headline3!.copyWith(
      color: Colors.black87,
      fontSize: _baseSize - (_goldenRatio * 3),
      fontWeight: FontWeight.w600,
    ),
    headline4: base.headline4!.copyWith(
      color: Colors.black87,
      fontSize: _baseSize - (_goldenRatio * 4),
      fontWeight: FontWeight.w600,
    ),
    headline5: base.headline5!.copyWith(
      color: Colors.black87,
      fontSize: _baseSize - (_goldenRatio * 5),
    ),
    headline6: base.headline6!.copyWith(
      color: Colors.black87,
      fontSize: _baseSize - (_goldenRatio * 6),
    ),
    subtitle1: base.subtitle1!.copyWith(
      color: Colors.black54,
    ),
    bodyText1: base.bodyText1!.copyWith(
      color: Colors.black87,
      fontWeight: FontWeight.w600,
      fontSize: 14.0,
    ),
    bodyText2: base.bodyText1!.copyWith(
      color: Colors.blueAccent,
    ),
  );
}
