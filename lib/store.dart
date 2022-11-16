import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Store extends ChangeNotifier {
  var userName = "John";
  var userImage;
  var userContent;
  var follower = 0;
  var data = [];
  var isFollow = false;

  void setUserImage(image) {
    userImage = image;
    notifyListeners();
  }

  void follow() {
    isFollow = !isFollow;
    notifyListeners();
  }

  void setUserContent(content) {
    userContent = content;
    notifyListeners();
  }

  void addImage() {
    data.add({
      'image': userImage,
      'content': userContent,
    });
    notifyListeners();
  }

  void changeUserName(name) {
    userName = name;
    notifyListeners();
  }
}

class Store1 extends ChangeNotifier {
  var profileImage = [];
  getImage() async {
    var result = await http
        .get(Uri.parse('https://codingapple1.github.io/app/profile.json'));
    var result2 = jsonDecode(result.body);
    profileImage = result2;
    notifyListeners();
  }
}
