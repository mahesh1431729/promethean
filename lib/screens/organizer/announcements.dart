import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../utils/unitls.dart';

class AddAnnouncement extends StatefulWidget {
  AddAnnouncement({
    super.key,
    required this.eventId,
    required this.image,
    required this.name,
  });
  String eventId;
  String image;
  String name;

  @override
  State<AddAnnouncement> createState() => _AddAnnouncementState();
}

class _AddAnnouncementState extends State<AddAnnouncement> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backGoundColor,
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
      body: ListView(
        children: [
          Container(
            height: height,
            width: width,
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Add Announcements",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xfffefefe),
                    fontSize: width * 0.06,
                    fontFamily: "Urbanist",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Title",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.04,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w600,
                      ),
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
                    controller: title,
                    style: TextStyle(color: Colors.white60),
                    minLines: 1,
                    decoration: InputDecoration(
                      hintText: "Title",
                      hintStyle: TextStyle(color: Colors.white60),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Description",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.04,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w600,
                      ),
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
                    controller: description,
                    style: TextStyle(color: Colors.white60),
                    minLines: 5,
                    maxLines: 10,
                    decoration: InputDecoration(
                      hintText: "Announcement description",
                      hintStyle: TextStyle(color: Colors.white60),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
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
                            showDialog(
                                context: context,
                                builder: (contex) {
                                  return Center(
                                    child: CircularProgressIndicator(
                                        color: AppColors.backGoundColor),
                                  );
                                });
                            FirebaseFirestore.instance
                                .collection('events')
                                .doc(widget.eventId)
                                .collection('announcements')
                                .add({
                              'title': title.text,
                              'description': description.text,
                              'eventImage': widget.image,
                              "eventName": widget.name,
                              "id": widget.eventId,
                            }).then((value) {
                              FirebaseFirestore.instance
                                  .collection('announcements')
                                  .add({
                                'title': title.text,
                                'description': description.text,
                                'eventImage': widget.image,
                                "eventName": widget.name,
                                "id": widget.eventId,
                              }).then((value) {
                                Navigator.pop(context);
                                const snackBar = SnackBar(
                                  content: Text('Announced'),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                Navigator.pop(context);
                              });
                            });
                          },
                          child: Center(
                            child: Text(
                              "Post",
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
          )
        ],
      ),
    );
  }
}
