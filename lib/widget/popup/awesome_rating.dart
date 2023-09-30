import 'package:alotazrighat_application/widget/color_utility.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

alertDialogRate(
    BuildContext context, String title, Widget widget, Widget btnwidget) {
  return AwesomeDialog(
    dialogBackgroundColor: backGroundColor,
    context: context,
    dialogType: DialogType.success,
    animType: AnimType.scale,
    headerAnimationLoop: false,
    title: title,
    body: widget,
    autoDismiss: false,
    dismissOnTouchOutside: false,
    btnOk: btnwidget, // buttonsTextStyle: getBodyBoldWhiteStyle(context),
  ).show();
}
