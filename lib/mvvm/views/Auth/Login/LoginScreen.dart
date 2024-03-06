import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:placed/constants/constants.dart';
import 'package:placed/constants/images.dart';
import 'package:placed/mvvm/viewModels/Auth/userAuth.dart';
import 'package:placed/mvvm/views/HomeView/home.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(AppConstant().isLogin);
  }
  @override
  Widget build(BuildContext context) {
    if(AppConstant().isLogin){
      Navigator.pushNamedAndRemoveUntil(context, Home.routeName , (route) => false);
    }
    print(AppConstant().isLogin);
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
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.black54),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            width: 60,
            height: 60,
            child: ClipOval(
              child: Image.asset(
              AppImage.google,
                fit: BoxFit.contain,
                        ),
            ),
          ),
        ),
      ]),
    )));
  }
}
