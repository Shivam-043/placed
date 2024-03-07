import 'package:flutter/material.dart';
import 'package:placed/mvvm/viewModels/Auth/userAuth.dart';
import 'package:placed/utils/fetchData/postData.dart';

class NavigationPanel extends StatelessWidget {
  final VoidCallback onPageVisited;

  NavigationPanel({required this.onPageVisited});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        // width: MediaQuery.of(context).size.width * 0.65, // 65% of screen width
        color: Theme.of(context)
            .primaryColor, // Use primary theme color for background
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              // padding: EdgeInsets.symmetric(vertical: 1, horizontal: 16), // Adjust the padding here
              child: Text(
                "PlaceIt",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
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
