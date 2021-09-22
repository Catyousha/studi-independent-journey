import 'package:flutter/material.dart';

import '../models/patient_model.dart';
import '../styles/colors.dart';
import '../styles/shadows.dart';
import '../styles/typos.dart';
import 'status_badge.dart';
import 'primary_nav_button.dart';

class PatientLabelAction extends StatelessWidget {
  const PatientLabelAction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: PrimaryNavButton(
            label: "Detail",
            onTapHandler: () {},
          ),
        ),
        SizedBox(width: 7.0),
        PrimaryNavButton(
          label: "Edit",
          onTapHandler: () {},
          textColor: colorPriBase,
          backgroundColor: colorPriLightest,
        )
      ],
    );
  }
}

class PatientLabelData extends StatelessWidget {
  final Patient patientData;

  final DateTime dateTreated;
  const PatientLabelData({
    Key? key,
    required this.patientData,
    required this.dateTreated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CircleAvatar(
          radius: 20.0,
          backgroundImage: NetworkImage(patientData.avatarSrc),
        ),
        SizedBox(width: 12.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                patientData.name,
                style: typosTextRegular(
                  type: TyposType.regular,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Dirawat Sejak ${dateTreated.day}/${dateTreated.month}/${dateTreated.year}",
                style: typosTextRegular(
                  type: TyposType.small,
                  color: colorInkLighter,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 9.0),
        StatusBadge(
          label: patientData.showPatientStatus,
          backgroundColor: patientData.showPatientStatusColor[1],
          textColor: patientData.showPatientStatusColor[0],
        )
      ],
    );
  }
}

class PatientListTile extends StatelessWidget {
  final Patient patientData;

  const PatientListTile({
    Key? key,
    required this.patientData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime dateTreated = patientData.dateTreatedStart;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 18.0,
      ),
      decoration: BoxDecoration(
        color: colorSkyWhite,
        boxShadow: shadowSmall,
      ),
      child: Column(
        children: [
          PatientLabelData(
            patientData: patientData,
            dateTreated: dateTreated,
          ),
          SizedBox(height: 22.0),
          PatientLabelAction(),
        ],
      ),
    );
  }
}
