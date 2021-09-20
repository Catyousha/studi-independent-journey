import 'package:flutter/material.dart';
import '../../../models/category_model.dart';
import '../../../models/category_list_model.dart';
import '../../../widgets/head_section_text.dart';
import '../../../widgets/carousel_scroller.dart';
import '../../../widgets/categories_item.dart';

class CategoriesCarousel extends StatelessWidget {
  const CategoriesCarousel({Key? key}) : super(key: key);
  final double gapYHeadToItems = 16.0;
  final double gapXItems = 32.0;

  List<Widget> _buildCategoryItems() {
    List<Widget> __categoryItems = [];
    List<Category> __categoryList = CategoryList().getList;
    for (Category category in __categoryList) {
      __categoryItems.addAll(
        [
          CategoryItem(
            iconColor: category.iconColor ?? Colors.blue,
            boxColor: category.boxColor ?? Colors.lightBlue,
            icon: category.icon ?? Icons.widgets_outlined,
            name: category.name,
          ),
          SizedBox(width: gapXItems),
        ],
      );
    }
    return __categoryItems;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        HeadSectionText(
          sectionName: "Categories",
        ),
        SizedBox(height: gapYHeadToItems),
        CarouselScroller(
          child: Row(
            children: _buildCategoryItems(),
          ),
        ),
      ],
    );
  }
}
