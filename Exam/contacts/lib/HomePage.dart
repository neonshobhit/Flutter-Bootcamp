import 'package:contacts/Details.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var data;
  final String url = "http://userapi.tk/";
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getjsondata();
  }

  Future getjsondata() async {
    var response = await http.get(Uri.encodeFull(
      url,
    ));
    setState(() {
      var convertjson = json.decode(response.body);
      data = convertjson;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contacts",
        ),
      ),
      body: SingleChildScrollView(
        child: isLoading
        ?LinearProgressIndicator()
        :Column(
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Details(
                        data: data[index],
                      ),
                    ),
                  );
                },
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                       data[index]["ImageURL"] ??
                          "https://www.anime-planet.com/images/characters/hinata-hyuuga-626.jpg",
                    ),
                  ),
                  title: Text(
                    data[index]["Name"] ?? "NoName",
                  ),
                  subtitle: Text(
                    data[index]["Mobile"] ?? "NoNumber",
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
