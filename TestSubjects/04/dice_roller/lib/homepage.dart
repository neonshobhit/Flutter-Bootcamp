import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var imagename = '/1 .png';
  imagechange(){
    var random = new Random().nextInt(6) + 1;
    setState(() {
     switch (random.toString()) {
      case '1' : imagename = '/1 .png';
                  break;
      case '2' : imagename = '/2.png';
                  break;
      case '3' : imagename = '/3.png';
                  break;
      case '4' : imagename = '/4.png';
                  break;
      case '5' : imagename = '/5.png';
                  break;
      case '6' : imagename = '/6.png';
                  break;
      default:   imagename = '/1 .png';
     } 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dice Roller"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.amber,
        child: Column(
          children: <Widget>[
            Image.asset('assets'+ imagename),
            MaterialButton(
              hoverColor: Colors.red,
              color: Colors.white10,
              child: Text("Play"),
              onPressed: (){imagechange();},
            )
          ],
        )
      )
    );
  }
}