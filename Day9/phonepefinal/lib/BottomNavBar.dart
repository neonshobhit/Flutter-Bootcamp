import 'package:flutter/material.dart';

class MyMadeBottomBar extends StatefulWidget {
  @override
  _MyMadeBottomBarState createState() => _MyMadeBottomBarState();
}

class _MyMadeBottomBarState extends State<MyMadeBottomBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.red,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            title: Text("Stores"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            title: Text("Apps"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            title: Text("MyMoney"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text("History"),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
            if (index == 0)
              Navigator.of(context).pushNamed("/Home");
            else if (index == 3)
              Navigator.of(context).pushNamed("/MyMoney");
            else if(index == 4)
              Navigator.of(context).pushNamed("/History");
           /* else if (index == 3)
              Navigator.of(context).pushNamed("/Add");
            else if (index == 4) 
              Navigator.of(context).pushNamed("/Notification");
            else if (index == 5)
              Navigator.of(context).pushNamed("/Jobs");
              */
          });
        },
        
      );
  }
}