import 'package:flutter/material.dart';
import 'package:jaka_app/tugas04_sipancora/models/patient_model.dart';
import 'package:jaka_app/tugas04_sipancora/styles/shadows.dart';
import '../styles/colors.dart';
import '../styles/typos.dart';
import '../models/patient_list_model.dart';

class PatientStats extends StatelessWidget {
  const PatientStats({
    Key? key,
    required this.patientList,
  }) : super(key: key);

  final PatientList patientList;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 19.0,
          vertical: 10.0,
        ),
        decoration: BoxDecoration(
          color: colorSkyWhite,
          borderRadius: BorderRadius.circular(10),
          boxShadow: shadowSmall,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Statistik Pasien",
              style: typosTextBold(
                type: TyposType.tiny,
              ),
            ),
            SizedBox(height: 6.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                PatientStatsNumber(
                  count: patientList
                      .getPatientByStatus(PatientStatus.treated)
                      .length,
                  label: "Dirawat",
                  color: colorBlueBase,
                ),
                PatientStatsNumber(
                  count: patientList
                      .getPatientByStatus(PatientStatus.recovered)
                      .length,
                  label: "Sembuh",
                  color: colorGreenBase,
                ),
                PatientStatsNumber(
                  count:
                      patientList.getPatientByStatus(PatientStatus.died).length,
                  label: "Meninggal",
                  color: colorRedBase,
                ),
              ],
            )
          ],
        ));
  }
}

class PatientStatsNumber extends StatelessWidget {
  const PatientStatsNumber({
    Key? key,
    required this.count,
    required this.label,
    this.gap = 7.0,
    this.color = Colors.black,
  }) : super(key: key);

  final int count;
  final Color color;
  final String label;
  final double gap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "${count}",
          style: typosTextTitle(
            title: 2,
            color: color,
          ),
        ),
        SizedBox(height: gap),
        Text(
          "$label",
          style: typosTextBold(
            type: TyposType.tiny,
            color: color,
          ),
        )
      ],
    );
  }
}
