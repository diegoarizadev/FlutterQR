import 'package:flutter/material.dart';

class FloatingActionCustom extends StatelessWidget {
  const FloatingActionCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(
        Icons.filter_center_focus,
        color: Colors.black,
      ),
      backgroundColor: Colors.orange,
    );
  }
}
