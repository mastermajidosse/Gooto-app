import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:gooto/models/blog_model.dart';

class Getdata {
  static final Getdata postServices = Getdata._internal();
  Getdata._internal();

  factory Getdata() {
    return postServices;
  }

  List<BlogModel> listblog = [];

  Future<List<BlogModel>?> fetchQuestions() async {
    if (listblog.isNotEmpty) {
      return listblog;
    }
    final String response = await rootBundle.loadString('assets/cities.json');
    final data = json.decode(response);

    if (data == null) {
      return null;
    }
    print(data['data']);

    data['data'].forEach((l) {
      listblog.add(BlogModel.fromData(l));
    });

    print(listblog.first.title);

    return listblog;
  }
}
