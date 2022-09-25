import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:promethean/screens/organizer/eventscreen.dart';
import 'package:promethean/utils/unitls.dart';
import 'package:intl/intl.dart';

class EditEvent extends StatefulWidget {
  EditEvent({
    super.key,
    required this.id,
    required this.registrationFee,
    required this.studentName,
    required this.facultyName,
    required this.eventName,
    required this.description,
    required this.date,
    required this.fixedReg,
    required this.facultyContact,
    required this.registrationSize,
    required this.studentContact,
    required this.upiId,
    required this.time,
    required this.image,
  });
  String id;
  String eventName;
  String description;
  String date;
  String time;
  String registrationFee;
  String registrationSize;
  bool fixedReg;
  String facultyName;
  String facultyContact;
  String studentName;
  String studentContact;
  String upiId;
  String image;

  @override
  State<EditEvent> createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
  bool fixedReg = false;

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

  TextEditingController dateInput = TextEditingController();
  TextEditingController timeInput = TextEditingController();
  TextEditingController eventName = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController registrationFee = TextEditingController();
  TextEditingController registrationSize = TextEditingController();
  TextEditingController facultyName = TextEditingController();
  TextEditingController facultyNumber = TextEditingController();
  TextEditingController studentName = TextEditingController();
  TextEditingController studentNumber = TextEditingController();
  TextEditingController upiID = TextEditingController();

  String image =
      'https://firebasestorage.googleapis.com/v0/b/promethean-bvrit.appspot.com/o/userImages%2Frectangle.png?alt=media&token=a6e66c96-dc05-42db-8dae-1d369827a8ea';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backGoundColor,
      body: SingleChildScrollView(
        child: Container(
          height: height * 3,
          width: width,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: height * 0.1),
              Align(
                alignment: FractionalOffset.center,
                child: Text(
                  "Edit event",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xfffefefe),
                    fontSize: width * 0.045,
                    fontFamily: "Urbanist",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              GestureDetector(
                onTap: (() {
                  _getFromGallery();
                }),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: get
                          ? Image.network(image)
                          : Image.network(
                              widget.image,
                              fit: BoxFit.cover,
                              width: width * 0.95,
                              height: height * 0.25,
                            ),
                    ),
                    Center(
                      child: IconButton(
                          onPressed: (() {
                            _getFromGallery();
                          }),
                          icon: Icon(Icons.add_a_photo)),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "Event Name",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          width: width * 0.75,
                          height: 41,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            ),
                            color: Color(0x00c4c4c4),
                          ),
                          child: TextFormField(
                            // initialValue: snapshot.data!.get('eventName'),
                            initialValue: widget.eventName,
                            controller: eventName,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.04,
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "Description",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          width: width * 0.9,
                          // height: ,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            ),
                            color: Color(0x00c4c4c4),
                          ),
                          child: TextFormField(
                            // initialValue: snapshot.data!.get('description'),
                            initialValue: widget.description,
                            controller: description,
                            style: TextStyle(color: Colors.white60),
                            minLines: 1,
                            maxLines: 15,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.white60),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "Registraction Details",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              decoration: TextDecoration.underline,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "Fixed Registration",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    fixedReg = true;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 10,
                                        height: 10,
                                        color: fixedReg
                                            ? Colors.green
                                            : Colors.grey,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          "True",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    fixedReg = false;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 10,
                                        height: 10,
                                        color: !fixedReg
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          "False",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "Registraction fee (in numbers only)",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                            width: width * 0.75,
                            // height: 41,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.white,
                                width: 1,
                              ),
                              color: Color(0x00c4c4c4),
                            ),
                            child: TextFormField(
                              initialValue: widget.registrationFee,
                              // initialValue:
                              //     snapshot.data!.get('registrationFee'),
                              keyboardType: TextInputType.number,
                              controller: registrationFee,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.04,
                              ),
                              // minLines: 2,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              )),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "Maximum number of participants in a team(1 if individual)",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          width: width * 0.75,
                          height: 41,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            ),
                            color: Color(0x00c4c4c4),
                          ),
                          child: TextFormField(
                            // initialValue:
                            //     snapshot.data!.get('registrationSize'),
                            initialValue: widget.registrationFee,

                            keyboardType: TextInputType.number,
                            controller: registrationSize,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.04,
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Contact Details",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              decoration: TextDecoration.underline,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Text(
                          "Faculty Coordinator",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "Full name",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                            width: width * 0.75,
                            // height: 41,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.white,
                                width: 1,
                              ),
                              color: Color(0x00c4c4c4),
                            ),
                            child: TextFormField(
                              initialValue: widget.facultyName,

                              controller: facultyName,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.04,
                              ),
                              // minLines: 2,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              )),
                            )),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "Contact number",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          width: width * 0.75,
                          height: 41,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            ),
                            color: Color(0x00c4c4c4),
                          ),
                          child: TextFormField(
                            // initialValue: snapshot.data!.get('facultyContact'),
                            initialValue: widget.facultyContact,

                            controller: facultyNumber,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.04,
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Student Coordinator",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "Full name",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                            width: width * 0.75,
                            // height: 41,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.white,
                                width: 1,
                              ),
                              color: Color(0x00c4c4c4),
                            ),
                            child: TextFormField(
                              // initialValue: snapshot.data!.get('studentName'),
                              initialValue: widget.studentName,

                              controller: studentName,

                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.04,
                              ),
                              // minLines: 2,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              )),
                            )),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "Contact number",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          width: width * 0.75,
                          height: 41,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            ),
                            color: Color(0x00c4c4c4),
                          ),
                          child: TextFormField(
                            initialValue: widget.studentContact,

                            // initialValue: snapshot.data!.get('studentContact'),
                            controller: studentNumber,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.04,
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "UPI ID",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          width: width * 0.75,
                          height: 41,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            ),
                            color: Color(0x00c4c4c4),
                          ),
                          child: TextFormField(
                            initialValue: widget.upiId,

                            // initialValue: snapshot.data!.get('UPIID'),
                            controller: upiID,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.04,
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
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
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Center(
                                  child: CircularProgressIndicator(
                                color: Colors.white,
                              ));
                            });

                        FirebaseFirestore.instance
                            .collection("events")
                            .doc()
                            .update({
                          'eventName': eventName.text,
                          'description': description.text,
                          'registrationFee': int.parse(registrationFee.text),
                          'registrationSize': int.parse(registrationSize.text),
                          'facultyName': facultyName.text,
                          'facultyContact': facultyNumber.text,
                          'studentContact': studentNumber.text,
                          'studentName': studentName.text,
                          'eventImage': get ? image : widget.image,
                          'UPIID': upiID.text,
                          'fixedRegistration': fixedReg,
                          'gallery': [image],
                        }).then(
                          (value) {
                            Navigator.pop(context);
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OrganizerEventScreen()),
                                (route) => false);
                          },
                        );
                      },
                      child: Center(
                        child: Text(
                          "Add Event",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
