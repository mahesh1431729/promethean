import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:promethean/screens/user/faqscreen.dart';
import 'package:promethean/screens/user/teamregistrationsreen.dart';

import '../../utils/unitls.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backGoundColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    // height: height * 0.05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: FloatingActionButton(
                            mini: true,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            backgroundColor: AppColors.focusColor,
                            isExtended: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: (() {
                              showDialog(
                                  context: context,
                                  builder: ((context) {
                                    return Stack(
                                      children: [
                                        Positioned(
                                          top: height * 0.07,
                                          right: 50,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Material(
                                                child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "Announcements",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: width * 0.06,
                                                      fontFamily: "Urbanist",
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  Container(
                                                    height: height * 0.3,
                                                    width: width * 0.5,
                                                    child: ListView.builder(
                                                        itemBuilder:
                                                            (context, index) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: SizedBox(
                                                          width: width * 0.5,
                                                          child: Text(
                                                            "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum\nLorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum",
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0x7f000000),
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                  ),
                                                ],
                                              ),
                                            )),
                                          ),
                                        ),
                                      ],
                                    );
                                  }));
                            }),
                            child: SvgPicture.asset(
                                "assets/images/announcements.svg")),
                      ],
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  "assets/images/rectangle.png",
                  fit: BoxFit.cover,
                  width: width * 0.95,
                  height: height * 0.25,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "CSM",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.035,
                        fontFamily: "Urbanist",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "XXX Registered",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.035,
                        fontFamily: "Urbanist",
                        fontWeight: FontWeight.w700,
                      ),
                    )
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Event name",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.07,
                          fontFamily: "Urbanist",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                        width: width * 0.3,
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TeamRegistrationScreen(maxcount: 3)),
                                  (route) => true);
                            },
                            child: Center(
                              child: Text(
                                "Register",
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
                    "October 13, 2022",
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
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Thursday, 10:00 - 12:30 PM",
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
                height: 160,
                child: Text(
                  "About event\nLorem Lorem Lorem LoremLorem Lorem Lorem Lorem\nLorem Lorem Lorem LoremLorem Lorem Lorem Lorem\nLorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem\nLorem Lorem Lorem LoremLorem Lorem Lorem Lorem\nLorem Lorem Lorem LoremLorem Lorem Lorem Lorem\nLorem Lorem Lorem LoremLorem Lorem Lorem Lorem\nLorem Lorem Lorem LoremLorem Lorem Lorem Lorem\nLorem Lorem Lorem LoremLorem Lorem Lorem Lorem\nLorem Lorem Lorem LoremLorem Lorem Lorem Lorem",
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
              SizedBox(
                width: width * 0.85,
                height: 160,
                child: Text(
                  "Team details\nno of members\nfee details\nLorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem\nLorem Lorem Lorem LoremLorem Lorem Lorem Lorem\nLorem Lorem Lorem LoremLorem Lorem Lorem Lorem\nLorem Lorem Lorem LoremLorem Lorem Lorem Lorem\nLorem Lorem Lorem LoremLorem Lorem Lorem Lorem\nLorem Lorem Lorem LoremLorem Lorem Lorem Lorem\nLorem Lorem Lorem LoremLorem Lorem Lorem Lorem",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "Name",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.045,
                          fontFamily: "Urbanist",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "Student coordinator",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.04,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "987654321",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.03,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "Name",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.045,
                          fontFamily: "Urbanist",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "Faculty coordinator",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.04,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "987654321",
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
                  child: Text(
                    "Gallery",
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
                height: height * 0.25,
                width: width * 0.9,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          "assets/images/rectangle.png",
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
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FAQscreen(),
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
        ),
      ),
    );
  }
}
