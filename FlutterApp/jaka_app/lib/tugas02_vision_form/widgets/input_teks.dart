import 'package:flutter/material.dart';

class InputTeks extends StatelessWidget {
  InputTeks({
    Key? key,
    required this.label,
    required this.onSavedHandler,
  }) : super(key: key);
  final String label;
  final void Function(String?) onSavedHandler;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Kolom ini wajib diisi!";
          }
        },
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w600,
          height: 1.5,
        ),
        decoration: InputDecoration(
          label: Text(
            "${this.label}",
          ),
          labelStyle: TextStyle(
            color: Colors.black38,
            fontWeight: FontWeight.w600,
            fontSize: 14.0,
          ),
          floatingLabelStyle: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w600,
            fontSize: 14.0,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10.0),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueGrey,
              width: 1.0,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
              width: 1.5,
            ),
          ),
        ),
        onSaved: (value) {
          onSavedHandler(value);
        },
      ),
    );
  }
}
