import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:promethean/screens/user/eventscreen.dart';
import 'package:promethean/screens/user/searchscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/unitls.dart';
import '../../widgets/userHome/carazol.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String currentBranch = 'CSE';
  List branches = [
    ["CSE", true],
    ["AIML & CSD", false],
    ["IT & CSBS", false],
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
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              height: height,
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection('centralEvents')
                      .snapshots(),
                  builder: (context, snapshot) {
                    return !snapshot.hasData
                        ? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.focusColor,
                            ),
                          )
                        : ListView(
                            children: [
                              Container(
                                // height: height,
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: height * 0.1,
                                        ),
                                        Carasol(),
                                        SizedBox(
                                          height: height * 0.05,
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Central Events",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: width * 0.06,
                                              letterSpacing: 1,
                                              fontFamily: "Urbanist",
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.05,
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: height *
                                          0.3 *
                                          (snapshot.data!.docs.length % 2 + 2),
                                      child: GridView.builder(
                                          // shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 20,
                                            crossAxisSpacing: 20,
                                          ),
                                          itemCount: snapshot.data!.docs.length,
                                          itemBuilder: ((context, index) {
                                            return MaterialButton(
                                              onPressed: (() {
                                                Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            EventScreen(
                                                                id: snapshot
                                                                    .data!
                                                                    .docs[
                                                                        index -
                                                                            1]
                                                                    .get(
                                                                        'id'))),
                                                    (route) => true);
                                              }),
                                              child: Container(
                                                  height: height * 0.25,
                                                  width: width * 0.45,
                                                  child: Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Image.network(
                                                          snapshot.data!
                                                                  .docs[index]
                                                              ['eventImage'],
                                                          height: height * 0.25,
                                                          width: width * 0.45,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                      Positioned(
                                                        bottom: 0,
                                                        child: Container(
                                                          height: height * 0.05,
                                                          width: width * 0.45,
                                                          decoration: BoxDecoration(
                                                              color: Color(
                                                                      0xffffffff)
                                                                  .withOpacity(
                                                                      0.2),
                                                              borderRadius: BorderRadius.only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          10),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          10))),
                                                          child: Center(
                                                            child: Text(snapshot
                                                                    .data!
                                                                    .docs[index]
                                                                ['eventName']),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                            );
                                          })),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                  }),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.35,
              maxChildSize: 0.9,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: FirebaseFirestore.instance
                        .collection('events')
                        .where('branch', isEqualTo: currentBranch)
                        .snapshots(),
                    builder: (context, snapshot) {
                      return Container(
                        width: width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: !snapshot.hasData
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: Colors.black,
                                ),
                              )
                            : Center(
                                child: ListView.builder(
                                  controller: scrollController,
                                  itemCount: snapshot.data!.docs.length + 1,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return index == 0
                                        ? Container(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: height * 0.015,
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
                                                          "Branch Events",
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
                                                        const EdgeInsets.all(
                                                            8.0),
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
                                                                              [
                                                                              1]
                                                                          ? AppColors
                                                                              .focusColor
                                                                          : Colors
                                                                              .transparent),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            40),
                                                                    child:
                                                                        MaterialButton(
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          for (int i = 0;
                                                                              i < branches.length;
                                                                              i++) {
                                                                            branches[i][1] =
                                                                                false;
                                                                          }
                                                                          branches[index][1] =
                                                                              true;
                                                                          currentBranch =
                                                                              branches[index][0];
                                                                        });
                                                                      },
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsets.symmetric(
                                                                              horizontal: 15,
                                                                              vertical: 3),
                                                                          child:
                                                                              Text(
                                                                            "${branches[index][0]}",
                                                                            style:
                                                                                TextStyle(
                                                                              color: branches[index][1] ? Colors.black : Colors.white,
                                                                              fontSize: 16,
                                                                              fontFamily: "Urbanist",
                                                                              fontWeight: FontWeight.w500,
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
                                                          EventScreen(
                                                              id: snapshot
                                                                  .data!
                                                                  .docs[
                                                                      index - 1]
                                                                  .id)),
                                                  (route) => true);
                                            }),
                                            child: Container(
                                              width: width,
                                              padding: EdgeInsets.all(10),
                                              height: height * 0.1,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            width * 0.1),
                                                    child: Image.network(
                                                      // "assets/images/rectangle.png",
                                                      snapshot.data!
                                                              .docs[index - 1]
                                                          ['eventImage'],
                                                      fit: BoxFit.contain,
                                                      width: width * 0.15,
                                                      height: width * 0.15,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.02,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        width: width * 0.6,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              snapshot.data!
                                                                          .docs[
                                                                      index - 1]
                                                                  ['eventName'],
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize:
                                                                    width *
                                                                        0.04,
                                                                fontFamily:
                                                                    "Urbanist",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            ),
                                                            Text(
                                                              snapshot.data!
                                                                          .docs[
                                                                      index - 1]
                                                                  ['date'],
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0x7f000000),
                                                                fontSize:
                                                                    width *
                                                                        0.028,
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
                                                              snapshot.data!
                                                                          .docs[
                                                                      index - 1]
                                                                  ['branch'],
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize:
                                                                    width *
                                                                        0.04,
                                                                fontFamily:
                                                                    "Urbanist",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            Text(
                                                              snapshot.data!
                                                                          .docs[
                                                                      index - 1]
                                                                  ['time'],
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0x7f000000),
                                                                fontSize:
                                                                    width *
                                                                        0.032,
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
                              ),
                      );
                    });
              },
            ),
            Positioned(
              // top: height * 0.02,
              // left: 20,
              child: Container(
                width: width,
                padding: EdgeInsets.all(20),
                color: AppColors.backGoundColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // CircleAvatar(
                    //   // minRadius: 100,
                    //   // maxRadius: 200,
                    //   radius: width * 0.07,
                    // ),

                    Container(
                      height: width * 0.16,
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/finlalogo.png',
                            width: width * 0.14,
                            height: width * 0.14,
                            fit: BoxFit.contain,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
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
                        ],
                      ),
                    ),
                    StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                        stream: FirebaseFirestore.instance
                            .collection("users")
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .snapshots(),
                        builder: (context, profileSnapshot) {
                          void function() async {
                            SharedPreferences pref =
                                await SharedPreferences.getInstance();
                            pref.setInt('count',
                                profileSnapshot.data!['registrationCount']);
                          }

                          if (profileSnapshot.hasData) {
                            function();
                          }
                          return profileSnapshot.hasData
                              ? ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(width * 0.14),
                                  child: Image.network(
                                    profileSnapshot.data!['profileImage'],
                                    width: width * 0.14,
                                    height: width * 0.14,
                                    fit: BoxFit.cover,
                                  ))
                              : ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(width * 0.14),
                                  child: Image.asset(
                                    "assets/images/profile.jpeg",
                                    width: width * 0.14,
                                    height: width * 0.14,
                                    fit: BoxFit.cover,
                                  ));
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
