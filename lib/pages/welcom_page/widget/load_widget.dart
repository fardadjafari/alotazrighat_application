import 'package:alotazrighat_application/constants/constans_variable.dart';
import 'package:alotazrighat_application/widget/color_utility.dart';
import 'package:alotazrighat_application/widget/loading/loading_widget.dart';
import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoadWidget extends StatelessWidget {
  const LoadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor.withOpacity(0.8),
      alignment: Alignment.center,
      child: Column(children: [
        SizedBox(height: getWidth(context, 0.6)),
        SvgPicture.asset(
          width: getWidth(context, 0.8),
          '${StaticVariable.iconPath}logo.svg',
          alignment: Alignment.center,
        ),
        SizedBox(
          height: getWidth(context, 0.6),
        ),
        const LoadingWidget(
          size: 0.0999,
          color: Colors.white,
        )
      ]),
    );
  }
}
