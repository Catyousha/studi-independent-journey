import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import '../../models/patient_screen_arguments.dart';
import '../../widgets/page_container.dart';
import '../../widgets/patient_list_tile.dart';
import '../../widgets/primary_button.dart';
import '../../models/patient_list_model.dart';
import '../../styles/typos.dart';
import '../../widgets/patient_stats.dart';
import '../../widgets/sipancora_text.dart';
import '../../widgets/sipancora_appbar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key, required this.patientList}) : super(key: key);

  final PatientList patientList;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      Navigator.of(context).pushNamed("/splash");
    });
    super.initState();
  }

  List<Widget> _buildPatientList() {
    List<Widget> __patientListTiles = [];
    widget.patientList.getPatientList.forEach((element) {
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
        onPressLeadingIcon: () {
          SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
        },
      ),
      body: PageContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Dashboard",
              style: typosTextTitle(title: 3),
            ),
            SizedBox(height: 16.0),
            PatientStats(
              patientList: widget.patientList,
            ),
            SizedBox(height: 18.0),
            Center(
              child: PrimaryButton(
                label: "+ Tambah Pasien",
                onTapHandler: () => {
                  Navigator.pushNamed(
                    context,
                    '/add',
                    arguments: PatientScreenArguments(
                      type: PatientArgsType.add,
                    ),
                  ),
                },
              ),
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
