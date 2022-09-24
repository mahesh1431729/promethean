import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:promethean/screens/user/homescreen.dart';
import 'package:promethean/utils/unitls.dart';
import 'package:qr/qr.dart';
import 'package:qr_svg_generator/qr_svg_generator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen(
      {Key? key,
      required this.id,
      this.details,
      required this.paymentQR,
      required this.amount,
      required this.count})
      : super(key: key);
  Widget paymentQR;
  int count;
  String amount;
  String id;
  var details;
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String image = '';
  bool get = false;
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
      image = imageUrl;
      get = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FloatingActionButton(
          mini: true,
          onPressed: () {
            Navigator.pop(context);
          },
          // focusColor: AppColors.focusColor,
          backgroundColor: AppColors.focusColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
      ),
      backgroundColor: AppColors.backGoundColor,
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            height: height,
            width: width,
            child: Column(
              children: [
                SizedBox(height: height * 0.05),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "PAYMENT",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xfffefefe),
                      fontSize: width * 0.06,
                      fontFamily: "Urbanist",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                Text(
                  "You are a step behind..!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xfffefefe),
                    fontSize: width * 0.06,
                    fontFamily: "Urbanist",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                SizedBox(
                  width: width * 0.8,
                  child: Text(
                    "Take a screenshot of the QR and complete your payment with any of the UPI payment application",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xfffefefe),
                      fontSize: width * 0.04,
                      fontFamily: "Urbanist",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: widget.paymentQR,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: width * 0.8,
                    child: Text(
                      "Upload a screenshot of your payment details and submit",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xfffefefe),
                        fontSize: width * 0.04,
                        fontFamily: "Urbanist",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      _getFromGallery();
                    },
                    child: Container(
                      height: height * 0.1,
                      width: width * 0.70,
                      decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(20)),
                      child: get
                          ? Image.network(image, fit: BoxFit.fitHeight)
                          : Center(
                              child: Icon(
                                Icons.add_a_photo_outlined,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                      width: width * 0.8,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: MaterialButton(
                          onPressed: () {
                            if (get) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  });
                              Map<String, dynamic> _data = {'image': image};

                              _data = (widget.details);
                              _data.addAll({
                                'amount': widget.amount,
                                'image': image,
                                'userID':
                                    FirebaseAuth.instance.currentUser!.uid,
                                'id': widget.id,
                                'count': widget.count,
                              });
                              // print(widget.details);
                              // for (int i = 0;
                              // i < widget.details.length;
                              // i++) {
                              //   _data.addAll(widget.details[i]);
                              // }
                              print(_data);
                              print(widget.details);
                              FirebaseFirestore.instance
                                  .collection('events')
                                  .doc(widget.id)
                                  .collection('registrations')
                                  .add(_data)
                                  .then((e_r) {
                                print("1");
                                FirebaseFirestore.instance
                                    .collection('events')
                                    .doc(widget.id)
                                    .update({
                                  'registrationCount': widget.count
                                }).then((_) async {
                                  print("2");
                                  FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(FirebaseAuth
                                          .instance.currentUser!.uid)
                                      .collection('registrations')
                                      .doc(widget.id)
                                      .set(_data)
                                      .then((value) async {
                                    print("3");
                                    SharedPreferences pref =
                                        await SharedPreferences.getInstance();
                                    int count = pref.getInt('count')!;
                                    FirebaseFirestore.instance
                                        .collection('users')
                                        .doc(FirebaseAuth
                                            .instance.currentUser!.uid)
                                        .update(
                                            {'registrationCount': count + 1});

                                    Navigator.pop(context);
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomeScreen()),
                                        (route) => false);
                                  });
                                });
                              });
                            } else {
                              const snackBar = SnackBar(
                                content: Text('Add screenshot of the payment'),
                              );

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                          child: Center(
                            child: Text(
                              "Submit",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: width * 0.04,
                                fontFamily: "Urbanist",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
