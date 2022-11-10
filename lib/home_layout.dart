import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:instagram_clone_coding/user_detail.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key, this.data, this.scroll});

  final data;
  final scroll;

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  var userImage;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        itemCount: widget.data.length,
        controller: widget.scroll,
        itemBuilder: (context, index) {
          return Article(data: widget.data[index]);
        },
      );
    }
  }
}

class Article extends StatelessWidget {
  const Article({
    super.key,
    required this.data,
  });

  final data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // data['image'].runtimeType == String
        //     ? Image.network(data['image'])
        //     : Image.file(data['image']),
        Center(
            child: Image.network(
          data['image'],
          width: 200,
        )),
        Container(
          constraints: BoxConstraints(maxWidth: 600),
          padding: EdgeInsets.all(20),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("좋아요 ${data["likes"]}개"),
              GestureDetector(
                onTap: (() => Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, a1, a2) => UserDetail(
                          name: data['user'],
                        ),
                        transitionsBuilder:
                            (context, a1, secondaryAnimation, child) =>
                                FadeTransition(
                          opacity: a1,
                          child: child,
                        ),
                        transitionDuration: Duration(milliseconds: 500),
                      ),
                    )),
                child: Text('글쓴이 ${data['user'] as String}'),
              ),
              Text(data['content'] as String),
            ],
          ),
        )
      ],
    );
  }
}
