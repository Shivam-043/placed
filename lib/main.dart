import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:placed/mvvm/views/Auth/Login/LoginScreen.dart';
import 'package:placed/utils/firebase/firebase_configure.dart';
import 'package:placed/utils/routes/routes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/widgets.dart';
import 'package:placed/mvvm/views/ProfileUpdate/updateProfile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseConfigure().data);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: LoginScreen.routeName,
        onGenerateRoute: RouteGenerator.generateRoute,
      );
    });
  }
}
