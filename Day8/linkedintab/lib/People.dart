import 'package:flutter/material.dart';

class People extends StatefulWidget {
  @override
  _PeopleState createState() => _PeopleState();
}

class _PeopleState extends State<People> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 1;
    //final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    //final snackBar = const SnackBar(content: Text('Showing Snackbar'));
    int i =0, j=0;
    var jobdesc = ['Senior Software Devel...', 'Tech Video Creator ...','Student at SKIT...','Freelancer. Works from...'];
    var jobname = ['Harshit Arora', 'Hitesh Chaudhary', 'Naman Sharma', 'Abhishek Gupta'];

    var imageslist =
        'https://instagram.fudr1-1.fna.fbcdn.net/vp/0e0c826c335d34a6537c2cf75b802a9f/5E3C1280/t51.2885-19/s320x320/32178282_1846693452055722_2280604583086522368_n.jpg?_nc_ht=instagram.fudr1-1.fna.fbcdn.net';

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
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: false,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('People'),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 0.0,
              childAspectRatio: 0.7,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  height: 400.0,
                  margin: const EdgeInsets.all(10.0),

                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    
                  ),

                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        child: SizedBox(),
                      ),
                      Positioned(
                        left: 0.0,
                        top: 0.0,
                        child: Container(
                          /*height: 100.0,
                          width: 100.0,*/
                          child: Image.network(
                          "http://images.unsplash.com/photo-1533134486753-c833f0ed4866?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjEyMDd9",
                          height: 100.0,
                          fit: BoxFit.fill,
                          width: MediaQuery.of(context).size.width* 0.45,
                          
                        ),

                        )
                        
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width * 0.09,
                        top: MediaQuery.of(context).size.height * 0.06,
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.red),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    "https://instagram.fudr1-1.fna.fbcdn.net/vp/0e0c826c335d34a6537c2cf75b802a9f/5E3C1280/t51.2885-19/s320x320/32178282_1846693452055722_2280604583086522368_n.jpg?_nc_ht=instagram.fudr1-1.fna.fbcdn.net"),
                              )),
                        ),
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width *0.025,
                        top: MediaQuery.of(context).size.height * 0.19,
                        child: Text(
                          jobname[i++],
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width *0.021,
                        top: MediaQuery.of(context).size.height * 0.23,
                        child: Text(
                          jobdesc[j++],
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.yellow,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width *0.021,
                        top: MediaQuery.of(context).size.height * 0.26,
                        child: MaterialButton(
                          color: Colors.white,
                          minWidth: 155.0,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(0.0),
                            
                          ),
                          child: Text(
                            'CONNECT',
                            
                            style: TextStyle(
                              
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          
                          onPressed: (){},
                        ),
                      )
                    ],
                  ),
                );
              },
              childCount: 4,
            ),
          )
        ],
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
