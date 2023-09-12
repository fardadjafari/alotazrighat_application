import 'package:alotazrighat_application/styles/shapes.dart';
import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:flutter/material.dart';

getSnackBarWidget(BuildContext context, String text, Color color) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      shape: getShapeWidget(10),
      behavior: SnackBarBehavior.floating,
      content: Text(
        text,
        style: TextStyle(
            decoration: TextDecoration.none,
            fontFamily: "Iran Sans",
            fontSize: getWidth(context, 0.04),
            fontWeight: FontWeight.bold),
      ),
      dismissDirection: DismissDirection.horizontal,
      duration: const Duration(seconds: 4),
    ),
  );
}
