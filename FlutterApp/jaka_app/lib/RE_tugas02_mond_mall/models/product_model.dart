import 'package:flutter/material.dart';
import './category_list_model.dart';

enum ProductType {
  featured,
  bestSeller,
  topRated,
  specialOffer,
  newArrival,
}

class Product {
  String name;
  Image image;
  int price;
  List<ProductType> type;
  List<CategoryType> category;
  int? afterSalePrice;
  double avgRate;
  int totalReviews;
  Product({
    required this.name,
    required this.image,
    required this.price,
    required this.type,
    required this.category,
    this.afterSalePrice,
    required this.avgRate,
    required this.totalReviews,
  });
}
