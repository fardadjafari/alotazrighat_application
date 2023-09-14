import 'package:alotazrighat_application/widget/shapes/top_wave_shap.dart';
import 'package:alotazrighat_application/widget/shapes/wave_shape.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'widget/body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const String screenId = "/login_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        FadeInDown(
          child: const Center(
            child: Align(
              alignment: Alignment.topCenter,
              child: WaveWidget(heightWave: 70),
            ),
          ),
        ),
        const Body(),
        FadeInUp(
          child: const Center(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: BottomWaveWidget(),
            ),
          ),
        )
      ]),
    );
  }
}
