import 'package:flutter/material.dart';
import 'package:placed/mvvm/views/HomeView/home.dart';

import '../../mvvm/views/Auth/Login/LoginScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      case '/home':
        return MaterialPageRoute(builder: (_) => Home());
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Error'),
        ),
      );
    });
  }
}
