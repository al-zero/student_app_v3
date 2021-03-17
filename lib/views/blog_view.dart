import 'package:flutter/material.dart';

class Blog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Blog'),
      ),
      body: Hero(
        tag: "alpha",
        transitionOnUserGestures: true,
        child: Container(
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}
