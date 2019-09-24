import 'package:flutter/material.dart';
import 'package:dice_roller/homepage.dart';

main() => runApp(Diceroller());

class Diceroller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}