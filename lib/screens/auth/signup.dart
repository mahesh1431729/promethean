import 'package:flutter/material.dart';
import 'package:promethean/screens/auth/login.dart';
import 'package:promethean/utils/unitls.dart';

import '../../widgets/auth/confirmpassword.dart';
import '../../widgets/auth/signup.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool details = true;
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
          onPressed: () {},
          // focusColor: AppColors.focusColor,
          backgroundColor: AppColors.focusColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
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
            height: height,
            width: width,
            child: Column(
              children: [
                details
                    ? Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            height: height * 0.7,
                            width: width,
                            decoration: BoxDecoration(
                              color: AppColors.focusColor,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40)),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                SizedBox(
                                  width: width * 0.75,
                                  child: Text(
                                    "Welcome! Glad to\n see you.",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: AppColors.backGoundColor,
                                      fontSize: width * 0.06,
                                      fontFamily: "Urbanist",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Container(
                                  width: width * 0.75,
                                  height: 56,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: Color(0xffdadada),
                                      width: 1,
                                    ),
                                    color: Color(0xfff7f8f9),
                                  ),
                                  child: TextFormField(
                                    style: TextStyle(
                                      color: AppColors.backGoundColor,
                                      fontSize: width * 0.04,
                                      fontFamily: "Urbanist",
                                      fontWeight: FontWeight.w700,
                                    ),
                                    decoration: InputDecoration(
                                        labelText: "Username",
                                        labelStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: width * 0.035,
                                          fontFamily: "Urbanist",
                                          fontWeight: FontWeight.w700,
                                        ),
                                        hintText: "Enter your name",
                                        hintStyle: TextStyle(
                                          color: Color(0xff8390a1),
                                          fontSize: width * 0.035,
                                          fontFamily: "Urbanist",
                                          fontWeight: FontWeight.w500,
                                        ),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none)),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Container(
                                  width: width * 0.75,
                                  height: 56,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: Color(0xffdadada),
                                      width: 1,
                                    ),
                                    color: Color(0xfff7f8f9),
                                  ),
                                  child: TextFormField(
                                    style: TextStyle(
                                      color: AppColors.backGoundColor,
                                      fontSize: width * 0.04,
                                      fontFamily: "Urbanist",
                                      fontWeight: FontWeight.w700,
                                    ),
                                    decoration: InputDecoration(
                                        labelText: "Email",
                                        labelStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: width * 0.035,
                                          fontFamily: "Urbanist",
                                          fontWeight: FontWeight.w700,
                                        ),
                                        hintText: "Enter your email",
                                        hintStyle: TextStyle(
                                          color: Color(0xff8390a1),
                                          fontSize: width * 0.035,
                                          fontFamily: "Urbanist",
                                          fontWeight: FontWeight.w500,
                                        ),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none)),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Container(
                                  width: width * 0.75,
                                  height: 56,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: Color(0xffdadada),
                                      width: 1,
                                    ),
                                    color: Color(0xfff7f8f9),
                                  ),
                                  child: TextFormField(
                                    style: TextStyle(
                                      color: AppColors.backGoundColor,
                                      fontSize: width * 0.04,
                                      fontFamily: "Urbanist",
                                      fontWeight: FontWeight.w700,
                                    ),
                                    decoration: InputDecoration(
                                        labelText: "College name",
                                        labelStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: width * 0.035,
                                          fontFamily: "Urbanist",
                                          fontWeight: FontWeight.w700,
                                        ),
                                        hintText: "Enter your college name",
                                        hintStyle: TextStyle(
                                          color: Color(0xff8390a1),
                                          fontSize: width * 0.035,
                                          fontFamily: "Urbanist",
                                          fontWeight: FontWeight.w500,
                                        ),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none)),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Container(
                                  width: width * 0.75,
                                  height: 56,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: Color(0xffdadada),
                                      width: 1,
                                    ),
                                    color: Color(0xfff7f8f9),
                                  ),
                                  child: TextFormField(
                                    style: TextStyle(
                                      color: AppColors.backGoundColor,
                                      fontSize: width * 0.04,
                                      fontFamily: "Urbanist",
                                      fontWeight: FontWeight.w700,
                                    ),
                                    decoration: InputDecoration(
                                        labelText: "Contact no",
                                        labelStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: width * 0.035,
                                          fontFamily: "Urbanist",
                                          fontWeight: FontWeight.w700,
                                        ),
                                        hintText: "Enter your contact no",
                                        hintStyle: TextStyle(
                                          color: Color(0xff8390a1),
                                          fontSize: width * 0.035,
                                          fontFamily: "Urbanist",
                                          fontWeight: FontWeight.w500,
                                        ),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none)),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.05,
                                ),
                                Container(
                                  width: width * 0.75,
                                  height: 56,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color(0xff1e232c),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: MaterialButton(
                                      onPressed: (() {
                                        setState(() {
                                          details = false;
                                        });
                                      }),
                                      child: Center(
                                        child: Text(
                                          "Next",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: width * 0.04,
                                            fontFamily: "Urbanist",
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Align(
                                  alignment: FractionalOffset.bottomCenter,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Already have an account?",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 15,
                                          letterSpacing: 0.15,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: (() {
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginScreen()),
                                              (route) => false);
                                        }),
                                        child: Text(
                                          "Login Now",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 15,
                                            letterSpacing: 0.15,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ),
                      )
                    : const ConfirmPasswordModule()
              ],
            ),
          )
        ],
      ),
    );
  }
}
