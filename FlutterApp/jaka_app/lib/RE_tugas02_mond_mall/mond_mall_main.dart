import 'package:flutter/material.dart';
import 'styles/mond_theme.dart';
import 'views/main_page/mond_main_page.dart';

class MondMallApp extends StatelessWidget {
  const MondMallApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mond Mall | Online Mall No. 1 Di Teyvat',
      theme: mondTheme,
      home: MondMainPage(),
    );
  }
}
