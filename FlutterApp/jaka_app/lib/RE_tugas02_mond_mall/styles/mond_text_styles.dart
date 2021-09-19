import 'package:flutter/material.dart';

class MondTextStyles{
  MondTextStyles({required this.context});
  BuildContext context;

  TextStyle get blueAppBarText{
    return Theme.of(context).textTheme.headline4!.copyWith(
      color: Theme.of(context).colorScheme.primary,
    );
  }
}