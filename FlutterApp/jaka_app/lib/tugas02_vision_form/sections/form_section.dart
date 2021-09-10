import 'package:flutter/material.dart';
import 'package:jaka_app/tugas02_vision_form/models/pegawai.dart';
import 'package:jaka_app/tugas02_vision_form/widgets/input_teks.dart';
import 'package:jaka_app/tugas02_vision_form/widgets/input_radio.dart';

class FormSection extends StatefulWidget {
  const FormSection({Key? key}) : super(key: key);

  @override
  State<FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends State<FormSection> {
  final _formKey = GlobalKey<FormState>();

  Pegawai _pegawai = Pegawai();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(36.0),
          topRight: Radius.circular(36.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8.0,
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InputTeks(
              label: 'Nama Lengkap',
              onSavedHandler: (val) {
                _pegawai.namaLengkap = val;
              },
            ),
            InputTeks(
              label: 'Asal Instansi Pendidikan',
              onSavedHandler: (val) {
                _pegawai.asalInstansi = val;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputRadio(
                  label: "Laki-Laki",
                  setGroupValue: _pegawai.jenisKelamin,
                  onChangedHandler: (String? val) {
                    setState(() {
                      _pegawai.jenisKelamin = val;
                    });
                  },
                ),
                InputRadio(
                  label: "Perempuan",
                  setGroupValue: _pegawai.jenisKelamin,
                  onChangedHandler: (String? val) {
                    setState(() {
                      _pegawai.jenisKelamin = val;
                    });
                  },
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${_pegawai.jenisKelamin}')));
                  }
                },
                child: Text('Submit'))
          ],
        ),
      ),
    );
  }
}
