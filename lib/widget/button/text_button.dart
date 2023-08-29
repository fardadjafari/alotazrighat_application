import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  final bool fontChange;
  final Function() bodyFunction;
  final String text;
  final Color colorText;
  final FontWeight fontWeightText;
  final double fontSizeText;

  const ButtonText(
      {Key? key,
      this.fontChange = true,
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
            fontSize: (fontSizeText / 720) * MediaQuery.of(context).size.height,
            color: colorText,
            fontWeight: fontWeightText),
      ),
    );
  }
}
