import 'package:flutter/material.dart';
import '../styles/mond_text_styles.dart';

class HeadSectionText extends StatelessWidget {
  const HeadSectionText({
    Key? key,
    required this.sectionName,
    this.optionText = "See All",
  }) : super(key: key);

  final String sectionName;
  final String optionText;

  @override
  Widget build(BuildContext context) {
    MondTextStyles _mondTextStyles = MondTextStyles(context: context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          sectionName,
          style: Theme.of(context).textTheme.headline5,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            optionText,
            style: _mondTextStyles.blueBoldBody2Text,
          ),
        )
      ],
    );
  }
}
