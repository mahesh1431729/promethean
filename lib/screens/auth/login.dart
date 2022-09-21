import 'package:flutter/material.dart';
import 'package:promethean/utils/unitls.dart';

import '../../widgets/auth/login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPassword = true;
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
      //       child: Padding(
      //         padding: const EdgeInsets.only(left:10.0),
      //         child: Icon(
      //           Icons.arrow_back_ios,
      //           color: Colors.black,
      //         ),
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
                  height: height * 0.45,
                  child: Center(
                      child: Image.asset(
                    'assets/images/finlalogo.png',
                    height: height * 0.3,
                    fit: BoxFit.contain,
                  )),
                ),
                LoginModule()
              ],
            ),
          )
        ],
      ),
    );
  }
}
