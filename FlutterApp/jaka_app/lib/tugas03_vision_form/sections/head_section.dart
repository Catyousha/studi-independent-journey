import 'package:flutter/material.dart';

class HeadSection extends StatelessWidget {
  const HeadSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Selamat Datang di SIPAIMON!",
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
          ),
          SizedBox(height: 8.0),
          Text(
            "Sistem Pendataan Pegawai Magang PT.Vision",
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Colors.white,
                ),
          ),
        ],
      ),
    );
  }
}
