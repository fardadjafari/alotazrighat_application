import 'package:flutter/material.dart';

class RadioInput extends StatefulWidget {
  const RadioInput({super.key});

  @override
  State<RadioInput> createState() => _RadioInputState();
}

class _RadioInputState extends State<RadioInput> {
  int _groupValue = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _myRadioButton(
          title: "Checkbox 0",
          value: 0,
          onChanged: (newValue) => setState(() => _groupValue = newValue!),
        ),
        _myRadioButton(
          title: "Checkbox 1",
          value: 1,
          onChanged: (newValue) => setState(() => _groupValue = newValue!),
        ),
      ],
    );
  }

  Widget _myRadioButton(
      {required String title,
      required int value,
      required Function(int?) onChanged}) {
    return RadioListTile(
      value: value,
      groupValue: _groupValue,
      onChanged: onChanged,
      title: Text(title),
    );
  }
}
