import 'package:admin/BottomBar/TotalReports.dart';
import 'package:flutter/material.dart';

import 'BottomBar/SOS.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentindex = 0;
  var pages = [SOS(), TotalReports()];

  void ontapped(int index) {
    setState(() {
      _currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SecYour- Admin"),
        
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        onTap: ontapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.healing,
              //color: Colors.blue,
            ),
            title: Text("SOS"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.receipt,
              //color: Colors.blue,
            ),
            title: Text("All Reports"),
          ),
        ],
      ),
      body: pages[_currentindex],
    );
  }
}
