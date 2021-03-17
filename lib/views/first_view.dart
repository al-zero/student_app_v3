import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:student_app_v3/widgets/custom_dialog.dart';

class FirstView extends StatelessWidget {
  final primaryColor = const Color(0xFF75A2EA);

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return new Scaffold(
      body: new Container(
        width: _width,
        height: _height,
        color: Colors.lightBlue[50] ,
        child: new SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: new Column(
                children: <Widget>[
                  SizedBox(height: _height * 0.10),
                  new AutoSizeText(
                    "Welcome",
                    style: TextStyle(fontSize: 44, color: Colors.black),
                  ),
                  SizedBox(height: _height * 0.10),
                  new AutoSizeText(
                    "Let's start planning your next trip ",
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: _height * 0.15),
                  RaisedButton(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 10.0, left: 30.0, right: 30.0),
                        child: new Text(
                          'Get Started ',
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 28,
                              fontWeight: FontWeight.w200),
                        ),
                      ),
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => CustomDialog(
                              title:
                              "Would you like to create a free account ?",
                              description:
                              "With an account, your data will be securely saved, allowing you to access it from multiple devices.",
                              primaryButtonText: "Create An Account",
                              primaryButtonRoute: "/signUp",
                              secondaryButtonText: "Maybe Later",
                              secondaryButtonRoute: "/anonymousSignIn",
                            ));
                      }),
                  SizedBox(height: _height * 0.05),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/signIn');
                    },
                    child: new Text(
                      'Sign In',
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
