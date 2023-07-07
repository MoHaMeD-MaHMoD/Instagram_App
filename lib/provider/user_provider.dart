
 
 import 'package:flutter/material.dart';
import 'package:instagram_app/firebase%20services/auth.dart';
import 'package:instagram_app/model/userData.dart';

class UserProvider with ChangeNotifier {
  UserData? _userData;
  UserData? get getUser => _userData;
  
  refreshUser() async {
    UserData userData = await AuthUser().getUserDetails();
    _userData = userData;
    notifyListeners();
  }
 }