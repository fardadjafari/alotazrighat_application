import 'package:flutter/material.dart';
import 'package:alotazrighat_application/widget/color_utility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../media_query.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key, required this.size, required this.color})
      : super(key: key);
  final double size;
  final Color color;
  @override
  Widget build(BuildContext context) {
    final spinKit =
        SpinKitThreeBounce(color: color, size: getWidth(context, size));
    return Center(child: spinKit);
  }
}

class ScreenLoadingWidget extends StatelessWidget {
  const ScreenLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final spinKit =
        SpinKitThreeBounce(color: primaryColor, size: getWidth(context, 0.055));
    return Container(
      width: getAllWidth(context),
      height: getHeight(context, 0.79),
      alignment: Alignment.center,
      child: Center(child: spinKit),
    );
  }
}
