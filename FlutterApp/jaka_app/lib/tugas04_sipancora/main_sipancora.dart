import 'package:flutter/material.dart';
import 'package:jaka_app/tugas04_sipancora/models/patient_list_model.dart';
import 'package:jaka_app/tugas04_sipancora/models/patient_model.dart';
import 'package:jaka_app/tugas04_sipancora/views/detail/page_patient_detail.dart';
import 'views/dashboard/page_dashboard.dart';

class SipancoraApp extends StatelessWidget {
  const SipancoraApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    PatientList _patientList = PatientList();
    return MaterialApp(
      title: "SIPANCORA | Sistem Pendataan Pasien COVID-19 RS Terra",
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => DashboardPage(
              patientList: _patientList,
            ),
        '/detail': (context) => PatientDetailPage(),
      },
    );
  }
}
