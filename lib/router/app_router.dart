import 'package:flutter/material.dart';
import 'package:translate_app/views/translate/components/translate_screen.dart';

class AppRouter {
  Route? RouteChanger(settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const TranslateView());
      default:
        return null;
    }
  }
}
