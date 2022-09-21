import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:promethean/screens/auth/login.dart';
import 'package:promethean/screens/auth/signup.dart';
import 'package:promethean/screens/user/eventregistration.dart';
import 'package:promethean/screens/user/homescreen.dart';
import 'package:promethean/utils/unitls.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 300), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => FirebaseAuth.instance.currentUser == null
                ? const SignUpScreen()
                : const EventRegistration(),
          ),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: AppColors.backGoundColor,
        body: Center(
          child: Image.asset(
            "assets/images/finlalogo.png",
            height: height * 0.2,
            fit: BoxFit.contain,
          ),
        ));
  }
}
