import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_app/firebase%20services/storage.dart';
import 'package:instagram_app/model/userData.dart';
import 'package:instagram_app/shared/snackbar';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
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
          profileImg: profileImgURL);

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

//register() async {
//     setState(() {
//       isLoading = true;
//     });

//     try {
//       final credential =
//           await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: emailController.text,
//         password: passwordController.text,
//       );

// // Upload image to firebase storage
//       final storageRef = FirebaseStorage.instance.ref("users-imgs/$imgName");
//       await storageRef.putFile(imgPath!);
//       String urll = await storageRef.getDownloadURL();

//       print(credential.user!.uid);

//       CollectionReference users =
//           FirebaseFirestore.instance.collection('userSSS');

//       users
//           .doc(credential.user!.uid)
//           .set({
//             "imgLink":   urll     ,
//             'username': usernameController.text,
//             'age': ageController.text,
//             "title": titleController.text,
//             "email": emailController.text,
//             "pass": passwordController.text,
//           })
//           .then((value) => print("User Added"))
//           .catchError((error) => print("Failed to add user: $error"));
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         showSnackBar(context, "The password provided is too weak.");
//       } else if (e.code == 'email-already-in-use') {
//         showSnackBar(context, "The account already exists for that email.");
//       } else {
//         showSnackBar(context, "ERROR - Please try again late");
//       }
//     } catch (err) {
//       showSnackBar(context, err.toString());
//     }

//     setState(() {
//       isLoading = false;
//     });
//   }
}
