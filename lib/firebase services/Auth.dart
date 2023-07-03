import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_app/firebase%20services/storage.dart';
import 'package:instagram_app/model/userData.dart';
import 'package:instagram_app/shared/snackbar';
import 'package:firebase_auth/firebase_auth.dart';

class AuthUser {
  register(
      {required emailAddress,
      required password,
      required context,
      required title,
      required userName,
      required imgName,
      required imgPath}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      String profileImgURL =
          await getImgURL(imgName: imgName, imgPath: imgPath);
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      UserData userr = UserData(
          email: emailAddress,
          password: password,
          title: title,
          userName: userName,
          profileImg: profileImgURL,
          uid: credential.user!.uid,
          followers: [],
          following: []);

      users
          .doc(credential.user!.uid)
          .set(userr.convertToMap())
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "ERROR ${e.code}");
    } catch (e) {
      print(e);
    }
  }

  signIn({required emaill, required passwordd, required context}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emaill, password: passwordd);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "ERROR :  ${e.code} ");
    } catch (e) {
      print(e);
    }
  }

  logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
