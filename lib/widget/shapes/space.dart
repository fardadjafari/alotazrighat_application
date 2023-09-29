import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:flutter/material.dart';

class Sperstor extends StatelessWidget {
  final Color color;

  const Sperstor({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth(context, 0.7),
      child: Divider(
        color: color,
        thickness: 1.1,
      ),
    );
  }
}
