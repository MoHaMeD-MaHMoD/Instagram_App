import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_app/firebase%20services/storage.dart';
import 'package:instagram_app/model/postData.dart';
import 'package:instagram_app/shared/snackbar';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  addComment(
    
      {required commentId,
      required postId,
      required profileImg,
      required userName,
      required commentText,
      required uid}) async {
    await FirebaseFirestore.instance
        .collection("posts")
        .doc(postId)
        .collection("comments")
        .doc(commentId)
        .set({
      "profile_img": profileImg,
      "user_name": userName,
      "textComment": commentText,
      "datePublished": DateTime.now(),
      "uid": uid,
      "commentId": commentId
    });
  }

  addPost(
      {required description,
      required profileImg,
      required username,
      required context,
      required imgName,
      required imgPath}) async {
    try {
      String imgPost = await getImgURL(
          imgName: imgName,
          imgPath: imgPath,
          folderName: 'postsIMG/${FirebaseAuth.instance.currentUser!.uid}');
      CollectionReference posts =
          FirebaseFirestore.instance.collection('posts');
      String newId = const Uuid().v1();

      PostData postData = PostData(
          datePublished: DateTime.now(),
          description: description,
          imgPost: imgPost,
          likes: [],
          postId: newId,
          profileImg: profileImg,
          uid: FirebaseAuth.instance.currentUser!.uid,
          username: username);

      posts
          .doc(newId)
          .set(postData.convertToMap())
          .then((value) => showSnackBar(context, "Post Added"))
          .catchError(
              (error) => showSnackBar(context, "Failed to add post: $error "));
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "ERROR ${e.code}");
    } catch (e) {
      showSnackBar(context, "ERROR :  $e ");
    }
  }

  toggleLike({required Map postData}) async {
    try {
      if (postData["likes"].contains(FirebaseAuth.instance.currentUser!.uid)) {
        await FirebaseFirestore.instance
            .collection("posts")
            .doc(postData["postId"])
            .update({
          "likes":
              FieldValue.arrayRemove([FirebaseAuth.instance.currentUser!.uid])
        });
      } else {
        await FirebaseFirestore.instance
            .collection("posts")
            .doc(postData["postId"])
            .update({
          "likes":
              FieldValue.arrayUnion([FirebaseAuth.instance.currentUser!.uid])
        });
      }
    } catch (e) {
        log('log: $e');

      
    }
  }
}
