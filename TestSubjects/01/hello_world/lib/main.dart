import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: "Hellor",
      home: Scaffold(
        appBar:
            AppBar(title: Text("Hello Wo"), backgroundColor: Colors.black,), 
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Text("heheh"),
          RaisedButton(
            child: Text("login"),
            onPressed: null,
          ),
          Text("fsdf", style: TextStyle(color: Colors.red[900]),),
          TextField(
            decoration: new InputDecoration.collapsed(
              hintText: "enter email"),
              textAlign: TextAlign.center,
              )
        ]),
      ),
    );
  }
}
