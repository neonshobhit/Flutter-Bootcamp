import 'package:flutter/material.dart';
import 'package:diceroller2/HomePage.dart';

main() => runApp(DiceRoller());

class DiceRoller extends StatefulWidget {
  @override
  _DiceRollerState createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}