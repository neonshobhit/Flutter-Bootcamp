import 'package:flutter/material.dart';
import 'package:github_repos/HomePage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

class EndDrawer extends StatefulWidget {
  @override
  _EndDrawerState createState() => _EndDrawerState();
}

class _EndDrawerState extends State<EndDrawer> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool flag = false;
  String userlink;

  var data;
  bool checkusernameifokay = false, isLoading = true;
  checktolaunch(String urllink) async {
    if (await canLaunch(urllink)) {
      setState(() {
        flag = true;
        // var data = "https://api.github.com/users/${urllink}/repos";
        getjsondata("https://api.github.com/users/${urllink}/repos");
      });
    }
  }

  Future<String> getjsondata(String myurl) async {
    var response = await http.get(
      Uri.encodeFull(myurl),
    );
    setState(() {
      var convertDataToJSON = json.decode(response.body);
      data = convertDataToJSON;
      //isLoading = false;
      isLoading= true;
      if (isLoading) {
        if (data["message"] == null) {
          //if (data["message"] != "Not Found") {
          checkusernameifokay = true;
          // }
          print("jvhb");
        }
        else{
          print(data["message"]);
        }
        print("vvvvvvvv");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Enter GitHub username",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: Form(
          key: _key,
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.search,
                ),
                title: TextFormField(
                  validator: (input) {
                    checktolaunch(
                        "https://api.github.com/users/${input}/repos");
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "GitHub username",
                  ),
                  onSaved: (input) =>
                      userlink = "https://api.github.com/users/${input}/repos",
                ),
              ),
              RaisedButton(
                child: Text("Find!!"),
                onPressed: _sendToNextScreen,
              )
            ],
          ),
        ));
  }

  _sendToNextScreen() {
    if (_key.currentState.validate() && flag == true) {
      _key.currentState.save();
      if (checkusernameifokay) {
        Navigator.of(context).pop();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(
              changinglink: userlink,
            ),
          ),
        );
      }
      /*else{
        Container(
          child: Text(
            "Username not found!",
          ),
        );
      }*/
      //Navigator.of(context).pop();
    }
  }
}
