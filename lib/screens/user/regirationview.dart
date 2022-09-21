import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:promethean/utils/unitls.dart';

class RegistrationView extends StatefulWidget {
  RegistrationView({
    super.key,
    required this.id,
  });
  String id;
  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backGoundColor,
      body: Container(
          padding: EdgeInsets.all(20),
          height: height,
          width: width,
          child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .collection('registrations')
                  .doc(widget.id)
                  .snapshots(),
              builder: (context, snapshot) {
                return !snapshot.hasData
                    ? CircularProgressIndicator(
                        color: AppColors.focusColor,
                      )
                    : ListView.builder(
                        itemCount: snapshot.data!['count'] + 1,
                        itemBuilder: (context, index) {
                          return index == 0
                              ? StreamBuilder<
                                      DocumentSnapshot<Map<String, dynamic>>>(
                                  stream: FirebaseFirestore.instance
                                      .collection('events')
                                      .doc(snapshot.data!.get('id'))
                                      .snapshots(),
                                  builder: (context, snapShot) {
                                    return !snapShot.hasData
                                        ? Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          )
                                        : Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Align(
                                                      alignment:
                                                          FractionalOffset
                                                              .centerLeft,
                                                      child:
                                                          FloatingActionButton(
                                                        mini: true,
                                                        onPressed: () {
                                                          Navigator.pop(
                                                            context,
                                                          );
                                                        },
                                                        backgroundColor:
                                                            AppColors
                                                                .focusColor,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child: Icon(
                                                            Icons
                                                                .arrow_back_ios,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 9,
                                                    child: Align(
                                                      alignment:
                                                          FractionalOffset
                                                              .center,
                                                      child: Text(
                                                        "Details",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xfffefefe),
                                                          fontSize:
                                                              width * 0.04,
                                                          fontFamily:
                                                              "Urbanist",
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: height * 0.05,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: width * 0.6,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          snapShot.data!
                                                              .get('eventName'),
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize:
                                                                width * 0.065,
                                                            fontFamily:
                                                                "Urbanist",
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                        SizedBox(height: 12.50),
                                                        Text(
                                                          snapShot.data!
                                                              .get('date'),
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize:
                                                                width * 0.04,
                                                            fontFamily:
                                                                "Urbanist",
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                        SizedBox(height: 12.50),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 15.0),
                                                          child: Text(
                                                            snapShot.data!
                                                                .get('time'),
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize:
                                                                  width * 0.04,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            width * 0.1),
                                                    child: Image.network(
                                                      snapShot.data!
                                                          .get('eventImage'),
                                                      fit: BoxFit.cover,
                                                      width: width * 0.15,
                                                      height: width * 0.15,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          );
                                  })
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // Text(
                                              //   "Team Member $index",
                                              //   style: TextStyle(
                                              //     color: Colors.black,
                                              //     fontSize: width * 0.045,
                                              //     fontFamily: "Urbanist",
                                              //     fontWeight: FontWeight.w700,
                                              //   ),
                                              // ),
                                              SizedBox(height: height * 0.01),
                                              Text(
                                                snapshot.data!['Name$index'],
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: width * 0.04,
                                                  fontFamily: "Urbanist",
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              SizedBox(height: height * 0.01),
                                              Text(
                                                snapshot
                                                    .data!['CollegeName$index'],
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: width * 0.035,
                                                  fontFamily: "Urbanist",
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              SizedBox(height: height * 0.01),
                                              Text(
                                                snapshot.data!['email$index'],
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: width * 0.035,
                                                  fontFamily: "Urbanist",
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              SizedBox(height: height * 0.01),
                                              Text(
                                                snapshot.data!['Contact$index'],
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: width * 0.035,
                                                  fontFamily: "Urbanist",
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                          index == 1
                                              ? ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          width * 0.1),
                                                  child: StreamBuilder<
                                                          DocumentSnapshot<
                                                              Map<String,
                                                                  dynamic>>>(
                                                      stream: FirebaseFirestore
                                                          .instance
                                                          .collection('users')
                                                          .doc(snapshot
                                                              .data!['userID'])
                                                          .snapshots(),
                                                      builder:
                                                          (context, snapShot) {
                                                        return Image.network(
                                                          snapShot.data![
                                                              'profileImage'],
                                                          height: width * 0.15,
                                                          width: width * 0.15,
                                                          fit: BoxFit.cover,
                                                        );
                                                      }),
                                                )
                                              : Container()
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                        });
              })),
    );
  }
}
