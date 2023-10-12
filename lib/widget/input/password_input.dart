import 'package:alotazrighat_application/tools/validator/user_validator.dart';
import 'package:alotazrighat_application/widget/color_utility.dart';
import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final Function(String?) onSaved;
  final FocusNode? focusNode;
  final TextEditingController controller;
  //final String? Function(String?) validation;
  final String? error;

  const PasswordInput(
      {Key? key,
      required this.icon,
      required this.hintText,
      required this.onSaved,

      // required this.validation,
      this.error,
      this.focusNode,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: getWidth(context, 0.9),
      child: TextFormField(
        focusNode: focusNode,
        textAlign: TextAlign.center,
        maxLength: 5,
        style: TextStyle(
          fontFamily: "Iran Sans",
          letterSpacing: getWidth(context, 0.06),
        ),
        decoration: InputDecoration(
          //errorText: error,
          errorStyle: TextStyle(
              fontFamily: "Iran Sans", fontSize: getWidth(context, 0.035)),
          counterText: "",
          labelText: hintText,
          labelStyle:
              TextStyle(fontSize: getWidth(context, 0.04), letterSpacing: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
          floatingLabelStyle: TextStyle(
              color: darkColor,
              fontSize: getWidth(context, 0.05),
              letterSpacing: 0),
          fillColor: const Color(0xFFA1D3D1),
          prefixIcon: Icon(Icons.lock, size: getWidth(context, 0.06)),
          prefixIconColor: Colors.black45,
          hintStyle: TextStyle(
              fontFamily: "Iran Sans",
              fontWeight: FontWeight.w500,
              fontSize: getWidth(context, 0.05)),
        ),
        validator: Uservalidator.pssswordValidator,
        onChanged: onSaved,
        autofocus: false,
        controller: controller,
        keyboardType: TextInputType.phone,
      ),
    );
  }
}
