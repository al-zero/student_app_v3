import 'package:flutter/material.dart';

class ExamView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Exam"),
      ),
      body: Hero(
        tag: "alpha",
        transitionOnUserGestures: true,
        child: Container(
          color: Colors.amber
        ),
      ),
    );
  }
}
