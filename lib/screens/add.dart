import 'package:flutter/material.dart';
import 'package:instagram_app/shared/colors.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      backgroundColor: mobileBackgroundColor,
     body: Center(
       child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.upload,
                size: 55,
              )),
     ),
    );
  }
}
