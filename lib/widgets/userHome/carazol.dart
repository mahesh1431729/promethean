import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:promethean/screens/user/eventscreen.dart';

class Carasol extends StatefulWidget {
  const Carasol({Key? key}) : super(key: key);

  @override
  State<Carasol> createState() => _CarasolState();
}

class _CarasolState extends State<Carasol> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var textSize = height < width ? height : width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance.collection('carazol').snapshots(),
          builder: (context, snapshot) {
            List events = [];
            if (snapshot.hasData) {
              for (int i = 0; i < snapshot.data!.docs.length; i++) {
                events.add([
                  snapshot.data!.docs[i]['image'],
                  snapshot.data!.docs[i]['id']
                ]);
              }
            }
            return !snapshot.hasData
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      "assets/images/rectangle.png",
                      fit: BoxFit.cover,
                      width: width * 0.95,
                      height: height * 0.25,
                    ),
                  )
                : CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 500),
                      autoPlayCurve: Curves.decelerate,
                      enlargeCenterPage: true,
                    ),
                    items: events.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            height: height * 0.25,
                            width: width,
                            child: Stack(
                              children: [
                                GestureDetector(
                                  onTap: (() {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EventScreen(id: i[1])),
                                        (route) => true);
                                  }),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.network(
                                      // "assets/images/rectangle.png",
                                      i[0],
                                      fit: BoxFit.cover,
                                      width: width * 0.95,
                                      height: height * 0.25,
                                    ),
                                  ),
                                ),
                                // Container(
                                //     width: width * 0.7,
                                //     height: height * 0.5,
                                //     margin: EdgeInsets.symmetric(horizontal: 5.0),
                                //     child: Image.asset(
                                //       "assets/images/25th-Aniv-Logo.jpeg",
                                //       fit: BoxFit.contain,
                                //     )),
                              ],
                            ),
                          );
                        },
                      );
                    }).toList(),
                  );
          }),
    );
  }
}
