import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:placed/utils/firebase/firebase_configure.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseConfigure().data
  );
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
        home: Scaffold(
          appBar: AppBar(title: Text('Bookish')),
          body: Center(
            child: Column(
              children: [Text("helllo govind ji"), Text("hello Anshu bro")],
            ),
          ),
        ),
      );
    });
  }
}
