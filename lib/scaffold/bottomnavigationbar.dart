import 'package:flutter/material.dart';

final InstaBottomnNavigationBar = BottomNavigationBar(
  showSelectedLabels: false,
  showUnselectedLabels: false,
  currentIndex: 0,
  items: [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: "home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_bag_outlined),
      label: "shop",
    ),
  ],
);
