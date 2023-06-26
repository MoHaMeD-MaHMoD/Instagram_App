// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:instagram_app/Responsive.dart';
import 'package:instagram_app/mobileScreen.dart';
import 'package:instagram_app/screens/user/Login.dart';
import 'package:instagram_app/screens/user/Register.dart';
import 'package:instagram_app/webScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBIjpHtCHbFOPICeiETKd2BlXOvq033XAw",
            authDomain: "instgram-e7c92.firebaseapp.com",
            projectId: "instgram-e7c92",
            storageBucket: "instgram-e7c92.appspot.com",
            messagingSenderId: "582666365592",
            appId: "1:582666365592:web:18b611c6fbf6dfbb55feed"));
  } else
    await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: Login()

        //  Responsive(
        //   myMobileScreen: MobileScreen(),
        //   myWebScreen: WebScreen(),
        // ),
        );
  }
}
