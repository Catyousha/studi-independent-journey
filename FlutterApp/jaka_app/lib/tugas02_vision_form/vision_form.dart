import 'package:flutter/material.dart';
import 'package:jaka_app/tugas02_vision_form/styles/text_style.dart';
import 'package:jaka_app/tugas02_vision_form/sections/head_section.dart';
import 'package:jaka_app/tugas02_vision_form/sections/form_section.dart';

class VisionForm extends StatelessWidget {
  final ThemeData base = ThemeData.light();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Rubik',
        textTheme: textThemeData(base.textTheme),
      ),
      title: 'SIPAIMON | Sistem Pendataan Pegawai Magang PT.Vision',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://static.wikia.nocookie.net/gensin-impact/images/9/9c/Icon_Paimon_Menu.png"),
              backgroundColor: Colors.white,
              radius: 15.0,
            ),
            SizedBox(width: 10.0),
            Text(
              'SIPAIMON | Home',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
        elevation: 3.0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff4A79CE),
              Color(0xff4D7BD0),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          children: <Widget>[
            HeadSection(),
            FormSection(),
          ],
        ),
      ),
    );
  }
}
