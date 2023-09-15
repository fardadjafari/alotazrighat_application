import 'package:alotazrighat_application/styles/radius.dart';
import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:flutter/material.dart';

class SquereButton extends StatelessWidget {
  final String text;
  final Function()? press;
  final Color color, textColor;
  const SquereButton(
      {Key? key,
      required this.text,
      required this.color,
      required this.press,
      this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth(context, 0.6),
      margin: EdgeInsets.symmetric(vertical: getWidth(context, 0.03)),
      child: ClipRRect(
        borderRadius: getBorderRadiusWidget(29),
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: color,
                disabledBackgroundColor: color.withOpacity(0.6),
                padding: EdgeInsets.symmetric(
                    vertical: getWidth(context, 0.04),
                    horizontal: getHeight(context, 0.05))),
            onPressed: press,
            child: Text(
              text,
              style: TextStyle(
                  fontFamily: "Iran Sans",
                  fontSize: getWidth(context, 0.03),
                  fontWeight: FontWeight.bold,
                  color: textColor),
            )),
      ),
    );
  }
}
