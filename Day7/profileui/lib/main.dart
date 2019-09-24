import 'package:flutter/material.dart';
import 'package:profileui/HomePage.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      
           
    );

    
  }
}