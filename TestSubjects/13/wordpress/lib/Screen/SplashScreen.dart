import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:wordpress/HomePage.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 10,
      navigateAfterSeconds: HomePage(),
      title: Text(
        "Welcome",
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
      image: Image.asset("assets/sasuke.jpg"),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 200,
      onClick: ()=> print("Wordpress"),
      loaderColor: Colors.blue,
    );
  }
}