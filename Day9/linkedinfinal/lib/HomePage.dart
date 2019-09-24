import 'package:flutter/material.dart';
import 'package:linkedinfinal/AppBar.dart';
import 'package:linkedinfinal/BottomBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var titlelist = ["Shobhit Maheshwari", "Suraj Arora"];
  var subtitlelist = ["Learning Flutter", "Don't Know What"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBarMade.getAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {},
                        child: Container(
                          width: 48,
                          height: 48,
                          padding: EdgeInsets.all(1.0),
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            child: Image(
                              image: AssetImage(""),
                            ),
                          ),
                        ),
                      ),
                      title: Text(titlelist[0]),
                      subtitle: Text(subtitlelist[0]),
                      trailing: IconButton(
                        icon: Icon(Icons.keyboard_arrow_down),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                      ),
                    ),
                    Container(
                      child: Image(
                        image: NetworkImage(
                            "https://www.apple.com/ac/structured-data/images/open_graph_logo.png?201809210816"),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        
                        Icons.thumb_up,
                        color: Colors.blue,
                      ),
                    ),
                    Divider(),
                    Row(
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.center, //It's Not aligning here??
                                    child: Icon(
                                      Icons.thumb_up,
                                    ),
                                  ),
                                  Text('Like'),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.comment),
                                  Text('Comment'),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.share),
                                  Text('Share'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

            /*



Copied!


            */
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {},
                        child: Container(
                          width: 48,
                          height: 48,
                          padding: EdgeInsets.all(4.0),
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            child: Image(
                              image: AssetImage(""),
                            ),
                          ),
                        ),
                      ),
                      title: Text(titlelist[0]),
                      subtitle: Text(subtitlelist[0]),
                      trailing: IconButton(
                        icon: Icon(Icons.keyboard_arrow_down),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                      ),
                    ),
                    Container(
                      child: Image(
                        image: NetworkImage(
                            "https://www.apple.com/ac/structured-data/images/open_graph_logo.png?201809210816"),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        
                        Icons.thumb_up,
                        color: Colors.blue,
                      ),
                    ),
                    Divider(),
                    Row(
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.thumb_up,
                                    ),
                                  ),
                                  Text('Like'),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.comment),
                                  Text('Comment'),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.share),
                                  Text('Share'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomnavBar(),
    );
  }
}
