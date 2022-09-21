import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:promethean/utils/unitls.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'announcements.dart';
import 'home.dart';
import 'registeredscreen.dart';
import 'userprofile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: AppColors.backGoundColor,
      body: Container(
        height: height,
        width: width,
        color: AppColors.backGoundColor,
        child: currentIndex == 0
            ? Home()
            : currentIndex == 1
                ? Announcements()
                : currentIndex == 2
                    ? Profile()
                    : SfPdfViewer.asset(
                        'assets/transportation.pdf',
                        key: _pdfViewerKey,
                      ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: AppColors.focusColor,
            currentIndex: currentIndex,
            selectedItemColor: AppColors.iconColor,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                label: ".",
                icon: SvgPicture.asset(
                  "assets/images/home.svg",
                  color: currentIndex == 0
                      ? AppColors.iconColor
                      : AppColors.disabledIcon,
                ),
              ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/images/notification.svg",
                    color: currentIndex == 1
                        ? AppColors.iconColor
                        : AppColors.disabledIcon,
                  ),
                  label: "."),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/images/profile.svg",
                    color: currentIndex == 2
                        ? AppColors.iconColor
                        : AppColors.disabledIcon,
                  ),
                  label: "."),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/images/transport.svg",
                    color: currentIndex == 3
                        ? AppColors.iconColor
                        : AppColors.disabledIcon,
                  ),
                  label: ".")
            ]),
      ),
    );
  }
}
