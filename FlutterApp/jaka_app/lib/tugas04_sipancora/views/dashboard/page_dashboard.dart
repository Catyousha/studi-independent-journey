import 'package:flutter/material.dart';
import '../../widgets/patient_list_tile.dart';
import '../../widgets/primary_nav_button.dart';
import '../../models/patient_list_model.dart';
import '../../styles/colors.dart';
import '../../styles/typos.dart';
import '../../widgets/patient_stats.dart';
import '../../widgets/sipancora_text.dart';
import '../../widgets/sipancora_appbar.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key, required this.patientList}) : super(key: key);

  final PatientList patientList;

  List<Widget> _buildPatientList() {
    List<Widget> __patientListTiles = [];
    patientList.getPatientList.forEach((element) {
      __patientListTiles.addAll([
        PatientListTile(
          patientData: element,
        ),
        SizedBox(height: 6.0),
      ]);
    });
    return __patientListTiles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SipancoraAppBar(
        title: SipancoraText(),
        leadingIcon: Icons.logout,
        onPressLeadingIcon: () {},
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 22.0,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: colorSkyLightest,
        ),
        child: ListView(
          children: <Widget>[
            Text(
              "Dashboard",
              style: typosTextTitle(title: 3),
            ),
            SizedBox(height: 16.0),
            PatientStats(
              patientList: patientList,
            ),
            SizedBox(height: 18.0),
            PrimaryNavButton(
              label: "+ Tambah Pasien",
              onTapHandler: () => {},
            ),
            SizedBox(height: 21.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildPatientList(),
            )
          ],
        ),
      ),
    );
  }
}
