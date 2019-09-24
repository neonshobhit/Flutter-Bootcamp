import 'package:flutter/material.dart';
import 'package:navigationapp/HomePage.dart';
import 'package:navigationapp/Category.dart';

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
      },
    );
  }
}