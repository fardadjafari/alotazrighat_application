import 'package:alotazrighat_application/pages/register_page/logic/bloc/register_bloc.dart';
import 'package:alotazrighat_application/tools/validator/user_validator.dart';
import 'package:alotazrighat_application/widget/button/squre_button.dart';
import 'package:alotazrighat_application/widget/color_utility.dart';
import 'package:alotazrighat_application/widget/input/location_picker.dart';
import 'package:alotazrighat_application/widget/input/multiline_input.dart';
import 'package:alotazrighat_application/widget/input/phonenumber_input.dart';
import 'package:alotazrighat_application/widget/input/tellphone_input.dart';
import 'package:alotazrighat_application/widget/input/text_input.dart';
import 'package:alotazrighat_application/widget/lable/text_lable.dart';
import 'package:alotazrighat_application/widget/loading/loading_widget.dart';
import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:alotazrighat_application/widget/popup/awesome_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController phoneNumberController = TextEditingController();
    final TextEditingController tellphoneController = TextEditingController();
    final TextEditingController addressController = TextEditingController();

    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.registerEvent is TurnOnGPSEvent) {
          alertDialogWarning(
            context,
            "مشکل",
            "GPS تلفن همراه خود را فعال کنید",
            "تلاش مجدد",
            () {
              context.read<RegisterBloc>().add(InitialRegisterPageEvent());
            },
          );
        }

        if (state.registerEvent is FaildPermisionEvent) {
          alertDialogWarning(
            context,
            "مشکل",
            "مشکل دسترسی به مکان شما",
            "تلاش مجدد",
            () {
              context.read<RegisterBloc>().add(InitialRegisterPageEvent());
            },
          );
        }
      },
      builder: (context, state) {
        print(state.registerEvent.toString());
        if (state.registerEvent is InitialFormPageEvent) {
          return SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: getHeight(context, 0.05)),
                    child: TextLable(
                      text: "ثبت نام ",
                      colorText: Colors.white,
                      fontSizeText: getHeight(context, 0.03),
                      fontWeightText: FontWeight.w900,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: getHeight(context, 0.14),
                  ),
                  PhoneNumberInput(
                    hintText: "شماره همراه",
                    icon: Icons.phone,
                    controller: phoneNumberController,
                    error: "خطا",
                    onSaved: (p0) {},
                  ),
                  SizedBox(
                    height: getHeight(context, 0.03),
                  ),
                  TextInput(
                    controller: firstNameController,
                    hintText: "نام",
                    icon: Icons.person,
                    onSaved: (p0) {},
                    error: "خطا",
                    validation: Uservalidator.userNameValidator,
                  ),
                  SizedBox(
                    height: getHeight(context, 0.02),
                  ),
                  TextInput(
                    controller: lastNameController,
                    hintText: "نام خانوادگی ",
                    icon: Icons.person,
                    onSaved: (p0) {},
                    error: "خطا",
                    validation: Uservalidator.userNameValidator,
                  ),
                  SizedBox(
                    height: getHeight(context, 0.02),
                  ),
                  TellphoneInput(
                    hintText: "شماره ثابت",
                    icon: Icons.fax,
                    controller: tellphoneController,
                    error: "خطا",
                    onSaved: (p0) {},
                  ),
                  SizedBox(
                    height: getHeight(context, 0.02),
                  ),
                  MultiLineTextInput(
                    controller: addressController,
                    hintText: "آدرس",
                    icon: Icons.add_home_work_sharp,
                    onSaved: (p0) {},
                    error: "خطا",
                    validation: Uservalidator.addressUserValidator,
                    maxLine: 3,
                    minLine: 1,
                  ),
                  SizedBox(
                    height: getHeight(context, 0.02),
                  ),
                  SquereButton(
                      text: "ثبت نام",
                      press: () {
                        if (_formKey.currentState!.validate()) {
                          // context.read<LoginBloc>().add(FillPhoneNumberEvent(
                          //     phonenumber: phoneNumberController.text));
                        }
                      },
                      color: buttonColor,
                      textColor: buttonTextColor)
                ],
              ),
            ),
          );
        }
        if (state.registerEvent is InitialMapPageEvent) {
          print(state.lang);
          return LocationPicker(state.lang, state.laut);
        } else {
          return Padding(
            padding: EdgeInsets.only(top: getHeight(context, 0.1)),
            child: const LoadingWidget(
              size: 0.2,
              color: bgColor,
            ),
          );
        }
      },
    );
  }
}
