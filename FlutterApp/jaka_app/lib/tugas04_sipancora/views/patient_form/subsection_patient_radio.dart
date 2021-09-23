import 'package:flutter/material.dart';
import '../../styles/typos.dart';
import '../../widgets/sipancora_input.dart' as sipancoraInput;

class PatientRadioSubsection extends StatelessWidget {
  const PatientRadioSubsection({
    Key? key,
    required this.label,
    required this.groupValue,
    required this.radioChoices,
    required this.valueSetter,
  }) : super(key: key);

  final String label;
  final dynamic groupValue;
  final Map<dynamic, dynamic> radioChoices;
  final Function(dynamic) valueSetter;

  List<Widget> _buildRadioChoices() {
    List<Widget> widgets = [];
    radioChoices.forEach((choice, titleWidget) {
      widgets.addAll([
        sipancoraInput.RadioInput(
          title: titleWidget,
          groupValue: groupValue,
          value: choice,
          valueSetter: (val) {
            valueSetter(val);
          },
        ),
      ]);
    });
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "$label",
          style: typosTextMedium(type: TyposType.regular),
        ),
        SizedBox(height: 12.0),
        Wrap(
          spacing: 15.0,
          children: _buildRadioChoices(),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
