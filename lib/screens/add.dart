import 'package:flutter/material.dart';
import 'package:instagram_app/firebase%20services/fire_store.dart';
import 'package:instagram_app/provider/user_provider.dart';
import 'package:instagram_app/shared/colors.dart';
import 'package:path/path.dart' show basename;
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';
import 'dart:math';

import 'package:provider/provider.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final desController = TextEditingController();

  Uint8List? imgPath;
  String? imgName;

  bool isLoading = false;

  uploadImage2Screen(ImageSource source) async {
    Navigator.pop(context);
    final XFile? pickedImg = await ImagePicker().pickImage(source: source);
    try {
      if (pickedImg != null) {
        imgPath = await pickedImg.readAsBytes();
        setState(() {
          imgName = basename(pickedImg.path);
          int random = Random().nextInt(9999999);
          imgName = "$random$imgName";
        });
      } else {
        debugPrint('debug: ERROR');
      }
    } catch (e) {
      debugPrint('debug: $e');
    }
  }

  showmodel() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          children: [
            SimpleDialogOption(
              onPressed: () async {
                // Navigator.of(context).pop();
                await uploadImage2Screen(ImageSource.camera);
              },
              padding: const EdgeInsets.all(20),
              child: const Text(
                "From Camera",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            SimpleDialogOption(
              onPressed: () async {
                // Navigator.of(context).pop();
                await uploadImage2Screen(ImageSource.gallery);
              },
              padding: const EdgeInsets.all(20),
              child: const Text(
                "From Gallary",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    desController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final allDataFromDB = Provider.of<UserProvider>(context).getUser;

    return imgPath == null
        ? Scaffold(
            backgroundColor: mobileBackgroundColor,
            body: Center(
              child: IconButton(
                  onPressed: () {
                    showmodel();
                  },
                  icon: const Icon(
                    Icons.upload,
                    size: 55,
                  )),
            ),
          )
        : Scaffold(
            backgroundColor: mobileBackgroundColor,
            appBar: AppBar(
              actions: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        isLoading = true;
                      });

                      FirestoreMethods().addPost(
                          imgName: imgName,
                          imgPath: imgPath,
                          description: desController.text,
                          profileImg: allDataFromDB!.profileImg,
                          username: allDataFromDB.userName,
                          context: context);

                      setState(() {
                        isLoading = false;
                        imgPath = null;
                      });
                    },
                    child: const Text(
                      "Post",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                    )),
              ],
              backgroundColor: mobileBackgroundColor,
              leading: IconButton(
                  onPressed: () {
                    setState(() {
                      imgPath = null;
                    });
                  },
                  icon: const Icon(Icons.arrow_back)),
            ),
            body: Column(
              children: [
                isLoading
                    ? const LinearProgressIndicator()
                    : const Divider(
                        thickness: 1,
                        height: 30,
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 33,
                      backgroundImage: NetworkImage(allDataFromDB!.profileImg),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: TextField(
                        // controller: descriptionController,
                        maxLines: 8,
                        controller: desController,
                        decoration: const InputDecoration(
                            hintText: "write a caption...",
                            border: InputBorder.none),
                      ),
                    ),
                    Container(
                      width: 70,
                      height: 74,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: MemoryImage(imgPath!), fit: BoxFit.cover
                              //
                              //
                              )),
                    )
                  ],
                ),
              ],
            ),
          );
  }
}
