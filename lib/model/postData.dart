// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';

class PostData {
  final String profileImg;
  final String username;
  final String description;
  final String imgPost;
  final String uid;
  final String postId;
  final DateTime datePublished;
  final List likes;

  PostData({
    required this.profileImg,
    required this.username,
    required this.description,
    required this.imgPost,
    required this.uid,
    required this.postId,
    required this.datePublished,
    required this.likes,
  });

  Map<String, dynamic> convertToMap() {
    return {
      'profile_img': profileImg,
      'user_name': username,
      'description': description,
      'imgPost': imgPost,
      'uid': uid,
      'postId': postId,
      'datePublished': datePublished,
      'likes': likes
    };
  }

  // function that convert "DocumentSnapshot" to a User
// function that takes "DocumentSnapshot" and return a User

  static convertSnap2Model(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return PostData(
      profileImg: snapshot["profile_img"],
      username: snapshot["user_name"],
      description: snapshot["description"],
      imgPost: snapshot["imgPost"],
      uid: snapshot["uid"],
      postId: snapshot["postId"],
      datePublished: snapshot["datePublished"],
      likes: snapshot["likes"],
    );
  }
}
