import 'dart:math';

import 'package:flutter/material.dart';

main() => runApp(RollDice());

class RollDice extends StatefulWidget {
  @override
  _RollDiceState createState() => _RollDiceState();
}

class _RollDiceState extends State<RollDice> {
  var _image = "assets/1.png";

  void rolling() {
    var random = Random.secure();
    var ran = random.nextInt(6);
    setState(() {
      if (ran == 1) {
        _image = "assets/1 .png";
      } else if (ran == 2) {
        _image = "assets/2.png";
      } else if (ran == 3) {
        _image = "assets/3.png";
      } else if (ran == 4) {
        _image = "assets/4.png";
      } else if (ran == 5) {
        _image = "assets/5.png";
      } else if (ran == 6) {
        _image = "assets/6.png";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Roll Dice",
          ),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              width: 400,
              height: 400,
              child: Image(
                image: AssetImage(
                  _image,
                ),
              ),
            ),
            RaisedButton(
              
              child: Text(
                "Roll",
              ),
              onPressed: () {
                rolling();
              },
            ),
          ],
        ),
      ),
    );
  }
}
//Pubspec.yaml file is the resource file where all the assets, dependencies, fonts, icons etc are declared which are going to be used in the whole project.
//factory keyword is used to call other constructors to use those when in need which means factory keyword will allow to not only call other constructors but also receive a return from them.

