import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_app/firebase%20services/Auth.dart';
import 'package:instagram_app/shared/colors.dart';

class Profile extends StatefulWidget {
  final String userUid;
  const Profile({super.key, required this.userUid});

  @override
  State<Profile> createState() => _ProfileState();
}

Map userData = {};
bool isLoading = true;
late int following;
late int postNumber;
late int followers;
late bool isFollowing;

class _ProfileState extends State<Profile> {
  getDate() async {
    setState(() {
      isLoading = true;
    });

    try {
      DocumentSnapshot<Map<String, dynamic>> snapShot = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(widget.userUid)
          .get();
      userData = snapShot.data()!;
      followers = userData["followers"].length;
      following = userData["following"].length;
      var snapShotPost = await FirebaseFirestore.instance
          .collection('posts')
          .where('uid', isEqualTo: widget.userUid)
          .get();
      postNumber = snapShotPost.docs.length;
      isFollowing = userData['followers']
          .contains(FirebaseAuth.instance.currentUser!.uid);
    } catch (e) {
      log('log: $e');
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getDate();
  }

  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;

    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
            color: Colors.white,
          ))
        : Scaffold(
            backgroundColor: mobileBackgroundColor,
            appBar: AppBar(
              backgroundColor: mobileBackgroundColor,
              title: Text(userData["user_name"]),
            ),
            body: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 22),
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(125, 78, 91, 110),
                      ),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                            // widget.snap["profileImg"],

                            userData["profile_img"]),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                postNumber.toString(),
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "Posts",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 17,
                          ),
                          Column(
                            children: [
                              Text(
                                followers.toString(),
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "Followers",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 17,
                          ),
                          Column(
                            children: [
                              Text(
                                following.toString(),
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "Following",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(15, 21, 0, 0),
                    width: double.infinity,
                    child: Text(userData["title"])),
                const SizedBox(
                  height: 15,
                ),
                Divider(
                  color: Colors.white,
                  thickness: widthScreen > 600 ? 0.06 : 0.44,
                ),
                const SizedBox(
                  height: 9,
                ),

                //---------------------

                widget.userUid == FirebaseAuth.instance.currentUser!.uid
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.grey,
                              size: 24.0,
                            ),
                            label: const Text(
                              "Edit profile",
                              style: TextStyle(fontSize: 17),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(0, 90, 103, 223)),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(
                                      vertical: widthScreen > 600 ? 19 : 10,
                                      horizontal: 33)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  side: const BorderSide(
                                      color: Color.fromARGB(109, 255, 255, 255),
                                      // width: 1,
                                      style: BorderStyle.solid),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          ElevatedButton.icon(
                            onPressed: () async {
                              await AuthUser().logOut();
                            },
                            icon: const Icon(
                              Icons.logout,
                              size: 24.0,
                            ),
                            label: const Text(
                              "Log out",
                              style: TextStyle(fontSize: 17),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(143, 255, 55, 112)),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(
                                      vertical: widthScreen > 600 ? 19 : 10,
                                      horizontal: 33)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : isFollowing
                        ? ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                followers--;

                                isFollowing = false;
                              });

                              await FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(widget.userUid)
                                  .update({
                                "followers": FieldValue.arrayRemove(
                                    [FirebaseAuth.instance.currentUser!.uid])
                              });
                              await FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(FirebaseAuth.instance.currentUser!.uid)
                                  .update({
                                "following":
                                    FieldValue.arrayRemove([widget.userUid])
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(231, 229, 69, 6)),
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                      vertical: 9, horizontal: 77)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                              ),
                            ),
                            child: const Text(
                              "UnFollow",
                              style: TextStyle(fontSize: 17),
                            ))
                        : ElevatedButton(
                            onPressed: () async {
                              followers++;
                              setState(() {
                                isFollowing = true;
                              });
                              await FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(widget.userUid)
                                  .update({
                                "followers": FieldValue.arrayUnion(
                                    [FirebaseAuth.instance.currentUser!.uid])
                              });
                              await FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(FirebaseAuth.instance.currentUser!.uid)
                                  .update({
                                "following":
                                    FieldValue.arrayUnion([widget.userUid])
                              });
                            },
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                      vertical: 9, horizontal: 77)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                              ),
                            ),
                            child: const Text(
                              "Follow",
                              style: TextStyle(fontSize: 17),
                            )),

                const SizedBox(
                  height: 9,
                ),
                Divider(
                  color: Colors.white,
                  thickness: widthScreen > 600 ? 0.06 : 0.44,
                ),
                const SizedBox(
                  height: 19,
                ),
                //------------------------------------
                FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection('posts')
                      .where('uid', isEqualTo: widget.userUid)
                      .get(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return const Text("Something went wrong");
                    }

                    if (snapshot.connectionState == ConnectionState.done) {
                      return Expanded(
                        child: Padding(
                          padding: widthScreen > 600
                              ? const EdgeInsets.all(66.0)
                              : const EdgeInsets.all(3.0),
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 3 / 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10),
                              itemCount: postNumber,
                              itemBuilder: (BuildContext context, int index) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Image.network(
                                    snapshot.data.docs[index]['imgPost'],
                                    loadingBuilder: (context, child, progress) {
                                      return progress == null
                                          ? child
                                          : const Center(
                                              child:
                                                  CircularProgressIndicator());
                                    },
                                    // height: 333,
                                    // width: 100,

                                    fit: BoxFit.cover,
                                  ),
                                );
                              }),
                        ),
                      );
                    }

                    return const CircularProgressIndicator(
                      color: Colors.white,
                    );
                  },
                )
              ],
            ),
          );
  }
}
