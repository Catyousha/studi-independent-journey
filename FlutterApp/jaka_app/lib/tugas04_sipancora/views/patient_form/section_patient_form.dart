import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/patient_model.dart';
import '../../models/patient_screen_arguments.dart';
import '../../styles/colors.dart';
import '../../styles/typos.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/sipancora_input.dart' as sipancoraInput;
import '../../widgets/status_badge.dart';
import 'subsection_patient_radio.dart';

class PatientFormSection extends StatefulWidget {
  const PatientFormSection({
    Key? key,
    required this.pageType,
    required this.patientData,
    this.modelModifier,
    this.modelModifierTwoParams,
  }) : super(key: key);

  final PatientArgsType pageType;
  final Function(dynamic)? modelModifier;
  final Function(dynamic, dynamic)? modelModifierTwoParams;
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
              backgroundImage: NetworkImage(widget.patientData?.avatarSrc ??
                  'https://source.unsplash.com/xz485Eku8O4'),
              backgroundColor: colorSkyLight,
              radius: 64.0,
            ),
          ),
          SizedBox(height: 50.0),
          sipancoraInput.TextInput(
            label: 'Nama Pasien',
            initialValue: _newPatient?.name,
            valueSetter: (String? val) {
              setState(() {
                _newPatient?.name = val;
              });
            },
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
            valueSetter: (String? val) {
              setState(() {
                _newPatient?.age = int.tryParse(val ?? '');
              });
            },
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
            valueSetter: (String? val) {
              setState(() {
                _newPatient?.room = int.tryParse(val ?? '');
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              sipancoraInput.DateInput(
                label: 'Tanggal Mulai Dirawat',
                initialDate: _newPatient?.dateTreatedStart,
                dateText: _newPatient?.showPatientStartDate,
                valueSetter: (val) {
                  setState(() {
                    _newPatient?.dateTreatedStart = val;
                  });
                },
              ),
              if (widget.pageType == PatientArgsType.edit)
                sipancoraInput.DateInput(
                  label: 'Tanggal Selesai Dirawat',
                  initialDate: _newPatient?.dateTreatedEnd,
                  dateText: _newPatient?.showPatientEndDate,
                  valueSetter: (val) {
                    setState(() {
                      _newPatient?.dateTreatedEnd = val;
                    });
                  },
                ),
            ],
          ),
          SizedBox(height: 30),
          Center(
            child: PrimaryButton(
              label: 'Submit',
              onTapHandler: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  if (widget.pageType == PatientArgsType.add) {
                    _newPatient!.avatarSrc =
                        "https://picsum.photos/seed/${_newPatient!.name}/200/300";
                    _newPatient!.id = Random().nextInt(10001);
                    widget.modelModifier!(_newPatient);
                  } else if (widget.pageType == PatientArgsType.edit) {
                    widget.modelModifierTwoParams!(
                      _newPatient!.id,
                      _newPatient,
                    );
                  }
                  Navigator.pop(context);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
