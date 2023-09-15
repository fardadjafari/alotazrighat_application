import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:flutter/material.dart';

class BottomWaveWidget extends StatelessWidget {
  const BottomWaveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(getAllWidth(context), getHeight(context, 0.4)),
      painter: Painter(),
    );
  }
}

class Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 1;

    var path = Path();

    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.7,
        size.width * 0.5, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9,
        size.width * 1.0, size.height * 0.8);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
