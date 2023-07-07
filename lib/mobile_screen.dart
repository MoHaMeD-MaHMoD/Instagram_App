
import 'package:firebase_auth/firebase_auth.dart';
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

  PageController pageController = PageController();

    @override
  void dispose() {
   
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          onPageChanged: (index) {},
          controller: pageController,
          children: [
            const Home(),
            const Search(),
            const Add(),
            Profile( userUid: FirebaseAuth.instance.currentUser!.uid,),
          ],
        ),
        bottomNavigationBar: CupertinoTabBar(
            onTap: (index) {
              pageController.jumpToPage(index);
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
