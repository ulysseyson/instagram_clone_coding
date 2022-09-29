import 'package:flutter/material.dart';

var ScaffoldStyle = ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey,
        titleTextStyle: TextStyle(
          color: Colors.black,
        ),
        actionsIconTheme: IconThemeData(
          color: Colors.black,
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      elevation: 3,
    ));
