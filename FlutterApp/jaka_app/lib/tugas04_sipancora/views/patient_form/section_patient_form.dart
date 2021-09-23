import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jaka_app/tugas04_sipancora/views/patient_form/subsection_patient_radio.dart';
import 'package:jaka_app/tugas04_sipancora/widgets/status_badge.dart';
import '../../models/patient_model.dart';
import '../../models/patient_screen_arguments.dart';
import '../../styles/colors.dart';
import '../../styles/typos.dart';
import '../../widgets/sipancora_input.dart' as sipancoraInput;

class PatientFormSection extends StatefulWidget {
  const PatientFormSection({
    Key? key,
    required this.pageType,
    required this.patientData,
  }) : super(key: key);

  final PatientArgsType pageType;
  final Patient? patientData;

  @override
  State<PatientFormSection> createState() => _PatientFormSectionState();
}

class _PatientFormSectionState extends State<PatientFormSection> {
  final _formKey = GlobalKey<FormState>();
  Patient? _newPatient;

  @override
  void initState() {
    _newPatient = widget.patientData ?? Patient();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "${(widget.pageType == PatientArgsType.add) ? 'Tambah Pasien' : 'Edit Pasien'}",
            style: typosTextTitle(title: 3),
          ),
          SizedBox(height: 25.0),
          Center(
            child: CircleAvatar(
              backgroundImage:
                  NetworkImage(widget.patientData?.avatarSrc ?? ''),
              backgroundColor: colorSkyLight,
              radius: 64.0,
            ),
          ),
          SizedBox(height: 50.0),
          sipancoraInput.TextInput(
            label: 'Nama Pasien',
            initialValue: _newPatient?.name,
          ),
          PatientRadioSubsection(
            label: "Jenis Kelamin",
            groupValue: _newPatient!.gender,
            radioChoices: <PatientGender, Widget>{
              PatientGender.male: Text(
                'Pria',
                style: typosTextMedium(type: TyposType.regular),
              ),
              PatientGender.female: Text(
                'Wanita',
                style: typosTextMedium(type: TyposType.regular),
              ),
            },
            valueSetter: (val) {
              setState(() {
                _newPatient!.gender = val;
              });
            },
          ),
          sipancoraInput.TextInput(
            label: 'Usia Pasien',
            initialValue: _newPatient?.age?.toString() ?? '',
            numberInput: true,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          PatientRadioSubsection(
            label: "Status Pasien",
            groupValue: _newPatient!.status,
            radioChoices: <PatientStatus, Widget>{
              PatientStatus.treated: StatusBadge(
                label: "Dirawat",
                backgroundColor: colorBlueLightest,
                textColor: colorBlueBase,
              ),
              PatientStatus.recovered: StatusBadge(
                label: "Sembuh",
                backgroundColor: colorGreenLightest,
                textColor: colorGreenBase,
              ),
              PatientStatus.died: StatusBadge(
                label: "Meninggal",
                backgroundColor: colorRedLightest,
                textColor: colorRedBase,
              ),
            },
            valueSetter: (val) {
              setState(() {
                _newPatient!.status = val;
              });
            },
          ),
          sipancoraInput.TextInput(
            label: 'Nomor Kamar',
            initialValue: _newPatient?.room?.toString() ?? '',
            numberInput: true,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ],
      ),
    );
  }
}
