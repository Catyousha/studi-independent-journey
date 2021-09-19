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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      height: screenHeight / 3,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            height: screenHeight / 3,
            width: screenWidth * 0.6,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: image,
            ),
          ),
          Positioned(
            left: 0,
            child: Container(
              width: screenWidth * 0.55,
              height: screenHeight / 3,
              padding: EdgeInsets.symmetric(
                vertical: 30.0,
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
