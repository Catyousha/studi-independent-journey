import 'package:flutter/material.dart';
import './sections/product_carousel.dart';
import './sections/greetings_text.dart';
import './sections/product_search_bar.dart';
import './sections/promotion_carousel.dart';
import './sections/categories_carousel.dart';
import '../../models/product_model.dart';
import '../../styles/colors.dart';

class MondMainBody extends StatelessWidget {
  const MondMainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gapY = 16.0;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: ListView(
        children: [
          Container(
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
          ),
          Container(
            padding: EdgeInsets.all(18.0),
            color: mondSecOffGrey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductCarousel(
                  name: "Featured Product",
                  type: ProductType.featured,
                ),
                ProductCarousel(
                  name: "Best Sellers",
                  type: ProductType.bestSeller,
                ),
                ProductCarousel(
                  name: "New Arrivals",
                  type: ProductType.newArrival,
                ),
                ProductCarousel(
                  name: "Top Rated Product",
                  type: ProductType.topRated,
                ),
                ProductCarousel(
                  name: "Special Offers",
                  type: ProductType.specialOffer,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
