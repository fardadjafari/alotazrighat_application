import 'package:alotazrighat_application/constants/constans_variable.dart';
import 'package:alotazrighat_application/widget/color_utility.dart';
import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailImage extends StatelessWidget {
  const DetailImage({Key? key, required this.logoPath}) : super(key: key);

  final String logoPath;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      width: getHeight(context, 0.05),
      StaticVariable.baseImageUrl + logoPath,
      // ignore: deprecated_member_use
      color: bgColor,
    );
  }
}
