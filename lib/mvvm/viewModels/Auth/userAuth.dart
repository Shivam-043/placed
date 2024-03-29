import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:placed/constants/strings.dart';
import 'package:placed/mvvm/Models/student.model.dart';
import 'package:placed/mvvm/views/Auth/Login/LoginScreen.dart';
import 'package:placed/mvvm/views/HomeView/home.dart';
import 'package:placed/utils/fetchData/postData.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/constants.dart';
import '../../../utils/widgets/snackbar/snackbar.dart';

class UserAuth extends ChangeNotifier {
  UserAuth() {
    readFromSharedPreferences();
  }

  User? _user = FirebaseAuth.instance.currentUser;

  User? get user => _user;

  Future<void> googleSignInMethod(BuildContext context) async {
    try {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      final GoogleSignIn _googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser!.email.endsWith('@nitkkr.ac.in')) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        await signInWithGoogle(context, credential);
      } else {
        _auth.signOut();
        _googleSignIn.signOut();
        showSnackBar(
            context: context, message: "Please use your college email id");
      }
    } catch (e) {
      showSnackBar(
          context: context,
          message: "Unable to continue with google in method");
      log(e.toString());
    }
  }

  //google sign in
  Future<void> signInWithGoogle(
      BuildContext context, AuthCredential credential) async {
    try {
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) async {
        if (value.user != null) {
          Student student = Student(
            name: value.user!.displayName!,
            email: value.user!.email!,
            mobileNumber: value.user!.phoneNumber ?? '',
            photo: value.user!.photoURL ?? '',
          );

          // AppConstant.student = student;
          Map<dynamic,dynamic> resp = await postData("/api/students/register", student.toMap());
          AppConstant.student = Student.fromJson(resp['user']);
          AppConstant.isLogin = true;
          await saveToSharedPreferences(student).then((value) =>
              Navigator.pushNamedAndRemoveUntil(
                  context, Home.routeName, (route) => false));
        }
      }).catchError((e) {
        showSnackBar(context: context, message: e.toString());
        log(e.toString());
      });
    } on Exception catch (e) {
      debugPrintStack();
      log(e.toString());
      GoogleSignIn().signOut();
    }
  }

  Future<void> saveToSharedPreferences(Student student) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(AppStrings.prefLogin, true);
    prefs.setString(AppStrings.prefUser, jsonEncode(student.toMap()));
  }

  Future<void> readFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    AppConstant.isLogin = prefs.getBool(AppStrings.prefLogin) ?? false;
    if (prefs.getBool(AppStrings.prefLogin) == true) {
      String? user = prefs.getString(AppStrings.prefUser);
      if (user != null) {
        AppConstant.student = Student.fromJson(jsonDecode(user));
      } else {
        AppConstant.student = Student();
      }
    }
  }

  //signOut
  Future<void> signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut().then((value) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool(AppStrings.prefLogin, false);
        await prefs.remove(AppStrings.prefUser);
        AppConstant.isLogin = false;
        GoogleSignIn().signOut().then((value) =>
            Navigator.pushNamedAndRemoveUntil(
                context, LoginScreen.routeName, (route) => false));
        // context, "/chat", (route) => false));
      });
    } catch (e) {
      showSnackBar(context: context, message: e.toString());
      log(e.toString());
    }
  }
}
