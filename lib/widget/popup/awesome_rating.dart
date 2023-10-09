import 'package:alotazrighat_application/widget/color_utility.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

alertDialogRate(
    BuildContext context, String title, Widget widget, Widget btnwidget) {
  return AwesomeDialog(
    dialogBackgroundColor: backGroundColor,
    context: context,
    titleTextStyle: const TextStyle(
        decoration: TextDecoration.none,
        fontFamily: "Iran Sans",
        fontWeight: FontWeight.bold),
    descTextStyle: const TextStyle(
        decoration: TextDecoration.none,
        fontFamily: "Iran Sans",
        fontWeight: FontWeight.w600),
    dialogType: DialogType.success,
    animType: AnimType.scale,
    headerAnimationLoop: false,
    title: title,
    body: widget,
    autoDismiss: true,
    dismissOnTouchOutside: false,
    btnOk: btnwidget, // buttonsTextStyle: getBodyBoldWhiteStyle(context),
  ).show();
}
