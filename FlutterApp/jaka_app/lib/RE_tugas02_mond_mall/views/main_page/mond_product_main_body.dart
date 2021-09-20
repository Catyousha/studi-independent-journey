import 'package:flutter/material.dart';
import './sections/product_carousel.dart';
import '../../models/product_model.dart';
import '../../styles/colors.dart';
import '../../widgets/product_banner.dart';

class MondProductMainBody extends StatelessWidget {
  const MondProductMainBody({
    Key? key,
    required this.gapY,
  }) : super(key: key);

  final double gapY;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25.0),
      color: mondSecOffGrey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: gapY),
          ProductCarousel(
            name: "Featured Product",
            type: ProductType.featured,
          ),
          SizedBox(height: gapY),
          ProductBanner(
            title: "Gratis Ongkir 10% Untuk Earphone Vortex",
            color: mondSecEarthGreen,
            image: Image.asset(
              "assets/RE_T2_Mond_Mall/productbanner1.png",
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: gapY),
          ProductCarousel(
            name: "Best Sellers",
            type: ProductType.bestSeller,
          ),
          SizedBox(height: gapY),
          ProductBanner(
            title: "Cashback 30% Untuk Pembelian Skyward Headphone",
            color: mondPriBlueOcean,
            image: Image.asset(
              "assets/RE_T2_Mond_Mall/productbanner2.png",
            ),
          ),
          SizedBox(height: gapY),
          ProductCarousel(
            name: "New Arrivals",
            type: ProductType.newArrival,
          ),
          SizedBox(height: gapY),
          ProductCarousel(
            name: "Top Rated Product",
            type: ProductType.topRated,
          ),
          SizedBox(height: gapY),
          ProductCarousel(
            name: "Special Offers",
            type: ProductType.specialOffer,
          ),
        ],
      ),
    );
  }
}
