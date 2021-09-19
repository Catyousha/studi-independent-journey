import 'package:flutter/material.dart';
import '../../../styles/colors.dart';
import '../../../styles/mond_text_styles.dart';

class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MondTextStyles _mondTextStyles = MondTextStyles(context: context);
    return TextField(
      style: _mondTextStyles.blueHeadline6Text,
      decoration: InputDecoration(
        label: Text(
          "Search Product Name",
          style: _mondTextStyles.halfGreyHeadline6Text,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: mondSecOffGrey,
        focusColor: mondSecOffGrey,
        filled: true,
        contentPadding: EdgeInsets.all(8.0),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        suffixIcon: Icon(
          Icons.search_outlined,
          color: mondSecHalfGrey,
        ),
      ),
    );
  }
}
