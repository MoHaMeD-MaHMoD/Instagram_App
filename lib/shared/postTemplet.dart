import 'package:flutter/material.dart';
import 'package:instagram_app/shared/colors.dart';
import 'package:intl/intl.dart';

class PostTemplete extends StatefulWidget {
  final allData;
  const PostTemplete({super.key, required this.allData});

  @override
  State<PostTemplete> createState() => _PostTempleteState();
}

class _PostTempleteState extends State<PostTemplete> {
  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
  
    return Container(
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
                              widget.allData["profile_img"])),
                    ),
                    SizedBox(
                      width: 17,
                    ),
                    Text(
                      // widget.snap["username"],
                      widget.allData["username"],
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
            widget.allData['imgPost'],
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
                "${widget.allData["likes"].length}    ${widget.allData["likes"].length > 1 ? "Likes" : "Like"}",
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
                widget.allData["username"],
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 189, 196, 199)),
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                // " ${widget.snap["description"]}",
                widget.allData["description"],
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
                      fontSize: 18, color: Color.fromARGB(214, 157, 157, 165)),
                  textAlign: TextAlign.start,
                )),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(10, 0, 9, 10),
              width: double.infinity,
              child: Text(
                DateFormat('MMM d, ' 'y')
                    .format(widget.allData['datePublished'].toDate()),
                style: TextStyle(
                    fontSize: 18, color: Color.fromARGB(214, 157, 157, 165)),
                textAlign: TextAlign.start,
              )),
        ],
      ),
    );
  }
}
