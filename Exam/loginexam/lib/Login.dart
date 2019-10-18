import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginexam/Welcome.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  var _email, _pass;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome!",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 300,
              height: 300,
              child: Image.asset(
                "assets/1.png",
              ),
            ),
            Form(
              key: _key,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.email,
                      ),
                      hintText: "Email",
                      labelText: "Email Id",
                    ),
                    onSaved: (String value) {
                      _email = value;
                    },
                    validator: (String value) {
                      if (value.isEmpty) return "Enter Email.";
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.security,
                      ),
                      hintText: "Password",
                      labelText: "Password",
                    ),
                    onSaved: (String value) {
                      _pass = value;
                    },
                    validator: (String value) {
                      if (value.isEmpty) return "Enter Password.";
                      return null;
                    },
                  ),
                  RaisedButton(
                    child: Text(
                      "Login",
                    ),
                    onPressed: () {
                      _logincheck();
                    },
                  ),
                  Text("-----Or-----"),
                  RaisedButton(
                    child: Text(
                      "SignUp",
                    ),
                    onPressed: () {
                      _signup();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _signup() async {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
        email: _email,
        password: _pass,
      ))
          .user;
    }
  }

  _logincheck() async {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      FirebaseUser user = (await _auth.signInWithEmailAndPassword(
        email: _email,
        password: _pass,
      ))
          .user;
      if (user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Welcome(),
          ),
        );
      } else {
        print("Not An user");
      }
    }
  }
}
