import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../screens/auth/login.dart';
import '../../utils/unitls.dart';

class ConfirmPasswordModule extends StatefulWidget {
  const ConfirmPasswordModule({super.key});

  @override
  State<ConfirmPasswordModule> createState() => _ConfirmPasswordModuleState();
}

class _ConfirmPasswordModuleState extends State<ConfirmPasswordModule> {
  bool isPassword = true;
  bool isconfirmPassword = true;

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
                            isPassword = !isPassword;
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
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
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
                    onPressed: (() {}),
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
    );
  }
}
