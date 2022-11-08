import 'package:flutter/material.dart';
import 'package:instagram_clone_coding/home_layout.dart';
import 'package:instagram_clone_coding/scaffold/appbar.dart';
import 'package:instagram_clone_coding/style.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(
    MaterialApp(
      theme: ScaffoldStyle,
      home: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _tab = 0;
  final body = [HomeLayout(), Text('샵페이지')];
  // This widget is the root of your application.

  var data = [];

  var scroll = ScrollController();

  getData() async {
    try {
      var result = await http
          .get(Uri.parse('https://codingapple1.github.io/app/data.json'));
      print(data);
      setState(() {
        data = jsonDecode(result.body);
      });
      print(data);
    } catch (e) {
      print(e);
    }
  }

  getMore() async {
    try {
      var result = await http
          .get(Uri.parse('https://codingapple1.github.io/app/more1.json'));
      print(data);
      setState(() {
        data.add(jsonDecode(result.body));
      });
      print(data);
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();

    scroll.addListener(() {
      if (scroll.position.pixels == scroll.position.maxScrollExtent) {
        getMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: insta_appbar,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _tab,
        onTap: (i) {
          print(i);
          setState(() {
            _tab = i;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: _tab == 0 ? Icon(Icons.home) : Icon(Icons.home_outlined),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: _tab == 1
                ? Icon(Icons.shopping_bag)
                : Icon(Icons.shopping_bag_outlined),
            label: "shop",
          ),
        ],
      ),
      body: HomeLayout(data: data, scroll: scroll),
    );
  }
}
