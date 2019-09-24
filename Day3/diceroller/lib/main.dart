import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var dicelist = ['assets/Images/1.png', 'assets/Images/2.png', 'assets/Images/3.png', 'assets/Images/4.png', 'assets/Images/5.png', 'assets/Images/6.jpg'];
  var initialimage = 'assets/Images/1.png';

  rolldice(){
    var random = Random().nextInt(6);
    setState(() {
     initialimage = dicelist[random] ;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dice Roller App',
          style: TextStyle(
            fontSize: 30.0,
            fontStyle: FontStyle.italic,
            color: Colors.blueAccent,
          ),),
          
          backgroundColor: Colors.yellowAccent,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              child: Image.asset(initialimage),
            ),
            Container(
              child: RaisedButton(
                color: Colors.yellow,
                child: Text('Roll It!',
                style: TextStyle(
                  color: Colors.red,
                  //backgroundColor: Colors.black,
                )),
                onPressed: rolldice,
              ),
            )
            
          ],
        )
      ),
    );
  }
}