import 'package:alotazrighat_application/tools/validator/user_validator.dart';
import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TellphoneInput extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final Function(String?) onSaved;
  final String? error;
  final TextEditingController controller;
  final FocusNode? focusNode;

  const TellphoneInput(
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
            fontFamily: "iran",
            fontSize: getWidth(context, 0.034),
            letterSpacing: getWidth(context, 0.02)),
        decoration: InputDecoration(
          //errorText: "شماره وارد شده صحیح نیست",
          errorStyle:
              TextStyle(fontFamily: "iran", fontSize: getWidth(context, 0.04)),
          counterText: "",
          labelText: hintText,
          labelStyle: TextStyle(fontSize: getWidth(context, 0.04)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
          floatingLabelStyle: TextStyle(fontSize: getWidth(context, 0.05)),
          fillColor: const Color(0xFFA1D3D1),
          prefixIcon: Icon(Icons.phone, size: getWidth(context, 0.06)),
          prefixIconColor: Colors.black45,
          hintStyle: TextStyle(
              fontFamily: "iran",
              fontWeight: FontWeight.w500,
              fontSize: getWidth(context, 0.05)),
        ),
        validator: Uservalidator.tellphoneValidator,
        onChanged: onSaved,
        autofocus: false,
        keyboardType: TextInputType.phone,
      ),
    );
  }
}
