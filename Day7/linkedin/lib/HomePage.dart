import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final snackBar = const SnackBar(content: Text('Showing Snackbar'));
    int i =0, j=0;
    var jobdesc = ['Senior Software Devel...', 'Tech Video Creator ...','Student at SKIT...','Freelancer. Works from...'];
    var jobname = ['Harshit Arora', 'Hitesh Chaudhary', 'Naman Sharma', 'Abhishek Gupta'];

    var imageslist =
        'https://instagram.fudr1-1.fna.fbcdn.net/vp/0e0c826c335d34a6537c2cf75b802a9f/5E3C1280/t51.2885-19/s320x320/32178282_1846693452055722_2280604583086522368_n.jpg?_nc_ht=instagram.fudr1-1.fna.fbcdn.net';

    return Scaffold(
      appBar: AppBar(
        title: Text('LinkedIn'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alarm),
            tooltip: 'Hello!',
            onPressed: () {
              scaffoldKey.currentState.showSnackBar(snackBar);
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Next Page',
            onPressed: () {},
          ),
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
    );
  }
}
