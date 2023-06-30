import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

// Function to get img url

getImgURL({
  required String imgName,
  required Uint8List imgPath,
}) async {
  // Upload image to firebase storage
  final storageRef = FirebaseStorage.instance.ref("profileIMG/$imgName");
  // use this code if u are using flutter web
  UploadTask uploadTask = storageRef.putData(imgPath);
  TaskSnapshot snap = await uploadTask;

  // Get img url
  String urll = await snap.ref.getDownloadURL();

  return urll;
}