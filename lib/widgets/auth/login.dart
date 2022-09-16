import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:promethean/screens/auth/forgotpassword.dart';
import 'package:promethean/screens/auth/signup.dart';
import 'package:promethean/screens/user/homescreen.dart';

import '../../utils/unitls.dart';

class LoginModule extends StatefulWidget {
  const LoginModule({super.key});

  @override
  State<LoginModule> createState() => _LoginModuleState();
}

class _LoginModuleState extends State<LoginModule> {
  TextEditingController email = new TextEditingController();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
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
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
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
                          isPassword ? Icons.visibility_off : Icons.visibility,
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
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: width * 0.08),
                  child: TextButton(
                    onPressed: (() {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotpasswordScreen()),
                          (route) => true);
                    }),
                    child: Text(
                      "Forgot Password?",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xff6a707c),
                        fontSize: width * 0.035,
                        fontFamily: "Urbanist",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
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
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                          (route) => false);
                    }),
                    child: Center(
                      child: Text(
                        "Login",
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
                      "Don't have an account?",
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
                                builder: (context) => SignUpScreen()),
                            (route) => false);
                      }),
                      child: Text(
                        "Register Now",
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
    );
  }
}
