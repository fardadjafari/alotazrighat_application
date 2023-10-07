import 'dart:io';

import 'package:flutter/material.dart';

import 'widget/body.dart';

class HelphPage extends StatelessWidget {
  const HelphPage({super.key});
  static const String screenId = "/helph_page";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () => exit(0), child: const Body());
  }
}
