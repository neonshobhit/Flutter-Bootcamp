import 'package:flutter/material.dart';
import 'package:spanishnumber/HomePage.dart';

main() => runApp(SpanishNumber());

class SpanishNumber extends StatefulWidget {
  @override
  _SpanishNumberState createState() => _SpanishNumberState();
}

class _SpanishNumberState extends State<SpanishNumber> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      
    );
  }
}