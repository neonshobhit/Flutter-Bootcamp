import 'dart:math';


import 'package:flutter/material.dart';

main() => runApp(RandomColor());

class RandomColor extends StatefulWidget {
  @override
  _RandomColorState createState() => _RandomColorState();
}

class _RandomColorState extends State<RandomColor> {
  var initialcolor = Colors.black;
  var colorlist = [Colors.amber, Colors.red, Colors.blue, Colors.green, Colors.orangeAccent];

  changecolor(){
    var random = Random().nextInt(colorlist.length);
    print(random);
    setState(() {
     initialcolor = colorlist[random];
    });
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Random Color"),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: initialcolor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              RaisedButton(
                child: Text("Change Color"),
                onPressed: changecolor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ],
          )

        )
      ),
    );
  }
}