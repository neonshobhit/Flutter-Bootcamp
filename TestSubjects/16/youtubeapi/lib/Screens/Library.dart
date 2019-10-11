import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:youtubeapi/Screens/VideoPlayer.dart';

class Library extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  final String url = "http://userapi.tk/youtube/";
  var playlist = "A-Z";
  bool isLoading = true;
  var data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getjsondata();
  }

  Future<String> getjsondata() async {
    var response = await http.get(
      Uri.encodeFull(url),
    );
    setState(() {
      var convertdatatojson = json.decode(response.body);
      data = convertdatatojson;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: isLoading
            ? CircularProgressIndicator()
            : Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      //padding: EdgeInsets.all(4),
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Recent",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) => Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 180,
                              width: 160,
                              child: Column(
                                children: <Widget>[
                                  Image.network(
                                    data[index]['ThumbmnilURL'],
                                    fit: BoxFit.cover,
                                  ),
                                  ListTile(
                                    title: Text(
                                      data[index]["Title"],
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                    subtitle: Text(
                                      data[index]['Name'],
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                    trailing: Icon(
                                      Icons.more_vert,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  ListView(
                    shrinkWrap: true,
                    primary: false,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.history),
                        title: Text("History"),
                      ),
                      ListTile(
                        leading: Icon(Icons.cloud_download),
                        title: Text("Downloads"),
                        subtitle: Text("20 recommendations."),
                      ),
                      ListTile(
                        leading: Icon(Icons.video_label),
                        title: Text("My Videos"),
                      ),
                      ListTile(
                        leading: Icon(Icons.tag_faces),
                        title: Text("Purchases"),
                      ),
                      ListTile(
                        leading: Icon(Icons.time_to_leave),
                        title: Text("Watch Later."),
                        subtitle: Text(
                          "3 unwatched videos.",
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: DropdownButton<String>(
                            isExpanded: false,
                            value: playlist,
                            icon: Icon(Icons.arrow_downward),
                            iconSize: 20.0,
                            elevation: 20,
                            style: TextStyle(
                              color: Colors.deepPurple,
                            ),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String newvalue) {
                              setState(
                                () {
                                  playlist = newvalue;
                                },
                              );
                            },
                            items: ["A-Z", "Recently Added"]
                                .map<DropdownMenuItem<String>>(
                              (String value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: FlatButton(
                              child: ListTile(
                                leading: Icon(Icons.add_comment),
                                title: Text(
                                  "NEW PLAYLIST",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      playthisvideo(data[0]['VideoURL'], 0);
                    },
                    child: ListTile(
                      leading: Image.network(
                        data[0]['ThumbmnilURL'],
                      ),
                      title: Text(
                        data[0]["Title"],
                      ),
                      subtitle: Text(
                        data[0]["Name"] + "." + "19 videos",
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  playthisvideo(String url, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoApp(
          url: url,
          content: data[index],
        ),
      ),
    );
  }
}
