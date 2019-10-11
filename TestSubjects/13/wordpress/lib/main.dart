import 'package:flutter/material.dart';
import 'package:wordpress/HomePage.dart';
import 'package:wordpress/Screen/SplashScreen.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
    );
  }
}