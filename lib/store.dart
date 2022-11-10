import 'package:flutter/material.dart';

class Store extends ChangeNotifier {
  var userName = "이름";
  var userImage;
  var userContent;
  var data = [];

  void setUserImage(image) {
    userImage = image;
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
