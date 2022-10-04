import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:promethean/utils/unitls.dart';
import 'eventscreen.dart';
import 'regirationview.dart';

class Particpants extends StatefulWidget {
  Particpants({super.key, required this.id});
  String id;
  @override
  State<Particpants> createState() => _ParticpantsState();
}

class _ParticpantsState extends State<Particpants> {
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
                .collection('events')
                .doc(widget.id)
                .collection('registrations')
                .snapshots(),
            builder: (context, snapshot) {
              var len = 0;
              if (snapshot.hasData) {
                print(snapshot.data!.docs[0]);
                len = snapshot.data!.docs.length;
                print(len);
              }
              return !snapshot.hasData
                  ? Center(
                      child: CircularProgressIndicator(
                          color: AppColors.focusColor),
                    )
                  : snapshot.hasError
                      ? Center(
                          child: Text(
                          "No participants yet",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.055,
                            fontFamily: "Urbanist",
                            fontWeight: FontWeight.w700,
                          ),
                        ))
                      : ListView.builder(
                          itemCount: snapshot.data!.docs.length + 1,
                          itemBuilder: (context, index) {
                            return index == 0
                                ? Column(
                                    children: [
                                      // Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.spaceBetween,
                                      //   children: [
                                      //     Container(
                                      //       width: width,
                                      //       padding: EdgeInsets.all(10),
                                      //       color: AppColors.backGoundColor,
                                      //       child: Row(
                                      //         children: [
                                      //           StreamBuilder<
                                      //                   DocumentSnapshot<
                                      //                       Map<String,
                                      //                           dynamic>>>(
                                      //               stream: FirebaseFirestore
                                      //                   .instance
                                      //                   .collection("users")
                                      //                   .doc(FirebaseAuth
                                      //                       .instance
                                      //                       .currentUser!
                                      //                       .uid)
                                      //                   .snapshots(),
                                      //               builder: (context,
                                      //                   profileSnapshot) {
                                      //                 return profileSnapshot
                                      //                         .hasData
                                      //                     ? ClipRRect(
                                      //                         borderRadius:
                                      //                             BorderRadius
                                      //                                 .circular(
                                      //                                     width *
                                      //                                         0.14),
                                      //                         child:
                                      //                             Image.network(
                                      //                           profileSnapshot
                                      //                                   .data![
                                      //                               'profileImage'],
                                      //                           width: width *
                                      //                               0.14,
                                      //                           height: width *
                                      //                               0.14,
                                      //                           fit: BoxFit
                                      //                               .cover,
                                      //                         ))
                                      //                     : ClipRRect(
                                      //                         borderRadius:
                                      //                             BorderRadius
                                      //                                 .circular(
                                      //                                     width *
                                      //                                         0.14),
                                      //                         child:
                                      //                             Image.asset(
                                      //                           "assets/images/profile.jpeg",
                                      //                           width: width *
                                      //                               0.14,
                                      //                           height: width *
                                      //                               0.14,
                                      //                           fit: BoxFit
                                      //                               .cover,
                                      //                         ));
                                      //               }),
                                      //           // CircleAvatar(
                                      //           //   // minRadius: 100,
                                      //           //   // maxRadius: 200,
                                      //           //   radius: width * 0.07,
                                      //           // ),
                                      //           SizedBox(
                                      //             width: width * 0.02,
                                      //           ),
                                      //           Container(
                                      //             height: width * 0.16,
                                      //             child: Column(
                                      //               crossAxisAlignment:
                                      //                   CrossAxisAlignment
                                      //                       .start,
                                      //               mainAxisAlignment:
                                      //                   MainAxisAlignment
                                      //                       .center,
                                      //               children: [
                                      //                 Text(
                                      //                   "Welcome to Promethean!",
                                      //                   style: TextStyle(
                                      //                     color: Colors.white,
                                      //                     fontSize:
                                      //                         width * 0.03,
                                      //                   ),
                                      //                 ),
                                      //                 Text(
                                      //                   "Explore Events",
                                      //                   style: TextStyle(
                                      //                     color: Colors.white,
                                      //                     fontSize:
                                      //                         width * 0.04,
                                      //                     fontFamily:
                                      //                         "Urbanist",
                                      //                     fontWeight:
                                      //                         FontWeight.w700,
                                      //                   ),
                                      //                 )
                                      //               ],
                                      //             ),
                                      //           )
                                      //         ],
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Participants",
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
                                              "No participants yet",
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
                                : GestureDetector(
                                    onTap: (() {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ParticipantsView(
                                                      eventId: widget.id,
                                                      id: snapshot.data!
                                                          .docs[index - 1].id)),
                                          (route) => true);
                                    }),
                                    child: Container(
                                      color: Colors.white,
                                      width: width,
                                      padding: EdgeInsets.all(10),
                                      height: height * 0.1,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // ClipRRect(
                                          //   borderRadius: BorderRadius.circular(
                                          //       width * 0.1),
                                          //   child: Image.network(
                                          //     // "assets/images/rectangle.png",
                                          //     snapshot.data!.docs[index - 1]
                                          //         ['eventImage'],
                                          //     fit: BoxFit.cover,
                                          //     width: width * 0.15,
                                          //     height: width * 0.15,
                                          //   ),
                                          // ),
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
                                                      snapshot.data!
                                                              .docs[index - 1]
                                                          ['Name1'],
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: width * 0.04,
                                                        fontFamily: "Urbanist",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    // Text(
                                                    //   snapshot.data!
                                                    //           .docs[index - 1]
                                                    //       ['date'],
                                                    //   style: TextStyle(
                                                    //     color:
                                                    //         Color(0x7f000000),
                                                    //     fontSize: width * 0.028,
                                                    //   ),
                                                    // )
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                snapshot.data!.docs[index - 1]
                                                    ['CollegeName1'],
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: width * 0.04,
                                                  fontFamily: "Urbanist",
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                snapshot.data!.docs[index - 1]
                                                    ['email1'],
                                                style: TextStyle(
                                                  color: Color(0x7f000000),
                                                  fontSize: width * 0.032,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                            ;
                          });
            }),
      ),
    );
  }
}
