import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:piano/HomePage.dart';

main() => runApp(Paino());

class Paino extends StatefulWidget {
  @override
  _PainoState createState() => _PainoState();
}

class _PainoState extends State<Paino> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      home: HomePage(),
    );
  }
}