import 'package:flutter/material.dart';

class ResultText extends StatelessWidget {
  const ResultText({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$label"),
          Text(
            "$value",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 16.0,
                ),
          ),
        ],
      ),
    );
  }
}
