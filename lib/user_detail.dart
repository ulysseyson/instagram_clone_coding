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
  @override
  void initState() {
    // TODO: implement initState
    context.read<Store1>().getImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(context.watch<Store>().userName,
                style: const TextStyle(fontSize: 30))),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: ProfileHeader()),
            SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (c, i) =>
                      Image.network(context.watch<Store1>().profileImage[i]),
                  childCount: context.watch<Store1>().profileImage.length,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2))
          ],
        ));
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      CircleAvatar(
        radius: 50,
        child: Image.network(
          "https://codingapple1.github.io/app/img2.jpg",
          width: 40,
        ),
      ),
      Text("팔로워 수 ${context.watch<Store>().follower}"),
      TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue)),
          child: Text("팔로우",
              style: TextStyle(
                color: Colors.white,
              )),
          onPressed: () {
            context.read<Store>().follow();
          }),
    ]);
  }
}
