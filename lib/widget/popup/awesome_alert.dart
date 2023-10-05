import 'package:alotazrighat_application/widget/color_utility.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

alertDialogWarning(BuildContext context, String title, String desc,
    String titlebtnOk, Function()? btnPress) {
  return AwesomeDialog(
    dialogBackgroundColor: backGroundColor,
    context: context,
    dialogType: DialogType.warning,
    animType: AnimType.scale,
    headerAnimationLoop: false,
    title: title,
    desc: desc,
    btnOkOnPress: btnPress,
    btnOkColor: Colors.amber[600],
    btnOkText: titlebtnOk,
    autoDismiss: true,
    // buttonsTextStyle: getBodyBoldWhiteStyle(context),
  ).show();
}

alertDialogError(BuildContext context, String title, String desc,
    void Function()? okFuncation) {
  return AwesomeDialog(
    dialogBackgroundColor: backGroundColor,
    context: context,
    dialogType: DialogType.error,
    animType: AnimType.scale,
    headerAnimationLoop: false,
    title: title,
    titleTextStyle: const TextStyle(
        decoration: TextDecoration.none,
        fontFamily: "Iran Sans",
        fontWeight: FontWeight.bold),
    descTextStyle: const TextStyle(
        decoration: TextDecoration.none,
        fontFamily: "Iran Sans",
        fontWeight: FontWeight.bold),
    desc: desc,
    btnOkOnPress: okFuncation,
    btnOkColor: primaryColor,
    btnOkText: 'تایید',
    btnCancelText: "برگشت",
    btnCancelOnPress: () {},
    // buttonsTextStyle: getBodyBoldWhiteStyle(context),
  ).show();
}
