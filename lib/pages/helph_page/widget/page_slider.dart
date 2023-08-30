import 'package:alotazrighat_application/pages/home_page/home_page.dart';
import 'package:alotazrighat_application/widget/button/squre_button.dart';
import 'package:alotazrighat_application/widget/button/text_button.dart';
import 'package:alotazrighat_application/widget/lable/text_lable.dart';
import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PageSlider {
  static List<Widget> getPage(BuildContext context) {
    var width = getAllWidth(context);
    var height = getAllHeight(context);
    var page = [
      Container(
        width: width,
        height: height,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: getWidth(context, 0.1),
              horizontal: getHeight(context, 0.03)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonText(
                        text: "بستن توضیحات",
                        bodyFunction: () => {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const HomePage()))
                            },
                        colorText: Colors.grey,
                        fontSizeText: getWidth(context, 0.03),
                        fontWeightText: FontWeight.bold,
                        fontChange: true),
                    TextLable(
                      text: "راحت تزریق کن",
                      colorText: Colors.redAccent,
                      fontSizeText: getWidth(context, 0.05),
                      fontWeightText: FontWeight.bold,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                SizedBox(
                  height: getWidth(context, 0.2),
                ),
                SvgPicture.asset(
                  "assets/icons/slider1.svg",
                  height: getWidth(context, 0.5),
                ),
                SizedBox(
                  height: getWidth(context, 0.3),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    textDirection: TextDirection.rtl,
                    children: <Widget>[
                      TextLable(
                        text: "با سرعت برق",
                        colorText: Colors.grey,
                        fontSizeText: getWidth(context, 0.08),
                        fontWeightText: FontWeight.w600,
                        textAlign: TextAlign.center,
                      ),
                      TextLable(
                        text: "پرستار پیدا کن",
                        colorText: Colors.redAccent,
                        fontSizeText: getWidth(context, 0.08),
                        fontWeightText: FontWeight.w800,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: getWidth(context, 0.1),
                      ),
                      TextLable(
                        text: "با زدن چندتا دکمه \n"
                            "کار تزریقات شما رو "
                            "انجام می دیم \n"
                            "البته در منزل ! ! !",
                        colorText: Colors.black54,
                        fontSizeText: getWidth(context, 0.05),
                        fontWeightText: FontWeight.w200,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Container(
        width: width,
        height: height,
        color: const Color(0xffCAEDFF),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: getWidth(context, 0.1),
              horizontal: getHeight(context, 0.03)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonText(
                        text: "بستن توضیحات",
                        bodyFunction: () => {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const HomePage()))
                            },
                        colorText: Colors.grey,
                        fontSizeText: getWidth(context, 0.03),
                        fontWeightText: FontWeight.bold,
                        fontChange: true),
                    TextLable(
                      text: "نیروی متخصص",
                      colorText: Colors.lightGreen,
                      fontSizeText: getWidth(context, 0.05),
                      fontWeightText: FontWeight.bold,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                SizedBox(
                  height: getWidth(context, 0.2),
                ),
                SvgPicture.asset(
                  "assets/icons/slider2.svg",
                  height: getWidth(context, 0.5),
                ),
                SizedBox(
                  height: getWidth(context, 0.1),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    textDirection: TextDirection.rtl,
                    children: <Widget>[
                      TextLable(
                        text: "با کمترین هزینه",
                        colorText: Colors.grey,
                        fontSizeText: getWidth(context, 0.08),
                        fontWeightText: FontWeight.w600,
                        textAlign: TextAlign.center,
                      ),
                      TextLable(
                        text: "از کادر بیمارستان کمک بگیر",
                        colorText: Colors.green,
                        fontSizeText: getWidth(context, 0.08),
                        fontWeightText: FontWeight.w800,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: getWidth(context, 0.1),
                      ),
                      TextLable(
                        text: "با الو تزریقات \n"
                            "از مهارت کار درمان بیمارستان "
                            " استفاده کن  \n"
                            "البته در منزل ! ! !",
                        colorText: Colors.black54,
                        fontSizeText: getWidth(context, 0.05),
                        fontWeightText: FontWeight.w200,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Container(
        width: width,
        height: height,
        color: const Color(0xffDBDFEA),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: getWidth(context, 0.1),
              horizontal: getHeight(context, 0.03)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonText(
                        text: "بستن توضیحات",
                        bodyFunction: () => {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const HomePage()))
                            },
                        colorText: Colors.grey,
                        fontSizeText: getWidth(context, 0.03),
                        fontWeightText: FontWeight.bold,
                        fontChange: true),
                    TextLable(
                      text: "درخواست اینترنتی",
                      colorText: Colors.blue,
                      fontSizeText: getWidth(context, 0.05),
                      fontWeightText: FontWeight.bold,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                SizedBox(
                  height: getWidth(context, 0.1),
                ),
                SvgPicture.asset(
                  "assets/icons/slider3.svg",
                  height: getWidth(context, 0.5),
                ),
                SizedBox(
                  height: getWidth(context, 0.1),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    textDirection: TextDirection.rtl,
                    children: <Widget>[
                      TextLable(
                        text: "به صورت اینترنتی",
                        colorText: Colors.grey,
                        fontSizeText: getWidth(context, 0.08),
                        fontWeightText: FontWeight.w600,
                        textAlign: TextAlign.center,
                      ),
                      TextLable(
                        text: " خدمات پزشکی و پرستاری ثبت کن",
                        colorText: Colors.blue,
                        fontSizeText: getWidth(context, 0.08),
                        fontWeightText: FontWeight.w800,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: getWidth(context, 0.1),
                      ),
                      SquereButton(
                        color: Colors.green,
                        press: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HomePage()));
                        },
                        text: "ثبت نام",
                        textColor: Colors.white70,
                      ),
                      SizedBox(
                        height: getWidth(context, 0.01),
                      ),
                      SquereButton(
                        color: Colors.blue,
                        press: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HomePage()));
                        },
                        text: "قبلا ثبت نام کردم",
                        textColor: Colors.white70,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ];

    return page;
  }
}
