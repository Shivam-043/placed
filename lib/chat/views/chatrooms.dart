import 'package:placed/chat/helper/authenticate.dart';
import 'package:placed/chat/helper/constants.dart';
import 'package:placed/chat/helper/helperfunctions.dart';
import 'package:placed/chat/helper/theme.dart';
import 'package:placed/chat/services/auth.dart';
import 'package:placed/chat/services/database.dart';
import 'package:placed/chat/views/chat.dart';
import 'package:placed/chat/views/search.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  // Stream chatRooms;

 List<Map<String, dynamic>> dummyChatRooms = [
    {
      'chatRoomId': 'user1_user2',
    },
    {
      'chatRoomId': 'user1_user3',
    },
    // Add more dummy chat rooms as needed
  ];

  Widget chatRoomsList() {
    return ListView.builder(
      itemCount: dummyChatRooms.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ChatRoomsTile(
          userName: dummyChatRooms[index]['chatRoomId']
              .toString()
              .replaceAll("_", "")
              .replaceAll(Constants.myName, ""),
          chatRoomId: dummyChatRooms[index]['chatRoomId'],
        );
      },
    );
  }

  @override
  void initState() {
    // getUserInfogetChats();
    super.initState();
  }

  // getUserInfogetChats() async {
  //   Constants.myName = await HelperFunctions.getUserNameSharedPreference();
  //   DatabaseMethods().getUserChats(Constants.myName).then((snapshots) {
  //     setState(() {
  //       chatRooms = snapshots;
  //       print(
  //           "we got the data + ${chatRooms.toString()} this is name  ${Constants.myName}");
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("chats"),
        elevation: 0.0,
        centerTitle: false,
        actions: [
          GestureDetector(
            onTap: () {
              // AuthService().signOut();
              // Navigator.pushReplacement(context,
              //     MaterialPageRoute(builder: (context) => Authenticate()));
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.exit_to_app)),
          )
        ],
      ),
      body: Container(
        child: chatRoomsList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => Search()));
        },
      ),
    );
  }
}

class ChatRoomsTile extends StatelessWidget {
  final String userName;
  final String chatRoomId;

  ChatRoomsTile({required this.userName,required this.chatRoomId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => Chat(
            chatRoomId: chatRoomId,
          )
        ));
      },
      child: Container(
        color: Colors.black26,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: CustomTheme.colorAccent,
                  borderRadius: BorderRadius.circular(30)),
              child: Text(userName.substring(0, 1),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'OverpassRegular',
                      fontWeight: FontWeight.w300)),
            ),
            SizedBox(
              width: 12,
            ),
            Text(userName,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'OverpassRegular',
                    fontWeight: FontWeight.w300))
          ],
        ),
      ),
    );
  }
}
