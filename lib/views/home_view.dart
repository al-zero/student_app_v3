//import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:student_app_v3/views/grid_view.dart';
//
//class HomePageTest extends StatefulWidget {
//  @override
//  _HomePageTestState createState() => _HomePageTestState();
//}
//
//class _HomePageTestState extends State<HomePageTest> {
//  final productivityType = [
//    "Music",
//    "Forum",
//    "Todo",
//    "Dictionary",
//    "Medic",
//    "Calculator",
//    "College Policies",
//    "Directory",
//    "Career Guidance "
//  ];
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        body: Container(
//      child: Column(
//
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//        children: [
//          SizedBox(
//            height: MediaQuery.of(context).size.height * 0.02,
//          ),
//          Text('Productivity'),
//          Container(
//            height: MediaQuery.of(context).size.height * 0.40,
//            margin: EdgeInsets.all(10),
//            //padding: EdgeInsets.all(10),
//            alignment: Alignment.topCenter,
//            decoration: BoxDecoration(
//                color: Colors.white,
//                border: Border.all(
//                    color: Colors.lightBlue[800], // set border color
//                    width: 3.0), // set border width
//                borderRadius: BorderRadius.all(
//                    Radius.circular(10.0)), // set rounded corner radius
//                boxShadow: [
//                  BoxShadow(
//                    blurRadius: 10,
//                    color: Colors.black,
//                    offset: Offset(1, 3),
//                  ),
//                ] // make rounded corner of border
//                ),
//            child: Padding(
//              padding: const EdgeInsets.all(30.0),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: [
//                  // Text('Productivity Tools'),
//                  Expanded(
//                    child: GridView.count(
//                      // shrinkWrap: true,
//                      crossAxisCount: 3,
//                      scrollDirection: Axis.vertical,
//                      primary: false,
//                      children: List.generate(
//                        productivityType.length,
//                        (index) {
//                          return FlatButton(
//                              onPressed: () {
//
//                              },
//                              child: Column(
//                                mainAxisAlignment: MainAxisAlignment.start,
//                                children: [
//                                  IconButton(icon: Icon(Icons.category),),
//
//                                  Text(productivityType[index]),
//                                ],
//                              ));
//                        },
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          ),
//          // Divider(),
//          MyGridView(),
//          //MyApp(),
//        ],
//      ),
//    )
////      GridView.count(
////        crossAxisCount: 2,
////        padding: EdgeInsets.all(16.0),
////        childAspectRatio: 0.9,
////        crossAxisSpacing: 10.0,
////        mainAxisSpacing: 10.0,
////        children: [
////          myGridItems("Java", "https://www.rolandberger.com/img/Tiles/KIQuiz_Search_result_teaser_01.jpg", 0xFFF48FB1,0xFFF8BBD0 ),
////          myGridItems("flutter", "https://health.usf.edu/-/media/Blog/HealthIS/Images/2018/04/Programming-code-on-computer.ashx?h=234&w=350&hash=C2B094D3FC563F7699B02C86DF95C77834BDC13B&hash=C2B094D3FC563F7699B02C86DF95C77834BDC13B&la=en')", 0xFF7986CB,0xFF4DD0E1 ),
////          myGridItems("dart", "https://health.usf.edu/-/media/Blog/HealthIS/Images/2018/04/Programming-code-on-computer.ashx?h=234&w=350&hash=C2B094D3FC563F7699B02C86DF95C77834BDC13B&hash=C2B094D3FC563F7699B02C86DF95C77834BDC13B&la=en", 0xFFB388FF, 0xFFB0BEC5),
////          myGridItems("python", "https://health.usf.edu/-/media/Blog/HealthIS/Images/2018/04/Programming-code-on-computer.ashx?h=234&w=350&hash=C2B094D3FC563F7699B02C86DF95C77834BDC13B&hash=C2B094D3FC563F7699B02C86DF95C77834BDC13B&la=en", 0xFF1DE9B6, 0xFF00796B),
////          myGridItems("c++", "https://health.usf.edu/-/media/Blog/HealthIS/Images/2018/04/Programming-code-on-computer.ashx?h=234&w=350&hash=C2B094D3FC563F7699B02C86DF95C77834BDC13B&hash=C2B094D3FC563F7699B02C86DF95C77834BDC13B&la=en", 0xFF00E5FF, 0xFF00B8D4),
////          myGridItems("php", "https://health.usf.edu/-/media/Blog/HealthIS/Images/2018/04/Programming-code-on-computer.ashx?h=234&w=350&hash=C2B094D3FC563F7699B02C86DF95C77834BDC13B&hash=C2B094D3FC563F7699B02C86DF95C77834BDC13B&la=en", 0xFFC6FF00, 0xFFAEEA00),
////          myGridItems("django", "https://health.usf.edu/-/media/Blog/HealthIS/Images/2018/04/Programming-code-on-computer.ashx?h=234&w=350&hash=C2B094D3FC563F7699B02C86DF95C77834BDC13B&hash=C2B094D3FC563F7699B02C86DF95C77834BDC13B&la=en", 0xFFEC407A,0xFFF8BBD0 ),
////          myGridItems("spring", "https://health.usf.edu/-/media/Blog/HealthIS/Images/2018/04/Programming-code-on-computer.ashx?h=234&w=350&hash=C2B094D3FC563F7699B02C86DF95C77834BDC13B&hash=C2B094D3FC563F7699B02C86DF95C77834BDC13B&la=en", 0xFF7986CB,0xFF4DD0E1 ),
////
////        ],
////      ),
//        );
//  }
//
//  Widget myGridItems(
//      String gridName, String gridImage, int color1, int color2) {
//    return GridTile(
//      child: InkWell(
//        onTap: () {
//          print('testing 123');
//        },
//        child: Container(
//          decoration: BoxDecoration(
//              borderRadius: BorderRadius.circular(24.0),
//              gradient: new LinearGradient(
//                colors: [
//                  Color(color1),
//                  Color(color2),
//                ],
//                begin: Alignment.centerLeft,
//                end: new Alignment(1.0, 1.0),
//              )),
//          child: Stack(
//            children: [
//              Opacity(
//                opacity: 0.3,
//                child: Container(
//                  decoration: new BoxDecoration(
//                      borderRadius: BorderRadius.circular(24.0),
//                      image: new DecorationImage(
//                          image: new NetworkImage(gridImage),
//                          fit: BoxFit.fill)),
//                ),
//              ),
//              Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: [
//                  Container(
//                    child: new Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: [
//                        Container(
//                          child: new Text(
//                            "job",
//                            style:
//                                TextStyle(color: Colors.white, fontSize: 16.0),
//                          ),
//                        ),
//                        SizedBox(
//                          width: 10.0,
//                        ),
//                        Container(
//                            child: Icon(FontAwesomeIcons.compass,
//                                color: Colors.white)),
//                        SizedBox(
//                          width: 10.0,
//                        ),
//                        Container(
//                          child: new Text(
//                            "Guide",
//                            style:
//                                TextStyle(color: Colors.white, fontSize: 16.0),
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                  Padding(
//                    padding: const EdgeInsets.only(left: 16.0),
//                    child: new Text(
//                      gridName,
//                      style: TextStyle(
//                          color: Colors.white,
//                          fontSize: 20.0,
//                          fontWeight: FontWeight.bold),
//                    ),
//                  ),
//                  HomePageTest(),
//                ],
//              )
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}

import 'package:flutter/material.dart';
import 'package:student_app_v3/apps/todo/todo_main.dart';
import 'package:student_app_v3/views/blog_view.dart';
import 'package:student_app_v3/views/exam_view.dart';
import 'package:student_app_v3/views/map_view.dart';
import 'package:student_app_v3/views/online_radio_view.dart';
import 'package:student_app_v3/views/policies_view.dart';
import 'package:student_app_v3/views/school_directory_view.dart';

class HomePageTest extends StatefulWidget {
  @override
  _HomePageTestState createState() => _HomePageTestState();
}

class _HomePageTestState extends State<HomePageTest> {
  List<String> homeList = [
    "Blog",
    "Online Radio",
    "School Map",
    "Exam Prep",
//    "Directory",
//    "Policies",
    "Todo",
    "Calculator"
//    "Sample",
  ];

  ScrollController _controller = new ScrollController();

  @override
  void initState() {
    super.initState();
    homeList = List.generate(homeList.length, (ind) => homeList[ind]).toList();
  }

  onTapped(i){
    print(i);
    if(i==0){
      Navigator.push(context, MaterialPageRoute(builder: (context) => Blog()),);
      print("Blog");
    }else if(i==1){
      Navigator.push(context, MaterialPageRoute(builder: (context) => OnlineRadio()));
      print("Online radio");
    }else if(i==2){
      Navigator.push(context, MaterialPageRoute(builder: (context) => MapView()));
      print("School Map");
    } else if(i==3){
      Navigator.push(context, MaterialPageRoute(builder: (context) => ExamView()));
      print("Exam Prep");
    } else if(i==4){
      Navigator.push(context, MaterialPageRoute(builder: (context) => TodoMain()));
      print("Todo");
    } else if(i==6){
      Navigator.push(context, MaterialPageRoute(builder: (context) => Policies()));
      print("Policies");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "alpha",
      transitionOnUserGestures: true,
      child: Scaffold(
//        appBar: AppBar(
//          title: Text("hello"),
//        ),
          body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            // PRODUCTIVITY ICONS
//            Container(
//              height: MediaQuery.of(context).size.height * 0.15,
//              // color: Colors.lightBlue,
//              decoration: BoxDecoration(
//                color: Colors.white,
//                border: Border.all(
//                    color: Colors.lightBlue[700], // set border color
//                    //color: Colors.white,
//                    width: 5.0), // set border width
//                borderRadius: BorderRadius.all(
//                    Radius.circular(40.0)), // set rounded corner radius
//                boxShadow: [
//                  BoxShadow(
//                    blurRadius: 10,
//                    color: Colors.black,
//                    offset: Offset(1, 3),
//                  ),
//                ], // make rounded corner
//                // color: Colors.indigo[300],
//                //   borderRadius: BorderRadius.circular(15.0)
//              ),
//
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//                crossAxisAlignment: CrossAxisAlignment.center,
//                children: [
//                  Padding(
//                    padding: const EdgeInsets.all(20.0),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                      crossAxisAlignment: CrossAxisAlignment.center,
//                      children: [
//                        IconButton(icon: Icon(Icons.music_video, color: Colors.deepOrange, size: 30.0,), onPressed: null),
//                        IconButton(icon: Icon(Icons.local_hospital, color: Colors.red, size: 30.0,), onPressed: null),
//                      ],
//                    ),
//                  ),
//                ],
//              ),
//            ),
            // BOTTOM GRIDS
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, bottom: 8.0),
                        child: GridView.builder(
                            shrinkWrap: true,
                            controller: _controller,
                            itemCount: homeList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, crossAxisSpacing: 30),
                            itemBuilder: (ctx, i) {
                              return GestureDetector(
                                onTap: () {
                                    onTapped(i);
                                  },
                                child: Container(
                                  child: Center(child: Text(homeList[i])),
                                  margin: EdgeInsets.only(bottom: 20.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.black, // set border color
                                        //color: Colors.white,
                                        width: 2.0), // set border width
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            10.0)), // set rounded corner radius
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 10,
                                        color: Colors.black,
                                        offset: Offset(1, 3),
                                      ),
                                    ], // make rounded corner
                                    // color: Colors.indigo[300],
                                    //   borderRadius: BorderRadius.circular(15.0)
                                  ),
                                ),
                              );
                            }),
                      ),
                    ])),
              ),
            )
          ],
        ),
      )),
    );
  }
}
