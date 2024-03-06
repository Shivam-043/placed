import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:placed/constants/images.dart';
import 'package:placed/mvvm/viewModels/Auth/userAuth.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(height: 20),
        Image.asset(AppImage.loginImage),
        SizedBox(height: 20),
        Text(
          'PlaceIt',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold , fontFamily: 'Stroke'),
        ),
        SizedBox(height: 20),
        Text(
          'Placement Intelligence and Transformation',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontFamily: 'Stroke'),
        ),
        SizedBox(height: 20),
        GestureDetector(
          onTap: (){
            UserAuth().googleSignInMethod(context);
          },
          child: Container(
            width: 50,
            height: 50,
            child: Image.asset(
            AppImage.google,
          ),
          ),
        ),
      ]),
    )));
  }
}
