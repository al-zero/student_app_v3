import 'package:flutter/material.dart';

class OnlineRadio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Online Radio"),
      ),
      body: Hero(
        tag: "alpha",
        transitionOnUserGestures: true,
        child: Container(
          color: Colors.black38
        ),
      ),
    );
  }
}
