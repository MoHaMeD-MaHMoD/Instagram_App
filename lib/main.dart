// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:instagram_app/Responsive.dart';
import 'package:instagram_app/mobileScreen.dart';
import 'package:instagram_app/webScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Responsive(
        myMobileScreen: MobileScreen(),
        myWebScreen: WebScreen(),
      ),
    );
  }
}
