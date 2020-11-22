import 'package:flutter/material.dart';
import 'package:student_app_v3/views/home_view.dart';
import 'package:student_app_v3/pages.dart';
import 'package:student_app_v3/views/profile_view.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home>{

  int _currentIndex = 0;
  // taking widgets from the pages.dart
  final List<Widget> _children = [
    HomeView(),
    ChatPage(),
    ProfileView(),
  ];

  void onTabTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override 
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: new BottomNavigationBar(
        onTap: onTabTapped,
          currentIndex: _currentIndex,
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.account_balance),
              title: new Text('Home')
            ),
            BottomNavigationBarItem(
                icon: new Icon(Icons.chat),
                title: new Text('Chat')
            ),
            BottomNavigationBarItem(
                icon: new Icon(Icons.person_outline),
                title: new Text('Person')
            ),
           // TODO : make it appear
           /* BottomNavigationBarItem(
                icon: new Icon(Icons.person_outline),
                title: new Text('Profile')
            ),*/
          ]
      ),
      
    );
  }
}