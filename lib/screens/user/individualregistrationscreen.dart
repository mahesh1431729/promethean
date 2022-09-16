import 'package:flutter/material.dart';
import 'package:promethean/utils/unitls.dart';

class IndividualRegistrationScreen extends StatefulWidget {
  const IndividualRegistrationScreen({super.key});

  @override
  State<IndividualRegistrationScreen> createState() =>
      _IndividualRegistrationScreenState();
}

class _IndividualRegistrationScreenState
    extends State<IndividualRegistrationScreen> {
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
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: FractionalOffset.centerLeft,
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
                    ),
                    Expanded(
                      flex: 9,
                      child: Align(
                        alignment: FractionalOffset.center,
                        child: Text(
                          "Register",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xfffefefe),
                            fontSize: 22,
                            fontFamily: "Urbanist",
                            fontWeight: FontWeight.w600,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: width * 0.6,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Event name",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.065,
                              fontFamily: "Urbanist",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 12.50),
                          Text(
                            "October 13, 2022",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.04,
                              fontFamily: "Urbanist",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 12.50),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              "Thursday, 10:00 - 12:30 PM",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.04,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(width * 0.1),
                      child: Image.asset(
                        "assets/images/rectangle.png",
                        fit: BoxFit.cover,
                        width: width * 0.15,
                        height: width * 0.15,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "Full Name",
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
                              "College Name",
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
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                              )),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "Email ID (College mail ID)",
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
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                              )),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "Contact No",
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
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Padding(
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
                          onPressed: () {},
                          child: Center(
                            child: Text(
                              "Register and pay",
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
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
