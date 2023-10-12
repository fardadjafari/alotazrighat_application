import 'package:alotazrighat_application/tools/validator/user_validator.dart';
import 'package:alotazrighat_application/widget/color_utility.dart';
import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumberInput extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final Function(String?) onSaved;
  final String? error;
  final TextEditingController controller;
  final FocusNode? focusNode;

  const PhoneNumberInput(
      {Key? key,
      required this.icon,
      required this.hintText,
      required this.onSaved,
      required this.controller,
      this.error,
      this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: getWidth(context, 0.9),
      child: TextFormField(
        maxLength: 11,
        controller: controller,
        focusNode: focusNode,
        maxLengthEnforcement: MaxLengthEnforcement.none,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: "Iran Sans", letterSpacing: getWidth(context, 0.02)),
        decoration: InputDecoration(
          //errorText: "شماره وارد شده صحیح نیست",
          errorStyle: TextStyle(
              fontFamily: "Iran Sans", fontSize: getWidth(context, 0.035)),
          counterText: "",
          labelText: hintText,
          labelStyle: TextStyle(fontSize: getWidth(context, 0.04)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
          floatingLabelStyle:
              TextStyle(color: darkColor, fontSize: getWidth(context, 0.05)),
          fillColor: const Color(0xFFA1D3D1),
          prefixIcon: Icon(Icons.phone, size: getWidth(context, 0.06)),
          prefixIconColor: Colors.black45,
          hintStyle: TextStyle(
              fontFamily: "Iran Sans",
              fontWeight: FontWeight.w500,
              fontSize: getWidth(context, 0.05)),
        ),
        validator: Uservalidator.phoneNumberValidator,
        onChanged: onSaved,
        autofocus: false,
        keyboardType: TextInputType.phone,
      ),
    );
  }
}
