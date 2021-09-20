import 'package:flutter/material.dart';
import '../utils/screen_width.dart';
import '../models/product_model.dart';
import './subwidgets/product_item_image.dart';
import './subwidgets/product_item_label.dart';
import './subwidgets/product_item_rating.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.product,
    this.sale = false,
  }) : super(key: key);

  final Product product;
  final bool sale;

  @override
  Widget build(BuildContext context) {
    int responsiveDivisor =
        (MediaQuery.of(context).size.width >= mediumWidth) ? 3 : 2;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      width: MediaQuery.of(context).size.width / responsiveDivisor,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ProductItemImage(
            image: product.image,
            sale: sale,
          ),
          SizedBox(height: 20),
          ProductItemLabel(
            name: product.name,
            price: product.price,
            priceAfterSale: (sale) ? product.priceAfterSale : null,
          ),
          SizedBox(height: 10),
          ProductItemRating(
            rate: product.avgRate,
            reviews: product.totalReviews,
          ),
        ],
      ),
    );
  }
}
