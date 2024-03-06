import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:placed/utils/fetchData/postData.dart';

class Home extends StatefulWidget {
  static const String routeName = '/';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  getData() async {
    print("startign post ");
    await postData("http://localhost:3000/api/students/getstudent",
        {"email": "jigovind556"});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PlaceIt'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  print("hello");
                  // getData();
                  Navigator.pushNamed(context, '/event');
                },
                child: Text("update profile"))
          ],
        ),
      ),
    );
  }
}
