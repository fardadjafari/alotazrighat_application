import 'package:alotazrighat_application/widget/color_utility.dart';
import 'package:alotazrighat_application/widget/lable/text_lable.dart';
import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:flutter/material.dart';

class NumericStepButton extends StatefulWidget {
  final int minValue;
  final int maxValue;

  final ValueChanged<int> onChanged;

  const NumericStepButton({
    Key? key,
    required this.minValue,
    required this.maxValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<NumericStepButton> createState() {
    return _NumericStepButtonState();
  }
}

class _NumericStepButtonState extends State<NumericStepButton> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(
                Icons.remove_circle,
                color: bgColor,
                size: getWidth(context, 0.07),
              ),
              padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 5.0),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                setState(() {
                  if (counter > widget.minValue) {
                    counter--;
                  }
                  widget.onChanged(counter);
                });
              },
            ),
            TextLable(
                text: counter.toString(),
                colorText: bgColor,
                fontWeightText: FontWeight.w600,
                fontSizeText: getWidth(context, 0.04),
                textAlign: TextAlign.center),
            IconButton(
              icon: Icon(
                Icons.add_circle,
                color: bgColor,
                size: getWidth(context, 0.07),
              ),
              padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                setState(() {
                  if (counter < widget.maxValue) {
                    counter++;
                  }
                  widget.onChanged(counter);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
