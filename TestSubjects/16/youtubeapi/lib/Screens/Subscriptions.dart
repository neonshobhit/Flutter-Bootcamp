import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:youtubeapi/Screens/VideoPlayer.dart';

class Subscriptions extends StatefulWidget {
  @override
  _SubscriptionsState createState() => _SubscriptionsState();
}

class _SubscriptionsState extends State<Subscriptions> {
  final String url = "http://userapi.tk/youtube/";
  String dropdownval = "Videos Only";
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
              child: Column(
                children: <Widget>[
                  ListTile(
                    trailing: FlatButton(
                      child: Text(
                        "ALL",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                      onPressed: () {},
                    ),
                    title: SizedBox(
                      height: 70,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        //primary: false,
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) =>
                            Padding(
                          padding: EdgeInsets.fromLTRB(8, 10, 8, 8),
                          child: Column(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundImage:
                                    NetworkImage(data[index]['ProfileiconURL']),
                              ),
                              Text(
                                data[index]['Name'],
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: DropdownButton<String>(
                        isExpanded: false,
                        value: dropdownval,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 20.0,
                        elevation: 20,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        /*underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  */
                        onChanged: (String newvalue) {
                          setState(() {
                            dropdownval = newvalue;
                          });
                        },
                        items: ["Videos Only", "Videos and Posts"]
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) =>
                        GestureDetector(
                      onTap: () {
                        playthisvideo(data[index]['VideoURL'], index);
                      },
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
