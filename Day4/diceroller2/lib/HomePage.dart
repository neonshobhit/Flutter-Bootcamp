import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var imagename = '/1 .png';
  var imagename2 = '/6.png';
  imagechange(int a) {
    var random = new Random().nextInt(6) + 1;
    setState(() {
      if (a == 1) {
        switch (random.toString()) {
          case '1':
            imagename = '/1 .png';
            imagename2 = '/6.png';
            break;
          case '2':
            imagename = '/2.png';
            imagename2 = '/5.png';
            break;
          case '3':
            imagename = '/3.png';
            imagename2 = '/4.png';
            break;
          case '4':
            imagename = '/4.png';
            imagename2 = '/3.png';
            break;
          case '5':
            imagename = '/5.png';
            imagename2 = '/2.png';
            break;
          case '6':
            imagename = '/6.png';
            imagename2 = '/1 .png';
            break;
          default:
            imagename = '/1 .png';
            imagename2 = '/6.png';
        }
      } else {
        switch (random.toString()) {
          case '1':
            imagename = '/1 .png';
            break;
          case '2':
            imagename = '/2.png';
            break;
          case '3':
            imagename = '/3.png';
            break;
          case '4':
            imagename = '/4.png';
            break;
          case '5':
            imagename = '/5.png';
            break;
          case '6':
            imagename = '/6.png';
            break;
          default:
            imagename = '/1 .png';
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Two Dice Roller"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 10.0,
            width: 10.0,
          ),
          new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Image.asset('assets' + imagename),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: 5.0,
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Image.asset('assets' + imagename2),
                  ),
                ),
              ]),
          SizedBox(
            height: 50.0,
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  color: Colors.blueAccent,
                  //materialTapTargetSize: MaterialTapTargetSize.padded,
                  child: Text("Play One"),
                  onPressed: () {
                    imagechange(0);
                  },
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: 10.0,
                ),
              ),
              Expanded(
                child: MaterialButton(
                  color: Colors.blueAccent,
                  //materialTapTargetSize: MaterialTapTargetSize.padded,
                  child: Text("Play Both"),
                  onPressed: () {
                    imagechange(1);
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
