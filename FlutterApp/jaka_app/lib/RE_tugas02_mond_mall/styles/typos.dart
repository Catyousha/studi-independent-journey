import 'package:flutter/material.dart';
import './colors.dart';

TextTheme mondTextTheme() {
  TextTheme base = ThemeData.light().textTheme;
  return base.copyWith(
    headline1: base.headline1!.copyWith(
      fontFamily: 'DMSans',
      fontWeight: FontWeight.bold,
      fontSize: 24,
      color: mondPriNavyBlack,
    ),
    headline2: base.headline2!.copyWith(
      fontFamily: 'DMSans',
      fontWeight: FontWeight.bold,
      fontSize: 22,
      color: mondPriNavyBlack,
    ),
    headline3: base.headline3!.copyWith(
      fontFamily: 'DMSans',
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: mondPriNavyBlack,
    ),
    headline4: base.headline4!.copyWith(
      fontFamily: 'DMSans',
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: mondPriNavyBlack,
    ),
    headline5: base.headline5!.copyWith(
      fontFamily: 'DMSans',
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: mondPriNavyBlack,
    ),
    headline6: base.headline6!.copyWith(
      fontFamily: 'DMSans',
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: mondPriNavyBlack,
    ),
    subtitle1: base.subtitle1!.copyWith(
      fontFamily: 'DMSans',
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: mondPriNavyBlack,
    ),
    caption: base.caption!.copyWith(
      fontFamily: 'DMSans',
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: mondPriNavyBlack,
    ),
    bodyText1: base.bodyText1!.copyWith(
      fontFamily: 'DMSans',
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: mondPriNavyBlack,
    ),
    bodyText2: base.bodyText2!.copyWith(
      fontFamily: 'DMSans',
      fontWeight: FontWeight.w400,
      fontSize: 10,
      color: mondPriNavyBlack,
    ),
  );
}
