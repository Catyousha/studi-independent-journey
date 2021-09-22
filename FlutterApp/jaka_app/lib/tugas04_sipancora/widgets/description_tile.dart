import 'package:flutter/material.dart';
import '../styles/colors.dart';
import '../styles/shadows.dart';
import '../styles/typos.dart';

class DescriptionTile extends StatelessWidget {
  const DescriptionTile({
    Key? key,
    required this.title,
    required this.text,
  }) : super(key: key);

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
        color: colorSkyWhite,
        boxShadow: shadowSmall,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 12.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: typosTextRegular(type: TyposType.regular),
          ),
          Text(
            text,
            style: typosTextRegular(type: TyposType.regular),
          ),
        ],
      ),
    );
  }
}
