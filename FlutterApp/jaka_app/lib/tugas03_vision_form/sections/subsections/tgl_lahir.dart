import 'package:flutter/material.dart';

class TanggalLahirSubSection extends StatelessWidget {
  const TanggalLahirSubSection({
    Key? key,
    required this.tglLahir,
    required this.onSelectedHandler,
  }) : super(key: key);

  final DateTime tglLahir;
  final Function(DateTime?) onSelectedHandler;

  void _selectTglLahir(BuildContext context) async {
    DateTime __initialDate = tglLahir;
    
    final DateTime? newTglLahir = await showDatePicker(
      context: context,
      initialDate: __initialDate,
      firstDate: DateTime(1945),
      lastDate: DateTime(2022),
    );
    if (newTglLahir != null) {
      onSelectedHandler(newTglLahir);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Tanggal Lahir",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          SizedBox(height: 8.0),
          ListTile(
            dense: true,
            leading: IconButton(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(0),
              onPressed: () {
                _selectTglLahir(context);
              },
              icon: Icon(Icons.edit),
            ),
            title: Text(
              "${tglLahir.day}/${tglLahir.month}/${tglLahir.year}",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 16.0,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
