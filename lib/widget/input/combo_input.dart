import 'package:alotazrighat_application/widget/color_utility.dart';
import 'package:alotazrighat_application/widget/lable/text_lable.dart';
import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:flutter/material.dart';

class ComboBoxFormField<TKey> extends StatefulWidget {
  final String text;
  final List<Map<TKey, String>>? items;
  final ValueChanged onChanged;
  final Function(TKey?)? validator;
  const ComboBoxFormField(
      {Key? key,
      required this.text,
      required this.items,
      required this.onChanged,
      this.validator})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ComboBoxFormFieldState<TKey> createState() =>
      _ComboBoxFormFieldState<TKey>();
}

class _ComboBoxFormFieldState<TKey> extends State<ComboBoxFormField<TKey>> {
  TKey? value;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth(context, 0.8),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<TKey>(
          validator: (value) {
            if (value == null) {
              return "${widget.text} را انتخاب کنید";
            }
            return null;
          },
          decoration: InputDecoration(
              errorStyle: TextStyle(
                  fontFamily: "Iran Sans", fontSize: getWidth(context, 0.035))),
          value: value,
          alignment: AlignmentDirectional.center,
          elevation: 20,
          focusColor: Colors.grey,
          isDense: true,
          hint: TextLable(
            text: widget.text,
            textAlign: TextAlign.right,
            colorText: bgColor,
            fontSizeText: getWidth(context, 0.03),
            fontWeightText: FontWeight.bold,
          ),
          iconSize: getWidth(context, 0.07),
          icon: const Icon(
            Icons.arrow_drop_down,
            color: bgColor,
          ),
          isExpanded: true,
          items: widget.items != null
              ? widget.items!.map(buildMenuItem).toList()
              : null,
          onChanged: (newValue) => setState(() {
            value = newValue;
            super.widget.onChanged.call(newValue);
          }),
        ),
      ),
    );
  }

  DropdownMenuItem<TKey> buildMenuItem(Map<TKey, String> item) =>
      DropdownMenuItem(
          value: item.keys.first,
          alignment: Alignment.centerRight,
          enabled: true,
          child: Container(
            child: TextLable(
                text: item.values.first,
                colorText: Colors.black,
                fontWeightText: FontWeight.w600,
                fontSizeText: getWidth(context, 0.04),
                textAlign: TextAlign.right),
          ));
}
