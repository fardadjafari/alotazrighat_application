import 'package:alotazrighat_application/widget/button/squre_button.dart';
import 'package:alotazrighat_application/widget/color_utility.dart';
import 'package:alotazrighat_application/widget/input/password_input.dart';
import 'package:alotazrighat_application/widget/input/phonenumber_input.dart';
import 'package:alotazrighat_application/widget/lable/text_lable.dart';
import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: getHeight(context, 0.06)),
                child: TextLable(
                  text: "ورود کاربران",
                  colorText: Colors.white,
                  fontSizeText: getHeight(context, 0.04),
                  fontWeightText: FontWeight.w900,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: getHeight(context, 0.3),
              ),
              PhoneNumberInput(
                hintText: "شماره همراه",
                icon: Icons.phone,
                error: "خطا",
                onSaved: (p0) {},
                //validation: (p0) {},
              ),
              SizedBox(
                height: getHeight(context, 0.03),
              ),
              PasswordInput(
                hintText: "رمز یکبار مصرف",
                icon: Icons.phone,
                error: "خطا",
                onSaved: (p0) {},
                //validation: (p0) {},
              ),
              SizedBox(
                height: getHeight(context, 0.04),
              ),
              SquereButton(
                  text: "ورود",
                  press: () {},
                  color: buttonColor,
                  textColor: buttonTextColor)
            ],
          ),
        ),
      ),
    );
  }
}
