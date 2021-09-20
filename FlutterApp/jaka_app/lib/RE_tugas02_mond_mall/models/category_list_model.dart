import 'package:flutter/material.dart';
import '../styles/colors.dart';
import './category_model.dart';

class CategoryList {
  List<Category> _categoryList = [
    Category(
      iconColor: mondSecEarthGreen,
      boxColor: mondLabOffGreen,
      icon: Icons.fastfood_outlined,
      name: "Foods",
    ),
    Category(
      iconColor: mondSecRedVelvet,
      boxColor: mondLabOffRed,
      icon: Icons.card_giftcard_outlined,
      name: "Gift",
    ),
    Category(
      iconColor: mondPriOrangeFresh,
      boxColor: mondSecLightYellow,
      icon: Icons.checkroom_outlined,
      name: "Fashion",
    ),
    Category(
      iconColor: mondPriBlueOcean,
      boxColor: mondLabOffBlue,
      icon: Icons.devices_other_outlined,
      name: "Gadget",
    ),
    Category(
      iconColor: mondSecEarthGreen,
      boxColor: mondLabOffGreen,
      icon: Icons.computer_outlined,
      name: "Computer",
    ),
    Category(
      iconColor: mondSecRedVelvet,
      boxColor: mondLabOffRed,
      icon: Icons.auto_awesome_outlined,
      name: "Souvenir",
    ),
  ];

  List<Category> get getList {
    return [..._categoryList];
  }
}
