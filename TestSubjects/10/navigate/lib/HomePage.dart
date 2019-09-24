import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  
  HomePage({
    Key key,
    @required this.name, this.mobile, this.email, this.collegename
  }) : super (key : key);
  final String name, mobile, email, collegename;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("printing"),
      ),
      body: Card(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Image(
              image: AssetImage(""),
              width: 100.0,
              height: 100.0,
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Name: $name"),
            ),
            ListTile(
              leading: Icon(Icons.mobile_screen_share),
              title: Text("MobileNum: $mobile"),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("Email id: $email"),
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text("college Name: $collegename"),
            ),
          ],
        ),
      ),
    );
  }
}

