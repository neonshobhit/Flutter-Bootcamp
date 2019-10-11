import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            ".",
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                icon: Icon(
                  Icons.search,
                ),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                icon: Icon(
                  Icons.more_vert,
                ),
                onPressed: () {},
              ),
            ),
          ],
          bottom: TabBar(isScrollable: true, tabs: [
            Tab(
              child: Text("HOME"),
            ),
            Tab(
              child: Text("VIDEOS"),
            ),
            Tab(
              child: Text("PLAYLISTS"),
            ),
            Tab(
              child: Text("COMMUNITY"),
            ),
            Tab(
              child: Text("COMMUNITY"),
            ),
            Tab(
              child: Text("COMMUNITY"),
            ),
            Tab(
              child: Text("COMMUNITY"),
            ),
          ]),
        ),
        body: TabBarView(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    // child: Image.network(
                    //   ""
                    // ),
                  ),
                  Container(
                    color: Colors.grey,
                    child: ListTile(
                      // leading: Image.network(
                      //   ""
                      // ),
                      title: Text(""),
                      subtitle: Column(
                        children: <Widget>[
                          Text(
                            "1.39M subscribers",
                          ),
                          ListTile(
                            leading: Icon(Icons.search),
                            title: FlatButton(
                              child: Text("SUBSCRIBED"),
                              onPressed: () {},
                            ),
                            trailing: Icon(
                              Icons.notifications,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(),
            Container(),
            Container(),
            Container(),
            Container(),
            Container(),
            //NextBarHere
          ],
        ),
      ),
    );
  }
}
