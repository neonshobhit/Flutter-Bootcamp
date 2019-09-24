import 'package:flutter/material.dart';
import 'People.dart';
import 'Feed.dart';
import 'HomePage.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Feed(),
      routes: <String, WidgetBuilder>{
        "/Feed" :(BuildContext context) => Feed(),
        "/People": (BuildContext context) => People(),
      },
    );
  }
}
