import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:secondapi/HomePage.dart';


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
    );
  }
}