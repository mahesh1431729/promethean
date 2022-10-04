import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:promethean/utils/unitls.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:webview_flutter/webview_flutter.dart';
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
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: height * 0.3,
                            width: width * 0.8,
                            child: WebView(
                              initialUrl: Uri.dataFromString(
                                '<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15201.497070129883!2d78.25749487292188!3d17.726995820452697!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xc4ae2d2cf9b35b63!2sB%20V%20Raju%20Institute%20of%20Technology!5e0!3m2!1sen!2sin!4v1664869233236!5m2!1sen!2sin" style="border:0;" allowfullscreen="true" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>',
                                mimeType: 'text/html',
                              ).toString(),
                              javascriptMode: JavascriptMode.unrestricted,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: height * 0.5,
                            width: width * 0.8,
                            child: SfPdfViewer.asset(
                              'assets/transportation.pdf',
                              key: _pdfViewerKey,
                            ),
                          ),
                        ],
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
