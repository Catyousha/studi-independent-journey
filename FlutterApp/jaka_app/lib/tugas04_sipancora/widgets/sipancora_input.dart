import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../styles/colors.dart';
import '../styles/typos.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    required this.label,
    this.initialValue,
    this.numberInput = false,
    this.inputFormatters,
    this.isRequired = true,
  }) : super(key: key);

  final String label;
  final String? initialValue;
  final bool numberInput;
  final List<TextInputFormatter>? inputFormatters;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${label}",
          style: typosTextMedium(type: TyposType.regular),
        ),
        SizedBox(height: 12.0),
        TextFormField(
          inputFormatters: inputFormatters,
          keyboardType:
              (numberInput) ? TextInputType.number : TextInputType.text,
          initialValue: initialValue,
          style: typosTextRegular(
            type: TyposType.regular,
            color: colorInkLighter,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: colorSkyWhite,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: colorSkyLight,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: colorSkyLight,
                width: 1.0,
              ),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: "Masukkan ${label.toLowerCase()}...",
            contentPadding: EdgeInsets.all(16.0),
          ),
          validator: (value) {
            if ((value == null || value.isEmpty) && isRequired) {
              return 'Kolom ini wajib diisi!';
            }
            return null;
          },
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class RadioInput extends StatelessWidget {
  const RadioInput({
    Key? key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.valueSetter,
  }) : super(key: key);

  final Widget title;
  final dynamic value;
  final dynamic groupValue;
  final Function(dynamic) valueSetter;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      children: [
        Radio(
          activeColor: colorPriBase,
          value: value,
          groupValue: groupValue,
          onChanged: (dynamic val) {
            valueSetter(val);
          },
        ),
        GestureDetector(
          onTap: () => valueSetter(value),
          child: title,
        )
      ],
    );
  }
}
