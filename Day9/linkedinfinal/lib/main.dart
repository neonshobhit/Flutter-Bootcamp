import 'package:flutter/material.dart';
import 'package:linkedinfinal/HomePage.dart';
import 'package:linkedinfinal/Connections.dart';

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
        
        '/Feed' : (BuildContext context) => HomePage(),
        '/People':  (BuildContext context) => Connections(),
      },
    );
  }
}