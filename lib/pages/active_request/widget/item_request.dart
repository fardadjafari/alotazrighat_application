import 'package:alotazrighat_application/widget/color_utility.dart';
import 'package:alotazrighat_application/widget/lable/text_lable.dart';
import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:flutter/material.dart';

class ItemRequest extends StatelessWidget {
  const ItemRequest({super.key, required this.title, required this.value});

  final String title;

  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getWidth(context, 0.08),
          vertical: getHeight(context, 0.004)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextLable(
              text: title,
              colorText: buttonTextColor,
              fontWeightText: FontWeight.w400,
              fontSizeText: getWidth(context, 0.027),
              textAlign: TextAlign.center),
          TextLable(
              text: value,
              colorText: buttonTextColor,
              fontWeightText: FontWeight.w500,
              fontSizeText: getWidth(context, 0.031),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
