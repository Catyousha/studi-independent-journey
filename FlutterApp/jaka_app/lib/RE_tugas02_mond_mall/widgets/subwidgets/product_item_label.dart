import 'package:flutter/material.dart';
import '../../utils/string_formatter.dart';
import '../../styles/mond_text_styles.dart';

class ProductItemLabel extends StatelessWidget {
  const ProductItemLabel({
    Key? key,
    required this.name,
    required this.price,
    this.priceAfterSale,
  }) : super(key: key);

  final String name;
  final int price;
  final int? priceAfterSale;

  @override
  Widget build(BuildContext context) {
    MondTextStyles _mondTextStyles = MondTextStyles(context: context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            "$name",
            style: Theme.of(context).textTheme.caption,
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          "Rp. ${numberToRupiah(priceAfterSale ?? price)}",
          style: _mondTextStyles.redBoldBody1Text,
        ),
        SizedBox(height: 5.0),
        if (priceAfterSale != null)
          Text(
            "Rp. ${numberToRupiah(price)}",
            style: _mondTextStyles.strikeGreyBody2Text,
          ),
        if (priceAfterSale != null) SizedBox(height: 5.0),
      ],
    );
  }
}
