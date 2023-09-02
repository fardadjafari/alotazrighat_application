import 'package:alotazrighat_application/styles/radius.dart';
import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:flutter/material.dart';

class TextInputStructur extends StatelessWidget {
  final Widget child;

  const TextInputStructur({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: EdgeInsets.all(1),
        width: getWidth(context, 0.8),
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: const Color(0xFFA1D3D1),
            borderRadius: getBorderRadiusWidget(29)),
        child: child,
      ),
    );
  }
}
