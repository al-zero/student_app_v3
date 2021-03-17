import 'package:flutter/material.dart';

class MapView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("school Map"),
      ),
      body: Hero(
        tag: "alpha",
        transitionOnUserGestures: true,
        child: Container(
          color: Colors.green
        ),
      ),
    );
  }
}
