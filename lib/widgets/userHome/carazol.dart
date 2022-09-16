import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 5),
          autoPlayAnimationDuration: Duration(milliseconds: 500),
          autoPlayCurve: Curves.decelerate,
          enlargeCenterPage: true,
        ),
        items: [1, 2].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                height: height * 0.25,
                width: width,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        "assets/images/rectangle.png",
                        fit: BoxFit.cover,
                        width: width * 0.95,
                        height: height * 0.25,
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
      ),
    );
  }
}
