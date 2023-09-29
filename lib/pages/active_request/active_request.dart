import 'package:alotazrighat_application/widget/color_utility.dart';
import 'package:alotazrighat_application/widget/lable/text_lable.dart';
import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:flutter/material.dart';

import 'widget/body.dart';

class ActiveRequest extends StatelessWidget {
  const ActiveRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: bgColor,
          centerTitle: true,
          title: TextLable(
              text: "درخواست های در جریان",
              colorText: buttonTextColor,
              fontWeightText: FontWeight.w500,
              fontSizeText: getWidth(context, 0.05),
              textAlign: TextAlign.center),
        ),
        body: Padding(
          padding: EdgeInsets.all(getHeight(context, 0.03)),
          child: const Body(),
        ));
  }
}
