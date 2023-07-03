// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_app/firebase%20services/auth.dart';
import 'package:instagram_app/shared/colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:
          widthScreen > 600 ? webBackgroundColor : mobileBackgroundColor,
      appBar: widthScreen > 600
          ? null
          : AppBar(
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.messenger_outline,
                    )),
                IconButton(
                    onPressed: () async {
                      await AuthUser().logOut();
                    },
                    icon: Icon(
                      Icons.logout,
                    )),
              ],
              backgroundColor: mobileBackgroundColor,
              title: SvgPicture.asset(
                "assets/img/Instagram_logo.svg",
                color: primaryColor,
                height: 32,
              ),
            ),
      body: Container(
        decoration: BoxDecoration(
            color: mobileBackgroundColor,
            borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.symmetric(
            vertical: 11, horizontal: widthScreen > 600 ? widthScreen / 6 : 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(125, 78, 91, 110),
                        ),
                        child: CircleAvatar(
                            radius: 33, backgroundImage: NetworkImage(
                                // widget.snap["profileImg"],
                                "https://scontent.fcai19-5.fna.fbcdn.net/v/t39.30808-6/326259785_5349343998499860_2647564246765235950_n.jpg?_nc_cat=110&cb=99be929b-3346023f&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=geQDy2rZ1ZkAX_pDEFh&_nc_ht=scontent.fcai19-5.fna&oh=00_AfDkuuygKCsDaETUwVvsUfWqSGy_M4n1b0TBWkxzJLFKPQ&oe=64A46A11")),
                      ),
                      SizedBox(
                        width: 17,
                      ),
                      Text(
                        // widget.snap["username"],
                        "EL-Beaky",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
                ],
              ),
            ),
            Image.network(
              
              // widget.snap["postUrl"],
              "https://scontent.fcai19-5.fna.fbcdn.net/v/t39.30808-6/326259785_5349343998499860_2647564246765235950_n.jpg?_nc_cat=110&cb=99be929b-3346023f&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=geQDy2rZ1ZkAX_pDEFh&_nc_ht=scontent.fcai19-5.fna&oh=00_AfDkuuygKCsDaETUwVvsUfWqSGy_M4n1b0TBWkxzJLFKPQ&oe=64A46A11",
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 11),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.comment_outlined,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.send,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bookmark_outline),
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                width: double.infinity,
                child: Text(
                  "10 Likes",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(214, 157, 157, 165)),
                )),
            Row(
              children: [
                SizedBox(
                  width: 9,
                ),
                Text(
                  // "${widget.snap["username"]}",
                  "USERNAME ",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 189, 196, 199)),
                ),
                Text(
                  // " ${widget.snap["description"]}",
                  " Sidi Bou Said ♥",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 189, 196, 199)),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                  margin: EdgeInsets.fromLTRB(10, 13, 9, 10),
                  width: double.infinity,
                  child: Text(
                    "view all 100 comments",
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(214, 157, 157, 165)),
                    textAlign: TextAlign.start,
                  )),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(10, 0, 9, 10),
                width: double.infinity,
                child: Text(
                  "10June 2022",
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(214, 157, 157, 165)),
                  textAlign: TextAlign.start,
                )),
          ],
        ),
      ),
    );
  }
}
