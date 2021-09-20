import 'package:flutter/material.dart';
import '../styles/mond_text_styles.dart';
import '../styles/colors.dart';

class PromotionBanner extends StatelessWidget {
  const PromotionBanner({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.image,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Image image;

  @override
  Widget build(BuildContext context) {
    MondTextStyles _mondTextStyles = MondTextStyles(context: context);
    double bannerHeight = MediaQuery.of(context).size.height * 0.30;
    double bannerWidth = MediaQuery.of(context).size.width * 0.94;
    return Container(
      width: bannerWidth,
      height: bannerHeight,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: mondPriBlueOcean.withOpacity(0.5),
            blurRadius: 8.0,
            spreadRadius: 0.0,
            offset: Offset(2.0, 2.0), // shadow direction: bottom right
          )
        ],
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
            height: bannerHeight,
            width: bannerWidth * 0.6,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: image,
            ),
          ),
          Positioned(
            left: 0,
            child: Container(
              width: bannerWidth * 0.65,
              height: bannerHeight,
              padding: EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              decoration: BoxDecoration(
                color: mondPriBlueOcean,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(100.0),
                  topLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(100.0),
                  bottomLeft: Radius.circular(10.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: _mondTextStyles.whiteHeadline6Text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    subtitle,
                    style: _mondTextStyles.whiteBody2Text,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
