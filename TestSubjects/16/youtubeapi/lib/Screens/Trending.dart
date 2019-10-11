import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:youtubeapi/Screens/VideoPlayer.dart';

class Trending extends StatefulWidget {
  @override
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  final String url = "http://userapi.tk/youtube/";
  var trendinglst = ["Music" , "Gaming", "News", "Movies", "Fashion"];
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
      body: Container(
        child: isLoading
            ? CircularProgressIndicator()
            : SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 110,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: trendinglst.length,
                        itemBuilder: (BuildContext context, int index)=>Padding(
                          padding: EdgeInsets.fromLTRB(16,20,0,8),
                          child: Column(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.black,
                                maxRadius: 30,
                              ),
                              Text(
                                trendinglst[index],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) => GestureDetector(
                        onTap: ()=>routepage(data[index]['VideoURL'],index),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              child: Image.network(
                                data[index]['ThumbmnilURL'],
                                fit: BoxFit.cover,
                              ),
                              width: double.infinity,
                              height: 250,
                            ),
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(data[index]['ProfileiconURL']),
                              ),
                              title: Text(
                                data[index]["Title"],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              subtitle: Text(
                                data[index]['Name'] +
                                    "." +
                                    data[index]['Views'] +
                                    'Views.' +
                                    data[index]["Day"],
                                style: TextStyle(fontSize: 12),
                              ),
                              trailing: Icon(
                                Icons.more_vert,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
  routepage(String url, int index){
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
