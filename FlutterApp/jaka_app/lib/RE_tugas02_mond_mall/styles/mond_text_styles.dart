import 'package:flutter/material.dart';
import './colors.dart';

class MondTextStyles {
  MondTextStyles({required this.context});
  BuildContext context;

  TextStyle get blueHeadline4Text {
    return Theme.of(context).textTheme.headline4!.copyWith(
          color: Theme.of(context).colorScheme.primary,
        );
  }

  TextStyle get halfGreyHeadline6Text {
    return Theme.of(context).textTheme.headline6!.copyWith(
          color: mondSecHalfGrey,
        );
  }

  TextStyle get blueHeadline6Text {
    return Theme.of(context).textTheme.headline6!.copyWith(
          color: mondPriBlueOcean,
        );
  }

  TextStyle get whiteHeadline6Text {
    return Theme.of(context).textTheme.headline3!.copyWith(
          color: mondPriPureWhite,
        );
  }

  TextStyle get whiteBody2Text {
    return Theme.of(context).textTheme.bodyText2!.copyWith(
          color: mondPriPureWhite,
        );
  }
}
