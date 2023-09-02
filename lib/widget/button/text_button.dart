import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  final Function() bodyFunction;
  final String text;
  final Color colorText;
  final FontWeight fontWeightText;
  final double fontSizeText;

  const ButtonText(
      {Key? key,
      required this.bodyFunction,
      required this.text,
      required this.colorText,
      required this.fontWeightText,
      required this.fontSizeText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: bodyFunction,
      child: Text(
        text,
        style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: fontSizeText,
            color: colorText,
            fontWeight: fontWeightText),
      ),
    );
  }
}
