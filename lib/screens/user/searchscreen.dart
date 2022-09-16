import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../utils/unitls.dart';
import 'eventscreen.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backGoundColor,
      body: ListView(
        children: [
          Container(
            height: height,
            width: width,
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: height * 0.08,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FloatingActionButton(
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
                          Container(
                              width: width * 0.7,
                              height: 41,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                ),
                                color: Color(0x00c4c4c4),
                              ),
                              child: Center(
                                child: TextFormField(
                                  autofocus: true,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width * 0.04,
                                  ),
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.only(top: 10),
                                      hintText: "Search",
                                      hintStyle: TextStyle(
                                        color: Colors.white60,
                                        fontSize: width * 0.04,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: Colors.white,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      )),
                                ),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: height * 0.85,
                  child: ListView.builder(itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (() {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EventScreen()),
                            (route) => true);
                      }),
                      child: Container(
                        width: width * 0.85,
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
                                          color: Color.fromARGB(
                                              126, 225, 225, 225),
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
                                          color: Colors.white70,
                                          fontSize: width * 0.04,
                                          fontFamily: "Urbanist",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        "Thursday, 10:00 - 12:30 PM",
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              126, 228, 228, 228),
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
