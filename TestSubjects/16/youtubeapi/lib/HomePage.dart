import 'dart:io';

import 'package:flutter/material.dart';
import 'package:youtubeapi/Screens/HomeScreen.dart';
import 'package:youtubeapi/Screens/Inbox.dart';
import 'package:youtubeapi/Screens/Library.dart';
import 'package:youtubeapi/Screens/Subscriptions.dart';
import 'package:youtubeapi/Screens/Trending.dart';
//import 'package:connectivity/connectivity.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currindex = 0;
  void ontapped(int index) {
    setState(() {
      _currindex = index;
    });
  }

  var nointernet = true;
  var pages = [
    HomeScreen(),
    Trending(),
    Subscriptions(),
    Inbox(),
    Library(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkyourinternet();
  }

  checkyourinternet() async {
    //var connectivityResult = await (Connectivity().checkConnectivity());
    //if(connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi)
    //{
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty)
        setState(() {
          nointernet = false;
        });
    } on SocketException catch (_) {
      setState(() {
        nointernet = true;
      });
    }
    //}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SizedBox(
          width: 125,
          child: Image.network(
            "https://darkeandtaylor.co.uk/wp-content/uploads/2018/09/youtube-logo-png-transparent-image-e1537456990695.png",
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.video_call,
              size: 25,
              color: Colors.black54,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.search,
              color: Colors.black54,
              size: 25,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,10,20,10),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(
                "https://i.ytimg.com/vi/T7jFKia58M8/maxresdefault.jpg",
              ),
              // child: Image.network(
              //     "https://i.ytimg.com/vi/T7jFKia58M8/maxresdefault.jpg",
              //   fit: BoxFit.contain,    
              // ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currindex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey[600],
        onTap: ontapped,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            title: Text("Trending"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.subscriptions,
            ),
            title: Text("Subscription"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
            ),
            title: Text("Inbox"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.library_add,
            ),
            title: Text("Library"),
          ),
        ],
      ),
      body:
          nointernet ? Image.asset("assets/nointernet.jpg") : pages[_currindex],
    );
  }
}
