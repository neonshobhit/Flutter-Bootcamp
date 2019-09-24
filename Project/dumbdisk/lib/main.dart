import 'package:flutter/material.dart';
import 'package:dumbdisk/EnterPage.dart';

main() => runApp(MyDumbDisk());

class MyDumbDisk extends StatefulWidget {
  @override
  _MyDumbDiskState createState() => _MyDumbDiskState();
}

class _MyDumbDiskState extends State<MyDumbDisk> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EnterPage(),

      
    );
  }
}