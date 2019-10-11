import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart' as urllaunch;

class SOS extends StatefulWidget {
  var selectedloc;
  SOS({Key key, @required this.selectedloc}) : super(key: key);
  @override
  _SOSState createState() => _SOSState(
        selectedloc: selectedloc,
      );
}

class _SOSState extends State<SOS> {
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  var selectedloc;
  var helpneed = "Police";
  var name = "Shobhit";
  var mobilenum = "+91 94134 60572";
  var data;
  bool isLoading = true;
  var link = "http://userapi.tk/shobhit/insertsos";
  Widget nochild = Container();

  _SOSState({
    Key key,
    @required this.selectedloc,
  });

  void post() async {
    var result = await http.post("http://userapi.tk/shobhit/insertsos", body: {
      "location": selectedloc,
      "name": name,
      "type": helpneed,
      "mobile": mobilenum,
      //"crime" : "ssss",
      //"evidence" : "dcc",
      //"suggestion": "hello world",
      //"suspect" : "dccdsdc",
      //"help" : "xcsdc",
      //"date" : "sdc",
    });
    print(link);
    print(result.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text("SecYour"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Divider(),
          Text(
            selectedloc,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),
          Text(
            name,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            mobilenum,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 18),
            child: Row(
              children: <Widget>[
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Text(
                    "Seeking help from?",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: DropdownButton<String>(
                    isExpanded: true,
                    isDense: false,
                    value: helpneed,
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
                      setState(() {
                        helpneed = newvalue;
                      });
                    },
                    items: ['Police', 'Ambulance', "Firebrigade", "Animal Aid"]
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(
                          value,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          MaterialButton(
            //color: Colors.red,
            color: Color(0xFFFF3E4D),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 6, 24, 6),
              child: Text(
                "HELP ME!",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            onPressed: () {
              final snackBar = SnackBar(
                content: Text("Help will be at your disposal soon."),
              );
              _scaffoldkey.currentState.showSnackBar(snackBar);
              post();
            },
          ),
          SizedBox(
            height: 100,
            width: double.infinity,
          ),
          Expanded(
            child: Container(
              //color: Colors.red[100],
              color: Color(0xFFF77754),
              child: FlatButton(
                onPressed: () {
                  urllaunch.launch("tel:100");
                },
                child: Center(
                  child: Text(
                    "Emergency\n       Call",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
