import 'package:flutter/material.dart';

class Todo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: "alpha",
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}
