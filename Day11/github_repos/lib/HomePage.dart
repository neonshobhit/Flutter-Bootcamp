import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:github_repos/EndDrawer.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
    @required this.changinglink,
  }) : super(key: key);
  final String changinglink;

  @override
  _HomePageState createState() => _HomePageState(
      changinglink: this.changinglink,
    );
}

class _HomePageState extends State<HomePage> {
  _HomePageState({
    Key key,
    @required this.changinglink,
  });

  int index = 0;
  String changinglink;
  String url;
  var data;
  bool isLoading = true;
  int lengthdata = 0;

  @override
  void initState() {
    super.initState();
    this.getjsondata();
  }

  Future<String> getjsondata() async {
    url = changinglink;
    var response = await http.get(
      Uri.encodeFull(url),
    );
    setState(() {
      index = 0;
      var convertDataToJson = json.decode(response.body);
      data = convertDataToJson;
      isLoading = false;
      lengthdata = data.length;
    });
  }

  _launchURL(String toopenlink) async {
    //const url = 'https://flutter.dev';
    if (await canLaunch(toopenlink)) {
      await launch(toopenlink, forceWebView: true);
    } else {
      throw 'Could not launch $toopenlink';
    }
  }

  _openinchrome(String toopenlink) async {
    if (await canLaunch(toopenlink)) {
      await launch(toopenlink);
    } else {
      throw 'Could not launch $toopenlink';
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isLoading 
          ? "My Repositories"
          :"${data[index]["owner"]["login"]}'s Repositories",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey,
          padding: EdgeInsets.all(10.0),
          child: isLoading
              ? CircularProgressIndicator()
              : Card(
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          width: screenSize.width,
                          height: screenSize.height / 4,
                          child: GestureDetector(
                            onLongPress: () =>
                                _launchURL(data[index]["owner"]["html_url"]),
                            child: GestureDetector(
                              onTap: () => _openinchrome(
                                  data[index]["owner"]["html_url"]),
                              child: Container(
                                child: Image(
                                  image: NetworkImage(
                                    data[index]["owner"]["avatar_url"],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        ListView(
                          primary: false,
                          shrinkWrap: true,
                          children: <Widget>[
                            Container(
                              child: Text(
                                data[index]["owner"]["id"].toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                data[index]["owner"]["login"],
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                data[index]["owner"]["html_url"],
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                data[index]["owner"]["repos_url"],
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 3.0,
                          color: Colors.black,
                        ),
                        Text(
                          "Repositories: ",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 25.0,
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int counter) =>
                              GestureDetector(
                            onTap: () => _openinchrome(
                                "${data[counter]["html_url"]}?files=1"),
                            child: GestureDetector(
                              onLongPress: () => _launchURL(
                                  "${data[counter]["html_url"]}?files=1"),
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        " ${counter + 1}.\n",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 25.0,
                                        ),
                                      ),
                                      Container(
                                        child: Column(
                                          children: <Widget>[
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "Name:",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "\n${data[counter]["name"] == null ? "Null" : data[counter]["name"]}",
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Column(
                                          children: <Widget>[
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "Full-Name: ",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "\n${data[counter]["full_name"] == null ? "Null" : data[counter]["full_name"]}",
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Column(
                                          children: <Widget>[
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "Description",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "\n${data[counter]["description"] == null ? "Null" : data[counter]["description"]}",
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Column(
                                          children: <Widget>[
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "Languages used:",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "\n${data[counter]["language"] == null ? "Null" : data[counter]["language"]}",
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 3.0,
                          color: Colors.black,
                        ),
                        /*
                Divider(),
                Text("Repositor number: $index"),
                Container(
                    child: Text(
                      data[index]["name"],
                    ),
                ),
                Container(
                    child: Text(
                      data[index]["full_name"],
                    ),
                ),
                */
                      ],
                    ),
                  ),
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.exit_to_app,
        color: Colors.white,
        ),
        onPressed: (){ Navigator.of(context).pop(); },
      ),
      endDrawer: EndDrawer(),
    );
  }
}
