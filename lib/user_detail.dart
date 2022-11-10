import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instagram_clone_coding/store.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class UserDetail extends StatefulWidget {
  const UserDetail({super.key, this.name});
  final name;

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  var follower = 0;
  var isFollow = false;
  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();
  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(context.watch<Store>().userName,
              style: const TextStyle(fontSize: 30)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  "https://codingapple1.github.io/app/img2.jpg",
                  width: 20,
                ),
              ),
              Text("팔로워 수 $follower"),
              TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue)),
                  child: Text("팔로우",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  onPressed: () {
                    setState(() {
                      if (isFollow) {
                        follower--;
                        isFollow = false;
                      } else {
                        follower++;
                        isFollow = true;
                      }
                    });
                  }),
              TextButton(
                  onPressed: () {
                    context.read<Store>().changeUserName(getRandomString(5));
                  },
                  child: Text("change name"))
            ],
          ),
        ],
      ),
    );
  }
}
