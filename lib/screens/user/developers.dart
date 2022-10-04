import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../utils/unitls.dart';

class Developers extends StatefulWidget {
  const Developers({super.key});

  @override
  State<Developers> createState() => _DevelopersState();
}

class _DevelopersState extends State<Developers> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.backGoundColor,
        title: Text(
          "Developers",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: AppColors.backGoundColor,
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: height * 0.3,
                  width: width * 0.8,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(height * 0.1),
                          child: Image.asset("assets/images/mahesh.jpeg",
                              height: height * 0.15, width: height * 0.15)),
                      Text(
                        "Mahesh Alyana",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: width * 0.065,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "App developer",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "3rd year\nCSE (AI & ML)\nBVRIT",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: width * 0.05,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: height * 0.3,
                  width: width * 0.8,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(height * 0.1),
                            child: Image.asset("assets/images/aditya.jpeg",
                                height: height * 0.15, width: height * 0.15)),
                      ),
                      Text(
                        "Thiyyagura Aditya Reddy",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: width * 0.065,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "App Designer",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "3rd year\nCSE (AI & ML)\nBVRIT",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: width * 0.05,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
