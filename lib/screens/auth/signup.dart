import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:promethean/screens/auth/login.dart';
import 'package:promethean/utils/unitls.dart';

import 'confirmpassword.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  List list = [
    'CSE',
    'AIML & CSD',
    'IT & CSBS',
    'ECE',
    'EEE',
    'MECH',
    'CIVIL',
    'CHE',
    'PHE',
    'BME',
    'MBA'
  ];
  String dropdownValue = 'CSE';
  TextEditingController email = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController collegeName = TextEditingController();
  var key = GlobalKey<FormState>();
  bool details = true;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.all(10.0),
      //   child: FloatingActionButton(
      //     mini: true,
      //     onPressed: () {},
      //     // focusColor: AppColors.focusColor,
      //     backgroundColor: AppColors.focusColor,
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(12),
      //     ),
      //     child: Center(
      //       child: Icon(
      //         Icons.arrow_back_ios,
      //         color: Colors.black,
      //       ),
      //     ),
      //   ),
      // ),
      backgroundColor: AppColors.backGoundColor,
      body: ListView(
        children: [
          Container(
            height: height,
            width: width,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.3,
                  child: Center(
                      child: Image.asset(
                    'assets/images/finlalogo.png',
                    height: height * 0.3,
                    fit: BoxFit.contain,
                  )),
                ),
                details
                    ? Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Form(
                            key: key,
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
                                      validator: ((value) {
                                        MultiValidator([
                                          RequiredValidator(
                                              errorText:
                                                  "This field is required"),
                                        ]);
                                      }),
                                      controller: userName,
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
                                      validator: ((value) {
                                        MultiValidator([
                                          EmailValidator(
                                              errorText:
                                                  "Enthe a email address"),
                                          RequiredValidator(
                                              errorText:
                                                  "This field is required"),
                                        ]);
                                      }),
                                      controller: email,
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
                                    height: 41,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Color(0xffdadada),
                                        width: 1,
                                      ),
                                      color: Color(0xfff7f8f9),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: DropdownButton(
                                        selectedItemBuilder: (context) {
                                          print(dropdownValue);
                                          return [
                                            Center(
                                              child: Text(
                                                dropdownValue,
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            )
                                          ];
                                        },
                                        value: dropdownValue,
                                        underline: Container(),
                                        icon: Expanded(
                                            child: Icon(Icons.arrow_downward)),
                                        elevation: 16,
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255)),
                                        onChanged: (value) {
                                          setState(() {
                                            dropdownValue = value!;
                                          });
                                        },
                                        items:
                                            list.map<DropdownMenuItem>((value) {
                                          return DropdownMenuItem(
                                            onTap: () {
                                              setState(() {
                                                dropdownValue = value!;
                                              });
                                            },
                                            value: value,
                                            child: Text(value,
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          );
                                        }).toList(),
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
                                      validator: ((value) {
                                        MultiValidator([
                                          MinLengthValidator(10,
                                              errorText:
                                                  "Enter a valid contact number"),
                                          RequiredValidator(
                                              errorText:
                                                  "This field is required"),
                                        ]);
                                      }),
                                      controller: contact,
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
                                          if (key.currentState!.validate()) {
                                            setState(() {
                                              details = false;
                                            });
                                          }
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                        ),
                      )
                    : ConfirmPasswordModule(
                        branch: dropdownValue,
                        contact: contact.text,
                        userName: userName.text,
                        email: email.text,
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}
