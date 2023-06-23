// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_app/shared/colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.messenger_outline,
              )),
          IconButton(
              onPressed: () {},
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 26,
                      backgroundImage: NetworkImage(
                          // widget.snap["profileImg"],
                          "https://i.pinimg.com/564x/94/df/a7/94dfa775f1bad7d81aa9898323f6f359.jpg"),
                    ),
                    SizedBox(
                      width: 17,
                    ),
                    Text(
                      // widget.snap["username"],
                      "Layla hassan",
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
            "https://cdn1-m.alittihad.ae/store/archive/image/2021/10/22/6266a092-72dd-4a2f-82a4-d22ed9d2cc59.jpg?width=1300",
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
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
              margin: EdgeInsets.fromLTRB(8, 0, 0, 8),
              width: double.infinity,
              child: Text(
                "10 Likes",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 14, color: Color.fromARGB(214, 157, 157, 165)),
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
                    fontSize: 16, color: Color.fromARGB(255, 189, 196, 199)),
              ),
              Text(
                // " ${widget.snap["description"]}",
                " Sidi Bou Said ♥",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 14, color: Color.fromARGB(255, 189, 196, 199)),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
                margin: EdgeInsets.fromLTRB(10, 8, 9, 8),
                width: double.infinity,
                child: Text(
                  "view all 100 comments",
                  style: TextStyle(
                      fontSize: 14, color: Color.fromARGB(214, 157, 157, 165)),
                  textAlign: TextAlign.start,
                )),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(10, 0, 9, 0),
              width: double.infinity,
              child: Text(
                "10June 2022",
                style: TextStyle(
                    fontSize: 14, color: Color.fromARGB(214, 157, 157, 165)),
                textAlign: TextAlign.start,
              )),
        ],
      ),
    );
  }
}