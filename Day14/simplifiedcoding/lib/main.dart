import 'package:flutter/material.dart';
import 'package:simplifiedcoding/Screen/SplashScreen.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
    );
  }
}