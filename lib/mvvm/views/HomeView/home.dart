import 'package:flutter/material.dart';
import 'package:placed/utils/widgets/spacing/spacing.dart';
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
    await postData("http://172.16.168.32:4000/api/students/getstudent",
        {"email": "jigovind556"});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
// <<<<<<< HEAD
//       body: Column(
//         children: <Widget>[
//           20.verticalSpace,
//           Icon()
//         ],
//       )
// =======
      appBar: AppBar(
        title: const Text('PlaceIt'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  print("hello");
                  getData();
                  //       Navigator.pushNamed(
                  // context,'/updateProfile');
                },
                child: Text("update profile"))
          ],
        ),
      ),
// >>>>>>> a758ba23cddbae60c3adb289f97462bb94f7f89e
    );
  }
}
