import 'package:flutter/material.dart';
import 'models/patient_list_model.dart';
import 'views/detail/page_patient_detail.dart';
import 'views/patient_form/page_patient_form.dart';
import 'views/dashboard/page_dashboard.dart';

class SipancoraApp extends StatefulWidget {
  const SipancoraApp({Key? key}) : super(key: key);

  @override
  State<SipancoraApp> createState() => _SipancoraAppState();
}

class _SipancoraAppState extends State<SipancoraApp> {
  PatientList _patientList = PatientList();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SIPANCORA | Sistem Pendataan Pasien COVID-19 RS Terra",
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => DashboardPage(
              patientList: _patientList,
            ),
        '/detail': (context) => PatientDetailPage(),
        '/add': (context) => PatientFormPage(
              modelModifier: (newPatient) {
                setState(() {
                  this._patientList = this._patientList.addPatient(newPatient);
                });
              },
            ),
        '/edit': (context) => PatientFormPage(
              modelModifierTwoParams: (id, newPatient) {
                setState(() {
                  this._patientList = this._patientList.editPatient(id, newPatient);
                });
              },
            ),
      },
    );
  }
}
