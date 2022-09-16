import 'package:flutter/material.dart';
import 'package:promethean/screens/auth/login.dart';
import 'package:promethean/screens/user/homescreen.dart';

import 'screens/user/addfaqscreen.dart';
import 'screens/user/registeredscreen.dart';
import 'screens/user/searchscreen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Promethean-BVRIT(2K22)',
      home: HomeScreen(),
    );
  }
}
