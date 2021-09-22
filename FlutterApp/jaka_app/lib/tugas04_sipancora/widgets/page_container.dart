import 'package:flutter/material.dart';
import '../styles/colors.dart';

class PageContainer extends StatelessWidget {
  const PageContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 22.0,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: colorSkyLightest,
        ),
        child: child,
      ),
    );
  }
}
