import 'package:flutter/material.dart';
import './mond_intro_main_body.dart';
import './mond_product_main_body.dart';

class MondMainBody extends StatelessWidget {
  const MondMainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: ListView(
        children: [
          MondIntroMainBody(gapY: 16.0),
          MondProductMainBody(gapY: 28.0),
        ],
      ),
    );
  }
}
