import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:youtubeapi/Screens/VideoPlayer.dart';

class Inbox extends StatefulWidget {
  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
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
      body: isLoading
          ? CircularProgressIndicator()
          : SingleChildScrollView(
              child: ListView.builder(
                itemCount: data.length,
                shrinkWrap: true,
                primary: false,
                itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                  onTap: () {
                    playthisvideo(data[index]['VideoURL'], index);
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(data[index]['ProfileiconURL']),
                    ),
                    title: ListTile(
                      title: Text(
                        data[index]["Title"],
                        style: TextStyle(fontSize: 15),
                      ),
                      subtitle: Text(
                        data[index]["Day"],
                        style: TextStyle(fontSize: 10),
                      ),
                      trailing: SizedBox(
                        child: Image.network(
                          data[index]['ThumbmnilURL'],
                          fit: BoxFit.cover,
                        ),
                        width: 80,
                        height: 40,
                      ),
                    ),
                    trailing: Icon(
                      Icons.more_vert,
                    ),
                  ),
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
