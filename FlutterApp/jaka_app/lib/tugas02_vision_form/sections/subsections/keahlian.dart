import 'package:flutter/material.dart';
import 'package:jaka_app/tugas02_vision_form/widgets/input_checkbox.dart';

class KeahlianSubSection extends StatelessWidget {
  const KeahlianSubSection({
    Key? key,
    required this.keahlianMap,
    required this.onKeahlianChangedHandler,
    required this.isValid,
  }) : super(key: key);
  final Map<String, bool> keahlianMap;
  final void Function(String, bool?) onKeahlianChangedHandler;
  final bool isValid;
  @override
  Widget build(BuildContext context) {
    List<Widget> input_checkbox = [];
    keahlianMap.entries.forEach((element) {
      input_checkbox.add(InputCheckBox(
        label: element.key,
        valueMap: keahlianMap,
        onChangedHandler: (key, val) {
          onKeahlianChangedHandler(key, val);
        },
      ));
    });

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Keahlian',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          if(!isValid) Text(
            'Pilih salah satu!',
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: Colors.red,
                ),
          ),
          Wrap(
            children: input_checkbox,
          ),
        ],
      ),
    );
  }
}
