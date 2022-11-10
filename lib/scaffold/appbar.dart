import 'package:flutter/material.dart';

class InstaAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  InstaAppBar({
    this.onPressAction,
  }) : preferredSize = Size.fromHeight(50.0);
  final onPressAction;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Instagram",
        style: TextStyle(
          fontFamily: "Insta",
          fontSize: 40,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.add_box_outlined),
          onPressed: onPressAction,
        ),
      ],
    );
  }
}
