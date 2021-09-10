import 'package:flutter/material.dart';

class InputRadio extends StatelessWidget {
  const InputRadio({
    Key? key,
    required this.label,
    required this.setGroupValue,
    required this.onChangedHandler,
  }) : super(key: key);
  final String label;
  final String? setGroupValue;
  final void Function(String?) onChangedHandler;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListTile(
        title: Text("$label"),
        leading: Radio(
          value: "$label",
          groupValue: setGroupValue,
          onChanged: (String? val) {
            onChangedHandler(val);
          },
        ),
      ),
    );
  }
}
