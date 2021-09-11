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
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Jenis Kelamin",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Row(
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
          ),
        ],
      ),
    );
  }
}
