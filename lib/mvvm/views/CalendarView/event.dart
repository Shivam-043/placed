import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:placed/utils/widgets/spacing/spacing.dart';

class MyEvent extends StatefulWidget {
  const MyEvent({super.key});

  @override
  State<MyEvent> createState() => _MyEventState();
}

class _MyEventState extends State<MyEvent> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFf8edfe),
        // appBar: AppBar(
        //   backgroundColor: Color(0xFFf8edfe),
        //   leading: IconButton(
        //     icon: const Icon(
        //       Icons.arrow_back_ios_rounded,
        //       color: Color(0xFFc270a0),
        //     ),
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //   ),
        //   actions: [
        //     IconButton(
        //         icon: const Icon(
        //           Icons.notifications_active_sharp,
        //           color: Color(0xFFc270a0),
        //         ),
        //         onPressed: () {}),
        //   ],
        // ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                20.verticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Color(0xFFc270a0),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(0xc6c270a0),
                              width: 2.0,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(35),
                          // color: Colors.white,
                        ),
                        child: IconButton(
                            icon: const Icon(
                              Icons.notifications_rounded,
                              color: Color(0xFFc270a0),
                            ),
                            onPressed: () {}),
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.all(20)),
                const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(children: [
                        Text("June 15",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFc270a0),
                              fontFamily: 'Stroke'
                            )),
                        Text("Tuesday",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFc270a0),
                                fontFamily: 'Stroke'
                            )),
                      ]),
                      Icon(
                        Icons.cake_outlined,
                        weight: 10,
                        size: 70,
                        color: Color(0xFFc270a0),
                      ),
                    ]),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.white,
                        width: 17.0,
                        style: BorderStyle.solid),
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(50) , topRight: Radius.circular(50)),
                    color: Colors.white,
                  ),
                  height: 510,
                  alignment: Alignment.centerLeft,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        10.verticalSpace,
                        const Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text(
                            "Google Intern",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Stroke'
                            ),
                          ),
                          Text(
                            "(Online Assessment)",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w500,
                                fontFamily: 'Stroke'
                            ),
                          ),]),
                        ),
                        10.verticalSpace,
                        Text(
                            "Coding questions on DSA and MCQs on computer science fundamentals" , style: TextStyle(fontFamily: 'Stroke'),),
                        Divider(
                          color: Colors.grey.withOpacity(0.5),
                          height: 45,
                          thickness: 2,

                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: Color(0xFFc270a0),
                              size: 35,
                            ),
                            SizedBox(
                              width: 15,
                              height: 40,
                            ),
                            Text(
                              "Color",
                              style: TextStyle(fontSize: 18 , fontFamily: 'Stroke'),
                            ),
                          ],
                        ),
                        10.verticalSpace,
                        Row(
                          children: [
                            Icon(
                              Icons.watch_later_outlined,
                              color: Colors.grey,
                              size: 35,
                            ),
                            SizedBox(
                              width: 15,
                              height: 40,
                            ),
                            Text(
                              "8:00 AM --> 10:00 AM",
                              style: TextStyle(fontSize: 18,fontFamily: 'Stroke'),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "2 hours",
                              style: TextStyle(color: Colors.grey ,fontFamily: 'Stroke'),
                            )
                          ],
                        ),
                        10.verticalSpace,
                        Row(
                          children: [
                            Icon(
                              Icons.hourglass_bottom_rounded,
                              color: Colors.grey,
                              size: 35,
                            ),
                            SizedBox(
                              width: 15,
                              height: 40,
                            ),
                            Text(
                              "All day",
                              style: TextStyle(fontSize: 18 , fontFamily: 'Stroke'),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                        10.verticalSpace,
                        Row(
                          children: [
                            Icon(
                              Icons.co_present,
                              color: Colors.grey,
                              size: 35,
                            ),
                            SizedBox(
                              width: 15,
                              height: 40,
                            ),
                            Text(
                              "Co. Engg, IT, ECE",
                              style: TextStyle(fontSize: 18 , fontFamily: 'Stroke'),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                        10.verticalSpace,
                        Row(
                          children: [
                            Icon(
                              Icons.person_outline_rounded,
                              color: Colors.grey,
                              size: 35,
                            ),
                            SizedBox(
                              width: 15,
                              height: 40,
                            ),
                            Text(
                              "200 participants",
                              style: TextStyle(fontSize: 18 , fontFamily: 'Stroke'),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "online",
                              style: TextStyle(color: Colors.grey  , fontFamily: 'Stroke'),
                            )
                          ],
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
