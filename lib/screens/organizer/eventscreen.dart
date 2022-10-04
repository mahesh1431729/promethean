import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:promethean/screens/organizer/editevent.dart';
import 'package:promethean/screens/organizer/registeredscreen.dart';

import '../../utils/unitls.dart';
import 'announcements.dart';
import 'faqscreen.dart';

class OrganizerEventScreen extends StatefulWidget {
  OrganizerEventScreen({super.key});

  @override
  State<OrganizerEventScreen> createState() => _OrganizerEventScreenState();
}

class _OrganizerEventScreenState extends State<OrganizerEventScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backGoundColor,
      body: SingleChildScrollView(
        child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection("users")
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (context, snapShot) {
              return !snapShot.hasData
                  ? Container()
                  : Container(
                      child: StreamBuilder<
                              DocumentSnapshot<Map<String, dynamic>>>(
                          stream: FirebaseFirestore.instance
                              .collection('events')
                              .doc(snapShot.data!.get('id'))
                              .snapshots(),
                          builder: (context, snapshot) {
                            var images = [];
                            if (snapshot.hasData) {
                              images = snapshot.data!.get("gallery");
                            }
                            return !snapshot.hasData
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : Container(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: GestureDetector(
                                                  onTap: (() {
                                                    Navigator.pushAndRemoveUntil(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) => EditEvent(
                                                                date: snapshot
                                                                    .data!
                                                                    .get(
                                                                        'date'),
                                                                description: snapshot
                                                                    .data!
                                                                    .get(
                                                                        'description'),
                                                                eventName: snapshot
                                                                    .data!
                                                                    .get(
                                                                        'eventName'),
                                                                facultyContact:
                                                                    snapshot
                                                                        .data!
                                                                        .get(
                                                                            'facultyContact'),
                                                                facultyName:
                                                                    snapshot
                                                                        .data!
                                                                        .get('facultyName'),
                                                                fixedReg: snapshot.data!.get('fixedRegistration'),
                                                                image: snapshot.data!.get('eventImage'),
                                                                registrationFee: "${snapshot.data!.get('registrationFee')}",
                                                                registrationSize: "${snapshot.data!.get('registrationSize')}",
                                                                studentContact: snapshot.data!.get('studentContact'),
                                                                studentName: snapshot.data!.get('studentName'),
                                                                time: snapshot.data!.get('time'),
                                                                upiId: snapshot.data!.get('UPIID'),
                                                                id: snapshot.data!.id)),
                                                        (route) => true);
                                                  }),
                                                  child: Icon(
                                                    Icons.edit,
                                                    color: Colors.white,
                                                  )),
                                            ),
                                          ),
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          child: Image.network(
                                            snapshot.data!['eventImage'],
                                            fit: BoxFit.contain,
                                            // width: width * 0.95,
                                            // height: height * 0.25,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: width * 0.6,
                                                child: Text(
                                                  snapshot.data!['branch'],
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: width * 0.035,
                                                    fontFamily: "Urbanist",
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "${snapshot.data!['registrationCount']}",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: width * 0.035,
                                                  fontFamily: "Urbanist",
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              TextButton(
                                                  onPressed: () {
                                                    Future.delayed(
                                                        Duration.zero, () {
                                                      Navigator.pushAndRemoveUntil(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  Particpants(
                                                                      id: snapShot
                                                                          .data!
                                                                          .get(
                                                                              'id'))),
                                                          (route) => true);
                                                    });
                                                  },
                                                  child: Text(
                                                    "Registered",
                                                    style: TextStyle(
                                                      backgroundColor:
                                                          Colors.white,
                                                      color: Colors.black,
                                                      fontSize: width * 0.035,
                                                      fontFamily: "Urbanist",
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ))
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  snapshot.data!['eventName'],
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: width * 0.065,
                                                    fontFamily: "Urbanist",
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Container(
                                                  width: width * 0.35,
                                                  // height: 56,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: Colors.white,
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: MaterialButton(
                                                      onPressed: () {
                                                        Navigator
                                                            .pushAndRemoveUntil(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            AddAnnouncement(
                                                                              eventId: snapshot.data!.id,
                                                                              image: snapshot.data!.get('eventImage'),
                                                                              name: snapshot.data!.get('eventName'),
                                                                            )),
                                                                (route) =>
                                                                    true);
                                                      },
                                                      child: Center(
                                                        child: Text(
                                                          "Add\nAnnouncements",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize:
                                                                width * 0.035,
                                                            fontFamily:
                                                                "Urbanist",
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              snapshot.data!['date'],
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: width * 0.035,
                                                fontFamily: "Urbanist",
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20.0),
                                              child: Text(
                                                snapshot.data!['time'],
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Urbanist",
                                                  fontSize: width * 0.035,
                                                ),
                                              )),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Description",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30,
                                                fontFamily: "Urbanist",
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.85,
                                          child: Text(
                                            snapshot.data!['description'],
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Registration details",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30,
                                                fontFamily: "Urbanist",
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          snapshot.data!
                                                  .get('fixedRegistration')
                                              ? "${snapshot.data!.get('registrationSize')} participants compulsory"
                                              : "Upto ${snapshot.data!.get('registrationSize')} participants",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                          ),
                                        ),
                                        Text(
                                          snapshot.data!
                                                  .get('fixedRegistration')
                                              ? "Registration fee - ${snapshot.data!.get('registrationFee')} per team"
                                              : "Registration fee - ${snapshot.data!.get('registrationFee')} per head",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Contact details",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: width * 0.06,
                                                    fontFamily: "Urbanist",
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Text(
                                                  snapshot.data!['studentName'],
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: width * 0.045,
                                                    fontFamily: "Urbanist",
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Text(
                                                  "Student coordinator",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: width * 0.04,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Text(
                                                  snapshot
                                                      .data!['studentContact'],
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: width * 0.03,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Text(
                                                  snapshot.data!['facultyName'],
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: width * 0.045,
                                                    fontFamily: "Urbanist",
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Text(
                                                  "Faculty coordinator",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: width * 0.04,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Text(
                                                  snapshot
                                                      .data!['facultyContact'],
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: width * 0.03,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Gallery",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: width * 0.06,
                                                    fontFamily: "Urbanist",
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                IconButton(
                                                    onPressed: () {
                                                      String image;
                                                      bool get = false;
                                                      void
                                                          _getFromGallery() async {
                                                        XFile? pickedFile =
                                                            await ImagePicker()
                                                                .pickImage(
                                                                    source: ImageSource
                                                                        .gallery);
                                                        var imageFile = File(
                                                            pickedFile!.path);
                                                        print(
                                                            "adding file to DB");
                                                        final ref =
                                                            FirebaseStorage
                                                                .instance
                                                                .ref()
                                                                .child(
                                                                    "userImages")
                                                                .child(DateTime
                                                                        .now()
                                                                    .toString());
                                                        await ref
                                                            .putFile(imageFile);
                                                        String imageUrl =
                                                            await ref
                                                                .getDownloadURL();

                                                        setState(() {
                                                          image = imageUrl;
                                                          images.add(image);
                                                          get = true;
                                                        });

                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                'events')
                                                            .doc(snapshot
                                                                .data!.id)
                                                            .update({
                                                          'gallery': images
                                                        });
                                                      }

                                                      _getFromGallery();
                                                    },
                                                    icon: Icon(
                                                      Icons.add_circle,
                                                      color: Colors.white,
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: height * 0.25,
                                          width: width * 0.9,
                                          child: ListView.builder(
                                            itemCount: snapshot
                                                .data!['gallery'].length,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              images.add(snapshot
                                                  .data!['gallery'][index]);
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  child: Image.network(
                                                    // "assets/images/rectangle.png",
                                                    snapshot.data!['gallery']
                                                        [index],
                                                    fit: BoxFit.cover,
                                                    width: width * 0.8,
                                                    height: height * 0.25,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "For queries",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: width * 0.06,
                                                fontFamily: "Urbanist",
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: width * 0.75,
                                          height: 56,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.white,
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: MaterialButton(
                                              onPressed: () {
                                                Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          FAQscreen(
                                                        id: snapshot.data!.id,
                                                      ),
                                                    ),
                                                    (route) => true);
                                              },
                                              child: Center(
                                                child: Text(
                                                  "FAQ's",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: width * 0.035,
                                                    fontFamily: "Urbanist",
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                          }),
                    );
            }),
      ),
    );
  }
}
