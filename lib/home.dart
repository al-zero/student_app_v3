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
    //HomeView(),
    //MyHomePage(), - from stakeoverflow
    HomePageTest(),
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
      backgroundColor: Colors.lightBlue[50],
      body: _children[_currentIndex],
      bottomNavigationBar: Hero(
        tag: 'Bttmtag',
        child: new BottomNavigationBar(
          onTap: onTabTapped,
            currentIndex: _currentIndex,
            backgroundColor: Colors.lightBlue[50],
            items: [
              BottomNavigationBarItem(
                icon: new Icon(Icons.account_balance),
                title: new Text('Home')
              ),
              BottomNavigationBarItem(
                  icon: new Icon(Icons.school),
                  title: new Text('Classes')
              ),

              BottomNavigationBarItem(
                  icon: new Icon(Icons.settings),
                  title: new Text('Settings')
              ),
             // TODO : make it appear
             /* BottomNavigationBarItem(
                  icon: new Icon(Icons.person_outline),
                  title: new Text('Profile')
              ),*/
            ]
        ),
      ),
      
    );
  }
}