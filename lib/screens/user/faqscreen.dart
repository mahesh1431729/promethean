import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../utils/unitls.dart';

class FAQscreen extends StatefulWidget {
  const FAQscreen({super.key});

  @override
  State<FAQscreen> createState() => _FAQscreenState();
}

class _FAQscreenState extends State<FAQscreen> {
  String buttonState = "view all";
  List faqOpen = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backGoundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
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
      body: Column(
        children: [
          Container(
            height: height * 0.9,
            width: width,
            child: ListView.builder(
              itemCount: faqOpen.length + 1,
              itemBuilder: ((context, index) {
                return index == 0
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Text(
                            "FAQ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xfffefefe),
                              fontSize: width * 0.06,
                              fontFamily: "Urbanist",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: width * 0.85,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Top Questions",
                                    style: TextStyle(
                                      color: Color(0xfffefefe),
                                      fontSize: 16,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          for (int i = 0;
                                              i < faqOpen.length;
                                              i++) {
                                            faqOpen[i] = !faqOpen[i];
                                          }
                                          buttonState =
                                              buttonState == "close all"
                                                  ? "view all"
                                                  : "close all";
                                        });
                                      },
                                      child: Text(
                                        buttonState,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Color(0xff6373f7),
                                          fontSize: 14,
                                          fontFamily: "Eudoxus Sans",
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.1, vertical: 10),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          height: faqOpen[index - 1]
                              ? height * 0.15
                              : height * 0.06,
                          width: width * 0.8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: Color(0xff434343), width: 1.5)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.02),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Lorem Lorem Lorem Lorem Lorem",
                                      style: TextStyle(
                                        color: Color(0xfffefefe),
                                        fontSize: 14,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            faqOpen[index - 1] =
                                                !faqOpen[index - 1];
                                          });
                                        },
                                        icon: Icon(
                                          faqOpen[index - 1]
                                              ? Icons.minimize_outlined
                                              : Icons.add,
                                          color: Color(0xff6373F7),
                                        ))
                                  ],
                                ),
                              ),
                              faqOpen[index - 1]
                                  ? SizedBox(
                                      width: width * 0.75,
                                      child: AnimatedTextKit(
                                        displayFullTextOnTap: true,
                                        isRepeatingAnimation: false,
                                        animatedTexts: [
                                          TyperAnimatedText(
                                              "sdfghjkiuytgfdsxdcfvghjkloiuytredsdfghjkoiuytrdxcvbnjkoiuytfgh",
                                              textStyle: TextStyle(
                                                  color: AppColors.focusColor))
                                        ],
                                        onTap: () {
                                          print("Tap Event");
                                        },
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      );
              }),
            ),
          ),
          Container(
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
                    "Ask Other Question",
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
        ],
      ),
    );
  }
}
