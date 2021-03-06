import 'package:flutter/material.dart';
import '../models/patient_screen_arguments.dart';

import '../models/patient_model.dart';
import '../styles/colors.dart';
import '../styles/shadows.dart';
import '../styles/typos.dart';
import 'status_badge.dart';
import 'primary_button.dart';

class PatientLabelAction extends StatelessWidget {
  const PatientLabelAction({
    Key? key,
    required this.patientData,
  }) : super(key: key);

  final Patient patientData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: PrimaryButton(
            label: "Detail",
            onTapHandler: () {
              Navigator.pushNamed(
                context,
                '/detail',
                arguments: PatientScreenArguments(
                  type: PatientArgsType.detail,
                  patient: patientData,
                ),
              );
            },
          ),
        ),
        SizedBox(width: 7.0),
        PrimaryButton(
          label: "Edit",
          textColor: colorPriBase,
          backgroundColor: colorPriLightest,
          onTapHandler: () {
            Navigator.pushNamed(
              context,
              '/edit',
              arguments: PatientScreenArguments(
                type: PatientArgsType.edit,
                patient: patientData,
              ),
            );
          },
        )
      ],
    );
  }
}

class PatientLabelData extends StatelessWidget {
  const PatientLabelData({
    Key? key,
    required this.patientData,
  }) : super(key: key);

  final Patient patientData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CircleAvatar(
          radius: 20.0,
          backgroundImage: NetworkImage(patientData.avatarSrc!),
        ),
        SizedBox(width: 12.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                patientData.name!,
                style: typosTextRegular(
                  type: TyposType.regular,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Dirawat Sejak ${patientData.showPatientStartDate}",
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
  const PatientListTile({
    Key? key,
    required this.patientData,
  }) : super(key: key);

  final Patient patientData;

  @override
  Widget build(BuildContext context) {
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
          ),
          SizedBox(height: 22.0),
          PatientLabelAction(
            patientData: patientData,
          ),
        ],
      ),
    );
  }
}
