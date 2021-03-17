import 'package:flutter/material.dart';

class SchoolDirectory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("School Directory "),
      ),
      body: Hero(
        tag: "alpha",
        transitionOnUserGestures: true,
        child: Container(
          color: Colors.teal,
        ),
      ),
    );
  }
}
