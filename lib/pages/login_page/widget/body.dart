import 'dart:async';

import 'package:alotazrighat_application/constants/constans_variable.dart';
import 'package:alotazrighat_application/pages/home_page/home_page.dart';
import 'package:alotazrighat_application/pages/layout_page.dart';
import 'package:alotazrighat_application/pages/main_page.dart';
import 'package:alotazrighat_application/widget/button/squre_button.dart';
import 'package:alotazrighat_application/widget/color_utility.dart';
import 'package:alotazrighat_application/widget/input/password_input.dart';
import 'package:alotazrighat_application/widget/input/phonenumber_input.dart';
import 'package:alotazrighat_application/widget/lable/text_lable.dart';
import 'package:alotazrighat_application/widget/loading/loading_widget.dart';
import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:alotazrighat_application/widget/popup/snack_bar_widget.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../logic/bloc/login_bloc.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _remainingTime = 180;
  late Timer _timer;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyPassword = GlobalKey<FormState>();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _focusNodeInput = FocusNode();

  @override
  void dispose() {
    phoneNumberController.dispose();
    passwordController.dispose();
    _timer.cancel();

    super.dispose();
  }

  @override
  void initState() {
    context.read<LoginBloc>().add(InitialPageEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: BlocConsumer<LoginBloc, LoginUserState>(
      listener: (context, state) {
        if (state.loginUserEvent is ErrorPhoneNumberEvent) {
          getSnackBarWidget(
              context, "اطلاعات وارد شده صحیح نمی باشد", Colors.red);
        } else if (state.loginUserEvent is InitialPageEvent) {
          _focusNodeInput.unfocus();
          restPhoneWidget();
        } else if (state.loginUserEvent is ErrorPasswordEvent) {
          getSnackBarWidget(
              context, "اطلاعات وارد شده صحیح نمی باشد", Colors.red);
          restPassWidget();
        } else if (state.loginUserEvent is InitialPasswordPageEvent) {
          //_restartTimer();
          _startTimer(state);
        }
      },
      builder: (context, state) {
        if (state.loginUserEvent is LoadingPageEvent) {
          return Padding(
            padding: EdgeInsets.only(top: getHeight(context, 0.5)),
            child: const LoadingWidget(
              size: 0.2,
              color: bgColor,
            ),
          );
        } else if (state.loginUserEvent is InitialPageEvent) {
          return Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    focusNode: _focusNodeInput,
                    hintText: "شماره همراه",
                    icon: Icons.phone,
                    controller: phoneNumberController,
                    error: "خطا",
                    onSaved: (p0) {},
                  ),
                  SizedBox(
                    height: getHeight(context, 0.03),
                  ),
                  SquereButton(
                      text: "تایید شماره همراه",
                      press: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<LoginBloc>().add(FillPhoneNumberEvent(
                              phonenumber: phoneNumberController.text));
                        }
                      },
                      color: buttonColor,
                      textColor: buttonTextColor),
                  SizedBox(
                    height: getHeight(context, 0.01),
                  ),
                  Visibility(
                    visible: state.loginUserEvent is ErrorPhoneNumberEvent
                        ? true
                        : false,
                    child: SquereButton(
                        text: "ثبت نام",
                        press: () {},
                        color: buttonColor,
                        textColor: buttonTextColor),
                  ),
                ],
              ),
            ),
          );
        } else if (state.loginUserEvent is InitialPasswordPageEvent) {
          return Form(
            key: _formKeyPassword,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: getHeight(context, 0.06)),
                    child: TextLable(
                      text: "ورود رمز کاربران",
                      colorText: Colors.white,
                      fontSizeText: getHeight(context, 0.04),
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
                        if (_formKeyPassword.currentState!.validate()) {
                          _timer.cancel();
                          context.read<LoginBloc>().add(FillPasswordEvent(
                              phonenumber: phoneNumberController.text,
                              password: passwordController.text));
                        }
                      },
                      color: buttonColor,
                      textColor: buttonTextColor)
                ],
              ),
            ),
          );
        } else if (state.loginUserEvent is CompletedLoginEvent) {
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
            padding: EdgeInsets.only(top: getHeight(context, 0.5)),
            child: const LoadingWidget(
              size: 0.2,
              color: bgColor,
            ),
          );
        }
      },
    ));
  }

  void restPhoneWidget() {
    phoneNumberController.clear();
    _focusNodeInput.unfocus();
  }

  void restPassWidget() {
    passwordController.clear();
    _focusNodeInput.unfocus();
  }

  void _startTimer(LoginUserState state) async {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer.cancel();
          _restartTimer();
          restPassWidget();
          context.read<LoginBloc>().emit(state.copyWith(InitialPageEvent()));
        }
      });
    });
  }

  void _restartTimer() {
    _remainingTime = 180;
  }
}
