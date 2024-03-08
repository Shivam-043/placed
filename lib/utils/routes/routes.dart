import 'package:flutter/material.dart';
import 'package:placed/chat/main.dart';
import 'package:placed/mvvm/views/CalendarView/event.dart';
import 'package:placed/mvvm/views/HomeView/home.dart';
import 'package:placed/mvvm/views/ProfileUpdate/updateProfile.dart';

import '../../mvvm/views/Auth/Login/LoginScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      case '/home':
        return MaterialPageRoute(builder: (_) => Home());
      case '/updateProfile':
        return MaterialPageRoute(builder: (_) => UpdateProfilePage());
      case '/chat':
        return MaterialPageRoute(builder: (_) => ChatApp());
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/event':
        return MaterialPageRoute(builder: (_) => MyEvent());
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
