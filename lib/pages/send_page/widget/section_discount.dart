import 'package:alotazrighat_application/widget/color_utility.dart';
import 'package:alotazrighat_application/widget/lable/text_lable.dart';
import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:flutter/material.dart';

class SectionDiscount extends StatelessWidget {
  const SectionDiscount(
      {super.key, required this.function, required this.isActive});
  final bool isActive;
  final Function(bool?) function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getWidth(context, 0.05),
          vertical: getHeight(context, 0.02)),
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.topCenter,
              height: getHeight(context, 0.15),
              child: Card(
                color: Colors.grey[100],
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextLable(
                      text: "آیا کد تخفیف دارید؟",
                      colorText: frColor,
                      fontSizeText: getWidth(context, 0.04),
                      fontWeightText: FontWeight.w700,
                      textAlign: TextAlign.center,
                    ),
                    Checkbox(value: isActive, onChanged: function)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
