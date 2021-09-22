import 'package:flutter/material.dart';
import './colors.dart';

enum TyposType {
  large,
  regular,
  small,
  tiny,
}

Map<TyposType, double> __fontSize = {
  TyposType.large: 18.0,
  TyposType.regular: 16.0,
  TyposType.small: 14.0,
  TyposType.tiny: 12.0,
};

TextStyle typosTextTitle({
  required int title,
  Color color = colorInkDarkest,
  double? fontSize,
}) {
  List<double> titleFontSize = [48, 32, 24];

  return TextStyle(
    fontFamily: 'Inter',
    fontSize: fontSize ?? titleFontSize[title - 1],
    fontWeight: FontWeight.w700,
    color: color,
  );
}

TextStyle typosTextRegular({
  required TyposType type,
  Color color = colorInkDarkest,
  double? fontSize,
}) {
  return TextStyle(
    fontFamily: 'Inter',
    fontSize: fontSize ?? __fontSize[type],
    fontWeight: FontWeight.w400,
    color: color,
  );
}

TextStyle typosTextMedium({
  required TyposType type,
  Color color = colorInkDarkest,
  double? fontSize,
}) {
  return TextStyle(
    fontFamily: 'Inter',
    fontSize: fontSize ?? __fontSize[type],
    fontWeight: FontWeight.w500,
    color: color,
  );
}

TextStyle typosTextBold({
  required TyposType type,
  Color color = colorInkDarkest,
  double? fontSize,
}) {
  return TextStyle(
    fontFamily: 'Inter',
    fontSize: fontSize ?? __fontSize[type],
    fontWeight: FontWeight.w700,
    color: color,
  );
}
