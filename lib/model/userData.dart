// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  String email;
  String password;
  String title;
  String userName;
  String profileImg;
  String uid;
  List followers;
  List following;

  UserData({
    required this.email,
    required this.password,
    required this.title,
    required this.userName,
    required this.profileImg,
    required this.uid,
    required this.followers,
    required this.following,
  });

  Map<String, dynamic> convertToMap() {
    return {
      'user_name': userName,
      'title': title,
      'email': email,
      'passwoed': password,
      'profile_img': profileImg,
      'uid': password,
      'followers': followers,
      'following': following
    };
  }

  // function that convert "DocumentSnapshot" to a User
// function that takes "DocumentSnapshot" and return a User

  static convertSnap2Model(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserData(
      email: snapshot["email"],
      userName: snapshot["user_name"],
      followers: snapshot["followers"],
      following: snapshot["followers"],
      password: snapshot["passwoed"],
      profileImg: snapshot["profile_img"],
      title: snapshot["title"],
      uid: snapshot["uid"],
    );
  }
}
