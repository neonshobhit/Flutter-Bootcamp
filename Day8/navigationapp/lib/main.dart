import 'package:flutter/material.dart';
import 'package:navigationapp/HomePage.dart';
import 'package:navigationapp/Category.dart';
import 'package:navigationapp/Login.dart';
import 'package:navigationapp/SignUp.dart';
import 'Profile.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        "/a" :(BuildContext context) => Category(),
        "/Login": (BuildContext context) => Login(),
        "/SignUp": (BuildContext context) => SignUp(),
        "/Profile" :(BuildContext context) => Profile(),

      },
    );
  }
}