import 'package:contacts/HomePage.dart';
import 'package:flutter/material.dart';

main() => runApp(Contacts());

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomePage(),
      
    );
  }
}