import 'package:flutter/material.dart';
import 'section_patient_form.dart';
import '../../models/patient_model.dart';
import '../../models/patient_screen_arguments.dart';
import '../../widgets/page_container.dart';
import '../../widgets/sipancora_appbar.dart';

class PatientFormPage extends StatefulWidget {
  const PatientFormPage({
    Key? key,
    this.modelModifier,
    this.modelModifierTwoParams,
  }) : super(key: key);

  final Function(dynamic)? modelModifier;
  final Function(dynamic, dynamic)? modelModifierTwoParams;

  @override
  State<PatientFormPage> createState() => _PatientFormPageState();
}

class _PatientFormPageState extends State<PatientFormPage> {
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
          modelModifier: widget.modelModifier,
          modelModifierTwoParams: widget.modelModifierTwoParams,
        ),
      ),
    );
  }
}
