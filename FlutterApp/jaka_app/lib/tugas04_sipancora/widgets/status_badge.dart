import 'package:flutter/material.dart';
import '../styles/colors.dart';
import '../styles/typos.dart';

class StatusBadge extends StatelessWidget {
  const StatusBadge({
    Key? key,
    this.backgroundColor = colorPriLightest,
    this.textColor = colorPriBase,
    required this.label,
  }) : super(key: key);

  final Color backgroundColor;
  final Color textColor;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.0),
        color: backgroundColor,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      child: Text(
        label,
        style: typosTextBold(
          type: TyposType.small,
          color: textColor,
        ),
      ),
    );
  }
}
