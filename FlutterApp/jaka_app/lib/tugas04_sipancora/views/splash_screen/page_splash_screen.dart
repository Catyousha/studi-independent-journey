import 'dart:async';

import 'package:flutter/material.dart';
import '../../widgets/sipancora_text.dart';
import '../../styles/colors.dart';
import '../../styles/typos.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.pop(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: colorSkyWhite,
        padding: EdgeInsets.symmetric(vertical: 32),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SipancoraText(),
              Column(
                children: <Widget>[
                  Image.asset(
                    'assets/tugas04/sipancora_splash.png',
                    width: 266,
                    height: 266,
                    fit: BoxFit.scaleDown,
                  ),
                  SizedBox(height: 63),
                  Text(
                    "Selamat Datang di",
                    style: typosTextTitle(title: 3),
                  ),
                  SipancoraText(),
                  SizedBox(height: 32),
                  Text(
                    "Sistem Pendataan Pasien COVID-19 RS Terra",
                    style: typosTextRegular(type: TyposType.tiny),
                  ),
                ],
              ),
              Text(
                "© PT. Mencari Cinta Sejati",
                style: typosTextRegular(type: TyposType.tiny),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
