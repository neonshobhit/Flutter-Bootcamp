//import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/Information/More.dart';
import 'package:news/Information/Privacypolicy.dart';
import 'package:news/Information/Rate.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:news/Content.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  int total_data;
  String changinglink =
      "https://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=b0bd20969d3c41b0b8a600cb78bfc2ff";
  String url;
  var data;
  bool isLoading = true;
  int lengthdata = 0;
  //List cataloguelist = ["Bitcoins",]

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    this.getjsondata();
    //total_data = data["articles"].length;
  }

  Future<String> getjsondata() async {
    url = changinglink;
    var response = await http.get(
      Uri.encodeFull(url),
    );
    //print(response.body);
    setState(() {
      index = 0;
      var convertDataToJSON = json.decode(response.body);
      data = convertDataToJSON;
      isLoading = false;
      lengthdata = data["articles"].length;
    });
  }

  launchURLbrowser(String yourURL, bool tf) async {
    if (await canLaunch(yourURL)) {
      await launch(yourURL, forceWebView: tf);
    } else {
      throw "Couldn't launch $yourURL";
    }
  }

  _sendtoNextScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Content(
                  data: data,
                  index: index,
                  URLpage: url,
                )));
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    //int total_data = data["articles"].length;

    return Scaffold(
      endDrawer: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Article List",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: lengthdata,
            itemBuilder: (BuildContext context, int counter) => Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          index = counter;
                          Navigator.of(context).pop();
                        });
                      },
                      child: ListTile(
                        leading: Image(
                          image: NetworkImage(
                            data["articles"][counter]["urlToImage"] == null
                                ? "http://www.sclance.com/images/no/No_687278.jpg"
                                : data["articles"][counter]["urlToImage"],
                          ),
                        ),
                        title: Text(
                          data["articles"][counter]["title"] == null
                              ? "Title"
                              : data["articles"][counter]["title"],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.grey[300],
        ),
        child: Drawer(
          child: SingleChildScrollView(
            child: Center(
              child: ListView(
                primary: false,
                shrinkWrap: true,
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountEmail: Text(
                      //data["articles"][index]["url"],
                      "",
                    ),
                    accountName: Text(
                      "Catalogue",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                    title: Text(
                      "SUGGESTED ARTICLES",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListView(
                        shrinkWrap: true,
                        primary: false,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  changinglink =
                                      "https://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=b0bd20969d3c41b0b8a600cb78bfc2ff";
                                  getjsondata();
                                  isLoading = !isLoading;
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text(
                                "Top headlines from Google News (India)",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  changinglink =
                                      "https://newsapi.org/v2/top-headlines?country=in&apiKey=b0bd20969d3c41b0b8a600cb78bfc2ff";
                                  getjsondata();
                                  isLoading = !isLoading;
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text(
                                "Top headlines from India",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  changinglink =
                                      "https://newsapi.org/v2/everything?q=bitcoin&from=2019-08-22&sortBy=publishedAt&apiKey=b0bd20969d3c41b0b8a600cb78bfc2ff";
                                  getjsondata();
                                  isLoading = !isLoading;
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text(
                                "Bitcoins",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  changinglink =
                                      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=b0bd20969d3c41b0b8a600cb78bfc2ff";
                                  getjsondata();
                                  isLoading = !isLoading;
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text(
                                "Top Business headlines in US",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  changinglink =
                                      "https://newsapi.org/v2/everything?q=apple&from=2019-09-21&to=2019-09-21&sortBy=popularity&apiKey=b0bd20969d3c41b0b8a600cb78bfc2ff";
                                  getjsondata();
                                  isLoading = !isLoading;
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text(
                                "Apple from yesterday",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  changinglink =
                                      "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=b0bd20969d3c41b0b8a600cb78bfc2ff";
                                  getjsondata();
                                  isLoading = !isLoading;
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text(
                                "Headlines from TechCrunch",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  changinglink =
                                      "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=b0bd20969d3c41b0b8a600cb78bfc2ff";
                                  getjsondata();
                                  isLoading = !isLoading;
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text(
                                "Wall Street Journals",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                    title: Text(
                      "About",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RateMyApp(),
                          ),
                        );
                      },
                      child: Text(
                        "Rate my App!",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PrivacyPolicy(),
                          ),
                        );
                      },
                      child: Text(
                        "Privacy Policy",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => More(),
                          ),
                        );
                      },
                      child: Text(
                        "More Apps",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: isLoading
                    ? CircularProgressIndicator()
                    : Stack(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: SizedBox(
                                height: screenSize.height / 1.1,
                                child: Card(
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: screenSize.height / 3,
                                        child: Image(
                                          // width: double.infinity,
                                          //height: 100,
                                          //height: screenSize.height / 3,
                                          image: NetworkImage(
                                            data["articles"][index]
                                                        ["urlToImage"] ==
                                                    null
                                                ? "https://vignette.wikia.nocookie.net/naruto/images/7/79/Hinata_Part_II.png/revision/latest/scale-to-width-down/300?cb=20160916060747"
                                                : data["articles"][index]
                                                    ["urlToImage"],
                                          ),
                                        ),
                                      ),
                                      Divider(),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Content(
                                                        data: data,
                                                        index: index,
                                                        URLpage: url,
                                                      )));
                                        },
                                        child: Hero(
                                          tag: "contenthero",
                                          child: Text(
                                            data["articles"][index]["title"] ==
                                                    null
                                                ? "null"
                                                : data["articles"][index]
                                                    ["title"],
                                            style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Divider(),
                                      GestureDetector(
                                        onDoubleTap: () {
                                          data["articles"][index]["url"] == null
                                              ? print("Link is broken")
                                              : launchURLbrowser(
                                                  data["articles"][index]
                                                      ["url"],
                                                  false);
                                        },
                                        child: GestureDetector(
                                          onTap: () {
                                            data["articles"][index]["url"] ==
                                                    null
                                                ? print("Link is broken")
                                                : launchURLbrowser(
                                                    data["articles"][index]
                                                        ["url"],
                                                    true);
                                          },
                                          child: Text(
                                            data["articles"][index]
                                                        ["description"] ==
                                                    null
                                                ? "null"
                                                : data["articles"][index]
                                                    ["description"],
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                      /*Padding(
                                        padding: const EdgeInsets.all(30),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: RaisedButton(
                                                child: Text(
                                                  "Previous",
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    index--;
                                                    if(index < 0){
                                                      index = 0;
                                                    }
                                                  });
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: RaisedButton(
                                                child: Text(
                                                  "Next",
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    index++;
                                                    /*if(index >= total_data){
                                                      index = total_data;
                                                    }
                                                    */
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      
                                      SizedBox(
                                        //data["articles"][index]["description"],
                                        height: screenSize.height / 10,
                                      ),
                                      
                                      GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          data["articles"][index]["author"] == null
                                              ? "Null"
                                              : data["articles"][index]["author"],
                                        ),
                                      ),
                                      */
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: (screenSize.height / 1.1) + 20,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: SizedBox(
                                width: screenSize.width - 40.0,
                                child: Card(
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        data["articles"][index]["author"] ==
                                                null
                                            ? "Null"
                                            : data["articles"][index]["author"],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: GestureDetector(
          onLongPress: () {
            setState(() {
              if (index > 0) index--;
            });
          },
          child: Icon(
            Icons.navigate_next,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          setState(() {
            if (index < lengthdata - 1) index++;
          });
        },
      ),
    );
  }
}
