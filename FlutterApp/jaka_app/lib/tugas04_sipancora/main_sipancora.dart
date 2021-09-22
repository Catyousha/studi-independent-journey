import 'package:flutter/material.dart';
import './views/page_dashboard.dart';

class SipancoraApp extends StatelessWidget {
  const SipancoraApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SIPANCORA | Sistem Pendataan Pasien COVID-19 RS Terra",
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => DashboardPage(),
      },
    );
  }
}
