import 'package:flutter/material.dart';
import 'package:phonepe/HomePage.dart';
import 'package:phonepe/MyMoney.dart';

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
        "/Home": (BuildContext context) => HomePage(),
        "/MyMoney": (BuildContext context) => MyMoney(),
      },
    );
  }
}