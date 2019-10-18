import 'package:firebaseauth/CheckAuth.dart';
import 'package:firebaseauth/HomePage.dart';
import 'package:firebaseauth/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

main() => runApp(Auth());

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Authenticate",
      initialRoute: '/',
      routes: {
        '/': (context) => CheckAuth(),
        '/signup' : (context) => SignUp(),
        '/home': (context) => HomePage(),
      },
    );
  }
}