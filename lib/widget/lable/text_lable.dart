import 'package:flutter/material.dart';

class TextLable extends StatelessWidget {
  final String text;
  final Color colorText;
  final FontWeight fontWeightText;
  final double fontSizeText;
  final TextAlign textAlign;

  const TextLable(
      {Key? key,
      required this.text,
      required this.colorText,
      required this.fontWeightText,
      required this.fontSizeText,
      required this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          decoration: TextDecoration.none,
          fontFamily: "iran",
          fontSize: fontSizeText,
          color: colorText,
          fontWeight: fontWeightText),
      textAlign: textAlign,
    );
  }
}
