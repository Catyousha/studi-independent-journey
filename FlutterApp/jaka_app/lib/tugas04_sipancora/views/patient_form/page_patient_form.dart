import 'package:flutter/material.dart';
import 'section_patient_form.dart';
import '../../models/patient_model.dart';
import '../../models/patient_screen_arguments.dart';
import '../../widgets/page_container.dart';
import '../../widgets/sipancora_appbar.dart';

class PatientFormPage extends StatelessWidget {
  const PatientFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final PatientScreenArguments args;
    try {
      args =
          ModalRoute.of(context)!.settings.arguments as PatientScreenArguments;
    } catch (Exception) {
      Navigator.pop(context);
    }
    final Patient? patientData = args.patient;
    return Scaffold(
      appBar: SipancoraAppBar(
        leadingIcon: Icons.chevron_left,
        onPressLeadingIcon: () {
          Navigator.pop(context);
        },
      ),
      body: PageContainer(
        child: PatientFormSection(
          pageType: args.type,
          patientData: patientData,
        ),
      ),
    );
  }
}


