import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_app/firebase%20services/storage.dart';
import 'package:instagram_app/model/postData.dart';
import 'package:instagram_app/shared/snackbar';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
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
          .then((value) => print("Post Added"))
          .catchError((error) => print("Failed to add post: $error"));
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "ERROR ${e.code}");
    } catch (e) {
      print(e);
    }
  }
}
