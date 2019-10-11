import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:youtubeapi/Screens/Profile.dart';
import 'dart:async';
import 'dart:convert';

import 'package:youtubeapi/Screens/VideoPlayer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String url = "http://userapi.tk/youtube/";
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
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) => Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        playthisvideo(data[index]['VideoURL'], index);
                      },
                      child: SizedBox(
                        child: Image.network(
                          data[index]['ThumbmnilURL'],
                          fit: BoxFit.cover,
                        ),
                        width: double.infinity,
                        height: 250,
                      ),
                    ),
                    ListTile(
                      leading: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context)=> Profile()
                          ),
                          );
                        },
                        child: CircleAvatar(
                          backgroundImage:
                              NetworkImage(data[index]['ProfileiconURL']),
                        ),
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
