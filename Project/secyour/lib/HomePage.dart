import 'package:flutter/material.dart';
import 'package:secyour/BottomtabPages.dart/Home.dart';
import 'package:secyour/BottomtabPages.dart/Mark.dart';
import 'package:secyour/BottomtabPages.dart/SOS.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentindex = 0;
  var pages = [Home(), Mark()];

  void ontapped(int index) {
    setState(() {
      _currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SecYour"),
        centerTitle: true,
      ),
      /*
      drawer: Drawer(
        child: RaisedButton(
          child: Text("Clear database"),
          onPressed: (){
            //deletingdatabase,
          }
        ),
      ),
      */
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        onTap: ontapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              //color: Colors.blue,
            ),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on,
              //color: Colors.blue,
            ),
            title: Text("Mark"),
          ),
          /*
          BottomNavigationBarItem(
            icon: Icon(
              Icons.new_releases,
              color: Colors.red,
            ),
            title: Text(
              "SOS",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
          */
        ],
      ),
      body: pages[_currentindex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        backgroundColor: Colors.amber,
        child: Text(
          "SOS",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.w900,
            fontSize: 20
          ),
        ),
        
        /*Icon(
          Icons.new_releases,
          color: Colors.red,
        ),
        */
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SOS(
                selectedloc: "Jagatpura",
              ),
            ),
          );
        },
      ),
    );
  }
}
