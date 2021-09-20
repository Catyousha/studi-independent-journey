import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.iconColor,
    required this.boxColor,
    required this.icon,
    required this.name,
  }) : super(key: key);

  final Color iconColor;
  final Color boxColor;
  final IconData icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    double gapY = 8.0;
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: boxColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            size: 24,
            color: iconColor,
          ),
        ),
        SizedBox(height: gapY),
        Text(
          name,
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    );
  }
}
