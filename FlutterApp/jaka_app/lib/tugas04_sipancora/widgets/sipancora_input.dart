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
    required this.valueSetter,
  }) : super(key: key);

  final String label;
  final String? initialValue;
  final bool numberInput;
  final List<TextInputFormatter>? inputFormatters;
  final bool isRequired;
  final Function(String?) valueSetter;

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
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: colorSkyLight,
                width: 1.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
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
          onSaved: (String? value) {
            valueSetter(value);
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

class DateInput extends StatelessWidget {
  const DateInput({
    Key? key,
    required this.label,
    required this.dateText,
    this.initialDate,
    required this.valueSetter,
  }) : super(key: key);

  final String label;
  final String? dateText;
  final DateTime? initialDate;
  final Function(dynamic) valueSetter;

  void _selectDate(BuildContext context) async {
    DateTime? __initialDate = initialDate ?? DateTime.now();
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: __initialDate,
      firstDate: DateTime(1945),
      lastDate: DateTime(2022),
    );
    if (newDate != null) {
      valueSetter(newDate);
    }
  }

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
        GestureDetector(
          onTap: () => _selectDate(context),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 16.0,
            ),
            decoration: BoxDecoration(
              color: colorSkyWhite,
              border: Border.all(
                color: colorSkyLight,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  color: colorInkLighter,
                ),
                SizedBox(width: 8.0),
                Text(
                  '$dateText',
                  style: typosTextRegular(
                    type: TyposType.tiny,
                    color: colorInkLighter,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
