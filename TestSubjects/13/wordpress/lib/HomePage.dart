import 'package:flutter/material.dart';
import 'package:wordpress/Screen/About.dart';
import 'package:wordpress/Screen/Category.dart';
import 'package:wordpress/Screen/Home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentindex = 0;
  var pages = [
    Home(),
    Category(),
    About(),
  ];

  void ontapped(int index){
    setState(() {
      _currentindex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wordpress"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: (){},
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        onTap: ontapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              //color: Colors.blue,
            ),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box,
              //color: Colors.blue,
            ),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_location,
              //color: Colors.blue,
            ),
            title: Text(""),
          ),
        ],
      ),
      body: pages[_currentindex],
      
    );
    
  }
}