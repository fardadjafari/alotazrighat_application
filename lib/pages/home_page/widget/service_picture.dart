import 'package:alotazrighat_application/constants/constans_variable.dart';
import 'package:alotazrighat_application/widget/color_utility.dart';
import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ServiceImage extends StatelessWidget {
  const ServiceImage({Key? key, required this.logoPath}) : super(key: key);

  final String logoPath;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      width: getWidth(context, 0.12),
      StaticVariable.baseImageUrl + logoPath,
      color: bgColor,
    );
  }
}
