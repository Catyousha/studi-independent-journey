import 'package:flutter/material.dart';
import '../styles/mond_text_styles.dart';

class ProductBanner extends StatelessWidget {
  const ProductBanner({
    Key? key,
    required this.title,
    this.subtitle = "Shop now",
    required this.color,
    required this.image,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Color color;
  final Image image;

  @override
  Widget build(BuildContext context) {
    double gap = 10.0;
    MondTextStyles _mondTextStyles = MondTextStyles(context: context);
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12.5,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: _mondTextStyles.whiteHeadline3Text,
                ),
                SizedBox(height: gap),
                Row(
                  children: [
                    Text(
                      subtitle,
                      style: _mondTextStyles.whiteHeadline6Text,
                    ),
                    SizedBox(width: gap),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: gap),
          Flexible(
            flex: 1,
            child: image,
          ),
        ],
      ),
    );
  }
}
