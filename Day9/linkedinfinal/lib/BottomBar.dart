import 'package:flutter/material.dart';

class BottomnavBar extends StatefulWidget {
  @override
  _BottomnavBarState createState() => _BottomnavBarState();
}

class _BottomnavBarState extends State<BottomnavBar> {
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
            icon: Icon(Icons.people),
            title: Text("Connections"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            title: Text("Add"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text("Nottifications"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business_center),
            title: Text("Jobs"),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.amber,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
            if (index == 0)
              Navigator.of(context).pushNamed("/Feed");
            else if (index == 1)
              Navigator.of(context).pushNamed("/People");
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