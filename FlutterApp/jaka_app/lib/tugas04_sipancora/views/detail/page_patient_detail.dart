import 'package:flutter/material.dart';
import '../../widgets/page_container.dart';
import '../../models/patient_screen_arguments.dart';
import '../../widgets/description_tile.dart';
import '../../widgets/status_badge.dart';
import '../../models/patient_model.dart';
import '../../styles/colors.dart';
import '../../styles/typos.dart';
import '../../widgets/sipancora_appbar.dart';

class PatientDetailPage extends StatelessWidget {
  const PatientDetailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final PatientScreenArguments args;
    try {
      args =
          ModalRoute.of(context)!.settings.arguments as PatientScreenArguments;
    } catch (Exception) {
      Navigator.pop(context);
    }

    final Patient patientData = args.patient!;

    return Scaffold(
      appBar: SipancoraAppBar(
        leadingIcon: Icons.chevron_left,
        onPressLeadingIcon: () {
          Navigator.pop(context);
        },
      ),
      body: PageContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Detail Pasien",
              style: typosTextTitle(title: 3),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 22.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(patientData.avatarSrc!),
                      radius: 22.0,
                    ),
                    SizedBox(height: 22.0),
                    StatusBadge(
                      label: patientData.showPatientStatus,
                      backgroundColor: patientData.showPatientStatusColor[1],
                      textColor: patientData.showPatientStatusColor[0],
                    ),
                  ],
                ),
              ),
            ),
            DescriptionTile(
              title: "Nama",
              text: "${patientData.name}",
            ),
            DescriptionTile(
              title: "Jenis Kelamin",
              text: "${patientData.showPatientGender}",
            ),
            DescriptionTile(
              title: "Usia",
              text: "${patientData.age} Tahun",
            ),
            SizedBox(height: 32.0),
            Text(
              "INFORMASI RAWAT INAP",
              style: typosTextRegular(
                type: TyposType.tiny,
                color: colorInkLight,
              ),
            ),
            SizedBox(height: 12.0),
            DescriptionTile(
              title: "Tanggal Mulai",
              text: "${patientData.showPatientStartDate}",
            ),
            DescriptionTile(
              title: "Tanggal Selesai",
              text: "${patientData.showPatientEndDate}",
            ),
            DescriptionTile(
              title: "Nomor Kamar",
              text: "${patientData.room}",
            ),
          ],
        ),
      ),
    );
  }
}
