import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
        child: ListView.builder(itemBuilder: (context, index) {
          return index == 0
              ? Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: width,
                          padding: EdgeInsets.all(10),
                          color: AppColors.backGoundColor,
                          child: Row(
                            children: [
                              ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(width * 0.14),
                                  child: Image.asset(
                                    "assets/images/profile.jpeg",
                                    width: width * 0.14,
                                    height: width * 0.14,
                                    fit: BoxFit.cover,
                                  )),
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
                    )
                  ],
                )
              : GestureDetector(
                  onTap: (() {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => EventScreen()),
                        (route) => true);
                  }),
                  child: Container(
                    width: width * 0.6,
                    padding: EdgeInsets.all(10),
                    height: width * 0.25,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(width * 0.1),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: width * 0.6,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Event A",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 0.04,
                                      fontFamily: "Urbanist",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    "Oct 13, 2022",
                                    style: TextStyle(
                                      color: Color.fromARGB(126, 226, 226, 226),
                                      fontSize: width * 0.028,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: width * 0.6,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "CSM",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 0.04,
                                      fontFamily: "Urbanist",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "Thursday, 10:00 - 12:30 PM",
                                    style: TextStyle(
                                      color: Color.fromARGB(126, 226, 226, 226),
                                      fontSize: width * 0.032,
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
        }),
      ),
    );
  }
}
