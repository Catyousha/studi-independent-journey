import 'package:flutter/material.dart';

class GreetingsText extends StatelessWidget {
  const GreetingsText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Hi, Awanama",
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Text(
          "What are you looking for today?",
          style: Theme.of(context).textTheme.headline1,
        ),
      ],
    );
  }
}
