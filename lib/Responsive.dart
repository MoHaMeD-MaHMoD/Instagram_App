import 'package:flutter/material.dart';
import 'package:instagram_app/mobileScreen.dart';
import 'package:instagram_app/webScreen.dart';

class Responsive extends StatefulWidget {
  final myWebScreen;
  final myMobileScreen;
  const Responsive(
      {super.key, required this.myWebScreen, required this.myMobileScreen});

  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext, BoxConstraints) {
      if (BoxConstraints.maxWidth > 600)
        return widget.myWebScreen;
      else
        return widget.myMobileScreen;
    });
  }
}
