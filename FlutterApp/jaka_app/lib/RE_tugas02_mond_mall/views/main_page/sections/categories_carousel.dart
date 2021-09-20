import 'package:flutter/material.dart';
import '../../../styles/colors.dart';
import '../../../widgets/head_section_text.dart';
import '../../../widgets/carousel_scroller.dart';
import '../../../widgets/categories_item.dart';

class CategoriesCarousel extends StatelessWidget {
  const CategoriesCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gapYHeadToItems = 16.0;
    double gapXItems = 32.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        HeadSectionText(
          sectionName: "Categories",
        ),
        SizedBox(height: gapYHeadToItems),
        CarouselScroller(
          child: Row(
            children: <Widget>[
              CategoriesItem(
                iconColor: mondSecEarthGreen,
                boxColor: mondLabOffGreen,
                icon: Icons.fastfood_outlined,
                name: "Foods",
              ),
              SizedBox(width: gapXItems),
              CategoriesItem(
                iconColor: mondSecRedVelvet,
                boxColor: mondLabOffRed,
                icon: Icons.card_giftcard_outlined,
                name: "Gift",
              ),
              SizedBox(width: gapXItems),
              CategoriesItem(
                iconColor: mondPriOrangeFresh,
                boxColor: mondSecLightYellow,
                icon: Icons.checkroom_outlined,
                name: "Fashion",
              ),
              SizedBox(width: gapXItems),
              CategoriesItem(
                iconColor: mondPriBlueOcean,
                boxColor: mondLabOffBlue,
                icon: Icons.devices_other_outlined,
                name: "Gadget",
              ),
              SizedBox(width: gapXItems),
              CategoriesItem(
                iconColor: mondSecEarthGreen,
                boxColor: mondLabOffGreen,
                icon: Icons.computer_outlined,
                name: "Computer",
              ),
              SizedBox(width: gapXItems),
              CategoriesItem(
                iconColor: mondSecRedVelvet,
                boxColor: mondLabOffRed,
                icon: Icons.auto_awesome_outlined,
                name: "Souvenir",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
