import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[],
      ),
      body: Container(
        child:Text("hello"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text("People"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business_center),
            title: Text("Home"),
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
        
      ),
    );
  }
}
