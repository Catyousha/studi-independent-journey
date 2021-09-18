import 'package:flutter/material.dart';

class ButtonSubmit extends StatelessWidget {
  const ButtonSubmit({
    Key? key,
    required this.onPressedHandler,
  }) : super(key: key);
  final void Function() onPressedHandler;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressedHandler,
      style: ElevatedButton.styleFrom(
        elevation: 20.0,
        primary: Colors.indigoAccent,
        padding: EdgeInsets.symmetric(
          vertical: 25.0,
          horizontal: 50.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
      child: Text('Submit'),
    );
  }
}
