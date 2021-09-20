import 'package:flutter/material.dart';

class Category {
  String name;
  IconData? icon;
  Color? boxColor;
  Color? iconColor;

  Category({
    required this.name,
    required this.icon,
    this.boxColor,
    this.iconColor,
  });
}