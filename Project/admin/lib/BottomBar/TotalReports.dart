import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class TotalReports extends StatefulWidget {
  @override
  _TotalReportsState createState() => _TotalReportsState();
}

class _TotalReportsState extends State<TotalReports> {
  var data;
  bool isLoading = true;
  var link = "http://userapi.tk/shobhit/data";

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
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                  leading: Text(
                                    data[index]["crime"].isEmpty || data[index]["name"] == null
                                        ? "CrimeUnknown"
                                        : (data[index]["crime"]),
                                  ),
                                  title: Text(
                                    data[index]["suspect"].isEmpty || data[index]["name"] == null
                                        ? "SuspectUnknown"
                                        : (data[index]["suspect"]),
                                  ),
                                  
                                  subtitle: Text(
                                    data[index]["evidence"].isEmpty || data[index]["name"] == null
                                        ? "NoEvidence"
                                        : ("has evidence" + data[index]["evidence"]),
                                  ),
                                  
                                  trailing: Text(
                                    data[index]["location"].isEmpty || data[index]["name"] == null
                                        ? "Location\nUnknown"
                                        : (data[index]["location"]),
                                  ),
                                  
                                  ),
                                  Divider(),
                                  Text(
                                    data[index]["suggestion"].isEmpty || data[index]["name"] == null
                                        ? "Stay Safe"
                                        : (data[index]["suggestion"]),
                                  ),
                                  Divider(),
                                  Text(
                                    data[index]["help"].isEmpty || data[index]["name"] == null
                                        ? "HelpNotNeeded"
                                        : ("Help needed now" + data[index]["help"]),
                                  ),


                            ],
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
