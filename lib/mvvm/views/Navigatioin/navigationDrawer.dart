import 'package:flutter/material.dart';
import 'package:placed/constants/constants.dart';
import 'package:placed/mvvm/viewModels/Auth/userAuth.dart';
import 'package:placed/utils/fetchData/postData.dart';

class NavigationPanel extends StatelessWidget {
  final VoidCallback onPageVisited;

  NavigationPanel({required this.onPageVisited});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "PlaceIt",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Display user's photo and name from AppConstant.student
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        // Assuming AppConstant.student has a field 'photoUrl'
                        backgroundImage:
                            NetworkImage(AppConstant.student.photo ?? ''),
                      ),
                      SizedBox(width: 10),
                      Text(
                        AppConstant.student?.name ?? '',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.white,
              thickness: 2,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    onTap: () async {
                      onPageVisited(); // Notify the HomePage that the user visited another page
                      Navigator.pushNamed(context, '/home');
                    },
                    title: Text(
                      "Home",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  ListTile(
                    onTap: () async {
                      onPageVisited(); // Notify the HomePage that the user visited another page
                      Navigator.pushNamed(context, '/updateProfile');
                    },
                    title: Text(
                      "Update Profile",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  ListTile(
                    onTap: () async {
                      onPageVisited();
                      Navigator.pushNamed(context, '/chat');
                    },
                    title: Text(
                      "Chat",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  ListTile(
                    onTap: () async {
                      onPageVisited();
                      // Navigator.pushNamed(context, '/backupPage');
                    },
                    title: Text(
                      "My Applications",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  ListTile(
                    onTap: () async {
                      onPageVisited();
                      // Navigator.pushNamed(context, '/backupPage');
                    },
                    title: Text(
                      "Settings",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  ListTile(
                    onTap: () async {
                      onPageVisited();
                      // Navigator.pushNamed(context, '/backupPage');
                      print("checking post ");
                      Map<dynamic,dynamic>resp=await postData(
                          "/api/students/getstudent",
                          {"email": "jigovind556@gmail.com"});

                          print("response is :  ${resp['user']}");
                    },
                    title: Text(
                      "Help",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  ListTile(
                    onTap: () async {
                      onPageVisited();
                      // Navigator.pushNamed(context, '/backupPage');
                    },
                    title: Text(
                      "Share Feedback",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              onTap: () async {
                // onPageVisited(); // Notify the HomePage that the user visited another page
                // SharedPref sharedPref = SharedPref();
                // await sharedPref.remove("user");
                // Navigator.pushReplacementNamed(context, '/login');
                await UserAuth().signOut(context);
              },
              title: Text(
                "Log Out",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
