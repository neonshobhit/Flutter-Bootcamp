import 'dart:math';
import 'package:flutter/material.dart';

main() => runApp(RandomColor());

class RandomColor extends StatefulWidget {
  @override
  _RandomColorState createState() => _RandomColorState();
}

class _RandomColorState extends State<RandomColor> {
  var initialcolor = Colors.black;
  var initialcol = Colors.blueGrey;
  var colorlist = [Colors.amber, Colors.red, Colors.blue, Colors.green, Colors.orangeAccent];

  changecolor(){
    var random = Random().nextInt(colorlist.length -2);
    setState(() {
     initialcolor = colorlist[random];
     initialcol = colorlist[random + 1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner : false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Random Color"),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                  child: Container(
                    height: 100.0,
                    width: double.infinity,
                    color: initialcol,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                  child: Container(
                    height: 50.0,
                    width: double.infinity,
                    color: initialcolor,
                  ),
                ),
              ),
              RaisedButton(
                child: Text("Change Color"),
                onPressed: changecolor,
              )

            ],
          )
          
          

        ),
       
      ),
    );
  }
}