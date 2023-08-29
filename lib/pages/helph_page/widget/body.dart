import 'package:alotazrighat_application/pages/helph_page/widget/page_slider.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Icon? icon = const Icon(Icons.arrow_back_ios);

  @override
  Widget build(BuildContext context) {
    return LiquidSwipe(
        pages: PageSlider.getPage(context),
        enableLoop: false,
        enableSideReveal: false,
        ignoreUserGestureWhileAnimating: false,
        fullTransitionValue: 670,
        slideIconWidget: icon,
        waveType: WaveType.liquidReveal,
        positionSlideIcon: 0.7,
        onPageChangeCallback: pageChangeCallback);
  }

  void pageChangeCallback(int activePageIndex) {
    setState(() {
      if (activePageIndex == 3) {
        icon = null;
      }
    });
  }
}
