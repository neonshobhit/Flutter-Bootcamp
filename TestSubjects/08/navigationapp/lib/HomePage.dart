import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigator"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Shobhit"),
              accountEmail: Text("shobhitmaheshwari18@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.amber,
                child: Container(
                  child: Image.network(
                      "https://instagram.fudr1-1.fna.fbcdn.net/vp/0e0c826c335d34a6537c2cf75b802a9f/5E3C1280/t51.2885-19/s320x320/32178282_1846693452055722_2280604583086522368_n.jpg?_nc_ht=instagram.fudr1-1.fna.fbcdn.net"),
                ),
              ),
            ),
            ListTile(
              title: Text("Home"),
              trailing: Icon(Icons.home),
            ),
            ListTile(
              title: Text("Category"),
              trailing: Icon(Icons.search),
              onTap: () => Navigator.of(context).pushNamed("/a"),
            ),
            ListTile(
              title: Text("About"),
              trailing: Icon(Icons.near_me),
            ),
            ListTile(
              title: Text("Contact"),
              trailing: Icon(Icons.contact_mail),
            ),
            Divider(),
            ListTile(
              title: Text("Close"),
              trailing: Icon(Icons.exit_to_app),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: Column(
          children: <Widget>[
            Text("HomePage"),
          ],
        ),
      ),
    );
  }
}
