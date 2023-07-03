// ignore_for_file: file_names

class UserData {
  String email;
  String password;
  String title;
  String userName;
  String profileImg;
  String uid;
  List followers;
  List following;

  UserData({
    required this.email,
    required this.password,
    required this.title,
    required this.userName,
    required this.profileImg,
    required this.uid,
    required this.followers,
    required this.following,
  });

  Map<String, dynamic> convertToMap() {
    return {
      'user_name': userName,
      'title': title,
      'email': email,
      'passwoed': password,
      'profile_img': profileImg,
      'uid': password,
      'followers': followers,
      'following': following
    };
  }
}
