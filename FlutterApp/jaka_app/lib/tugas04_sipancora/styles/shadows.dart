import 'package:flutter/material.dart';

List<BoxShadow> get shadowSmall {
  return [
    BoxShadow(
      color: Color(0xFF141414).withOpacity(0.04),
      blurRadius: 1,
    ),
    BoxShadow(
      color: Color(0xFF141414).withOpacity(0.08),
      blurRadius: 8,
    ),
  ];
}
