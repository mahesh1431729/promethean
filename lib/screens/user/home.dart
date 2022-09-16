import 'package:flutter/material.dart';
import 'package:promethean/screens/user/eventscreen.dart';
import 'package:promethean/screens/user/searchscreen.dart';
import '../../utils/unitls.dart';
import '../../widgets/userHome/carazol.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List branches = [
    ["CSE", true],
    ["CSM", false],
    ["CSD", false],
    ["CSBS", false],
    ["AIDS", false],
    ["INF", false],
    ["ECE", false],
    ["EEE", false],
    ["MECH", false],
    ["CIVIL", false],
    ["CHE", false],
    ["BME", false],
    ["PHE", false],
    ["MBA", false],
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: AppColors.backGoundColor,
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Align(
                    alignment: FractionalOffset.topCenter,
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15),
                          height: height,
                          child:
                              ListView.builder(itemBuilder: ((context, index) {
                            return index == 0
                                ? Stack(
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: width * 0.16,
                                          ),
                                          Carasol(),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Announcements",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: width * 0.06,
                                                letterSpacing: 1,
                                                fontFamily: "Urbanist",
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                : Container(
                                    height: width * 0.25,
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              width * 0.1),
                                          child: Image.asset(
                                            "assets/images/rectangle.png",
                                            fit: BoxFit.cover,
                                            width: width * 0.15,
                                            height: width * 0.15,
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Event A",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: width * 0.04,
                                                fontFamily: "Urbanist",
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            SizedBox(
                                              width: width * 0.7,
                                              child: Text(
                                                "Lorem Ipsum Lorem Ipsum Lorem Ipsum\nLorem Ipsum",
                                                style: TextStyle(
                                                  color: Color(0x7fffffff),
                                                  fontSize: 14,
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                          })),
                        ),
                        DraggableScrollableSheet(
                          initialChildSize: 0.35,
                          maxChildSize: 0.9,
                          builder: (BuildContext context,
                              ScrollController scrollController) {
                            return Container(
                              width: width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40),
                                ),
                              ),
                              child: ListView.builder(
                                controller: scrollController,
                                itemCount: 25,
                                itemBuilder: (BuildContext context, int index) {
                                  return index == 0
                                      ? Container(
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: height * 0.03,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: width * 0.08),
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Events",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize:
                                                              width * 0.06,
                                                          fontFamily:
                                                              "Urbanist",
                                                          fontWeight:
                                                              FontWeight.w900,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: width *
                                                                    0.08),
                                                        child: IconButton(
                                                          onPressed: () {
                                                            Navigator.pushAndRemoveUntil(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            Search()),
                                                                (route) =>
                                                                    true);
                                                          },
                                                          icon: Icon(
                                                              Icons.search),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.center,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    width: width * 0.8,
                                                    height: 55,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40),
                                                        color: AppColors
                                                            .backGoundColor),
                                                    child: ListView.builder(
                                                        itemCount:
                                                            branches.length,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(4.0),
                                                            child: Container(
                                                                height: 45,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            40),
                                                                    color: branches[index]
                                                                            [1]
                                                                        ? AppColors
                                                                            .focusColor
                                                                        : Colors
                                                                            .transparent),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              40),
                                                                  child:
                                                                      MaterialButton(
                                                                    onPressed:
                                                                        () {
                                                                      setState(
                                                                          () {
                                                                        for (int i =
                                                                                0;
                                                                            i < branches.length;
                                                                            i++) {
                                                                          branches[i][1] =
                                                                              false;
                                                                        }
                                                                        branches[index][1] =
                                                                            true;
                                                                      });
                                                                    },
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsets.symmetric(
                                                                            horizontal:
                                                                                15,
                                                                            vertical:
                                                                                3),
                                                                        child:
                                                                            Text(
                                                                          "${branches[index][0]}",
                                                                          style:
                                                                              TextStyle(
                                                                            color: branches[index][1]
                                                                                ? Colors.black
                                                                                : Colors.white,
                                                                            fontSize:
                                                                                16,
                                                                            fontFamily:
                                                                                "Urbanist",
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )),
                                                          );
                                                        }),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      : GestureDetector(
                                          onTap: (() {
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        EventScreen()),
                                                (route) => true);
                                          }),
                                          child: Container(
                                            width: width * 0.85,
                                            padding: EdgeInsets.all(10),
                                            height: width * 0.25,
                                            child: Row(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          width * 0.1),
                                                  child: Image.asset(
                                                    "assets/images/rectangle.png",
                                                    fit: BoxFit.cover,
                                                    width: width * 0.15,
                                                    height: width * 0.15,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width * 0.02,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: width * 0.6,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "Event A",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  width * 0.04,
                                                              fontFamily:
                                                                  "Urbanist",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                          Text(
                                                            "Oct 13, 2022",
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0x7f000000),
                                                              fontSize:
                                                                  width * 0.028,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: width * 0.6,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "CSM",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  width * 0.04,
                                                              fontFamily:
                                                                  "Urbanist",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          Text(
                                                            "Thursday, 10:00 - 12:30 PM",
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0x7f000000),
                                                              fontSize:
                                                                  width * 0.032,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                },
                              ),
                            );
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width,
                              padding: EdgeInsets.all(10),
                              color: AppColors.backGoundColor,
                              child: Row(
                                children: [
                                  ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(width * 0.14),
                                      child: Image.asset(
                                        "assets/images/profile.jpeg",
                                        width: width * 0.14,
                                        height: width * 0.14,
                                        fit: BoxFit.cover,
                                      )),
                                  // CircleAvatar(
                                  //   // minRadius: 100,
                                  //   // maxRadius: 200,
                                  //   radius: width * 0.07,
                                  // ),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  Container(
                                    height: width * 0.16,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Welcome to Promethean!",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: width * 0.03,
                                          ),
                                        ),
                                        Text(
                                          "Explore Events",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: width * 0.04,
                                            fontFamily: "Urbanist",
                                            fontWeight: FontWeight.w700,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
