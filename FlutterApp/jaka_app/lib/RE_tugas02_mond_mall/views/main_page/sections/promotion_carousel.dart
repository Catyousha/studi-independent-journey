import 'package:flutter/material.dart';
import '../../../widgets/carousel_scroller.dart';
import '../../../widgets/promotion_banner.dart';

class PromotionCarousel extends StatelessWidget {
  const PromotionCarousel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gapX = 8.0;
    return CarouselScroller(
      child: Row(
        children: <Widget>[
          PromotionBanner(
            title: "Gratis Ongkir Selama PPKM!",
            subtitle: "Periode Mei - Agustus 2021",
            image: Image.asset(
              "assets/RE_T2_Mond_Mall/promotion1.png",
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: gapX,
          ),
          PromotionBanner(
            title: "Kemerdekaan Diskon 70%",
            subtitle: "Periode Agustus 2021",
            image: Image.asset(
              "assets/RE_T2_Mond_Mall/promotion2.png",
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
