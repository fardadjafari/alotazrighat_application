import 'package:alotazrighat_application/widget/color_utility.dart';
import 'package:alotazrighat_application/widget/lable/text_lable.dart';
import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:flutter/material.dart';

class CheckBoxInput extends StatefulWidget {
  final String text;
  final ValueChanged onChanged;
  final bool defualt;
  final ListTileControlAffinity listTileControlAffinity;
  const CheckBoxInput(
      {Key? key,
      required this.text,
      required this.onChanged,
      required this.listTileControlAffinity,
      required this.defualt})
      : super(key: key);

  @override
  _CheckBoxFormFieldState createState() => _CheckBoxFormFieldState();
}

class _CheckBoxFormFieldState extends State<CheckBoxInput> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: widget.listTileControlAffinity,
      value: widget.defualt,
      activeColor: bgColor,
      title: TextLable(
          text: widget.text,
          colorText: bgColor,
          fontWeightText: FontWeight.w400,
          fontSizeText: getWidth(context, 0.05),
          textAlign: TextAlign.right),
      checkColor: Colors.white,
      onChanged: (newValue) => setState(() {
        value = newValue!;
        super.widget.onChanged.call(newValue);
      }),
    );
  }
}
