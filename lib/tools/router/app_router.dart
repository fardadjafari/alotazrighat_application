import 'package:alotazrighat_application/pages/helph_page/helph_page.dart';
import 'package:alotazrighat_application/pages/home_page/home_page.dart';
import 'package:alotazrighat_application/pages/layout_page.dart';
import 'package:alotazrighat_application/pages/login_page/login_page.dart';
import 'package:alotazrighat_application/pages/register_page/register_page.dart';
import 'package:alotazrighat_application/pages/welcom_page/welcom_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route<dynamic>? onGenerateRout(RouteSettings settings) {
    switch (settings.name) {
      case WelcomPage.screenId:
        return MaterialPageRoute(builder: (_) => const WelcomPage());

      case HelphPage.screenId:
        return MaterialPageRoute(builder: (_) => const HelphPage());

      case HomePage.screenId:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case LoginPage.screenId:
        return MaterialPageRoute(builder: (_) => const LoginPage());

      case RegisterPage.screenId:
        return MaterialPageRoute(builder: (_) => const RegisterPage());

      case Layout.screenId:
        return MaterialPageRoute(builder: (_) => const Layout());

      default:
        return null;
    }
  }
}
