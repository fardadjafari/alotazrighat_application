import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:flutter/material.dart';

class IconLable extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color colorText;
  final Color colorIcon;
  final FontWeight fontWeightText;
  final double fontSizeText;
  final TextAlign textAlign;

  const IconLable(
      {Key? key,
      required this.text,
      required this.colorText,
      required this.fontWeightText,
      required this.fontSizeText,
      required this.textAlign,
      required this.icon,
      required this.colorIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
              decoration: TextDecoration.none,
              fontFamily: "Iran Sans",
              fontSize: fontSizeText,
              color: colorText,
              fontWeight: fontWeightText),
          textAlign: textAlign,
        ),
        Icon(
          icon,
          color: colorIcon,
          size: getWidth(context, 0.09),
        )
      ],
    );
  }
}
