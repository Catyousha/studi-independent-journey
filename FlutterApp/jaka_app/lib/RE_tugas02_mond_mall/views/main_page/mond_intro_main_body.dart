import 'package:flutter/material.dart';
import './sections/greetings_text.dart';
import './sections/product_search_bar.dart';
import './sections/promotion_carousel.dart';
import './sections/categories_carousel.dart';

class MondIntroMainBody extends StatelessWidget {
  const MondIntroMainBody({
    Key? key,
    required this.gapY,
  }) : super(key: key);

  final double gapY;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GreetingsText(),
          SizedBox(height: gapY),
          ProductSearchBar(),
          SizedBox(height: gapY),
          PromotionCarousel(),
          SizedBox(height: gapY),
          CategoriesCarousel(),
        ],
      ),
    );
  }
}
