import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:promethean/screens/user/eventregistration.dart';
import 'package:promethean/screens/user/homescreen.dart';

import 'login.dart';
import '../../utils/unitls.dart';

class ConfirmPasswordModule extends StatefulWidget {
  ConfirmPasswordModule({
    super.key,
    required this.branch,
    required this.contact,
    required this.email,
    required this.userName,
  });
  String userName;
  String email;
  String branch;
  String contact;
  @override
  State<ConfirmPasswordModule> createState() => _ConfirmPasswordModuleState();
}

class _ConfirmPasswordModuleState extends State<ConfirmPasswordModule> {
  bool isPassword = true;
  bool isconfirmPassword = true;
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  var key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Form(
          key: key,
          child: Container(
            padding: const EdgeInsets.all(10),
            height: height * 0.55,
            width: width,
            decoration: BoxDecoration(
              color: AppColors.focusColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(
                  width: width * 0.75,
                  child: Text(
                    "Welcome back! Glad to see you, Again!",
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
                        RequiredValidator(errorText: "This field is required"),
                      ]);
                    }),
                    controller: password,
                    obscureText: isPassword,
                    style: TextStyle(
                      color: AppColors.backGoundColor,
                      fontSize: width * 0.04,
                      fontFamily: "Urbanist",
                      fontWeight: FontWeight.w700,
                    ),
                    decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: width * 0.035,
                          fontFamily: "Urbanist",
                          fontWeight: FontWeight.w700,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isPassword = !isPassword;
                            });
                          },
                          child: Icon(
                            isPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Color(
                              0xff6A707C,
                            ),
                          ),
                        ),
                        hintText: "Enter your password",
                        hintStyle: TextStyle(
                          color: Color(0xff8390a1),
                          fontSize: width * 0.035,
                          fontFamily: "Urbanist",
                          fontWeight: FontWeight.w500,
                        ),
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
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
                    obscureText: isconfirmPassword,
                    controller: confirmPassword,
                    validator: ((value) {
                      MultiValidator([
                        RequiredValidator(errorText: "This field is required"),
                      ]);
                      if (value != password.text) {
                        return "Password didn't match";
                      }
                    }),
                    style: TextStyle(
                      color: AppColors.backGoundColor,
                      fontSize: width * 0.04,
                      fontFamily: "Urbanist",
                      fontWeight: FontWeight.w700,
                    ),
                    decoration: InputDecoration(
                        labelText: "Confirm password",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: width * 0.035,
                          fontFamily: "Urbanist",
                          fontWeight: FontWeight.w700,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isconfirmPassword = !isconfirmPassword;
                            });
                          },
                          child: Icon(
                            isconfirmPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Color(
                              0xff6A707C,
                            ),
                          ),
                        ),
                        hintText: "Re-enter the password",
                        hintStyle: TextStyle(
                          color: Color(0xff8390a1),
                          fontSize: width * 0.035,
                          fontFamily: "Urbanist",
                          fontWeight: FontWeight.w500,
                        ),
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
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
                          showDialog(
                              context: context,
                              builder: (contex) {
                                return Center(
                                  child: CircularProgressIndicator(
                                      color: AppColors.backGoundColor),
                                );
                              });
                          try {
                            FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: widget.email,
                                    password: password.text)
                                .then((value) => FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(FirebaseAuth
                                            .instance.currentUser!.uid)
                                        .set({
                                      'registrationCount': 0,
                                      "profileImage":
                                          "https://firebasestorage.googleapis.com/v0/b/promethean-bvrit.appspot.com/o/userImages%2F2022-09-17%2011%3A29%3A19.483030?alt=media&token=1407e358-8e33-4f7c-b95d-3520d7070b44",
                                      "name": widget.userName,
                                      "email": widget.email,
                                      "branch": widget.branch,
                                      "contact": widget.contact,
                                      'organizer ': false,
                                    }))
                                .then((value) {
                              FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(FirebaseAuth.instance.currentUser!.uid)
                                  .collection('registrations');
                              Navigator.pop(context);
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()),
                                  (route) => false);
                            });
                          } catch (e) {
                            if (e is PlatformException) {
                              if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
                                Navigator.pop(context);
                                showDialog(
                                    context: context,
                                    builder: (contex) {
                                      return Center(
                                          child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Material(
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'This email already exists..\n Please login',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: width * 0.04,
                                                    fontFamily: "Urbanist",
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                // width: width * 0.,
                                                height: 56,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: Color(0xff1e232c),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: MaterialButton(
                                                      onPressed: (() {}),
                                                      child: Center(
                                                        child: Text(
                                                          "Login",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize:
                                                                width * 0.04,
                                                            fontFamily:
                                                                "Urbanist",
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ));
                                    });
                              }
                            }
                          }
                        }
                      }),
                      child: Center(
                        child: Text(
                          "Continue",
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
                                  builder: (context) => LoginScreen()),
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
    );
  }
}
