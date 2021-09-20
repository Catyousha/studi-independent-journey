import 'package:flutter/material.dart';
import '../../../models/product_model.dart';
import '../../../models/product_list_model.dart';
import '../../../widgets/carousel_scroller.dart';
import '../../../widgets/head_section_text.dart';
import '../../../widgets/product_item.dart';

class ProductCarousel extends StatelessWidget {
  const ProductCarousel({
    Key? key,
    required this.name,
    required this.type,
  }) : super(key: key);

  final String name;
  final ProductType type;
  final double gapYHeadToItems = 24.0;
  final double gapXItems = 15;

  List<Widget> _buildProductItems() {
    List<Widget> __productItems = [];
    List<Product> __product = ProductList().getByProductType(type);
    __product.forEach((element) {
      __productItems.addAll([
        ProductItem(
          product: element,
          sale: (type == ProductType.specialOffer),
        ),
        SizedBox(width: gapXItems),
      ]);
    });
    return __productItems;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        HeadSectionText(sectionName: name),
        SizedBox(
          height: gapYHeadToItems,
        ),
        CarouselScroller(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: _buildProductItems(),
          ),
        ),
      ],
    );
  }
}
