import 'package:alotazrighat_application/widget/color_utility.dart';
import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

alertDialogImage(BuildContext context, String title, String path,
    String titlebtnOk, String header) {
  return AwesomeDialog(
    dialogBackgroundColor: backGroundColor,
    context: context,
    dialogType: DialogType.info,
    animType: AnimType.scale,
    headerAnimationLoop: false,
    title: title,
    body: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          path,
          headers: {"Authorization": "Bearer $header"},
          width: getWidth(context, 0.7),
          height: getHeight(context, 0.2),
        )
      ],
    ),
    btnOkColor: Colors.amber[600],
    btnOkText: titlebtnOk,
    autoDismiss: true,
    // buttonsTextStyle: getBodyBoldWhiteStyle(context),
  ).show();
}
