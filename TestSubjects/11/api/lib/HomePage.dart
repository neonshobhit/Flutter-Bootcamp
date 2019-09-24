import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url ="https://api.github.com/users/neonshobhit/repos";
  List data;
  var isLoading = true;

  @override
  void initState(){
    super.initState();
    this.getjsondata();
  }
  Future<String> getjsondata() async{
    var response = await http.get(
    Uri.encodeFull(url),
    );

    print(response.body);
    setState(() {

      var convertDatatoJson = json.decode(response.body) ;
      data = convertDatatoJson;
      isLoading = false;

    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
      ),
      body: Container(
        child: Center(
          child: isLoading ? CircularProgressIndicator() :ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index){
              return new Card(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      /*leading: CircleAvatar(
                        backgroundImage:  NetworkImage(data[index]["ImageURL"]),
                        
                      ),*/
                      title: Text(data[index]["name"]),
                      subtitle: Text(data[index]["owner"]["html_url"]),

                     
                    )
                  ],
                ),
              );
            },
          )  ,

        ),
      ),
      
    );
  }
}