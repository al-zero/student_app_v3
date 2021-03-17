import 'package:flutter/material.dart';

class Policies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'tag',
      child: Scaffold(
        appBar: AppBar(
          title: new Text("School Policies "),
        ),
        body: Hero(
          tag: "alpha",
          transitionOnUserGestures: true,
          child: Container(
            color: Colors.brown
          ),
        ),
      ),
    );
  }
}
