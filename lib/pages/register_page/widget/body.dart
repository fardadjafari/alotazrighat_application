import 'package:alotazrighat_application/tools/validator/user_validator.dart';
import 'package:alotazrighat_application/widget/button/squre_button.dart';
import 'package:alotazrighat_application/widget/color_utility.dart';
import 'package:alotazrighat_application/widget/input/location_picker.dart';
import 'package:alotazrighat_application/widget/input/multiline_input.dart';
import 'package:alotazrighat_application/widget/input/phonenumber_input.dart';
import 'package:alotazrighat_application/widget/input/tellphone_input.dart';
import 'package:alotazrighat_application/widget/input/text_input.dart';
import 'package:alotazrighat_application/widget/lable/text_lable.dart';
import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController phoneNumberController = TextEditingController();
    final TextEditingController tellphoneController = TextEditingController();
    final TextEditingController addressController = TextEditingController();

    return Container(alignment: Alignment.center, child: LocationPicker());

    // return SingleChildScrollView(
    //   child: Container(
    //     alignment: Alignment.center,
    //     child: Column(
    //       children: [
    //         Padding(
    //           padding: EdgeInsets.only(top: getHeight(context, 0.038)),
    //           child: TextLable(
    //             text: "ثبت نام ",
    //             colorText: Colors.white,
    //             fontSizeText: getHeight(context, 0.04),
    //             fontWeightText: FontWeight.w900,
    //             textAlign: TextAlign.center,
    //           ),
    //         ),
    //         SizedBox(
    //           height: getHeight(context, 0.14),
    //         ),
    //         PhoneNumberInput(
    //           //focusNode: _focusNodeInput,
    //           hintText: "شماره همراه",
    //           icon: Icons.phone,
    //           controller: phoneNumberController,
    //           error: "خطا",
    //           onSaved: (p0) {},
    //         ),
    //         SizedBox(
    //           height: getHeight(context, 0.03),
    //         ),
    //         TextInput(
    //           controller: firstNameController,
    //           hintText: "نام",
    //           icon: Icons.person,
    //           onSaved: (p0) {},
    //           error: "خطا",
    //           validation: Uservalidator.userNameValidator,
    //         ),
    //         SizedBox(
    //           height: getHeight(context, 0.02),
    //         ),
    //         TextInput(
    //           controller: lastNameController,
    //           hintText: "نام خانوادگی ",
    //           icon: Icons.person,
    //           onSaved: (p0) {},
    //           error: "خطا",
    //           validation: Uservalidator.userNameValidator,
    //         ),
    //         SizedBox(
    //           height: getHeight(context, 0.02),
    //         ),
    //         TellphoneInput(
    //           hintText: "شماره ثابت",
    //           icon: Icons.fax,
    //           controller: tellphoneController,
    //           error: "خطا",
    //           onSaved: (p0) {},
    //         ),
    //         SizedBox(
    //           height: getHeight(context, 0.02),
    //         ),
    //         MultiLineTextInput(
    //           controller: addressController,
    //           hintText: "آدرس",
    //           icon: Icons.add_home_work_sharp,
    //           onSaved: (p0) {},
    //           error: "خطا",
    //           validation: Uservalidator.addressUserValidator,
    //           maxLine: 3,
    //           minLine: 1,
    //         ),
    //         SquereButton(
    //             text: "ثبت نام",
    //             press: () {
    //               // if (_formKey.currentState!.validate()) {
    //               //   context.read<LoginBloc>().add(FillPhoneNumberEvent(
    //               //       phonenumber: phoneNumberController.text));
    //               // }
    //             },
    //             color: buttonColor,
    //             textColor: buttonTextColor)
    //       ],
    //     ),
    //   ),
    // );
  }
}
