import 'package:flutter/material.dart';

class InputCheckBox extends StatelessWidget {
  const InputCheckBox({
    Key? key,
    required this.label,
    required this.valueMap,
    required this.onChangedHandler,
  }) : super(key: key);
  final String label;
  final Map<String, bool> valueMap;
  final void Function(String, bool?) onChangedHandler;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(
        '$label',
        style: Theme.of(context).textTheme.bodyText1,
      ),
      value: valueMap[label],
      onChanged: (val) {
        onChangedHandler(label, val);
      },
    );
  }
}
