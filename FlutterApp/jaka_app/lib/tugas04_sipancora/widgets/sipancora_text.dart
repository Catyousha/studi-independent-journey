import 'package:flutter/material.dart';
import '../styles/colors.dart';
import '../styles/typos.dart';

class SipancoraText extends StatelessWidget {
  const SipancoraText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "SiPan",
        style: typosTextTitle(
          title: 3,
        ),
        children: <TextSpan>[
          TextSpan(
            text: "Cora",
            style: typosTextTitle(
              title: 3,
              color: colorPriBase,
            ),
          ),
        ],
      ),
    );
  }
}
