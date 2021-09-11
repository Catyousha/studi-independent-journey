import 'package:flutter/material.dart';
import 'package:jaka_app/tugas02_vision_form/models/pegawai.dart';
import 'package:jaka_app/tugas02_vision_form/sections/subsections/jenis_kelamin.dart';
import 'package:jaka_app/tugas02_vision_form/sections/subsections/keahlian.dart';
import 'package:jaka_app/tugas02_vision_form/widgets/input_teks.dart';

class FormSection extends StatefulWidget {
  const FormSection({Key? key}) : super(key: key);

  @override
  State<FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends State<FormSection> {
  final _formKey = GlobalKey<FormState>();

  Pegawai _pegawai = Pegawai();
  bool _keahlianValid = true;

  void _validateKeahlianCheckbox() {
    
  }
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
            JenisKelaminSubSection(
              jenisKelaminPegawai: _pegawai.jenisKelamin,
              jenisKelaminSetter: (val) {
                setState(() {
                  _pegawai.jenisKelamin = val;
                });
              },
            ),
            KeahlianSubSection(
              keahlianMap: _pegawai.keahlian,
              onKeahlianChangedHandler: (key, val) {
                setState(() {
                  _pegawai.keahlian[key] = val!;
                });
              },
              isValid: _keahlianValid,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (!_pegawai.keahlian.containsValue(true)) {
                      setState(() {
                        _keahlianValid = false;
                      });
                      return;
                    } else {
                      setState(() {
                        _keahlianValid = true;
                      });
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${_pegawai.keahlian}')));
                  }
                },
                child: Text('Submit'))
          ],
        ),
      ),
    );
  }
}
