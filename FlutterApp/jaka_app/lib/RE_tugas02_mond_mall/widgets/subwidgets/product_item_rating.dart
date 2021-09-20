import 'package:flutter/material.dart';
import '../../styles/colors.dart';

class ProductItemRating extends StatelessWidget {
  const ProductItemRating({
    Key? key,
    required this.rate,
    required this.reviews,
  }) : super(key: key);

  final double rate;
  final int reviews;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              Icons.star,
              color: mondPriOrangeFresh,
              size: 10,
            ),
            SizedBox(width: 3),
            Text(
              "$rate",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(width: 10),
            Text(
              "$reviews Reviews",
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
        Icon(
          Icons.more_vert,
          color: mondSecHalfGrey,
          size: 14,
        ),
      ],
    );
  }
}
