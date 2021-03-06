import 'package:flutter/material.dart';

import './colors.dart';

class MondTextStyles {
  BuildContext context;
  MondTextStyles({required this.context});

  TextStyle get blueBoldBody2Text {
    return Theme.of(context).textTheme.bodyText2!.copyWith(
          color: mondPriBlueOcean,
          fontWeight: FontWeight.bold,
        );
  }

  TextStyle get blueHeadline4Text {
    return Theme.of(context).textTheme.headline4!.copyWith(
          color: mondPriBlueOcean,
        );
  }

  TextStyle get blueHeadline6Text {
    return Theme.of(context).textTheme.headline6!.copyWith(
          color: mondPriBlueOcean,
        );
  }

  TextStyle get halfGreyHeadline6Text {
    return Theme.of(context).textTheme.headline6!.copyWith(
          color: mondSecHalfGrey,
        );
  }

  TextStyle get redBoldBody1Text {
    return Theme.of(context).textTheme.bodyText1!.copyWith(
          color: mondSecRedVelvet,
          fontWeight: FontWeight.bold,
        );
  }

  TextStyle get strikeGreyBody2Text {
    return Theme.of(context).textTheme.bodyText2!.copyWith(
          color: mondSecHalfGrey,
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.lineThrough,
        );
  }

  TextStyle get whiteBody2Text {
    return Theme.of(context).textTheme.bodyText2!.copyWith(
          color: mondPriPureWhite,
        );
  }

  TextStyle get whiteHeadline3Text {
    return Theme.of(context).textTheme.headline3!.copyWith(
          color: mondPriPureWhite,
        );
  }

  TextStyle get whiteHeadline6Text {
    return Theme.of(context).textTheme.headline6!.copyWith(
          color: mondPriPureWhite,
        );
  }
}
