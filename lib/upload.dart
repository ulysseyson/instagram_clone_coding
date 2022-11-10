import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Upload extends StatelessWidget {
  Upload(
      {Key? key,
      this.userImage,
      this.userContent,
      this.setUserContent,
      this.addImage})
      : super(key: key);
  final userImage;
  var userContent;
  final setUserContent;
  final addImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              userImage,
              width: 100,
            ),
            TextField(
              onChanged: (a) {
                setUserContent(a);
              },
            ),
            TextButton(
                child: Text("업로드하기"),
                onPressed: () {
                  if (userContent != null) {
                    addImage();
                    Navigator.pop(context);
                  }
                })
          ],
        ));
  }
}
