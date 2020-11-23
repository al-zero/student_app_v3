import 'package:flutter/material.dart';
import 'package:student_app_v3/services/auth_service.dart';
import 'package:student_app_v3/widgets/provider_widget.dart';


class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.undo),
              onPressed: () async {
                try{
                  AuthService auth = Provider.of(context).auth;
                  await auth.signOut();
                  print("Signed out");
                } catch(e){
                  print(e);
                }
              }),
        ],
      ),
      body: new  Container(
        color: Colors.amber,
      ),
    );
  }
}