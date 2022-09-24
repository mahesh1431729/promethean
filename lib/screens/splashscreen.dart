import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:promethean/screens/auth/login.dart';
import 'package:promethean/screens/auth/signup.dart';
import 'package:promethean/screens/organizer/eventscreen.dart';
import 'package:promethean/screens/user/eventregistration.dart';
import 'package:promethean/screens/user/homescreen.dart';
import 'package:promethean/utils/unitls.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    Timer(Duration(milliseconds: 300), () async {
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => FirebaseAuth.instance.currentUser != null
      //           ? SignUpScreen()
      //           : HomeScreen(),
      //     ),
      //     (route) => false);
      if (FirebaseAuth.instance.currentUser != null) {
        // bool val = await FirebaseFirestore.instance
        //     .collection('users')
        //     .doc(FirebaseAuth.instance.currentUser!.uid)
        //     .snapshots()
        //     .contains('organizer ');
        bool val = false;

        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();

        val = sharedPreferences.getBool('organizer') ==null? false : sharedPreferences.getBool('organizer')!;
        print(val);

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  val ? OrganizerEventScreen() : const HomeScreen(),
            ),
            (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => SignUpScreen()),
            (route) => false);
      }
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
