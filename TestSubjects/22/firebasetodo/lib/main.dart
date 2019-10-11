import 'package:firebasetodo/HomePage.dart';
import 'package:flutter/material.dart';

main() => runApp(ToDoApp());

class ToDoApp extends StatefulWidget {
  @override
  _ToDoAppState createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}