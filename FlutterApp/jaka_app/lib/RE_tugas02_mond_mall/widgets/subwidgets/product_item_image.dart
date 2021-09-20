import 'package:flutter/material.dart';
import '../../styles/colors.dart';
import '../../styles/mond_text_styles.dart';

class ProductItemImage extends StatelessWidget {
  const ProductItemImage({
    Key? key,
    this.sale = false,
    required this.image,
  }) : super(key: key);

  final bool sale;
  final Image image;

  @override
  Widget build(BuildContext context) {
    MondTextStyles _mondTextStyles = MondTextStyles(context: context);
    return Stack(
      children: <Widget>[
        image,
        if (sale)
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 2.0,
              ),
              decoration: BoxDecoration(
                color: mondSecRedVelvet,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "SALE",
                style: _mondTextStyles.whiteBody2Text.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
