import 'package:alotazrighat_application/pages/helph_page/helph_page.dart';
import 'package:alotazrighat_application/pages/welcom_page/welcom_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route<dynamic>? onGenerateRout(RouteSettings settings) {
    switch (settings.name) {
      case WelcomPage.screenId:
        return MaterialPageRoute(builder: (_) => const WelcomPage());

      case HelphPage.screenId:
        return MaterialPageRoute(builder: (_) => const HelphPage());

      default:
        return null;
    }
  }
}
