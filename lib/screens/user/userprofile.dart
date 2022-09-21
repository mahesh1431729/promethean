import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:promethean/screens/auth/login.dart';
import 'package:promethean/screens/user/registeredscreen.dart';
import 'package:promethean/utils/unitls.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String profileURL = "";
  void _getFromGallery() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    addImage(File(pickedFile!.path));

    // _cropImage(pickedFile!.path);
  }

  // void _cropImage(String filePath) async {
  //   CroppedFile? croppedImage =
  //       await ImageCropper().cropImage(sourcePath: filePath);
  //   if (croppedImage != null) {
  //     print("adding File to list");
  //     addImage(File(croppedImage.path));
  //   }
  // }

  void addImage(File? imageFile) async {
    print("adding file to DB");
    final ref = FirebaseStorage.instance
        .ref()
        .child("userImages")
        .child(DateTime.now().toString());
    await ref.putFile(imageFile!);
    String imageUrl = await ref.getDownloadURL();
    setState(() {
      profileURL = imageUrl;
    });
    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({"profileImage": profileURL});
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      color: AppColors.focusColor,
      child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection("users")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            return !snapshot.hasData
                ? Center(
                    child:
                        CircularProgressIndicator(color: AppColors.focusColor),
                  )
                : Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: -20,
                        child: Image.asset(
                          "assets/images/BACKGROUND.png",
                          fit: BoxFit.fitWidth,
                          // height: height * 0.3,
                          width: width,
                        ),
                      ),
                      Positioned(
                        top: height * 0.12,
                        child: Container(
                          height: height * 0.35,
                          width: width * 0.9,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x4c005fb6),
                                blurRadius: 20,
                                offset: Offset(0, 10),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(30),
                            color: AppColors.backGoundColor,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.18,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  snapshot.data!["name"],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width * 0.045,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Text(
                                snapshot.data!["collegeName"],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: width * 0.75,
                                  height: height * 0.15,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                  ),
                                  child: MaterialButton(
                                    onPressed: () {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RegisteredEvents()),
                                          (route) => true);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${snapshot.data!['registrationCount']}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: width * 0.065,
                                                fontFamily: "Roboto",
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              "Events\nRegistered",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: width * 0.03,
                                              ),
                                            )
                                          ],
                                        ),
                                        // Column(
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.spaceEvenly,
                                        //   crossAxisAlignment:
                                        //       CrossAxisAlignment.start,
                                        //   children: [
                                        //     Text(
                                        //       "Upcoming",
                                        //       textAlign: TextAlign.center,
                                        //       style: TextStyle(
                                        //         color: Colors.black,
                                        //         fontSize: width * 0.04,
                                        //         fontFamily: "Roboto",
                                        //         fontWeight: FontWeight.w700,
                                        //       ),
                                        //     ),
                                        //     Row(
                                        //       children: [
                                        //         ClipRRect(
                                        //           borderRadius:
                                        //               BorderRadius.circular(
                                        //                   width * 0.1),
                                        //           child: Image.asset(
                                        //             "assets/images/rectangle.png",
                                        //             fit: BoxFit.cover,
                                        //             width: width * 0.12,
                                        //             height: width * 0.12,
                                        //           ),
                                        //         ),
                                        //         Padding(
                                        //           padding: const EdgeInsets.only(
                                        //               left: 10.0),
                                        //           child: SizedBox(
                                        //             width: width * 0.2,
                                        //             child: Column(
                                        //               mainAxisAlignment:
                                        //                   MainAxisAlignment
                                        //                       .center,
                                        //               crossAxisAlignment:
                                        //                   CrossAxisAlignment
                                        //                       .start,
                                        //               children: [
                                        //                 Text(
                                        //                   "Event A",
                                        //                   style: TextStyle(
                                        //                     color: Colors.black,
                                        //                     fontSize:
                                        //                         width * 0.035,
                                        //                     fontFamily:
                                        //                         "Urbanist",
                                        //                     fontWeight:
                                        //                         FontWeight.w700,
                                        //                   ),
                                        //                 ),
                                        //                 Padding(
                                        //                   padding:
                                        //                       const EdgeInsets
                                        //                           .all(8.0),
                                        //                   child: Text(
                                        //                     "Oct 13, 2022",
                                        //                     style: TextStyle(
                                        //                       color: Color(
                                        //                           0x7f000000),
                                        //                       fontSize:
                                        //                           width * 0.025,
                                        //                     ),
                                        //                   ),
                                        //                 ),
                                        //               ],
                                        //             ),
                                        //           ),
                                        //         )
                                        //       ],
                                        //     ),
                                        //   ],
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: height * 0.5,
                        left: width * 0.1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Container(
                            //     padding: EdgeInsets.all(10),
                            //     width: width * 0.85,
                            //     height: 56,
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(8),
                            //       color: Color(0xff1e232c),
                            //     ),
                            //     child: ClipRRect(
                            //       borderRadius: BorderRadius.circular(8),
                            //       child: MaterialButton(
                            //         onPressed: (() {}),
                            //         child: Center(
                            //           child: Row(
                            //             mainAxisAlignment:
                            //                 MainAxisAlignment.spaceBetween,
                            //             children: [
                            //               Text(
                            //                 "Events registered",
                            //                 style: TextStyle(
                            //                   color: Colors.white,
                            //                   fontSize: width * 0.05,
                            //                   fontFamily: "Lato",
                            //                   fontWeight: FontWeight.w600,
                            //                 ),
                            //               ),
                            //               IconButton(
                            //                   onPressed: () {},
                            //                   icon: Icon(
                            //                     Icons.arrow_forward,
                            //                     color: AppColors.focusColor,
                            //                   ))
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Email",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: "Lato",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 21.67),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      snapshot.data!["email"],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 21.67),
                                  Text(
                                    "Contact number",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: "Lato",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 21.67),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      snapshot.data!["contact"],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: width * 0.85,
                          height: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xff1e232c),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: MaterialButton(
                              onPressed: (() {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => LoginScreen())),
                                    (route) => false);
                              }),
                              child: Center(
                                child: Text(
                                  "Sign Out",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width * 0.04,
                                    fontFamily: "Lato",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: height * 0.07,
                        child: Container(
                          height: width * 0.25,
                          width: width * 0.25,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: GestureDetector(
                              onTap: () {
                                _getFromGallery();
                              },
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(width * 0.25),
                                child: Image.network(
                                  snapshot.data!['profileImage'],
                                  fit: BoxFit.cover,
                                  height: width * 0.25,
                                  width: width * 0.25,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container()
                    ],
                  );
          }),
    );
  }
}
