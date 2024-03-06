import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:placed/utils/firebase/firebase_configure.dart';
import 'package:flutter/widgets.dart';
import 'package:placed/mvvm/views/ProfileUpdate/updateProfile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseConfigure().data
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Place It',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Bookish')),
        body: Center(
          child: Column(
            children: [Text("helllo govind ji"), Text("hello Anshu bro")],
          ),
        ),
      ),
    );
  }
}
