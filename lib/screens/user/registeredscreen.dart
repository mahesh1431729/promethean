import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:promethean/screens/user/regirationview.dart';
import 'package:promethean/utils/unitls.dart';
import 'eventscreen.dart';

class RegisteredEvents extends StatefulWidget {
  const RegisteredEvents({super.key});

  @override
  State<RegisteredEvents> createState() => _RegisteredEventsState();
}

class _RegisteredEventsState extends State<RegisteredEvents> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backGoundColor,
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .collection('registrations')
                .snapshots(),
            builder: (context, snapshot) {
              return !snapshot.hasData
                  ? Center(
                      child: CircularProgressIndicator(
                          color: AppColors.focusColor),
                    )
                  : ListView.builder(
                      itemCount: snapshot.data!.docs.length + 1,
                      itemBuilder: (context, index) {
                        var len = snapshot.data!.docs.length;
                        return index == 0
                            ? Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: width,
                                        padding: EdgeInsets.all(10),
                                        color: AppColors.backGoundColor,
                                        child: Row(
                                          children: [
                                            StreamBuilder<
                                                    DocumentSnapshot<
                                                        Map<String, dynamic>>>(
                                                stream: FirebaseFirestore
                                                    .instance
                                                    .collection("users")
                                                    .doc(FirebaseAuth.instance
                                                        .currentUser!.uid)
                                                    .snapshots(),
                                                builder:
                                                    (context, profileSnapshot) {
                                                  return profileSnapshot.hasData
                                                      ? ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      width *
                                                                          0.14),
                                                          child: Image.network(
                                                            profileSnapshot
                                                                    .data![
                                                                'profileImage'],
                                                            width: width * 0.14,
                                                            height:
                                                                width * 0.14,
                                                            fit: BoxFit.cover,
                                                          ))
                                                      : ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      width *
                                                                          0.14),
                                                          child: Image.asset(
                                                            "assets/images/profile.jpeg",
                                                            width: width * 0.14,
                                                            height:
                                                                width * 0.14,
                                                            fit: BoxFit.cover,
                                                          ));
                                                }),
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
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Registered Events",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width * 0.055,
                                        fontFamily: "Urbanist",
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: len == 0 ? height * 0.3 : 0,
                                  ),
                                  len == 0
                                      ? Text(
                                          "You haven't registered for any event\nHurry up..!",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: width * 0.055,
                                            fontFamily: "Urbanist",
                                            fontWeight: FontWeight.w700,
                                          ),
                                        )
                                      : Container(),
                                ],
                              )
                            : StreamBuilder<
                                    DocumentSnapshot<Map<String, dynamic>>>(
                                stream: FirebaseFirestore.instance
                                    .collection('events')
                                    .doc(snapshot.data!.docs[index - 1]['id'])
                                    .snapshots(),
                                builder: (context, snapShot) {
                                  return !snapShot.hasData
                                      ? Container()
                                      : GestureDetector(
                                          onTap: (() {
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      RegistrationView(
                                                    id: snapshot.data!
                                                        .docs[index - 1]['id'],
                                                  ),
                                                ),
                                                (route) => true);
                                          }),
                                          child: Container(
                                            width: width * 0.6,
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
                                                            snapShot.data![
                                                                'eventName'],
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
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
                                                            snapShot
                                                                .data!['date'],
                                                            style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      126,
                                                                      226,
                                                                      226,
                                                                      226),
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
                                                            snapShot.data![
                                                                'branch'],
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
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
                                                            snapShot
                                                                .data!['time'],
                                                            style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      126,
                                                                      226,
                                                                      226,
                                                                      226),
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
                                });
                      });
            }),
      ),
    );
  }
}
