import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:placed/mvvm/views/Navigatioin/navigationDrawer.dart';
import 'package:placed/utils/widgets/spacing/spacing.dart';
import 'package:flutter/widgets.dart';
import 'package:placed/utils/fetchData/postData.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Home extends StatefulWidget {
  static const String routeName = '/';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool onPageVisited = false;
  getData() async {
    print("starting post ");
    await postData("http://172.16.168.32:4000/api/students/getstudent",
        {"email": "jigovind556"});
  }

  List<String> data = ['Week', "Month", 'Year'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Home Page'),
        ),
        drawer: NavigationPanel(onPageVisited: () {
          setState(() {
            onPageVisited = true;
          });
        }),
        backgroundColor: Color(0xFFE9ECF3),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                20.verticalSpace,
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 3,
                            width: 9.w,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                            )),
                        5.verticalSpace,
                        Container(
                            height: 3,
                            width: 7.w,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                            )),
                        5.verticalSpace,
                        Container(
                            height: 3,
                            width: 5.w,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                            )),
                      ],
                    )),
                10.verticalSpace,
                Container(
                  height: 12.h,
                  child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.4)),
                              color: (index == 0)
                                  ? Colors.white
                                  : Colors.transparent),
                          margin: EdgeInsets.all(10),
                          height: 10.h,
                          width: 35.sp,
                          child: Text(
                            (index + 10).toString(),
                            style: TextStyle(
                              fontFamily: "Stroke",
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                        );
                      }),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "June",
                                  style: TextStyle(
                                      fontFamily: "Stroke",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 50),
                                ),
                                Text(
                                  "12.06.23",
                                  style: TextStyle(
                                      fontFamily: "Stroke",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 40),
                                ),
                              ],
                            ),
                            VerticalDivider(
                              thickness: 1,
                              color: Colors.grey.withOpacity(0.4),
                            ),
                            10.horizontalSpace,
                            Text(
                              "2:22",
                              style: TextStyle(
                                  fontFamily: "Stroke",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 50),
                            ),
                            Text(
                              "PM",
                              style: TextStyle(
                                fontFamily: "Stroke",
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.grey,
                                fontFeatures: [FontFeature.enable('sups')],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "New York - 1:22 PM",
                            style: TextStyle(
                              fontFamily: "Stroke",
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          10.horizontalSpace,
                          Text(
                            "Moscow - 1:22 PM",
                            style: TextStyle(
                              fontFamily: "Stroke",
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Text(
                  "Upcoming Events",
                  style: TextStyle(
                    fontFamily: "Stroke",
                    fontWeight: FontWeight.w400,
                    fontSize: 30,
                  ),
                ),
                10.verticalSpace,
                Container(
                  height: 13.h,
                  child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border:
                                Border.all(color: Colors.grey.withOpacity(0.4)),
                            color: (index == 0)
                                ? Colors.white
                                : Colors.transparent,
                          ),
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(10),
                          height: 10.h,
                          width: 30.w,
                          child: Text(
                            data[index],
                            style: TextStyle(
                              fontFamily: "Stroke",
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                        );
                      }),
                ),
                10.verticalSpace,

                //grid view builder with having containers of variabe size
                StaggeredGrid.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  children: [
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 2,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/event');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Color(0xFFF8EDFE),
                          ),
                          height: Random().nextInt(100).toDouble(),
                          width: Random().nextInt(100).toDouble(),
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.cakeCandles,
                                    size: 40,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(
                                            color: Color(0xFFc270a0))),
                                    child: Icon(
                                      Icons.notifications_rounded,
                                      color: Color(0xFFc270a0),
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "June 15",
                                    style: TextStyle(
                                        fontFamily: "Stroke",
                                        fontWeight: FontWeight.w300,
                                        fontSize: 30),
                                  ),
                                  Text(
                                    "Tommy's Birthday",
                                    style: TextStyle(
                                        fontFamily: "Stroke",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Color(0xFFF0F8EB),
                        ),
                        padding: EdgeInsets.all(20),
                        height: 50.h,
                        width: Random().nextInt(100).toDouble(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "June 13",
                              style: TextStyle(
                                  fontFamily: "Stroke",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15),
                            ),
                            Text(
                              "Veterinary",
                              style: TextStyle(
                                  fontFamily: "Stroke",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Color(0xFFE8EFFF),
                        ),
                        width: Random().nextInt(100).toDouble(),
                        height: Random().nextInt(100).toDouble(),
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  FontAwesomeIcons.youtube,
                                  size: 40,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      border:
                                          Border.all(color: Color(0xFFc270a0))),
                                  child: Icon(
                                    Icons.notifications_rounded,
                                    color: Color(0xFFc270a0),
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "June 16",
                                  style: TextStyle(
                                      fontFamily: "Stroke",
                                      fontWeight: FontWeight.w300,
                                      fontSize: 30),
                                ),
                                Text(
                                  "Watch Courses",
                                  style: TextStyle(
                                      fontFamily: "Stroke",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Color(0xFFFEF1E8),
                        ),
                        padding: EdgeInsets.all(20),
                        width: Random().nextInt(100).toDouble(),
                        height: Random().nextInt(100).toDouble(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "June 17",
                              style: TextStyle(
                                  fontFamily: "Stroke",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15),
                            ),
                            Text(
                              "Meeting With Manager",
                              style: TextStyle(
                                  fontFamily: "Stroke",
                                  fontWeight: FontWeight.w300,
                                  fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
// =======
//       appBar: AppBar(
//         title: const Text('PlaceIt'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             ElevatedButton(
//                 onPressed: () {
//                   print("hello");
//                   // getData();
//                   Navigator.pushNamed(context, '/event');
//                 },
//                 child: Text("update profile"))
//           ],
//         ),
//       ),
// >>>>>>> a758ba23cddbae60c3adb289f97462bb94f7f89e
        );
  }
}
