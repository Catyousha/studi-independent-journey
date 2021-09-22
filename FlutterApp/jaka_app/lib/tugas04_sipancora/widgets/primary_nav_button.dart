import 'package:flutter/material.dart';
import '../styles/colors.dart';
import '../styles/typos.dart';

class PrimaryNavButton extends StatelessWidget {
  const PrimaryNavButton({
    Key? key,
    required this.label,
    required this.onTapHandler,
    this.backgroundColor = colorPriBase,
    this.textColor = colorSkyWhite,
  }) : super(key: key);

  final String label;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onTapHandler;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: backgroundColor,
        padding: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 60.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48.0),
        ),
      ),
      onPressed: onTapHandler,
      child: Text(
        label,
        style: typosTextRegular(
          type: TyposType.small,
          color: textColor,
        ),
      ),
    );
  }
}
