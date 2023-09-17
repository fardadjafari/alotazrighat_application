import 'package:alotazrighat_application/widget/input/location_picker.dart';
import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:alotazrighat_application/widget/shapes/wave_shape.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'widget/body.dart';

class RegisterPage extends StatelessWidget {
  static const String screenId = "/register_page";

  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        FadeInDown(
          child: Center(
            child: Align(
              alignment: Alignment.topCenter,
              child: WaveWidget(heightWave: getHeight(context, 0.0008)),
            ),
          ),
        ),
        const Body(),
      ]),
    );
  }
}
