import 'package:flutter/material.dart';

TextTheme mondTextTheme() {
  TextTheme base = ThemeData.light().textTheme;
  return base.copyWith(
    headline1: base.headline1!.copyWith(
      fontFamily: 'DMSans',
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    headline2: base.headline2!.copyWith(
      fontFamily: 'DMSans',
      fontWeight: FontWeight.bold,
      fontSize: 22,
    ),
    headline3: base.headline3!.copyWith(
      fontFamily: 'DMSans',
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    headline4: base.headline4!.copyWith(
      fontFamily: 'DMSans',
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    headline5: base.headline5!.copyWith(
      fontFamily: 'DMSans',
      fontWeight: FontWeight.w500,
      fontSize: 16,
    ),
    headline6: base.headline6!.copyWith(
      fontFamily: 'DMSans',
      fontWeight: FontWeight.w500,
      fontSize: 14,
    ),
    subtitle1: base.subtitle1!.copyWith(
      fontFamily: 'DMSans',
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    caption: base.caption!.copyWith(
      fontFamily: 'DMSans',
      fontWeight: FontWeight.w500,
      fontSize: 14,
    ),
    bodyText1: base.bodyText1!.copyWith(
      fontFamily: 'DMSans',
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
    bodyText2: base.bodyText2!.copyWith(
      fontFamily: 'DMSans',
      fontWeight: FontWeight.w400,
      fontSize: 10,
    ),
  );
}
