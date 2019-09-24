import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://instagram.fudr1-1.fna.fbcdn.net/vp/0e0c826c335d34a6537c2cf75b802a9f/5E3C1280/t51.2885-19/s320x320/32178282_1846693452055722_2280604583086522368_n.jpg?_nc_ht=instagram.fudr1-1.fna.fbcdn.net"),
                  fit: BoxFit.cover,
                )),
          ),
        ),
        actions: <Widget>[
          Container(
            width: 310.0,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.white12.withOpacity(1.0),
                filled: true,
                prefixIcon: Icon(Icons.search),
                hintText: "Search",
                suffixIcon: Icon(Icons.select_all),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
          Icon(Icons.chat),
        ],
      ),
      body: Container(
        
        child: ListView(
          primary: true,
          shrinkWrap: true,
          children: <Widget>[
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(bottom: 8.0),
              child: ListView(
                shrinkWrap: true,
                primary: true,
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    child: GridView.count(
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      children: <Widget>[
                        Container(
                          width: 10.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://instagram.fudr1-1.fna.fbcdn.net/vp/0e0c826c335d34a6537c2cf75b802a9f/5E3C1280/t51.2885-19/s320x320/32178282_1846693452055722_2280604583086522368_n.jpg?_nc_ht=instagram.fudr1-1.fna.fbcdn.net",
                              ),
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            //shrinkWrap: true,
                            children: <Widget>[
                              Container(
                                child: GridView.count(
                                  shrinkWrap: true,
                                  crossAxisCount: 2,
                                  children: <Widget>[
                                    Text(
                                      "Shobhit Maheshwari",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    Text(
                                      " . 1st",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "Learning Flutter Apps|...",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 18.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Icon(
                            Icons.keyboard_arrow_down,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Text(
                        "sdfbhsb xfkwenkfnsjnflk \nwadbmhabehdfbwekfbkjwnef"),
                  ),
                  Container(
                    width: double.infinity,
                    //height: double.infinity,

                    child: Image.network(
                        "http://www.nehru-centre.org/wp-content/uploads/2019/06/back_cover-1024x762.jpg"),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Icon(Icons.thumb_up,
                    color: Colors.blue,
                    ),
                  ),
                  Divider(),
                  Container(
                    height: 55.0,
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      children: <Widget>[
                        Container(
                          child: GridView.count(
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            children: <Widget>[
                              Icon(Icons.thumb_up),
                              Text(
                                "Like",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: GridView.count(
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            children: <Widget>[
                              Icon(Icons.comment),
                              Text(
                                "Comment",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          //height: 10.0,
                          child: GridView.count(
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            children: <Widget>[
                              Icon(Icons.share),
                              Text(
                                "Share",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

/*copied







*/
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(bottom: 8.0),
              child: ListView(
                primary: true,
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    child: GridView.count(
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      children: <Widget>[
                        Container(
                          width: 10.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://instagram.fudr1-1.fna.fbcdn.net/vp/0e0c826c335d34a6537c2cf75b802a9f/5E3C1280/t51.2885-19/s320x320/32178282_1846693452055722_2280604583086522368_n.jpg?_nc_ht=instagram.fudr1-1.fna.fbcdn.net",
                              ),
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                        Container(
                          child: ListView(
                            shrinkWrap: true,
                            primary: true,
                            children: <Widget>[
                              Container(
                                child: GridView.count(
                                  shrinkWrap: true,
                                  crossAxisCount: 2,
                                  children: <Widget>[
                                    Text(
                                      "Shobhit Maheshwari",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    Text(
                                      " . 1st",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "Learning Flutter Apps|...",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 18.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Icon(
                            Icons.keyboard_arrow_down,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Text(
                        "sdfbhsb xfkwenkfnsjnflk \nwadbmhabehdfbwekfbkjwnef"),
                  ),
                  Container(
                    width: double.infinity,
                    //height: double.infinity,

                    child: Image.network(
                        "http://www.nehru-centre.org/wp-content/uploads/2019/06/back_cover-1024x762.jpg"),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.thumb_up,
                      color: Colors.blue,
                      ),
                      ),
                  Divider(),
                  Container(
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      children: <Widget>[
                        Container(
                          child: GridView.count(
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            children: <Widget>[
                              Icon(Icons.thumb_up),
                              Text(
                                "Like",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: GridView.count(
                          
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            children: <Widget>[
                              Icon(Icons.comment),
                              Text(
                                "Comment",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: GridView.count(
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            children: <Widget>[
                              Icon(Icons.share),
                              Text(
                                "Share",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
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
