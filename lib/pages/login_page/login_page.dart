import 'package:alotazrighat_application/widget/shapes/top_wave_shap.dart';
import 'package:alotazrighat_application/widget/shapes/wave_shape.dart';
import 'package:flutter/material.dart';

import 'widget/body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const String screenId = "/login_page";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Center(
          child: Align(
            alignment: Alignment.topCenter,
            child: WaveWidget(),
          ),
        ),
        Body(),
        Center(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: BottomWaveWidget(),
          ),
        )
      ]),
    );
  }
}
