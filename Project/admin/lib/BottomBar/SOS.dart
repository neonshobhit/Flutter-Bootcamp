import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class SOS extends StatefulWidget {
  @override
  _SOSState createState() => _SOSState();
}

class _SOSState extends State<SOS> {
  var data;
  bool isLoading = true;
  var link = "http://userapi.tk/shobhit";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getjsondata();
  }

  Future<String> getjsondata() async {
    var response = await http.get(
      Uri.encodeFull(link),
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
        child: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : Column(
                  children: <Widget>[
                    Divider(),
                    Text(
                      data.length.toString() + "reports",
                    ),
                    Divider(),
                    ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) => Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Card(
                          child: ListTile(
                              leading: Text(
                                data[index]["type"].isEmpty || data[index]["name"] == null
                                    ? "TypeUnknown"
                                    : (data[index]["type"]),
                              ),
                              title: Text(
                                data[index]["name"].isEmpty || data[index]["name"] == null
                                    ? "NameUnknown"
                                    : (data[index]["name"]),
                              ),
                              
                              subtitle: Text(
                                data[index]["mobile"].isEmpty || data[index]["name"] == null
                                    ? "MobileUnknown"
                                    : (data[index]["mobile"]),
                              ),
                              
                              trailing: Text(
                                data[index]["location"].isEmpty || data[index]["name"] == null
                                    ? "Location\nUnknown"
                                    : (data[index]["location"]),
                              ),
                              
                              ),
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
