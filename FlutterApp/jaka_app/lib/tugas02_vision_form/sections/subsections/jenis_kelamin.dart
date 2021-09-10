import 'package:flutter/material.dart';
import 'package:jaka_app/tugas02_vision_form/widgets/input_radio.dart';

class JenisKelaminSubSection extends StatelessWidget {
  const JenisKelaminSubSection(
      {Key? key,
      required this.jenisKelaminPegawai,
      required this.jenisKelaminSetter})
      : super(key: key);
  final void Function(String?) jenisKelaminSetter;
  final String? jenisKelaminPegawai;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InputRadio(
          label: "Laki-Laki",
          setGroupValue: jenisKelaminPegawai,
          onChangedHandler: (String? val) {
            jenisKelaminSetter(val);
          },
        ),
        InputRadio(
          label: "Perempuan",
          setGroupValue: jenisKelaminPegawai,
          onChangedHandler: (String? val) {
            jenisKelaminSetter(val);
          },
        ),
      ],
    );
  }
}
