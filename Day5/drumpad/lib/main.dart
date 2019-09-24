import 'package:flutter/material.dart';
import 'package:drumpad/HomePage.dart';

main() => runApp(DrumPad());

class DrumPad extends StatefulWidget {
  @override
  _DrumPadState createState() => _DrumPadState();
}

class _DrumPadState extends State<DrumPad> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DrumPad',
      //color: Colors.black12,
      home: HomePage(),
      
    );
  }
}