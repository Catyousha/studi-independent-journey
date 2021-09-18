import 'package:flutter/material.dart';
import '../models/pegawai.dart';
import './text_result.dart';

class DialogResult extends StatelessWidget {
  const DialogResult({
    Key? key,
    required this.pegawai,
  }) : super(key: key);

  final Pegawai pegawai;

  @override
  Widget build(BuildContext context) {
    String _keahlian = "";
    pegawai.keahlian.forEach((key, value) {
      if (value) {
        _keahlian += "$key, ";
      }
    });
    return SimpleDialog(
      contentPadding: EdgeInsets.all(18.0),
      title: Center(
        child: Text(
          "Data anda berhasil didaftarkan!",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      children: <Widget>[
        ResultText(
          label: "Nama Lengkap",
          value: pegawai.namaLengkap!,
        ),
        ResultText(
          label: "Asal Instansi Pendidikan",
          value: pegawai.asalInstansi!,
        ),
        ResultText(
          label: "Jenis Kelamin",
          value: pegawai.jenisKelamin!,
        ),
        ResultText(
          label: "Keahlian",
          value: _keahlian.substring(0, _keahlian.length - 2),
        ),
        ResultText(
          label: "Tanggal Lahir",
          value:
              "${pegawai.tglLahir!.day}/${pegawai.tglLahir!.month}/${pegawai.tglLahir!.year}",
        ),
      ],
    );
  }
}
