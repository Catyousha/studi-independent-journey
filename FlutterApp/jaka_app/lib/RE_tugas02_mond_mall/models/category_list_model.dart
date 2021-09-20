import 'package:flutter/material.dart';
import '../styles/colors.dart';
import './category_model.dart';

enum CategoryType {
  foods,
  gift,
  fashion,
  gadget,
  computer,
  souvenir,
}

class CategoryList {
  Map<CategoryType, Category> _categoryTypes = {
    CategoryType.foods: Category(
      iconColor: mondSecEarthGreen,
      boxColor: mondLabOffGreen,
      icon: Icons.fastfood_outlined,
      name: "Foods",
    ),
    CategoryType.gift: Category(
      iconColor: mondSecRedVelvet,
      boxColor: mondLabOffRed,
      icon: Icons.card_giftcard_outlined,
      name: "Gift",
    ),
    CategoryType.fashion: Category(
      iconColor: mondPriOrangeFresh,
      boxColor: mondSecLightYellow,
      icon: Icons.checkroom_outlined,
      name: "Fashion",
    ),
    CategoryType.gadget: Category(
      iconColor: mondPriBlueOcean,
      boxColor: mondLabOffBlue,
      icon: Icons.devices_other_outlined,
      name: "Gadget",
    ),
    CategoryType.computer: Category(
      iconColor: mondSecEarthGreen,
      boxColor: mondLabOffGreen,
      icon: Icons.computer_outlined,
      name: "Computer",
    ),
    CategoryType.souvenir: Category(
      iconColor: mondSecRedVelvet,
      boxColor: mondLabOffRed,
      icon: Icons.auto_awesome_outlined,
      name: "Souvenir",
    ),
  };

  List<Category> get getList {
    List<Category> _categoryList = [];
    _categoryTypes.forEach((key, value) {
      _categoryList.add(value);
    });
    return _categoryList;
  }
}
