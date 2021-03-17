import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}
class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'Bttmtag',
      child: Container(
        color: Colors.purpleAccent,
      ),
    );
  }
}



