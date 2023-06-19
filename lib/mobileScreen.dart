// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names, prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_app/screens/add.dart';
import 'package:instagram_app/screens/home.dart';
import 'package:instagram_app/screens/profile.dart';
import 'package:instagram_app/screens/search.dart';
import 'package:instagram_app/shared/colors.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  int currentPage = 0;

  PageController _PageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          onPageChanged: (index) {},
          controller: _PageController,
          children: [
            Home(),
            Search(),
            Add(),
            Profile(),
          ],
        ),
        bottomNavigationBar: CupertinoTabBar(
            onTap: (index) {
              _PageController.jumpToPage(index);
              setState(() {
                currentPage = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: currentPage == 0 ? primaryColor : secondaryColor,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    color: currentPage == 1 ? primaryColor : secondaryColor,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add,
                    color: currentPage == 2 ? primaryColor : secondaryColor,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    color: currentPage == 3 ? primaryColor : secondaryColor,
                  ),
                  label: ""),
            ]));
  }
}
