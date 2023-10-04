import 'package:alotazrighat_application/widget/color_utility.dart';
import 'package:alotazrighat_application/widget/lable/text_lable.dart';
import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:flutter/material.dart';

import 'widget/body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String screenId = "/home_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: bgColor,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: TextLable(
              text: "خدمات الو تزریقات",
              colorText: buttonTextColor,
              fontWeightText: FontWeight.w400,
              fontSizeText: getWidth(context, 0.05),
              textAlign: TextAlign.center),
        ),
        body: const Body());
  }
}
