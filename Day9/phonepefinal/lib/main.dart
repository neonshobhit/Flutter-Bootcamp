import 'package:flutter/material.dart';
import 'package:phonepefinal/AppBar.dart';
import 'package:phonepefinal/BottomNavBar.dart';
import 'package:phonepefinal/HomePage.dart';
import 'package:phonepefinal/MyMoney.dart';
import 'package:phonepefinal/History.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /* builder: (context, child){
        return Scaffold(
          appBar: MyCustomAppBarMade.getAppBar(),
          bottomNavigationBar: MyMadeBottomBar(),
          body: child,
          

        );
      },
      */
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        '/Home': (BuildContext context) => HomePage(),
        '/MyMoney': (BuildContext context) => MyMoney(),
        '/History': (BuildContext context) => History(),
      },
    );
  }
}
