import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone_coding/home_layout.dart';
import 'package:instagram_clone_coding/notification.dart';
import 'package:instagram_clone_coding/scaffold/appbar.dart';
import 'package:instagram_clone_coding/store.dart';
import 'package:instagram_clone_coding/style.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:instagram_clone_coding/upload.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => Store()),
        ChangeNotifierProvider(create: (c) => Store1()),
      ],
      child: MaterialApp(
        theme: ScaffoldStyle,
        home: const MyApp(),
      ),
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
  var data = [];
  var scroll = ScrollController();
  saveData() async {
    var storage = await SharedPreferences.getInstance();
    storage.setString('name', 'john');
    var result = storage.getString('name');
    print(result);
  }

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

  var userImage;
  var userContent;
  setUserContent(a) {
    setState(() {
      userContent = a;
    });
  }

  addImage() {
    var mdata = {
      'id': data.length,
      'image': userImage,
      'content': userContent,
      'user': 'ulysss',
      'likes': 0,
      'liked': false,
      'date': '2021-07-01',
    };
    setState(() {
      data.insert(0, mdata);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: InstaAppBar(
          onPressAction: () async {
            var picker = ImagePicker();
            var pickedFile =
                await picker.pickImage(source: ImageSource.gallery);
            if (pickedFile != null) {
              setState(() {
                userImage = (pickedFile.path);
              });
              // ignore: use_build_context_synchronously
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Upload(
                      userImage: userImage,
                      userContent: userContent,
                      setUserContent: setUserContent,
                      addImage: addImage,
                    ),
                  ));
            }
          },
        ),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("Dfdf");
            showNotification();
          },
          child: Icon(Icons.add),
        ));
  }
}
