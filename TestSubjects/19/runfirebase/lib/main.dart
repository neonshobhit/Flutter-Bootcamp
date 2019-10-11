import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0;
  var myemail = "123@myapp.com";
  var mypass = "12345678";
  var mywrongpass = "123456";
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void signin(String passme) async {
    var user;
    try {
      user = await _auth.signInWithEmailAndPassword(
        email: '123@myapp.com',
        password: passme,
      );
    } catch (e) {
      print(e.toString());
    } finally {
      setState(() {
        if (user != null)
          count = 1;
        else
          count = 2;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello!"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Email: " + myemail,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Password: " + mypass,
                    ),
                  ),
                  RaisedButton(
                    child: Text(
                      "password: 12345678",
                    ),
                    onPressed: () {
                      signin("12345678");
                    },
                  ),
                  RaisedButton(
                    child: Text(
                      "password: 123456",
                    ),
                    onPressed: () {
                      signin("123456");
                    },
                  ),
                  RaisedButton(
                    child: Text(
                      "reset",
                    ),
                    onPressed: () {
                      setState(() {
                       count = 0; 
                      });
                    },
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    color: Colors.amber,
                    child: Text(
                      count == 0
                      ?"PressButton"
                      : (count == 1
                      ? "Signed in!"
                      : "Wrong password!"),
                      style: TextStyle(color: Colors.red, fontSize: 30),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
