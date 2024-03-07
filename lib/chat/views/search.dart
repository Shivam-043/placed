import 'package:placed/chat/helper/constants.dart';
import 'package:placed/chat/models/user.dart';
import 'package:placed/chat/services/database.dart';
import 'package:placed/chat/views/chat.dart';
import 'package:placed/chat/widget/widget.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchEditingController = TextEditingController();
  bool isLoading = false;
  bool haveUserSearched = false;

  List<Map<String, String>> dummyUsers = [
    {"userName": "User1", "userEmail": "user1@example.com"},
    {"userName": "User2", "userEmail": "user2@example.com"},
    // Add more dummy users as needed
  ];

  initiateSearch() {
    if (searchEditingController.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });

      // Simulating a delay for searching (you can remove this in a real app)
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          haveUserSearched = true;
          isLoading = false;
        });
      });
    }
  }

  Widget userList() {
    return haveUserSearched
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: dummyUsers.length,
            itemBuilder: (context, index) {
              return userTile(
                dummyUsers[index]["userName"]!,
                dummyUsers[index]["userEmail"]!,
              );
            },
          )
        : Container();
  }

  sendMessage(String userName) {
    // Simulate sending a message (replace with actual logic)
    print("Sending message to $userName");
  }

  Widget userTile(String userName, String userEmail) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                userEmail,
                style: TextStyle(color: Colors.white, fontSize: 16),
              )
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              sendMessage(userName);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(24)),
              child: Text(
                "Message",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    color: Color(0x54FFFFFF),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: searchEditingController,
                            style: simpleTextStyle(),
                            decoration: InputDecoration(
                                hintText: "search username ...",
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                                border: InputBorder.none),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            initiateSearch();
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      const Color(0x36FFFFFF),
                                      const Color(0x0FFFFFFF)
                                    ],
                                    begin: FractionalOffset.topLeft,
                                    end: FractionalOffset.bottomRight),
                                borderRadius: BorderRadius.circular(40)),
                            padding: EdgeInsets.all(12),
                            child: Image.asset(
                              "assets/images/search_white.png",
                              height: 25,
                              width: 25,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  userList(),
                ],
              ),
            ),
    );
  }
}

