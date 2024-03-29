import 'package:placed/chat/helper/authenticate.dart';
import 'package:placed/chat/helper/helperfunctions.dart';
import 'package:placed/chat/views/chatrooms.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _ChatAppState createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {


  @override
  void initState() {
    // getLoggedInState();
    super.initState();
  }

  // getLoggedInState() async {
  //   await HelperFunctions.getUserLoggedInSharedPreference().then((value){
  //     setState(() {
  //       userIsLoggedIn  = value;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterChat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff145C9E),
        scaffoldBackgroundColor: Color(0xff1F1F1F),
        // accentColor: Color(0xff007EF4),
        fontFamily: "OverpassRegular",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChatRoom() 
          
    );
  }
}
