import 'package:flutter/material.dart';
import 'package:student_app_v3/apps/blog/blog_main.dart';

import 'apps/todo/todo_main.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.lightBlueAccent,
              height: 800.0,
              width: double.infinity,
              child: Stack(
                children: <Widget>[
                  //Container for top data
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "myStudent",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 36,
                                  fontWeight: FontWeight.w700),
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.notifications,
                                    color: Colors.lightBlue[100],
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.white,
                                    child: ClipOval(
                                      child: Image.asset(
                                        "assets/dp.jpg",
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(243, 245, 248, 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(18))),
                                    child: Icon(
                                      Icons.date_range,
                                      color: Colors.blue[900],
                                      size: 30,
                                    ),
                                    padding: EdgeInsets.all(12),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "myCalender",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        color: Colors.blue[100]),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(243, 245, 248, 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(18))),
                                    child: Icon(
                                      Icons.local_hospital,
                                      color: Colors.blue[900],
                                      size: 30,
                                    ),
                                    padding: EdgeInsets.all(12),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "Safety",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        color: Colors.blue[100]),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(243, 245, 248, 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(18))),
                                    child: Icon(
                                      Icons.attach_money,
                                      color: Colors.blue[900],
                                      size: 30,
                                    ),
                                    padding: EdgeInsets.all(12),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "Wallet",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        color: Colors.blue[100]),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(243, 245, 248, 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(18))),
                                    child: Icon(
                                      Icons.trending_down,
                                      color: Colors.blue[900],
                                      size: 30,
                                    ),
                                    padding: EdgeInsets.all(12),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "Topup",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        color: Colors.blue[100]),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),

                  //draggable sheet
                  DraggableScrollableSheet(
                    builder: (context, scrollController) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(243, 245, 248, 1),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40))),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 10.0,
                              ),

                              //Container for buttons
                              Container(
//                                padding: EdgeInsets.symmetric(horizontal: 32),
                                child: Row(
                                  children: <Widget>[
//                                    Container(
//                                      child: Text(
//                                        "All",
//                                        style: TextStyle(
//                                            fontWeight: FontWeight.w700,
//                                            fontSize: 14,
//                                            color: Colors.grey[900]),
//                                      ),
//                                      decoration: BoxDecoration(
//                                          color: Colors.white,
//                                          borderRadius: BorderRadius.all(
//                                              Radius.circular(20)),
//                                          boxShadow: [
//                                            BoxShadow(
//                                                color: Colors.grey[200],
//                                                blurRadius: 10.0,
//                                                spreadRadius: 4.5)
//                                          ]),
//                                      padding: EdgeInsets.symmetric(
//                                          horizontal: 20, vertical: 10),
//                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
//                                    Container(
//                                      child: Row(
//                                        children: <Widget>[
//                                          CircleAvatar(
//                                            radius: 8,
//                                            backgroundColor: Colors.green,
//                                          ),
//                                          SizedBox(
//                                            width: 8,
//                                          ),
//                                          Text(
//                                            "Income",
//                                            style: TextStyle(
//                                                fontWeight: FontWeight.w700,
//                                                fontSize: 14,
//                                                color: Colors.grey[900]),
//                                          ),
//                                        ],
//                                      ),
//                                      decoration: BoxDecoration(
//                                          color: Colors.white,
//                                          borderRadius: BorderRadius.all(
//                                              Radius.circular(20)),
//                                          boxShadow: [
//                                            BoxShadow(
//                                                color: Colors.grey[200],
//                                                blurRadius: 10.0,
//                                                spreadRadius: 4.5)
//                                          ]),
//                                      padding: EdgeInsets.symmetric(
//                                          horizontal: 20, vertical: 10),
//                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
//                                    Container(
//                                      child: Row(
//                                        children: <Widget>[
//                                          CircleAvatar(
//                                            radius: 8,
//                                            backgroundColor: Colors.orange,
//                                          ),
//                                          SizedBox(
//                                            width: 8,
//                                          ),
//                                          Text(
//                                            "Expenses",
//                                            style: TextStyle(
//                                                fontWeight: FontWeight.w700,
//                                                fontSize: 14,
//                                                color: Colors.grey[900]),
//                                          ),
//                                        ],
//                                      ),
//                                      decoration: BoxDecoration(
//                                          color: Colors.white,
//                                          borderRadius: BorderRadius.all(
//                                              Radius.circular(20)),
//                                          boxShadow: [
//                                            BoxShadow(
//                                                color: Colors.grey[200],
//                                                blurRadius: 10.0,
//                                                spreadRadius: 4.5)
//                                          ]),
//                                      padding: EdgeInsets.symmetric(
//                                          horizontal: 20, vertical: 10),
//                                    )
                                  ],
                                ),
                              ),

                              SizedBox(
                                height: 10,
                              ),
                              //Container Listview for expenses and incomes

                              //TODO: My own grid view
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      elevation: 50,
                                      shadowColor: Colors.redAccent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      color: Colors.white10,
                                      child: SizedBox(
                                        width: 160,
                                        height: 135,
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor:
                                                    Colors.blue[500],
                                                radius: 30,
                                                child: CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMzMMqRGoSeNEE0nJK4k7OcXkzrNrNtV0RCQ&usqp=CAU"), //NetworkImage
                                                  radius: 100,
                                                ), //CircleAvatar
                                              ), //CirclAvatar
                                              SizedBox(
                                                height: 5,
                                              ), //SizedBox
                                              Text(
                                                'Calculator',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                ), //Textstyle
                                              ), //Text
                                              SizedBox(
                                                height: 8,
                                              ), //SizedBox
                                            ],
                                          ), //Column
                                        ), //Padding
                                      ), //SizedBox
                                    ),
                                  ), //Card
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => BlogMain()));
                                      },
                                      child: Card(
                                        elevation: 50,
                                        shadowColor: Colors.lightBlueAccent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        color: Colors.white10,
                                        child: SizedBox(
                                          width: 160,
                                          height: 135,
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Column(
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor: Colors.white10,
                                                  radius: 30,
                                                  child: CircleAvatar(
                                                    backgroundImage: NetworkImage(
                                                        "https://lh3.googleusercontent.com/proxy/JREUwXiHtF7eEe8dfWTf6u6KrV_fjpAbKcP3Re1qj4l6llXzlP3IdNwHv_zLFSTrttHEfqeMb9Pd_H-Nbn-y_Hsl"), //NetworkImage
                                                    radius: 100,
                                                  ), //CircleAvatar
                                                ), //CirclAvatar
                                                SizedBox(
                                                  height: 5,
                                                ), //SizedBox
                                                Text(
                                                  'Blog',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                  ), //Textstyle
                                                ), //Text
                                                SizedBox(
                                                  height: 8,
                                                ), //SizedBox
                                              ],
                                            ), //Column
                                          ), //Padding
                                        ), //SizedBox
                                      ),
                                    ),
                                  ), //Card
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      elevation: 50,
                                      shadowColor: Colors.purple,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      color: Colors.white10,
                                      child: SizedBox(
                                        width: 160,
                                        height: 135,
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor: Colors.white10,
                                                radius: 30,
                                                child: CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT39neHHuL68UTyWdihnxO4x0j-qise-Mablw&usqp=CAU"), //NetworkImage
                                                  radius: 100,
                                                ), //CircleAvatar
                                              ), //CirclAvatar
                                              SizedBox(
                                                height: 5,
                                              ), //SizedBox
                                              Text(
                                                'Online-Radio',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                ), //Textstyle
                                              ), //Text
                                              SizedBox(
                                                height: 8,
                                              ), //SizedBox
                                            ],
                                          ), //Column
                                        ), //Padding
                                      ), //SizedBox
                                    ),
                                  ), //Card
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => TodoMain()));
                                      },
                                      child: Card(
                                        elevation: 50,
                                        shadowColor: Colors.lightGreenAccent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        color: Colors.white10,
                                        child: SizedBox(
                                          width: 160,
                                          height: 135,
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Column(
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor:
                                                      Colors.blueGrey[500],
                                                  radius: 30,
                                                  child: CircleAvatar(
                                                    backgroundImage: NetworkImage(
                                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtJVx8s4ZVMcuVaP8KRBd5Q-Dekf6adg6DCQ&usqp=CAU"), //NetworkImage
                                                    radius: 100,
                                                  ), //CircleAvatar
                                                ), //CirclAvatar
                                                SizedBox(
                                                  height: 5,
                                                ), //SizedBox
                                                Text(
                                                  'Todo',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                  ), //Textstyle
                                                ), //Text
                                                SizedBox(
                                                  height: 8,
                                                ), //SizedBox
                                              ],
                                            ), //Column
                                          ), //Padding
                                        ), //SizedBox
                                      ),
                                    ),
                                  ), //Card
                                ],
                              ),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      elevation: 50,
                                      shadowColor: Colors.cyanAccent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      color: Colors.white10,
                                      child: SizedBox(
                                        width: 160,
                                        height: 135,
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor: Colors.white10,
                                                radius: 30,
                                                child: CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTldSHfSx_0SuJ2ba063dxvktCGYbLM5yd_6g&usqp=CAU"), //NetworkImage
                                                  radius: 100,
                                                ), //CircleAvatar
                                              ), //CirclAvatar
                                              SizedBox(
                                                height: 5,
                                              ), //SizedBox
                                              Text(
                                                'Quiz',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                ), //Textstyle
                                              ), //Text
                                              SizedBox(
                                                height: 8,
                                              ), //SizedBox
                                            ],
                                          ), //Column
                                        ), //Padding
                                      ), //SizedBox
                                    ),
                                  ), //Card
                                  Card(
                                    elevation: 50,
                                    shadowColor: Colors.yellowAccent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    color: Colors.white10,
                                    child: SizedBox(
                                      width: 160,
                                      height: 135,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor:
                                                  Colors.blueGrey[500],
                                              radius: 30,
                                              child: CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-Kp3JK0Wpdk1PUHwnZVMjjhOncrXr_jjJcQ&usqp=CAU"), //NetworkImage
                                                radius: 100,
                                              ), //CircleAvatar
                                            ), //CirclAvatar
                                            SizedBox(
                                              height: 5,
                                            ), //SizedBox
                                            Text(
                                              'Dictionary',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                              ), //Textstyle
                                            ), //Text
                                            SizedBox(
                                              height: 8,
                                            ), //SizedBox
                                          ],
                                        ), //Column
                                      ), //Padding
                                    ), //SizedBox
                                  ), //Card
                                ],
                              ),
//                              Row(
//                                mainAxisAlignment:
//                                    MainAxisAlignment.spaceEvenly,
//                                children: [
//                                  Padding(
//                                    padding: const EdgeInsets.all(8.0),
//                                    child: Card(
//                                      elevation: 50,
//                                      shadowColor: Colors.black,
//                                      shape: RoundedRectangleBorder(
//                                        borderRadius: BorderRadius.circular(20),
//                                      ),
//                                      color: Colors.greenAccent[100],
//                                      child: SizedBox(
//                                        width: 160,
//                                        height: 135,
//                                        child: Padding(
//                                          padding: const EdgeInsets.all(20.0),
//                                          child: Column(
//                                            children: [
//                                              CircleAvatar(
//                                                backgroundColor:
//                                                    Colors.green[500],
//                                                radius: 30,
//                                                child: CircleAvatar(
//                                                  backgroundImage: NetworkImage(
//                                                      "https://pbs.twimg.com/profile_images/1304985167476523008/QNHrwL2q_400x400.jpg"), //NetworkImage
//                                                  radius: 100,
//                                                ), //CircleAvatar
//                                              ), //CirclAvatar
//                                              SizedBox(
//                                                height: 5,
//                                              ), //SizedBox
//                                              Text(
//                                                'GeeksforGeeks',
//                                                style: TextStyle(
//                                                  fontSize: 15,
//                                                  color: Colors.green[900],
//                                                  fontWeight: FontWeight.w500,
//                                                ), //Textstyle
//                                              ), //Text
//                                              SizedBox(
//                                                height: 8,
//                                              ), //SizedBox
//                                            ],
//                                          ), //Column
//                                        ), //Padding
//                                      ), //SizedBox
//                                    ),
//                                  ), //Card
//                                  Padding(
//                                    padding: const EdgeInsets.all(8.0),
//                                    child: Card(
//                                      elevation: 50,
//                                      shadowColor: Colors.black,
//                                      shape: RoundedRectangleBorder(
//                                        borderRadius: BorderRadius.circular(20),
//                                      ),
//                                      color: Colors.purple[800],
//                                      child: SizedBox(
//                                        width: 160,
//                                        height: 135,
//                                        child: Padding(
//                                          padding: const EdgeInsets.all(20.0),
//                                          child: Column(
//                                            children: [
//                                              CircleAvatar(
//                                                backgroundColor:
//                                                    Colors.blueGrey[500],
//                                                radius: 30,
//                                                child: CircleAvatar(
//                                                  backgroundImage: NetworkImage(
//                                                      "https://lh3.googleusercontent.com/proxy/JREUwXiHtF7eEe8dfWTf6u6KrV_fjpAbKcP3Re1qj4l6llXzlP3IdNwHv_zLFSTrttHEfqeMb9Pd_H-Nbn-y_Hsl"), //NetworkImage
//                                                  radius: 100,
//                                                ), //CircleAvatar
//                                              ), //CirclAvatar
//                                              SizedBox(
//                                                height: 5,
//                                              ), //SizedBox
//                                              Text(
//                                                'Blog',
//                                                style: TextStyle(
//                                                  fontSize: 15,
//                                                  color: Colors.green[900],
//                                                  fontWeight: FontWeight.w500,
//                                                ), //Textstyle
//                                              ), //Text
//                                              SizedBox(
//                                                height: 8,
//                                              ), //SizedBox
//                                            ],
//                                          ), //Column
//                                        ), //Padding
//                                      ), //SizedBox
//                                    ),
//                                  ), //Card
//                                ],
//                              ),
//                              Row(
//                                mainAxisAlignment:
//                                    MainAxisAlignment.spaceEvenly,
//                                children: [
//                                  Padding(
//                                    padding: const EdgeInsets.all(8.0),
//                                    child: Card(
//                                      elevation: 50,
//                                      shadowColor: Colors.black,
//                                      shape: RoundedRectangleBorder(
//                                        borderRadius: BorderRadius.circular(20),
//                                      ),
//                                      color: Colors.greenAccent[100],
//                                      child: SizedBox(
//                                        width: 160,
//                                        height: 135,
//                                        child: Padding(
//                                          padding: const EdgeInsets.all(20.0),
//                                          child: Column(
//                                            children: [
//                                              CircleAvatar(
//                                                backgroundColor:
//                                                    Colors.green[500],
//                                                radius: 30,
//                                                child: CircleAvatar(
//                                                  backgroundImage: NetworkImage(
//                                                      "https://pbs.twimg.com/profile_images/1304985167476523008/QNHrwL2q_400x400.jpg"), //NetworkImage
//                                                  radius: 100,
//                                                ), //CircleAvatar
//                                              ), //CirclAvatar
//                                              SizedBox(
//                                                height: 5,
//                                              ), //SizedBox
//                                              Text(
//                                                'GeeksforGeeks',
//                                                style: TextStyle(
//                                                  fontSize: 15,
//                                                  color: Colors.green[900],
//                                                  fontWeight: FontWeight.w500,
//                                                ), //Textstyle
//                                              ), //Text
//                                              SizedBox(
//                                                height: 8,
//                                              ), //SizedBox
//                                            ],
//                                          ), //Column
//                                        ), //Padding
//                                      ), //SizedBox
//                                    ),
//                                  ), //Card
//                                  Padding(
//                                    padding: const EdgeInsets.all(8.0),
//                                    child: Card(
//                                      elevation: 50,
//                                      shadowColor: Colors.black,
//                                      shape: RoundedRectangleBorder(
//                                        borderRadius: BorderRadius.circular(20),
//                                      ),
//                                      color: Colors.purple[800],
//                                      child: SizedBox(
//                                        width: 160,
//                                        height: 135,
//                                        child: Padding(
//                                          padding: const EdgeInsets.all(20.0),
//                                          child: Column(
//                                            children: [
//                                              CircleAvatar(
//                                                backgroundColor:
//                                                    Colors.blueGrey[500],
//                                                radius: 30,
//                                                child: CircleAvatar(
//                                                  backgroundImage: NetworkImage(
//                                                      "https://lh3.googleusercontent.com/proxy/JREUwXiHtF7eEe8dfWTf6u6KrV_fjpAbKcP3Re1qj4l6llXzlP3IdNwHv_zLFSTrttHEfqeMb9Pd_H-Nbn-y_Hsl"), //NetworkImage
//                                                  radius: 100,
//                                                ), //CircleAvatar
//                                              ), //CirclAvatar
//                                              SizedBox(
//                                                height: 5,
//                                              ), //SizedBox
//                                              Text(
//                                                'Blog',
//                                                style: TextStyle(
//                                                  fontSize: 15,
//                                                  color: Colors.green[900],
//                                                  fontWeight: FontWeight.w500,
//                                                ), //Textstyle
//                                              ), //Text
//                                              SizedBox(
//                                                height: 8,
//                                              ), //SizedBox
//                                            ],
//                                          ), //Column
//                                        ), //Padding
//                                      ), //SizedBox
//                                    ),
//                                  ), //Card
//                                ],
//                              ),
                            ],
                          ),
                          controller: scrollController,
                        ),
                      );
                    },
                    initialChildSize: 0.65,
                    minChildSize: 0.65,
                    maxChildSize: 1,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
