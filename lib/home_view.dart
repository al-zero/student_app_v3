import 'package:flutter/material.dart';

import 'models/job.dart';

import 'models/global.dart';

void main() => runApp(HomeView());

class HomeView extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
// Todo : change it to a stateless widget

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                /*
                Container(
                  padding: EdgeInsets.all(40),
                  constraints: BoxConstraints.expand(height: 120),
                  decoration: BoxDecoration(
                      gradient: new LinearGradient(
                          colors: [lightBlueIsh, lightGreen],
                          begin: const FractionalOffset(1.0, 1.0),
                          end: const FractionalOffset(0.2, 0.2),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp
                      ),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight:  Radius.circular(30))
                  ),
                  child: Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Student Assistant ', style: titleStyleWhite,)
                      ],
                    ),
                  ),
                ),
                    */
                Container(
                  height: 750,
                  margin: EdgeInsets.only(top: 60),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 1.0),
                        child: Text(
                          "Explore New Opportunities",
                          style: titileStyleBlack,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 700,
                          child: ListView(
                            children: getJobCategories(),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  List<String> jobCategories = ["Blog", "Margarine", "Maps", "Quiz", "Directory", "O-Radio"];

  Map jobCatToIcon = {
    "Blog" : Icon(Icons.monetization_on, color: lightBlueIsh, size: 50,),
    "Margarine" : Icon(Icons.settings, color: lightBlueIsh, size: 50),
    "Maps" : Icon(Icons.map, color: lightBlueIsh, size: 50),
    "Quiz" : Icon(Icons.question_answer, color: lightBlueIsh, size: 50),
    "Student Directory" : Icon(Icons.contact_mail, color: lightBlueIsh, size: 50),
    "Online Radio" : Icon(Icons.radio, color: lightBlueIsh, size: 50),
  };

  Widget getCategoryContainer(String categoryName) {
    return new Container(
      margin: EdgeInsets.only(right: 10, left: 10, bottom: 40),
      height: 180,
      width: 140,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          new BoxShadow(
            color: Colors.grey,
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Text(categoryName, style: titileStyleLighterBlack),
          Container(
            padding: EdgeInsets.only(top: 30),
            height: 100,
            width: 70,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              child:  jobCatToIcon[categoryName],
              elevation: 10,
              onPressed: () {

              },
            ),
          )
        ],
      ),
    );
  }

  List<Widget> getJobCategories() {
    List<Widget> jobCategoriesCards = [];
    List<Widget> rows = [];
    int i = 0;
    for (String category in jobCategories) {
      if (i < 2) {
        rows.add(getCategoryContainer(category));
        i ++;
      } else {
        i = 0;
        jobCategoriesCards.add(new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: rows,
        ));
        rows = [];
        rows.add(getCategoryContainer(category));
        i++;
      }
    }
    if (rows.length > 0) {
      jobCategoriesCards.add(new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rows,
      ));
    }
    return jobCategoriesCards;
  }

}
