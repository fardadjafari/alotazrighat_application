import 'dart:async';

import 'package:alotazrighat_application/constants/constans_variable.dart';
import 'package:alotazrighat_application/pages/layout_page.dart';
import 'package:alotazrighat_application/pages/login_page/login_page.dart';
import 'package:alotazrighat_application/pages/register_page/logic/bloc/register_bloc.dart';
import 'package:alotazrighat_application/pages/register_page/widget/location_picker.dart';
import 'package:alotazrighat_application/tools/validator/user_validator.dart';
import 'package:alotazrighat_application/widget/button/squre_button.dart';
import 'package:alotazrighat_application/widget/button/text_button.dart';
import 'package:alotazrighat_application/widget/color_utility.dart';
import 'package:alotazrighat_application/widget/input/multiline_input.dart';
import 'package:alotazrighat_application/widget/input/password_input.dart';
import 'package:alotazrighat_application/widget/input/phonenumber_input.dart';
import 'package:alotazrighat_application/widget/input/tellphone_input.dart';
import 'package:alotazrighat_application/widget/input/text_input.dart';
import 'package:alotazrighat_application/widget/lable/text_lable.dart';
import 'package:alotazrighat_application/widget/loading/loading_widget.dart';
import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:alotazrighat_application/widget/popup/awesome_alert.dart';
import 'package:alotazrighat_application/widget/popup/snack_bar_widget.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formPasswordKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController tellphoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  int _remainingTime = 180;
  late Timer _timer;
  final _focusNodeInput = FocusNode();

  @override
  void initState() {
    context.read<RegisterBloc>().add(InitialRegisterPageEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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

        if (state.registerEvent is ErrorFormPageEvent) {
          phoneNumberController.clear();
          var result = state.registerEvent as ErrorFormPageEvent;
          getSnackBarWidget(context, result.errorMessage, Colors.red);
        }
        if (state.registerEvent is ErrorPasswordEvent) {
          getSnackBarWidget(
              context, "اطلاعات وارد شده صحیح نمی باشد", Colors.red);
          restPassWidget();
        }
        if (state.registerEvent is InitialPasswordPageEvent) {
          _startTimer(state);
        }
      },
      builder: (context, state) {
        if (state.registerEvent is InitialRegisterPageEvent) {
          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      height: getHeight(context, 0.025),
                    ),
                    ButtonText(
                      colorText: Colors.blueAccent,
                      fontSizeText: getWidth(context, 0.036),
                      fontWeightText: FontWeight.w300,
                      text: "شرایط استفاده از خدمات و حریم خصوصی را می پذیرم",
                      bodyFunction: () {
                        launchUrl(Uri.parse(StaticVariable.termsOfUse));
                      },
                    ),
                    SizedBox(
                      height: getHeight(context, 0.03),
                    ),
                    SquereButton(
                        text: "ثبت نام",
                        press: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<RegisterBloc>().add(FillFormPageEvent(
                                firstName: firstNameController.text,
                                lastName: lastNameController.text,
                                address: addressController.text,
                                phoneNumber: phoneNumberController.text,
                                telephone: tellphoneController.text));
                          }
                        },
                        color: buttonColor,
                        textColor: buttonTextColor)
                  ],
                ),
              ),
            ),
          );
        }
        if (state.registerEvent is InitialMapPageEvent) {
          final InitialMapPageEvent model =
              state.registerEvent as InitialMapPageEvent;
          return LocationPicker(
            model.lang,
            model.laut,
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            address: addressController.text,
            phoneNumber: phoneNumberController.text,
            telephone: tellphoneController.text,
          );
        }
        if (state.registerEvent is InitialPasswordPageEvent) {
          return Form(
              key: _formPasswordKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: getHeight(context, 0.05)),
                      child: TextLable(
                        text: " رمز یکبار مصرف ",
                        colorText: Colors.white,
                        fontSizeText: getHeight(context, 0.03),
                        fontWeightText: FontWeight.w900,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: getHeight(context, 0.2),
                    ),
                    TextLable(
                        text: '$_remainingTime ثانیه',
                        colorText: darkColor,
                        fontSizeText: getWidth(context, 0.05),
                        fontWeightText: FontWeight.w600,
                        textAlign: TextAlign.center),
                    SizedBox(
                      height: getHeight(context, 0.05),
                    ),
                    PasswordInput(
                      controller: passwordController,
                      focusNode: _focusNodeInput,
                      hintText: "رمز یکبار مصرف",
                      icon: Icons.lock,
                      error: "خطا",
                      onSaved: (p0) {},
                    ),
                    SizedBox(
                      height: getHeight(context, 0.06),
                    ),
                    SquereButton(
                        text: "تایید رمز یبار مصرف",
                        press: () {
                          if (_formPasswordKey.currentState!.validate()) {
                            _timer.cancel();
                            context.read<RegisterBloc>().add(FillPasswordEvent(
                                phonenumber: phoneNumberController.text,
                                password: passwordController.text));
                          }
                        },
                        color: buttonColor,
                        textColor: buttonTextColor)
                  ],
                ),
              ));
        }
        if (state.registerEvent is FinishedLoginEvent) {
          Future.delayed(const Duration(seconds: 5), () {
            Navigator.pushNamed(context, Layout.screenId);
          });
          return Center(
              child: Column(children: [
            Padding(padding: EdgeInsets.only(top: getHeight(context, 0.3))),
            FadeIn(
              child: SvgPicture.asset(
                width: getWidth(context, 0.5),
                '${StaticVariable.iconPath}logo_pure.svg',
                alignment: Alignment.center,
              ),
            ),
            SizedBox(height: getWidth(context, 0.2)),
            FadeIn(
              child: TextLable(
                  text: "به سامانه الو تزریقات خوش آمدید",
                  colorText: buttonColor,
                  fontWeightText: FontWeight.w600,
                  fontSizeText: getWidth(context, 0.05),
                  textAlign: TextAlign.center),
            )
          ]));
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

  void restPassWidget() {
    passwordController.clear();
    _focusNodeInput.unfocus();
  }

  void _startTimer(RegisterState state) async {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer.cancel();
          _restartTimer();
          restPassWidget();
          Navigator.pushNamed(context, LoginPage.screenId);
        }
      });
    });
  }

  void _restartTimer() {
    _remainingTime = 180;
  }
}
