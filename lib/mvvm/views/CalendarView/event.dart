import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyEvent extends StatelessWidget {
  const MyEvent({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: Color(0xFFf8edfe),
        appBar: AppBar(
          backgroundColor: Color(0xFFf8edfe),
          leading: BackButton(color: Colors.black),
          title: Text('PlaceIt'),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.notifications_active_sharp,
                  color: Color(0xFFc270a0),
                ),
                onPressed: () {}),
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(20)),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(children: [
                        Text("June 15",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFc270a0),
                            )),
                        Text("Tuesday",
                            style: TextStyle(
                              fontSize: 40,
                              color: Color(0xFFc270a0),
                            )),
                      ]),
                      Icon(
                        // Icons.assignment_outlined,
                        Icons.pending_actions_sharp,
                        weight: 10,
                        size: 70,
                        color: Color(0xFFc270a0),
                      ),
                    ]),
                Container(
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(10.0),
                  //   // color: Colors.white,
                  // ),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.white,
                        width: 17.0,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(35),
                    color: Colors.white,
                  ),
                  height: 510,
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.all(17.0),

                  // color: Colors.white,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Google Intern",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "(Online Assessment)",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            "Coding questions on DSA and MCQs on computer science fundamentals"),
                        Divider(
                          color: Colors.grey,
                          height: 45,
                          thickness: 2,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: Color(0xFFc270a0),
                            ),
                            SizedBox(
                              width: 15,
                              height: 40,
                            ),
                            Text(
                              "Color",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.alarm_sharp,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 15,
                              height: 40,
                            ),
                            Text(
                              "8:00 AM --> 10:00 AM",
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "2 hours",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.hourglass_bottom,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 15,
                              height: 40,
                            ),
                            Text(
                              "All day",
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.co_present,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 15,
                              height: 40,
                            ),
                            Text(
                              "Co. Engg, IT, ECE",
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.people,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 15,
                              height: 40,
                            ),
                            Text(
                              "200 participants",
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "online",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
