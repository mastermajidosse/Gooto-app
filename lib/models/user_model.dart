import 'dart:convert';

class UserModel {
  String? id;
  String? firstname;
  String? password;
  String? email;
  String? imgurl;
  String? country;
  DateTime? creationDate = DateTime.now();
  String? instagram = "";
  bool? isAdmin = false;

  UserModel({
    this.id,
    this.email,
    this.firstname,
    this.password,
    this.imgurl = "",
    this.country,
    this.isAdmin = false,
    this.creationDate,
    this.instagram = "",
  });
  static const Map<String, dynamic> fakelistStreak = {};

  UserModel.fromData(Map<String, dynamic> map) {
    id = map['id']?.toString();
    firstname = map['name'];
    email = map['email'];
    country = map['country'];
    imgurl = map['image'];
  }


  UserModel.fromJson(Map<String, dynamic> map) {
    firstname = map['name']?.toString();
    email = map['email']?.toString();
    isAdmin = map['isAdmin'] ?? false;
    country = map['country']?.toString();
    imgurl = map['image']?.toString();
  }


   Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstname': firstname,
      'email': email,
      'imgurl': imgurl,
      'country': country,
      'creationDate': creationDate?.toIso8601String(), // Format DateTime
      'instagram': instagram,
      'isAdmin': isAdmin,
    };
  }

  toJsononly2() {
    return jsonEncode({
      "name": firstname,
      "country": country,
      "imgurl": "https://i0.wp.com/rouelibrenmaine.fr/wp-content/uploads/2018/10/empty-avatar.png",
    });
  }

  logintoJson() {
    return jsonEncode({
      "email": email,
      "password": password,
    });
  }

  registertoJson() {
    return jsonEncode({
      "name": firstname,
      "email": email,
      "password": password,
    });
  }
}
