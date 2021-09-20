import 'package:flutter/material.dart';
import './sections/greetings_text.dart';
import './sections/product_search_bar.dart';
import './sections/promotion_carousel.dart';
import './sections/categories_carousel.dart';

class MondMainBody extends StatelessWidget {
  const MondMainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gapY = 16.0;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        margin: EdgeInsets.all(18.0),
        child: ListView(
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
      ),
    );
  }
}
